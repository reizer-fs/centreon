<?php

/*
 * Copyright 2005-2015 Centreon
 * Centreon is developped by : Julien Mathis and Romain Le Merlus under
 * GPL Licence 2.0.
 *
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation ; either version 2 of the License.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
 * PARTICULAR PURPOSE. See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * this program; if not, see <http://www.gnu.org/licenses>.
 *
 * Linking this program statically or dynamically with other modules is making a
 * combined work based on this program. Thus, the terms and conditions of the GNU
 * General Public License cover the whole combination.
 *
 * As a special exception, the copyright holders of this program give Centreon
 * permission to link this program with independent modules to produce an executable,
 * regardless of the license terms of these independent modules, and to copy and
 * distribute the resulting executable under terms of Centreon choice, provided that
 * Centreon also meet, for each linked independent module, the terms  and conditions
 * of the license of that module. An independent module is a module which is not
 * derived from this program. If you modify this program, you may extend this
 * exception to your version of the program, but you are not obliged to do so. If you
 * do not wish to do so, delete this exception statement from your version.
 *
 * For more information : contact@centreon.com
 *
 * SVN : $URL$
 * SVN : $Id$
 *
 */

class CentreonGMT {

    var $listGTM;
    var $myGMT;
    var $use;
    /**
     *
     * @var array
     */
    var $aListTimezone;
        
    /**
     *
     * @var type 
     */
    protected $db;
    
    /**
     * 
     * @param array $myTimezone
     */
    var $myTimezone;
    
    /**
     * 
     * @param array $hostLocations
     */
     var $hostLocations = array();
     
     /**
      * Default timezone setted in adminstration/options
      * @var string $sDefaultTimezone
      */
     var $sDefaultTimezone;
    
    /**
     * 
     * @param string $myOffset
     */
    var $myOffset;

    public function __construct($DB)
    {
        $this->db = $DB;
        
        /*
         * Define Table of GMT line
         */
        $this->listGTM = $this->getList();
        /*
         * Flag activ / inactiv
         */
        $this->use = 1;
    }

    /**
     * 
     * @return string
     */
    function used() {
        return $this->use;
    }

    /**
     * 
     * @param string $value
     */
    function setMyGMT($value)
    {
        $this->myGMT = $value;
    }

    /**
     * 
     * @return array
     */
    function getGMTList() {
        return $this->listGTM;
    }

    /**
     * 
     * @return string
     */
    function getMyGMT() {
        return $this->myGMT;
    }

    
    /**
     * This method return timezone of user
     * 
     * @return string
     */
    function getMyTimezone()
    {
        if (is_null($this->myTimezone)) {
            if (isset($this->listGTM[$this->myGMT])) {
                $this->myTimezone = $this->listGTM[$this->myGMT];
            } else {
                $this->getCentreonTimezone();
                if (!empty($this->sDefaultTimezone) && !empty($this->listGTM[$this->sDefaultTimezone])) {
                    $this->myTimezone = $this->listGTM[$this->sDefaultTimezone];
                } else { //if we take the empty PHP
                    $this->myTimezone = date_default_timezone_get();
                }
            }
        }
        return $this->myTimezone;
    }
    
    /**
     * 
     * @return string
     */
    function getMyOffset()
    {
        if (is_null($this->myOffset)) {
            if (count($this->aListTimezone) == 0) {
                $this->getList();
            }
            $this->myOffset = $this->aListTimezone[$this->myGMT]['timezone_offset'];
        }
        return $this->myOffset;
    }
    
    /**
     * 
     * @return string
     */
    function getMyGMTForRRD()
    {
        $sOffset = '';
        if (count($this->listGTM) == 0) {
            $this->getList();
        }

        if (isset($this->aListTimezone[$this->myGMT]['timezone_offset'])) {
           $sOffset = $this->aListTimezone[$this->myGMT]['timezone_offset'];
        }
        return $sOffset;
    }

    /**
     * 
     * @param type $format
     * @param string $date
     * @param type $gmt
     * @return string
     */
    function getDate($format, $date, $gmt = NULL)
    {
        $return = "";
        if (!$date) {
            $date = "N/A";
        }
        if ($date == "N/A") {
            return $date;
        }

        if (!isset($gmt)) {
            $gmt = $this->myGMT;
        }

        if (isset($date) && isset($gmt)) {
            $sDate = new DateTime();
            $sDate->setTimestamp($date);
            $sDate->setTimezone(new DateTimeZone($this->getActiveTimezone($gmt)));
            $return = $sDate->format($format);
        }
        
        return $return;
    }
    
