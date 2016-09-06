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
 * SVN : $URL: http://svn.centreon.com/trunk/centreon/www/include/monitoring/status/Services/xml/broker/serviceXML.php $
 * SVN : $Id: serviceXML.php 11683 2011-02-14 16:10:44Z jmathis $
 *
 */

	/**
	 * Require configuration.
	 */
	require_once realpath(dirname(__FILE__) . "/../../../../../../../config/centreon.config.php");

	/**
	 * Require Sepecific XML / Ajax Class
	 */
	include_once _CENTREON_PATH_ . "www/class/centreonXMLBGRequest.class.php";

	/**
	 * Require commonu Files.
	 */
	include_once _CENTREON_PATH_ . "www/include/monitoring/status/Common/common-Func.php";
	include_once _CENTREON_PATH_ . "www/include/common/common-Func.php";

	/**
	 * Create XML Request Objects
	 */
    CentreonSession::start();
	$obj = new CentreonXMLBGRequest(session_id(), 1, 1, 0, 1);
	

	if (isset($obj->session_id) && CentreonSession::checkSession($obj->session_id, $obj->DB)) {
		;
	} else {
		print "Bad Session ID";
		exit();
	}

	/**
	 * Set Default Poller
	 */
	$obj->getDefaultFilters();

	/** **************************************************
	 * Check Arguments From GET tab
	 */
	$o 			= $obj->checkArgument("o", $_GET, "h");
	$p 			= $obj->checkArgument("p", $_GET, "2");
	$nc 		= $obj->checkArgument("nc", $_GET, "0");
	$num 		= $obj->checkArgument("num", $_GET, 0);
	$limit 		= $obj->checkArgument("limit", $_GET, 20);
	$instance 	= $obj->checkArgument("instance", $_GET, $obj->defaultPoller);
	$search 	= $obj->checkArgument("search", $_GET, "");
	$search_host	= $obj->checkArgument("search_host", $_GET, "");
	$sort_type 	= $obj->checkArgument("sort_type", $_GET, "host_name");
	$order 		= $obj->checkArgument("order", $_GET, "ASC");
	$dateFormat = $obj->checkArgument("date_time_format_status", $_GET, "d/m/Y H:i:s");

	/** **************************************************
	 * Backup poller selection
	 */
	$obj->setInstanceHistory($instance);

	/**
	 * Graphs Tables
	 */
	$graphs = array();

	/** **************************************************
	 * Get Service status
	 */

	$instance_filter = "";
	if ($instance != -1) {
		$instance_filter = " AND h.instance_id = ".$instance." ";
	}

	$searchHost = "";
	if ($search_host) {
		$searchHost .= " AND h.name LIKE '%$search_host%' ";
	}

	$searchService = "";
	if ($search) {
		$searchService .= " AND s.description LIKE '%$search%' ";
	}

	$tabOrder = array();
	$tabOrder["host_name"] 			= " ORDER BY h.name ". $order.", s.description ";
	$tabOrder["service_description"]= " ORDER BY s.description ". $order.", h.name";
	$tabOrder["current_state"] 		= " ORDER BY s.state ". $order.", h.name, s.description";
	$tabOrder["last_state_change"] 	= " ORDER BY s.last_state_change ". $order.", h.name, s.description";
	$tabOrder["last_hard_state_change"] = " ORDER by s.last_hard_state_change ". $order.", h.name, s.description";
	$tabOrder["last_check"] 		= " ORDER BY s.last_check ". $order.", h.name, s.description";
	$tabOrder["current_attempt"] 	= " ORDER BY s.check_attempt ". $order.", h.name, s.description";
	$tabOrder["output"] 			= " ORDER BY s.output ". $order.", h.name, s.description";
	$tabOrder["default"] 			= " ORDER BY s.next_check ". $order.", h.name, s.description" ;

	$request = "SELECT SQL_CALC_FOUND_ROWS h.name, h.host_id, s.description, s.service_id, s.notes, s.notes_url, s.action_url, s.max_check_attempts,
				s.icon_image, s.display_name, s.process_perfdata, s.state, s.output as plugin_output,
				s.state_type, s.check_attempt as current_attempt, s.last_update as status_update_time, s.last_state_change,
				s.last_hard_state_change, s.last_check, s.next_check,
				s.notify, s.acknowledged, s.passive_checks, s.active_checks, s.event_handler_enabled, s.flapping,
				s.scheduled_downtime_depth, s.flap_detection, h.state as host_state, h.acknowledged AS h_acknowledged, h.scheduled_downtime_depth AS h_scheduled_downtime_depth,
				h.icon_image AS h_icon_images, h.display_name AS h_display_name, h.action_url AS h_action_url, h.notes_url AS h_notes_url, h.notes AS h_notes, h.address,
				h.passive_checks AS h_passive_checks, h.active_checks AS h_active_checks ";
	$request .= " FROM hosts h, services s ";
	if (!$obj->is_admin) {
		$request .= ", centreon_acl ";
	}
	$request .= " WHERE h.host_id = s.host_id
				  AND s.service_id IS NOT NULL
				  AND s.service_id != 0
				  AND h.enabled = 1
				  AND s.enabled = 1
				  AND h.name NOT LIKE '_Module_%' ";
	if ($searchHost) {
		$request .= $searchHost;
	}
	if ($searchService) {
		$request .= $searchService;
	}
	$request .= $instance_filter;

	/**
	 * ACL activation
	 */
	if (!$obj->is_admin) {
		$request .= " AND h.host_id = centreon_acl.host_id AND s.service_id = centreon_acl.service_id AND group_id IN (".$obj->grouplistStr.") ";
	}

	(isset($tabOrder[$sort_type])) ? $request .= $tabOrder[$sort_type] : $request .= $tabOrder["default"];
	$request .= " LIMIT ".($num * $limit).",".$limit;

	/** ***************************************************
	 * Get Pagination Rows
	 */
	$DBRESULT = $obj->DBC->query($request);
	$numRows = $obj->DBC->numberRows();

	/* ***************************************************
	 * Create Buffer
	 */
	$obj->XML->startElement("reponse");
	$obj->XML->startElement("i");
	$obj->XML->writeElement("numrows", $numRows);
	$obj->XML->writeElement("num", $num);
	$obj->XML->writeElement("limit", $limit);
	$obj->XML->writeElement("p", $p);
	$obj->XML->writeElement("nc", $nc);
	$obj->XML->writeElement("o", $o);
	$obj->XML->writeElement("hard_state_label", _("Hard State Duration"));
	$obj->XML->writeElement("http_link", _("HTTP Link"));
	$obj->XML->writeElement("host_currently_downtime", _("Host is currently on downtime"));
	$obj->XML->writeElement("problem_ack", _("Problem has been acknowledged"));
	$obj->XML->writeElement("host_passive_mode", _("This host is only checked in passive mode"));
	$obj->XML->writeElement("host_never_checked", _("This host is never checked"));
	$obj->XML->writeElement("service_currently_downtime", _("Service is currently on Downtime"));
	$obj->XML->writeElement("service_passive_mode", _("This service is only checked in passive mode"));
	$obj->XML->writeElement("service_not_active_not_passive", _("This service is neither active nor passive"));
	$obj->XML->writeElement("service_flapping", _("This Service is flapping"));
	$obj->XML->writeElement("notif_disabled", _("Notification is disabled"));
	$obj->XML->endElement();

	$host_prev = "";
	$ct = 0;
	$flag = 0;

	while ($data = $DBRESULT->fetchRow()) {
		$passive = 0;
		$active = 1;
		$last_check = " ";
		$duration = " ";

		if ($data["last_state_change"] > 0 && time() > $data["last_state_change"]) {
			$duration = CentreonDuration::toString(time() - $data["last_state_change"]);
		} else if ($data["last_state_change"] > 0) {
			$duration = " - ";
		}

		$hard_duration = " N/S ";
		if (($data["last_hard_state_change"] > 0) && ($data["last_hard_state_change"] >= $data["last_state_change"])) {
			$hard_duration = CentreonDuration::toString(time() - $data["last_hard_state_change"]);
		}

		if ($data["scheduled_downtime_depth"] > 0) {
			$class = "line_downtime";
		} else if ($data["state"] == 2) {
			$data["acknowledged"] == 1 ? $class = "line_ack" : $class = "list_down";
		} else {
			if ($data["acknowledged"] == 1)
				$class = "line_ack";
		}

		$obj->XML->startElement("l");
		$obj->XML->writeAttribute("class", $obj->getNextLineClass());
		$obj->XML->writeElement("o", $ct++);

		if ($host_prev == $data["name"]) {
			$obj->XML->writeElement("hc", "transparent");
			$obj->XML->startElement("hn");
			$obj->XML->writeAttribute("none", "1");
			$obj->XML->text($data["name"]);
			$obj->XML->endElement();
			$obj->XML->writeElement("hnl", urlencode($data["name"]));
			$obj->XML->writeElement("hid", $data["host_id"]);
		} else {
			$host_prev = $data["name"];
			if ($data["h_scheduled_downtime_depth"] == 0) {
				$obj->XML->writeElement("hc", $obj->colorHostInService[$data["host_state"]]);
			} else {
				$obj->XML->writeElement("hc", $obj->general_opt['color_downtime']);
			}

			$obj->XML->writeElement("hnl", urlencode($data["name"]));
			$obj->XML->startElement("hn");
			$obj->XML->writeAttribute("none", "0");
			$obj->XML->text($data["name"], true, false);
			$obj->XML->endElement();
			$obj->XML->writeElement("hau", $data["h_action_url"]);

			if ($data["h_notes_url"]) {
				$obj->XML->writeElement("hnu", str_replace("\$HOSTNAME\$", $data["name"], $data["h_notes_url"]));
			} else
				$obj->XML->writeElement("hnu", "none");

			$obj->XML->writeElement("hnn", 	$data["h_notes"]);
			$obj->XML->writeElement("hico", $data["h_icon_images"]);
			$obj->XML->writeElement("hip", 	$data["address"]);
			$obj->XML->writeElement("hdtm", $data["h_scheduled_downtime_depth"]);
			$obj->XML->writeElement("hid", 	$data["host_id"]);
		}
		$obj->XML->writeElement("ppd", 	$data["process_perfdata"]);
		$obj->XML->writeElement("hs", 	$data["host_state"]);

		/*
		 * Add possibility to use display name
		 */
		if (isset($data["display_name"]) && $data["display_name"]) {
			$obj->XML->writeElement("sd", 	$data["display_name"], false);
		} else {
			$obj->XML->writeElement("sd", 	$data["description"], false);
		}
		$obj->XML->writeElement("sico", $data["icon_image"]);
		$obj->XML->writeElement("sdl", 	urlencode($data["description"]));
		$obj->XML->writeElement("svc_id", $data["service_id"]);
		$obj->XML->writeElement("sc", 	$obj->colorService[$data["state"]]);
		$obj->XML->writeElement("cs", 	_($obj->statusService[$data["state"]]), false);
		$obj->XML->writeElement("po", 	$data["plugin_output"], false);
		$obj->XML->writeElement("ca", 	$data["current_attempt"]."/".$data["max_check_attempts"]." (".$obj->stateType[$data["state_type"]].")");
		$obj->XML->writeElement("ne", 	$data["notify"]);
		$obj->XML->writeElement("pa", 	$data["acknowledged"]);
		$obj->XML->writeElement("pc", 	$data["passive_checks"]);
		$obj->XML->writeElement("ac", 	$data["active_checks"] ? _("Enabled") : _("Disabled"));
		$obj->XML->writeElement("eh", 	$data["event_handler_enabled"]);
		$obj->XML->writeElement("is", 	$data["flapping"]);
		$obj->XML->writeElement("dtm",	$data["scheduled_downtime_depth"]);

		if ($data["notes_url"] != "") {
			$data["notes_url"] = str_replace("\$SERVICEDESC\$", $data["description"], $data["notes_url"]);
			$data["notes_url"] = str_replace("\$HOSTNAME\$", $data["name"], $data["notes_url"]);
			if (isset($data["alias"]) && $data["alias"]) {
			    $data["notes_url"] = str_replace("\$HOSTALIAS\$", $data["alias"], $data["notes_url"]);
			}
			if (isset($data['address']) && $data['address']) {
                    $data["notes_url"] = str_replace("\$HOSTADDRESS\$", $data['address'], $data["notes_url"]);
			}
			$obj->XML->writeElement("snu", $data["notes_url"]);
		} else {
			$obj->XML->writeElement("snu", 'none');
		}

		if ($data["notes"] != "") {
			$data["notes"] = str_replace("\$SERVICEDESC\$", $data["description"], $data["notes"]);
			$data["notes"] = str_replace("\$HOSTNAME\$", $data["name"], $data["notes"]);
		    if (isset($data["alias"]) && $data["alias"]) {
			    $data["notes"] = str_replace("\$HOSTALIAS\$", $data["alias"], $data["notes"]);
			}
			if (isset($data['address']) && $data['address']) {
                    $data["notes"] = str_replace("\$HOSTADDRESS\$", $data['address'], $data["notes"]);
			}
			$obj->XML->writeElement("sn", $data["notes"]);
		} else {
			$obj->XML->writeElement("sn", 'none');
		}

		$obj->XML->writeElement("fd", $data["flap_detection"]);
		$obj->XML->writeElement("ha", $data["h_acknowledged"]);
		$obj->XML->writeElement("hae", $data["h_active_checks"]);
		$obj->XML->writeElement("hpe", $data["h_passive_checks"]);
		$obj->XML->writeElement("nc", $obj->GMT->getDate($dateFormat, $data["next_check"]));
		if ($data["last_check"] != 0) {
			$obj->XML->writeElement("lc", $obj->GMT->getDate($dateFormat, $data["last_check"]));
		} else {
			$obj->XML->writeElement("lc", "N/A");
		}
		$obj->XML->writeElement("d", $duration);
		$obj->XML->writeElement("last_hard_state_change", $hard_duration);

		/**
		 * Get Service Graph index
		 */
		if (!isset($graphs[$data["host_id"]])) {
			$request2 = "SELECT service_id, id FROM index_data WHERE host_id = '".$data["host_id"]."'";
			$DBRESULT2 = $obj->DBC->query($request2);
			while ($dataG = $DBRESULT2->fetchRow()) {
				if (!isset($graphs[$data["host_id"]])) {
					$graphs[$data["host_id"]] = array();
				}
				$graphs[$data["host_id"]][$dataG["service_id"]] = $dataG["id"];
			}
			if (!isset($graphs[$data["host_id"]])) {
				$graphs[$data["host_id"]] = array();
			}
		}
		$obj->XML->writeElement("svc_index", (isset($graphs[$data["host_id"]][$data["service_id"]]) ? $graphs[$data["host_id"]][$data["service_id"]] : 0));
		$obj->XML->endElement();
	}
	$DBRESULT->free();
	unset($data);
	unset($host_status);

	if (!$ct) {
		$obj->XML->writeElement("infos", "none");
	}

	$obj->XML->writeElement("sid", $obj->session_id);
	$obj->XML->endElement();

	/*
	 * Send Header
	 */
	$obj->header();

	/*
	 * Send XML
	 */
	$obj->XML->output();
?>