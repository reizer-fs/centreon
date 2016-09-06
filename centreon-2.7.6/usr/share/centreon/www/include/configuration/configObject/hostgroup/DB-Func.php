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

	if (!isset ($oreon))
		exit ();


	function getHGParents($hg_id, $parentList, $pearDB) {
		/*
		 * Get Parent Groups
		 */
		$DBRESULT = $pearDB->query("SELECT hg_parent_id FROM hostgroup_hg_relation WHERE hg_child_id = '".$hg_id."'");
		while ($hgs = $DBRESULT->fetchRow()) {
			$parentList[$hgs["hg_parent_id"]] = $hgs["hg_parent_id"];
			$parentList = getHGParents($hgs["hg_parent_id"], $parentList, $pearDB);
		}
		$DBRESULT->free();
		unset($hgs);
		return $parentList;
	}

	function testHostGroupExistence ($name = NULL)	{
		global $pearDB, $form, $oreon;
		$id = NULL;
		if (isset($form))
			$id = $form->getSubmitValue('hg_id');
		$DBRESULT = $pearDB->query("SELECT hg_name, hg_id FROM hostgroup WHERE hg_name = '".CentreonDB::escape($oreon->checkIllegalChar($name))."'");
		$hg = $DBRESULT->fetchRow();
		#Modif case
		if ($DBRESULT->numRows() >= 1 && $hg["hg_id"] == $id)
			return true;
		#Duplicate entry
		else if ($DBRESULT->numRows() >= 1 && $hg["hg_id"] != $id)
			return false;
		else
			return true;
	}

	function enableHostGroupInDB ($hg_id = NULL, $hg_arr = array())	{
		global $pearDB, $oreon;

		if (!$hg_id && !count($hg_arr))
			return;

		if ($hg_id)
			$hg_arr = array($hg_id=>"1");

		foreach($hg_arr as $key=>$value)	{
			$DBRESULT = $pearDB->query("UPDATE hostgroup SET hg_activate = '1' WHERE hg_id = '".$key."'");
			$DBRESULT2 = $pearDB->query("SELECT hg_name FROM `hostgroup` WHERE `hg_id` = '".$key."' LIMIT 1");
			$row = $DBRESULT2->fetchRow();
			$oreon->CentreonLogAction->insertLog("hostgroup", $key, $row['hg_name'], "enable");
		}
	}

	function disableHostGroupInDB ($hg_id = NULL, $hg_arr = array())	{
		if (!$hg_id && !count($hg_arr)) return;
		global $pearDB, $oreon;
		if ($hg_id)
			$hg_arr = array($hg_id=>"1");
		foreach($hg_arr as $key=>$value)	{
			$DBRESULT = $pearDB->query("UPDATE hostgroup SET hg_activate = '0' WHERE hg_id = '".$key."'");
			$DBRESULT2 = $pearDB->query("SELECT hg_name FROM `hostgroup` WHERE `hg_id` = '".$key."' LIMIT 1");
			$row = $DBRESULT2->fetchRow();
			$oreon->CentreonLogAction->insertLog("hostgroup", $key, $row['hg_name'], "disable");
		}
	}

	function deleteHostGroupInDB ($hostGroups = array())	{
		global $pearDB, $centreon;

		foreach ($hostGroups as $key=>$value)	{
			$rq = "SELECT @nbr := (SELECT COUNT( * ) FROM host_service_relation WHERE service_service_id = hsr.service_service_id GROUP BY service_service_id ) AS nbr, hsr.service_service_id FROM host_service_relation hsr WHERE hsr.hostgroup_hg_id = '".$key."'";
			$DBRESULT = $pearDB->query($rq);

			while ($row = $DBRESULT->fetchRow()) {
				if ($row["nbr"] == 1)	{
					$DBRESULT2 = $pearDB->query("DELETE FROM service WHERE service_id = '".$row["service_service_id"]."'");
				}
			}
			$DBRESULT3 = $pearDB->query("SELECT hg_name FROM `hostgroup` WHERE `hg_id` = '".$key."' LIMIT 1");
			$row = $DBRESULT3->fetchRow();

			$DBRESULT = $pearDB->query("DELETE FROM hostgroup WHERE hg_id = '".$key."'");
			$centreon->CentreonLogAction->insertLog("hostgroup", $key, $row['hg_name'], "d");
		}
		$centreon->user->access->updateACL();
	}

	function multipleHostGroupInDB ($hostGroups = array(), $nbrDup = array())	{
		global $pearDB, $oreon, $is_admin;

        $hgAcl = array();
		foreach($hostGroups as $key=>$value)	{
			$DBRESULT = $pearDB->query("SELECT * FROM hostgroup WHERE hg_id = '".$key."' LIMIT 1");
			$row = $DBRESULT->fetchRow();
			$row["hg_id"] = '';
			for ($i = 1; $i <= $nbrDup[$key]; $i++)	{
				$val = NULL;
				$rq = NULL;
				foreach ($row as $key2 => $value2)	{
					$key2 == "hg_name" ? ($hg_name = $value2 = $value2."_".$i) : null;
					$val ? $val .= ($value2 != NULL ? (", '".$pearDB->escape($value2)."'") : ", NULL") : $val .= ($value2 != NULL ? ("'".$pearDB->escape($value2)."'") : "NULL");
					if ($key2 != "hg_id")
						$fields[$key2] = $value2;
					if (isset($fields["hg_name"])) {
						$fields["hg_name"] = $hg_name;
					}
				}
				if (testHostGroupExistence($hg_name))	{
					$val ? $rq = "INSERT INTO hostgroup VALUES (".$val.")" : $rq = null;
					$DBRESULT = $pearDB->query($rq);
					$DBRESULT = $pearDB->query("SELECT MAX(hg_id) FROM hostgroup");
					$maxId = $DBRESULT->fetchRow();
					if (isset($maxId["MAX(hg_id)"]))	{
						$hgAcl[$maxId["MAX(hg_id)"]] = $key;
                        if (!$is_admin) {
							$resource_list = $oreon->user->access->getResourceGroups();
							if (count($resource_list)){
								foreach ($resource_list as $res_id => $res_name)	{
									$DBRESULT3 = $pearDB->query("INSERT INTO `acl_resources_hg_relations` (acl_res_id, hg_hg_id) VALUES ('".$res_id."', '".$maxId["MAX(hg_id)"]."')");
								}
								unset($resource_list);
							}
						}
						#
						$DBRESULT = $pearDB->query("SELECT DISTINCT hgr.host_host_id FROM hostgroup_relation hgr WHERE hgr.hostgroup_hg_id = '".$key."'");
						$fields["hg_hosts"] = "";
						while($host = $DBRESULT->fetchRow()){
							$DBRESULT2 = $pearDB->query("INSERT INTO hostgroup_relation VALUES ('', '".$maxId["MAX(hg_id)"]."', '".$host["host_host_id"]."')");
							$fields["hg_hosts"] .= $host["host_host_id"] . ",";
						}
						$fields["hg_hosts"] = trim($fields["hg_hosts"], ",");
						$DBRESULT = $pearDB->query("SELECT DISTINCT cghgr.contactgroup_cg_id FROM contactgroup_hostgroup_relation cghgr WHERE cghgr.hostgroup_hg_id = '".$key."'");
						while ($cg = $DBRESULT->fetchRow()){
							$DBRESULT2 = $pearDB->query("INSERT INTO contactgroup_hostgroup_relation VALUES ('', '".$cg["contactgroup_cg_id"]."', '".$maxId["MAX(hg_id)"]."')");
						}
						$oreon->CentreonLogAction->insertLog("hostgroup", $maxId["MAX(hg_id)"], $hg_name, "a", $fields);
					}
				}
			}
		}
        CentreonACL::duplicateHgAcl($hgAcl);
        $oreon->user->access->updateACL();
	}

	function insertHostGroupInDB ($ret = array())	{
		global $oreon;

		$hg_id = insertHostGroup($ret);
		updateHostGroupHosts($hg_id, $ret);
		$oreon->user->access->updateACL();
		return $hg_id;
	}

	function updateHostGroupInDB ($hg_id = NULL, $ret = array(), $increment = false) {
		global $oreon;
		if (!$hg_id)
			return;
		updateHostGroup($hg_id, $ret);
		updateHostGroupHosts($hg_id, $ret, $increment);
		$oreon->user->access->updateACL();
	}

	function insertHostGroup($ret = array())	{
		global $form, $pearDB, $oreon, $is_admin;

		if (!count($ret))
			$ret = $form->getSubmitValues();

		$ret["hg_name"] = $oreon->checkIllegalChar($ret["hg_name"]);

		$rq = "INSERT INTO hostgroup ";
		$rq .= "(hg_name, hg_alias, hg_notes, hg_notes_url, hg_action_url, hg_icon_image, hg_map_icon_image, hg_rrd_retention, hg_comment, hg_activate) ";
		$rq .= "VALUES (";
		isset($ret["hg_name"]) && $ret["hg_name"] ? $rq .= "'".$pearDB->escape($ret["hg_name"])."', " : $rq .= "NULL,";
		isset($ret["hg_alias"]) && $ret["hg_alias"] ? $rq .= "'".$pearDB->escape($ret["hg_alias"])."', " : $rq .= "NULL,";
		isset($ret["hg_notes"]) && $ret["hg_notes"] ? $rq .= "'".$pearDB->escape($ret["hg_notes"])."', " : $rq .= "NULL,";
		isset($ret["hg_notes_url"]) && $ret["hg_notes_url"] ? $rq .= "'".$pearDB->escape($ret["hg_notes_url"])."', " : $rq .= "NULL,";
		isset($ret["hg_action_url"]) && $ret["hg_action_url"] ? $rq .= "'".$pearDB->escape($ret["hg_action_url"])."', " : $rq .= "NULL,";
		isset($ret["hg_icon_image"]) && $ret["hg_icon_image"] ? $rq .= "'".$pearDB->escape($ret["hg_icon_image"])."', " : $rq .= "NULL,";
		isset($ret["hg_map_icon_image"]) && $ret["hg_map_icon_image"] ? $rq .= "'".$pearDB->escape($ret["hg_map_icon_image"])."', " : $rq .= "NULL,";
        isset($ret["hg_rrd_retention"]) && $ret["hg_rrd_retention"] ? $rq .= "'".$pearDB->escape($ret["hg_rrd_retention"])."', " : $rq .= "NULL,";
		isset($ret["hg_comment"]) && $ret["hg_comment"] ? $rq .= "'".$pearDB->escape($ret["hg_comment"])."', " : $rq .= "NULL, ";
		isset($ret["hg_activate"]["hg_activate"]) && $ret["hg_activate"]["hg_activate"] ? $rq .= "'".$ret["hg_activate"]["hg_activate"]."'" : $rq .= "'0'";
		$rq .= ")";

		$pearDB->query($rq);
		$DBRESULT = $pearDB->query("SELECT MAX(hg_id) FROM hostgroup");
		$hg_id = $DBRESULT->fetchRow();

		$fields["hg_name"] = $pearDB->escape($ret["hg_name"]);
		$fields["hg_alias"] = $pearDB->escape($ret["hg_alias"]);
		$fields["hg_notes"] = $pearDB->escape($ret["hg_notes"]);
		$fields["hg_notes_url"] = $pearDB->escape($ret["hg_notes_url"]);
		$fields["hg_action_url"] = $pearDB->escape($ret["hg_action_url"]);
		$fields["hg_icon_image"] = $pearDB->escape($ret["hg_notes_url"]);
		$fields["hg_map_icon_image"] = $pearDB->escape($ret["hg_action_url"]);
        $fields["hg_rrd_retention"] = $pearDB->escape($ret["hg_rrd_retention"]);
		$fields["hg_comment"] = $pearDB->escape($ret["hg_comment"]);
		$fields["hg_activate"] = $ret["hg_activate"]["hg_activate"];
		if (isset($ret["hg_hosts"]))
			$fields["hg_hosts"] = implode(",", $ret["hg_hosts"]);
		if (isset($ret["hg_hg"]))
			$fields["hg_hg"] = implode(",", $ret["hg_hg"]);


		if (!$oreon->user->admin) {
			$resource_list = $oreon->user->access->getResourceGroups();
			if (count($resource_list)) {
				foreach ($resource_list as $res_id => $res_name)	{
					$DBRESULT3 = $pearDB->query("INSERT INTO `acl_resources_hg_relations` (acl_res_id, hg_hg_id) VALUES ('".$res_id."', '".$hg_id["MAX(hg_id)"]."')");
				}
				unset($resource_list);
			}
		}

		$oreon->CentreonLogAction->insertLog("hostgroup", $hg_id["MAX(hg_id)"], CentreonDB::escape($ret["hg_name"]), "a", $fields);

		return ($hg_id["MAX(hg_id)"]);
	}

	function updateHostGroup($hg_id, $ret = array()) {
		global $form, $pearDB, $oreon;

		if (!$hg_id)
			return;

	    if (!count($ret)) {
		    $ret = $form->getSubmitValues();
		}

		$ret["hg_name"] = $oreon->checkIllegalChar($ret["hg_name"]);

		$rq = "UPDATE hostgroup SET ";
		$rq .= "hg_name = ";
		isset($ret["hg_name"]) && $ret["hg_name"] != NULL ? $rq .= "'".$pearDB->escape($ret["hg_name"])."', " : $rq .= "NULL, ";
		$rq .= "hg_alias = ";
		isset($ret["hg_alias"]) && $ret["hg_alias"] != NULL ? $rq .= "'".$pearDB->escape($ret["hg_alias"])."', " : $rq .= "NULL, ";
		$rq .= "hg_notes = ";
		isset($ret["hg_notes"]) && $ret["hg_notes"] != NULL ? $rq .= "'".$pearDB->escape($ret["hg_notes"])."', " : $rq .= "NULL, ";
		$rq .= "hg_notes_url = ";
		isset($ret["hg_notes_url"]) && $ret["hg_notes_url"] != NULL ? $rq .= "'".$pearDB->escape($ret["hg_notes_url"])."', " : $rq .= "NULL, ";
		$rq .= "hg_action_url = ";
		isset($ret["hg_action_url"]) && $ret["hg_action_url"] != NULL ? $rq .= "'".$pearDB->escape($ret["hg_action_url"])."', " : $rq .= "NULL, ";
		$rq .= "hg_icon_image = ";
		isset($ret["hg_icon_image"]) && $ret["hg_icon_image"] != NULL ? $rq .= "'".$pearDB->escape($ret["hg_icon_image"])."', " : $rq .= "NULL, ";
		$rq .= "hg_map_icon_image = ";
		isset($ret["hg_map_icon_image"]) && $ret["hg_map_icon_image"] != NULL ? $rq .= "'".$pearDB->escape($ret["hg_map_icon_image"])."', " : $rq .= "NULL, ";
        $rq .= "hg_rrd_retention = ";
        $rq .= isset($ret["hg_rrd_retention"]) && $ret["hg_rrd_retention"] ? "'".$pearDB->escape($ret["hg_rrd_retention"])."', " : "NULL, ";
		$rq .= "hg_comment = ";
		isset($ret["hg_comment"]) && $ret["hg_comment"] != NULL ? $rq .= "'".$pearDB->escape($ret["hg_comment"])."', " : $rq .= "NULL, ";
		$rq .= "hg_activate = ";
		isset($ret["hg_activate"]["hg_activate"]) && $ret["hg_activate"]["hg_activate"] != NULL ? $rq .= "'".$ret["hg_activate"]["hg_activate"]."'" : $rq .= "NULL ";
		$rq .= " WHERE hg_id = '".$hg_id."'";
		$DBRESULT = $pearDB->query($rq);

		$fields["hg_name"] = $pearDB->escape($ret["hg_name"]);
		$fields["hg_alias"] = $pearDB->escape($ret["hg_alias"]);
		$fields["hg_notes"] = $pearDB->escape($ret["hg_notes"]);
		$fields["hg_notes_url"] = $pearDB->escape($ret["hg_notes_url"]);
		$fields["hg_action_url"] = $pearDB->escape($ret["hg_action_url"]);
		$fields["hg_icon_image"] = $pearDB->escape($ret["hg_icon_image"]);
		$fields["hg_map_icon_image"] = $pearDB->escape($ret["hg_map_icon_image"]);
        $fields["hg_rrd_retention"] = $pearDB->escape($ret["hg_rrd_retention"]);
		$fields["hg_comment"] = $pearDB->escape($ret["hg_comment"]);
		$fields["hg_activate"] = $ret["hg_activate"]["hg_activate"];

		if (isset( $ret["hg_hosts"])) {
			$fields["hg_hosts"] = implode(",", $ret["hg_hosts"]);
		}
		if (isset( $ret["hg_hg"])) {
			$fields["hg_hg"] = implode(",", $ret["hg_hg"]);
		}
		$oreon->CentreonLogAction->insertLog("hostgroup", $hg_id, $pearDB->escape($ret["hg_name"]), "c", $fields);
	}

	function updateHostGroupHosts($hg_id, $ret = array(), $increment = false)	{
		global $form, $pearDB;

		if (!$hg_id)
			return;

		/*
		 * Special Case, delete relation between host/service, when service
		 * is linked to hostgroup in escalation, dependencies
		 *
		 * Get initial Host list to make a diff after deletion
		 */
		$hostsOLD = array();
		$DBRESULT = $pearDB->query("SELECT host_host_id FROM hostgroup_relation WHERE hostgroup_hg_id = '".$hg_id."'");
		while ($host = $DBRESULT->fetchRow())
			$hostsOLD[$host["host_host_id"]] = $host["host_host_id"];
		$DBRESULT->free();

		/*
		 * Get service lists linked to hostgroup
		 */
		$rq = "SELECT service_service_id FROM host_service_relation ";
		$rq .= "WHERE hostgroup_hg_id = '".$hg_id."' AND host_host_id IS NULL";
		$DBRESULT = $pearDB->query($rq);
		$hgSVS = array();
		while ($sv = $DBRESULT->fetchRow())
			$hgSVS[$sv["service_service_id"]] = $sv["service_service_id"];

		/*
		 * Update Host HG relations
		 */
	    if ($increment == false) {
    		$rq  = 	"DELETE FROM hostgroup_relation ";
    		$rq .= 	"WHERE hostgroup_hg_id = '".$hg_id."'";
    		$pearDB->query($rq);
		}

        $ret = isset($ret["hg_hosts"]) ? $ret["hg_hosts"] : CentreonUtils::mergeWithInitialValues($form, 'hg_hosts');

		$hgNEW = array();

		$rq = "INSERT INTO hostgroup_relation (hostgroup_hg_id, host_host_id) VALUES ";
		for ($i = 0; $i < count($ret); $i++)	{
			$resTest = $pearDB->query("SELECT hostgroup_hg_id FROM hostgroup_relation WHERE hostgroup_hg_id = ".$hg_id." AND host_host_id = ".$ret[$i]);
			if (!$resTest->numRows()) {
    		    if ($i != 0) {
    				$rq .= ", ";
    		    }
    			$rq .= " ('".$hg_id."', '".$ret[$i]."')";
    			$hostsNEW[$ret[$i]] = $ret[$i];
			}
		}

		if ($i != 0) {
            $DBRESULT = $pearDB->query($rq);
		}

		/*
		 * Update HG HG relations
		 */
		if ($increment == false) {
		    $pearDB->query("DELETE FROM hostgroup_hg_relation WHERE hg_parent_id = '".$hg_id."'");
		}
		isset($ret["hg_hg"]) ? $ret = $ret["hg_hg"] : $ret = $form->getSubmitValue("hg_hg");
		$hgNEW = array();

		$rq = "INSERT INTO hostgroup_hg_relation (hg_parent_id, hg_child_id) VALUES ";
		for ($i = 0; $i < count($ret); $i++)	{
			$resTest = $pearDB->query("SELECT hg_parent_id FROM hostgroup_hg_relation WHERE hg_parent_id = ".$hg_id." AND hg_child_id = ".$ret[$i]);
			if (!$resTest->numRows()) {
    		    if ($i != 0) {
    				$rq .= ", ";
    		    }
    			$rq .= " ('".$hg_id."', '".$ret[$i]."')";
    			$hostsNEW[$ret[$i]] = $ret[$i];
			}
		}
		if ($i != 0) {
			$DBRESULT = $pearDB->query($rq);
		}

                /*
                 * Remove relations that no longer exist (for services by hostgroup)
                 */
                $svcObj = new CentreonService($pearDB);
                $svcObj->cleanServiceRelations("escalation_service_relation", "host_host_id", "service_service_id");
                $svcObj->cleanServiceRelations("dependency_serviceChild_relation", "host_host_id", "service_service_id");
                $svcObj->cleanServiceRelations("dependency_serviceParent_relation", "host_host_id", "service_service_id");
		$svcObj->cleanServiceRelations("downtime_service_relation", "host_host_id", "service_service_id");
	}

?>