    /**
     * 
     * @param type $date
     * @param type $gmt
     * @param type $reverseOffset
     * @return string
     */
    function getUTCDate($date, $gmt = NULL, $reverseOffset = 1)
    {
        $return = "";
        if (!isset($gmt)) {
            $gmt = $this->myGMT;
        }

        if (isset($date) && isset($gmt)) {
            if (!is_numeric($date)) {
                $sDate = new DateTime($date);
            } else {
                $sDate = new DateTime();
                $sDate->setTimestamp($date);
            }
            
            $sDate->setTimezone(new DateTimeZone($this->getActiveTimezone($gmt)));
            
            $iTimestamp = $sDate->getTimestamp();
            $sOffset = $sDate->getOffset();
            $return = $iTimestamp + ($sOffset * $reverseOffset);
        }

        return $return;
    }
    
    /**
     * 
     * @param type $date
     * @param type $gmt
     * @return string
     */
    function getUTCDateFromString($date, $gmt = NULL, $reverseOffset = 1)
    {
        $return = "";
        if (!isset($gmt)) {
            $gmt = $this->myGMT;
        }
        if (isset($date) && isset($gmt)) {
            if (!is_numeric($date)) {
                $sDate = new DateTime($date);
            } else {
                $sDate = new DateTime();
                $sDate->setTimestamp($date);
            }
       
            $localDate = new DateTime(); 
            $sDate->setTimezone(new DateTimeZone($this->getActiveTimezone($gmt)));
 
            $iTimestamp = $sDate->getTimestamp();
            $sOffset = $sDate->getOffset();
            $sLocalOffset = $localDate->getOffset();
            $return = $iTimestamp - (($sOffset - $sLocalOffset) * $reverseOffset);
        }
        
        return $return;
    }
    

    /**
     * 
     * @param type $gmt
     * @return string
     */
    function getDelaySecondsForRRD($gmt)
    {
        $str = "";
        if ($gmt) {
            if ($gmt > 0) {
                $str .= "+";
            }
        } else {
            return "";
        }
    }

    /**
     * 
     * @global type $pearDB
     * @param type $sid
     * @param type $DB
     * @return int
     */
    function getMyGMTFromSession($sid = NULL, $DB)
    {
        global $pearDB;
        
        if (!isset($sid)) {
            return 0;
        }
        if (!isset($pearDB) && isset($DB)) {
            $pearDB = $DB;
        }
        
        $DBRESULT = $pearDB->query("SELECT `contact_location` FROM `contact`, `session` " .
                "WHERE `session`.`user_id` = `contact`.`contact_id` " .
                "AND `session_id` = '" . CentreonDB::escape($sid) . "' LIMIT 1");
        if (PEAR::isError($DBRESULT)) {
            $this->myGMT = 0;
        }
        $info = $DBRESULT->fetchRow();
        $DBRESULT->free();
        $this->myGMT = $info["contact_location"];
    }
    
    /**
     * 
     * @global type $pearDB
     * @param int $userId
     * @param type $DB
     */
    function getMyGTMFromUser($userId, $DB = null)
    {
        global $pearDB;
        
        if (!empty($userId)) {
        
            if (!isset($pearDB) && isset($DB)) {
                $pearDB = $DB;
            }

            $DBRESULT = $pearDB->query("SELECT `contact_location` FROM `contact` " .
                    "WHERE `contact`.`contact_id` = " . $userId ." LIMIT 1");
            if (PEAR::isError($DBRESULT)) {
                $this->myGMT = 0;
            }
            $info = $DBRESULT->fetchRow();
            $DBRESULT->free();
            $this->myGMT = $info["contact_location"];
        } else {
            $this->myGMT = 0;
        }
    }

    /**
     * 
     * @param type $host_id
     * @param type $date_format
     * @return \DateTime
     */
    function getHostCurrentDatetime($host_id, $date_format = 'c')
    {
        $locations = $this->getHostLocations();
        $sDate = new DateTime();
        $sDate->setTimezone(new DateTimeZone($this->getActiveTimezone($locations[$host_id])));
        return $sDate;
    }
    
