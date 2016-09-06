<?php
/**
 * Copyright 2005-2011 MERETHIS
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
 * As a special exception, the copyright holders of this program give MERETHIS
 * permission to link this program with independent modules to produce an executable,
 * regardless of the license terms of these independent modules, and to copy and
 * distribute the resulting executable under terms of MERETHIS choice, provided that
 * MERETHIS also meet, for each linked independent module, the terms  and conditions
 * of the license of that module. An independent module is a module which is not
 * derived from this program. If you modify this program, you may extend this
 * exception to your version of the program, but you are not obliged to do so. If you
 * do not wish to do so, delete this exception statement from your version.
 *
 * For more information : contact@centreon.com
 *
 */

require_once "../../require.php";
require_once $centreon_path . 'www/class/centreon.class.php';
require_once $centreon_path . 'www/class/centreonSession.class.php';
require_once $centreon_path . 'www/class/centreonDB.class.php';
require_once $centreon_path . 'www/class/centreonACL.class.php';
require_once $centreon_path . 'www/class/centreonHost.class.php';
require_once $centreon_path . 'www/class/centreonService.class.php';
require_once $centreon_path . 'www/class/centreonExternalCommand.class.php';
require_once $centreon_path . 'www/class/centreonUtils.class.php';

session_start();

try {
    if (!isset($_SESSION['centreon']) || !isset($_POST['cmdType']) || !isset($_POST['selection']) ||
        !isset($_POST['author']) || !isset($_POST['cmd'])) {
        throw new Exception('Missing data');
    }
    $db = new CentreonDB();
    if (CentreonSession::checkSession(session_id(), $db) == 0) {
        throw new Exception('Invalid session');
    }
    $type = $_POST['cmdType'];
    $cmd = $_POST['cmd'];
    $centreon = $_SESSION['centreon'];
    $selections = explode(',', $_POST['selection']);
    $oreon = $centreon;
    $externalCmd = new CentreonExternalCommand($centreon);

    $hostObj = new CentreonHost($db);
    $svcObj = new CentreonService($db);
    $command = "";
    $author = $_POST['author'];
    $comment = "";
    if (isset($_POST['comment'])) {
        $comment = $_POST['comment'];
    }
    if ($type == 'ack') {
        $persistent = 0;
        $sticky = 0;
        $notify = 0;
        if (isset($_POST['persistent'])) {
            $persistent = 1;
        }
        if (isset($_POST['sticky'])) {
            $sticky = 1;
        }
        if (isset($_POST['notify'])) {
            $notify = 1;
        }
        $command = "ACKNOWLEDGE_HOST_PROBLEM;%s;$sticky;$notify;$persistent;$author;$comment";
        $commandSvc = "ACKNOWLEDGE_SVC_PROBLEM;%s;%s;$sticky;$notify;$persistent;$author;$comment";
        if (isset($_POST['forcecheck'])) {
            $forceCmd = "SCHEDULE_FORCED_HOST_CHECK;%s;".time(); 
            $forceCmdSvc = "SCHEDULE_FORCED_SVC_CHECK;%s;%s;".time();
        }
    } elseif ($type == 'downtime') {
        $fixed = 0;
        if (isset($_POST['fixed'])) {
            $fixed = 1;
        }
        $duration = 0;
        if (isset($_POST['dayduration'])) {
            $duration += ($_POST['dayduration'] * 86400);
        }
        if (isset($_POST['hourduration'])) {
            $duration += ($_POST['hourduration'] * 3600);
        }
        if (isset($_POST['minuteduration'])) {
            $duration += ($_POST['minuteduration'] * 60);
        }

        if (!isset($_POST['start']) || !isset($_POST['end'])) {
            throw new Exception ('Missing downtime start/end');
        }
        if (isset($_POST['hourstart']) && $_POST['hourstart']) {
            $tmpHstart = str_pad($_POST['hourstart'], 2, "0", STR_PAD_LEFT);
        } else {
            $tmpHstart = "00";
        }
        if (isset($_POST['minutestart']) && $_POST['minutestart']) {
            $tmpMstart = str_pad($_POST['minutestart'], 2, "0", STR_PAD_LEFT);
        } else {
            $tmpMstart = "00";
        }
        if (isset($_POST['hourend']) && $_POST['hourend']) {
            $tmpHend = str_pad($_POST['hourend'], 2, "0", STR_PAD_LEFT);
        } else {
            $tmpHend = "00";
        }
        if (isset($_POST['minuteend']) && $_POST['minuteend']) {
            $tmpMend = str_pad($_POST['minuteend'], 2, "0", STR_PAD_LEFT);
        } else {
            $tmpMend = "00";
        }
        $dateStart = $_POST['start'];
        $start = $dateStart . " " . $tmpHstart . ":" . $tmpMstart;
        $start = CentreonUtils::getDateTimeTimestamp($start);
        $dateEnd = $_POST['end'];
        $end = $dateEnd . " " . $tmpHend . ":" . $tmpMend;
        $end = CentreonUtils::getDateTimeTimestamp($end);
        $command = "SCHEDULE_HOST_DOWNTIME;%s;$start;$end;$fixed;0;$duration;$author;$comment";
        $commandSvc = "SCHEDULE_SVC_DOWNTIME;%s;%s;$start;$end;$fixed;0;$duration;$author;$comment";
    } else {
        throw new Exception('Unknown command');
    }
    if ($command != "") {
        foreach ($selections as $selection) {
            $tmp = explode(";", $selection);
            if (count($tmp) != 2) {
                throw new Exception('Incorrect id format');
            }
            $hostId = $tmp[0];
            $svcId = $tmp[1];
            $hostname = $hostObj->getHostName($hostId);
            $svcDesc = $svcObj->getServiceDesc($svcId);
            $pollerId = $hostObj->getHostPollerId($hostId);
            if ($cmd == 70 || $cmd == 74) {
                $externalCmd->set_process_command(sprintf($commandSvc, $hostname, $svcDesc), $pollerId);
                if (isset($forceCmdSvc)) {
                    $externalCmd->set_process_command(sprintf($forceCmdSvc, $hostname, $svcDesc), $pollerId);
                }
            } else {
                $externalCmd->set_process_command(sprintf($command, $hostname), $pollerId);
            }
            if (isset($forceCmd)) {
                $externalCmd->set_process_command(sprintf($forceCmd, $hostname), $pollerId);
            }
            if (isset($_POST['processServices'])) {
                $services = $svcObj->getServiceId(null, $hostname);
                foreach($services as $svcDesc => $svcId) {
                    $externalCmd->set_process_command(sprintf($commandSvc, $hostname, $svcDesc), $pollerId);
                    if (isset($forceCmdSvc)) {
                        $externalCmd->set_process_command(sprintf($forceCmdSvc, $hostname, $svcDesc), $pollerId);
                    }
                }
            }
        }
        $externalCmd->write();
    }
} catch (Exception $e) {
    echo $e->getMessage();
}
