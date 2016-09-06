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
 */

function getServiceObjectId($svc_description, $host_name, $monObj)
{
    static $hostSvcTab = array();

		if (!isset($hostSvcTab[$host_name])) {
 	    $rq = "SELECT s.service_object_id as service_id, s.display_name as service_description ".
 	    	  "FROM ".$monObj->ndoPrefix. "services s, ".$monObj->ndoPrefix."hosts h " .
 	          "WHERE s.host_object_id = h.host_object_id " .
 	          "AND h.display_name LIKE '" . $monObj->DBNdo->escape($host_name) . "' ";
 		$res = $monObj->DBNdo->query($rq);
 		$hostSvcTab[$host_name] = array();
 		while ($row = $res->fetchRow()) {
 		    $hostSvcTab[$host_name][$row['service_description']] = $row['service_id'];
 		}
		}
		if (isset($hostSvcTab[$host_name]) && isset($hostSvcTab[$host_name][$svc_description])) {
		    return $hostSvcTab[$host_name][$svc_description];
		}
		return null;
}

function get_Host_Status($host_name, $pearDBndo, $general_opt){
	global $ndo_base_prefix;

	$ndo_base_prefix = "nagios_";

	 $rq = "SELECT nhs.current_state FROM `" .$ndo_base_prefix."hoststatus` nhs, `" .$ndo_base_prefix."hosts` nh " .
	            "WHERE nh.display_name = '".$host_name."'" .
	            "AND nh.host_object_id = nhs.host_object_id" ;
	$DBRESULT = $pearDBndo->query($rq);
	$status = $DBRESULT->fetchRow();
	unset($DBRESULT);
	return $status["current_state"];
}

function getMyIndexGraph4Service($host_id = NULL, $service_id = NULL, $pearDBO)	{
	if ((!isset($service_id) || !$service_id ) || (!isset($host_id) || !$host_id))
		return NULL;

	$DBRESULT = $pearDBO->query("SELECT id FROM index_data i, metrics m WHERE i.host_id = '".$host_id."' " .
								"AND m.hidden = '0' " .
								"AND i.service_id = '".$service_id."' " .
								"AND i.id = m.index_id");
	if ($DBRESULT->numRows())	{
		$row = $DBRESULT->fetchRow();
		return $row["id"];
	}
	return 0;
}