    /**
     * 
     * @param type $date
     * @param type $hostId
     * @param type $dateFormat
     * @param type $reverseOffset
     * @return string
     */
    function getUTCDateBasedOnHostGMT($date, $hostId, $dateFormat = 'c', $reverseOffset = 1)
    {
        $locations = $this->getHostLocations();

        if (isset($locations[$hostId]) && $locations[$hostId] != '0') {
            $date = $this->getUTCDate($date, $locations[$hostId], $reverseOffset);
        }

        return date($dateFormat, $date);
    }

    /**
     * 
     * @param type $date
     * @param type $hostId
     * @param type $dateFormat
     * @return string
     */
    function getUTCTimestampBasedOnHostGMT($date, $hostId, $dateFormat = 'c')
    {
        $locations = $this->getHostLocations();

        if (isset($locations[$hostId]) && $locations[$hostId] != '0') {
            $date = $this->getUTCDate($date, $locations[$hostId]);
        }
 
        return $date;
    }
    
    /**
     * 
     * @param type $hostId
     * @return array
     */
    function getUTCLocationHost($hostId)
    {
        $locations = $this->getHostLocations();

        if (isset($locations[$hostId])) {
            return $locations[$hostId];
        }

        return null;
    }
    
    /**
     * Get the list of timezone
     *
     * @return array
     */
    public function getList()
    {
        $aDatas = array();
        
        $queryList = "SELECT timezone_id, timezone_name, timezone_offset FROM timezone ORDER BY timezone_name asc";
        $res = $this->db->query($queryList);
        if (PEAR::isError($res)) {
            return array();
        }
 
        $aDatas[null] = null;
        while ($row = $res->fetchRow()) {
            $aDatas[$row['timezone_id']] =  $row['timezone_name'];
            $this->aListTimezone[$row['timezone_id']] = $row;
        }
         
        return $aDatas;
    }
    
    /**
     * 
     * @param type $values
     * @return array
     */
    public function getObjectForSelect2($values = array(), $options = array())
    {
        $items = array();
        
        $explodedValues = implode(',', $values);
        if (empty($explodedValues)) {
            $explodedValues = "''";
        }

        # get list of selected timezones
        $query = "SELECT timezone_id, timezone_name "
            . "FROM timezone "
            . "WHERE timezone_id IN (" . $explodedValues . ") "
            . "ORDER BY timezone_name ";
        
        $resRetrieval = $this->db->query($query);
        while ($row = $resRetrieval->fetchRow()) {
            $items[] = array(
                'id' => $row['timezone_id'],
                'text' => $row['timezone_name']
            );
        }

        return $items;
    }
    
    /**
     * Get list of timezone of host
     * @return array
     */
    public function getHostLocations()
    {
        if (count($this->hostLocations) == 0 ) {
            $locations = array();

            $query = "SELECT host_id, host_location FROM host";
            $res  = $this->db->query($query);
            if (!PEAR::isError($res)) {
                while ($row = $res->fetchRow()) {
                    $locations[$row['host_id']] = $row['host_location'];
                }
            }
            $this->hostLocations = $locations;
        }
        
        return $this->hostLocations;
    }
    
    /**
     * Get default timezone setted in admintration/options
     * 
     * @return string
     */
    public function getCentreonTimezone()
    {       
        if (is_null($this->sDefaultTimezone) ) {
            $sTimezone = '';

            $query = "SELECT `value` FROM `options` WHERE `key` = 'gmt' LIMIT 1";
            $res  = $this->db->query($query);
            if (!PEAR::isError($res)) {
                $row = $res->fetchRow();
                $sTimezone = $row["value"];
            }
            $this->sDefaultTimezone = $sTimezone;
        }
        
        return $this->sDefaultTimezone;
    }
    
    /**
     * This method verifies the timezone which is to be used in the other appellants methods. 
     * In priority, it uses timezone of the object, else timezone of centreon, then lattest timezone PHP
     * 
     * @param string $gmt
     * @return string timezone
     */
    private function getActiveTimezone($gmt)
    {
        $sTimezone = "";
        if (count($this->listGTM) == 0) {
            $this->getList();
        }
        
        if (isset($this->listGTM[$gmt]) && !empty($this->listGTM[$gmt])) {
            $sTimezone = $this->listGTM[$gmt];
        } else {
            $this->getCentreonTimezone();
            if (!empty($this->sDefaultTimezone) && !empty($this->listGTM[$this->sDefaultTimezone])) {
                $sTimezone = $this->listGTM[$this->sDefaultTimezone];
            } else { //if we take the empty PHP
                 $sTimezone = date_default_timezone_get();
            }
        }
        
        return $sTimezone;
    }
}
