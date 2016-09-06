<?php
/*
 * Centreon is developped with GPL Licence 2.0 :
 * http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
 * Developped by : Julien Mathis - Romain Le Merlus
 *
 * The Software is provided to you AS IS and WITH ALL FAULTS.
 * Centreon makes no representation and gives no warranty whatsoever,
 * whether express or implied, and without limitation, with regard to the quality,
 * any particular or intended purpose of the Software found on the Centreon web site.
 * In no event will Centreon be liable for any direct, indirect, punitive, special,
 * incidental or consequential damages however they may arise and even if Centreon has
 * been previously advised of the possibility of such damages.
 *
 * For information : contact@centreon.com
 */

	if (!isset($oreon))
		exit();
	/**
	 *
	 * Write command in nagios pipe or in centcore pipe.
	 * @param $cmd
	 * @param $poller
	 */
	function write_command($cmd, $poller){
		global $oreon, $key, $pearDB;
		$str = NULL;

		$informations = preg_split("/\;/", $key);
        
        /* Replace forbidden charaters in external command*/
        $cmd = str_replace("`", "&#96;", $cmd);
		//$cmd = str_replace("'", "&#39;", $cmd);

		$cmd = str_replace("\n", "<br>", $cmd);
        
		setlocale(LC_CTYPE, 'en_US.UTF-8');
        $str = "echo ". escapeshellarg("EXTERNALCMD:$poller:[" . time() . "]" . $cmd . "\n") . " >> " . _CENTREON_VARLIB_."/centcore.cmd";
		return passthru($str);
	}

	/**
	 *
	 * Ack hosts massively
	 * @param $key
	 */
	function massiveHostAck($key){
            global $pearDB, $is_admin, $oreon;
            static $processedHosts = array();

            $actions = false;
            $actions = $oreon->user->access->checkAction("host_acknowledgement");

            $key = urldecode($key);
            $tmp = preg_split("/\;/", $key);
            $host_name = $tmp[0];
            if (isset($processedHosts[$host_name])) {
                return null;
            }
            $processedHosts[$host_name] = true;

		isset($_GET['persistent']) && $_GET['persistent'] == "true" ? $persistent = "1" : $persistent = "0";
		isset($_GET['notify']) && $_GET['notify'] == "true" ? $notify = "1" : $notify = "0";
		isset($_GET['sticky']) && $_GET['sticky'] == "true" ? $sticky = "2" : $sticky = "1";
		isset($_GET['force_check']) && $_GET['force_check'] == "true" ? $force_check = "1" : $force_check = "0";

		if ($actions == true || $is_admin) {
			$host_poller = GetMyHostPoller($pearDB, $host_name);
			$flg = write_command(" ACKNOWLEDGE_HOST_PROBLEM;".$host_name.";".$sticky.";".$notify.";".$persistent.";".$_GET["author"].";".trim(urldecode($_GET["comment"])), $host_poller);
		    if ($force_check == 1) {
			    write_command(" SCHEDULE_FORCED_HOST_CHECK;".$host_name.";".time(), $host_poller);
            }
		}

		$actions = $oreon->user->access->checkAction("service_acknowledgement");
		if (($actions == true || $is_admin) && isset($_GET['ackhostservice']) && $_GET['ackhostservice'] == "true") {
			$DBRES = $pearDB->query("SELECT host_id FROM `host` WHERE host_name = '".$host_name."' LIMIT 1");
			$row = $DBRES->fetchRow();
			$svc_tab = array();
			$svc_tab = getMyHostServices($row['host_id']);
			if (count($svc_tab)) {
				foreach ($svc_tab as $key2 => $value) {
					write_command(" ACKNOWLEDGE_SVC_PROBLEM;".$host_name.";".$value.";".$sticky.";".$notify.";".$persistent.";".$_GET["author"].";".trim(urldecode($_GET["comment"])), $host_poller);
					if ($force_check == 1 && $oreon->user->access->checkAction("service_schedule_forced_check") == true) {
				 		write_command(" SCHEDULE_FORCED_SVC_CHECK;".$host_name.";".$value.";".time(), $host_poller);
					}
				}
			}
		}

		/*
		 * Set param in memory
		 */
		set_user_param($oreon->user->user_id, $pearDB, "ack_sticky", $sticky);
		set_user_param($oreon->user->user_id, $pearDB, "ack_notify", $notify);
		set_user_param($oreon->user->user_id, $pearDB, "ack_persistent", $persistent);
		set_user_param($oreon->user->user_id, $pearDB, "force_check", $force_check);

		return _("Your command has been sent");
	}

    /**
     *
     * Ack services massively
     * @param $key
     */
	function massiveServiceAck($key){
    	global $pearDB, $is_admin, $oreon;

		$actions = false;
		$actions = $oreon->user->access->checkAction("service_acknowledgement");

		$key = urldecode($key);

		$tmp = preg_split("/\;/", $key);

		if (!isset($tmp[0])) {
			throw new Exception('No host found');
		}
		$host_name = $tmp[0];

		if (!isset($tmp[1])) {
			throw new Exception('No service found');
		} else {
			$svc_description = $tmp[1];
		}

		isset($_GET['persistent']) && $_GET['persistent'] == "true" 		? $persistent = "1" : $persistent = "0";
		isset($_GET['notify']) && $_GET['notify'] == "true" 			? $notify = "1" : $notify = "0";
		isset($_GET['sticky']) && $_GET['sticky'] == "true" 			? $sticky = "2" : $sticky = "1";
		isset($_GET['force_check']) && $_GET['force_check'] == "true" 		? $force_check = "1" : $force_check = "0";

		$host_poller = GetMyHostPoller($pearDB, $host_name);

		if ($actions == true || $is_admin) {

			$_GET["comment"] = $_GET["comment"];
			$_GET["comment"] = str_replace('\'', ' ', trim(urldecode($_GET["comment"])));

			$flg = write_command(" ACKNOWLEDGE_SVC_PROBLEM;".$host_name.";".$svc_description.";".$sticky.";".$notify.";".$persistent.";".$_GET["author"].";".$_GET["comment"], $host_poller);

			if ($force_check == 1 && $oreon->user->access->checkAction("service_schedule_forced_check") == true) {
				write_command(" SCHEDULE_FORCED_SVC_CHECK;".$host_name.";".$svc_description.";".time(), $host_poller);
			}
			set_user_param($oreon->user->user_id, $pearDB, "ack_sticky", $sticky);
			set_user_param($oreon->user->user_id, $pearDB, "ack_notify", $notify);
			set_user_param($oreon->user->user_id, $pearDB, "ack_persistent", $persistent);
			set_user_param($oreon->user->user_id, $pearDB, "force_check", $force_check);

			return _("Your command has been sent");
		}
		return null;
        }


	/**
	 *
	 * Sets host downtime massively
	 * @param $key
	 */
    function massiveHostDowntime($key)
    {
    	global $pearDB, $is_admin, $oreon, $centreonGMT;
        static $processedHosts = array();
        
        $actions = false;
        $actions = $oreon->user->access->checkAction("host_schedule_downtime");

        if ($actions == true || $is_admin) {
        	$key = urldecode($key);

        	$tmp = preg_split("/\;/", $key);
        	if (!isset($tmp[0])) {
                throw new Exception('No host found');
            }
            
            $host_name = $tmp[0];
            if (isset($processedHosts[$host_name])) {
                return null;
            }
            $processedHosts[$host_name] = true;

			isset($_GET['start']) && $_GET['start'] ? $start = $_GET['start'] : $start = time();
			isset($_GET['end']) && $_GET['end'] ? $end = $_GET['end'] : $end = time();
			isset($_GET['comment']) && $_GET['comment'] ? $comment = str_replace('\'', ' ', trim(urldecode($_GET["comment"]))) : $comment = "";
			isset($_GET['fixed']) && $_GET['fixed'] == "true" ? $fixed = 1 : $fixed = 0;
			isset($_GET['duration']) && $_GET['duration'] && is_numeric($_GET['duration']) ? $duration = $_GET['duration'] : $duration = 0;
            isset($_GET['duration_scale']) && $_GET['duration_scale'] ? $duration_scale = $_GET['duration_scale'] : $duration_scale = "s";
            isset($_GET['host_or_centreon_time']) && $_GET['host_or_centreon_time'] == "true" 		? $host_or_centreon_time = "1" : $host_or_centreon_time = "0";
            
            if ($duration > 0) {
                switch ($duration_scale) {
                    default:
                    case 's':
                        $duration = $duration;
                        break;
                    case 'm':
                        $duration = $duration * 60;
                        break;
                    case 'h':
                        $duration = $duration * 60 * 60;
                        break;
                    case 'd':
                        $duration = $duration * 60 * 60 * 24;
                        break;
                }
            }
            
            $host = getMyHostID($host_name);
            
            $with_services = false;
            if (($oreon->user->access->checkAction("service_schedule_downtime") == true)
				&& isset($_GET['downtimehostservice']) && $_GET['downtimehostservice'] == "true") {
                $with_services = true;
			}
            
            $extCmdObj = new CentreonExternalCommand($oreon);
            $extCmdObj->AddHostDowntime($host, $comment, $start, $end, $fixed, $duration, $with_services,$host_or_centreon_time);
        }
        
        return null;
    }

	/*
	 *  Sets service downtime massively
	 */
	function massiveServiceDowntime($key) {
		global $pearDB, $is_admin, $oreon, $centreonGMT;

        $actions = false;
        $actions = $oreon->user->access->checkAction("service_schedule_downtime");

        if ($actions == true || $is_admin) {
        	$key = urldecode($key);
        	$tmp = preg_split("/\;/", $key);

        	if (!isset($tmp[0])) {
				throw new Exception('No host found');
			}
			$host_name = $tmp[0];

			if (!isset($tmp[1])) {
				throw new Exception('No service found');
        	} else {
				$svc_description = $tmp[1];
			}

			isset($_GET['start']) && $_GET['start'] ? $start = $_GET['start'] : $start = time();
			isset($_GET['end']) && $_GET['end'] ? $end = $_GET['end'] : $end = time();
			isset($_GET['comment']) && $_GET['comment'] ? $comment = str_replace('\'', ' ', $_GET["comment"]) : $comment = "";
			isset($_GET['fixed']) && $_GET['fixed'] == "true" ? $fixed = 1 : $fixed = 0;
			isset($_GET['duration']) && $_GET['duration'] && is_numeric($_GET['duration']) ? $duration = $_GET['duration'] : $duration = 0;
            isset($_GET['duration_scale']) && $_GET['duration_scale'] ? $duration_scale = $_GET['duration_scale'] : $duration_scale = "s";
            isset($_GET['host_or_centreon_time']) && $_GET['host_or_centreon_time'] == "true" 		? $host_or_centreon_time = "1" : $host_or_centreon_time = "0";
            
            if ($duration > 0)
            {
                switch ($duration_scale)
                {
                    default:
                    case 's':
                        $duration = $duration;
                        break;

                    case 'm':
                        $duration = $duration * 60;
                        break;

                    case 'h':
                        $duration = $duration * 60 * 60;
                        break;

                    case 'd':
                        $duration = $duration * 60 * 60 * 24;
                        break;
                }
            }
            
            $host = getMyHostID($host_name);
            $service = getMyServiceID($svc_description, $host);
            
            $extCmdObj = new CentreonExternalCommand($oreon);
            $extCmdObj->AddSvcDowntime($host, $service, $comment, $start, $end, $fixed, $duration, $host_or_centreon_time);
            
            
            
			//write_command(" SCHEDULE_SVC_DOWNTIME;".urldecode($host_name).";".urldecode($svc_description).";".$start_time.";".$end_time.";".$fixed.";0;".$duration.";".$oreon->user->get_alias().";".$comment."\n", GetMyHostPoller($pearDB, urldecode($host_name)));
        }
        return null;
        }
?>
