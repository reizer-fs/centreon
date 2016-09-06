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

class CentreonSession
{
	/*
	 * Constructor class
	 *
	 * @access public
	 * @return 	object	object session
	 */
	public function __construct() {

	}

	function start() {
		session_start();
	}

	function stop() {
		session_unset();
		session_destroy();
	}

	function restart() {
		self::stop();
		self::start();
        session_regenerate_id(true);
	}

	function s_unset() {
		session_unset();
	}

	function unregister_var($register_var) {
		unset($_SESSION[$register_var]);
	}

	function register_var($register_var) {
		if (!isset($_SESSION[$register_var])) {
            $_SESSION[$register_var] = $$register_var;
		}
	}

	function checkSession($session_id, $pearDB)
	{
		$session_id = str_replace(array('_', '%'), array('', ''), $session_id);
		$DBRESULT = $pearDB->query("SELECT id FROM session WHERE `session_id` = '".htmlentities(trim($session_id), ENT_QUOTES, "UTF-8")."'");
        if ($DBRESULT->numRows()) {
        	return 1;
        } else {
        	return 0;
       	}
	}
    
    public static function getUser($sessionId, $pearDB)
    {
    	$session_id = str_replace(array('_', '%'), array('', ''), $session_id);
        $DBRESULT = $pearDB->query("SELECT user_id FROM session WHERE `session_id` = '".htmlentities(trim($sessionId), ENT_QUOTES, "UTF-8")."'");
        $row = $DBRESULT->fetchRow();
        if (!$row) {
            return 0;
        }
        return $row['user_id'];
    }

} /* end class Session */
?>