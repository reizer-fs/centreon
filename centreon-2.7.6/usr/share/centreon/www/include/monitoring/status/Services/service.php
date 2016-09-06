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

if (!isset($centreon)) {
    exit();
}
/*
 * ACL Actions
 */
$GroupListofUser = array();
$GroupListofUser = $oreon->user->access->getAccessGroups();

$allActions = false;
/*
 * Get list of actions allowed for user
 */
if (count($GroupListofUser) > 0 && $is_admin == 0) {
    $authorized_actions = array();
    $authorized_actions = $oreon->user->access->getActions();
} else {
    /*
     * if user is admin, or without ACL, he cans perform all actions
     */
    $allActions = true;
}

include("./include/common/autoNumLimit.php");

/*
 * set limit & num
 */
$DBRESULT = $pearDB->query("SELECT * FROM options WHERE `key` = 'maxViewMonitoring' LIMIT 1");
$data = $DBRESULT->fetchRow();
$gopt[$data['key']] = myDecode($data['key']);

!isset($_GET["sort_type"]) ? $sort_type = 0 : $sort_type = $_GET["sort_type"];
!isset($_GET["host_name"]) ? $host_name = "" : $host_name = $_GET["host_name"];
!isset($_GET["strict"]) ? $hostSearchStrict = 0 : $hostSearchStrict = 1;

$problem_sort_type = 'host_name';
if (!empty($oreon->optGen["problem_sort_type"])) {
    $problem_sort_type = $oreon->optGen["problem_sort_type"];
}
$problem_sort_order = 'asc';
if (!empty($oreon->optGen["problem_sort_type"])) {
    $problem_sort_order = $oreon->optGen["problem_sort_order"];
}
$global_sort_type = 'host_name';
if (!empty($_SESSION['centreon']->optGen["global_sort_type"])) {
    $global_sort_type = $_SESSION['centreon']->optGen["global_sort_type"];
}
$global_sort_order = 'asc';
if (!empty($_SESSION['centreon']->optGen["global_sort_order"])) {
    $global_sort_order = $_SESSION['centreon']->optGen["global_sort_order"];
}

if ($o == "svcpb" || $o == "svc_unhandled" || empty($o)) {
    if (!isset($_GET["sort_type"])) {
        $sort_type = $oreon->optGen["problem_sort_type"];
    } else {
        $sort_type = $_GET["sort_type"];
    }
    if (!isset($_GET["order"])) {
        $order = $oreon->optGen["problem_sort_order"];
    } else {
        $order = $_GET["order"];
    }
} else {
    if (!isset($_GET["sort_type"])) {
        if (isset($_SESSION['centreon']->optGen["global_sort_type"]) && $_SESSION['centreon']->optGen["global_sort_type"] != "host_name") {
            $sort_type = CentreonDB::escape($_SESSION['centreon']->optGen["global_sort_type"]);
        } else {
            $sort_type = "host_name";
        }
    } else {
        $sort_type = $_GET["sort_type"];
    }

    if (!isset($_GET["order"])) {
        $order = "ASC";
        if (isset($_SESSION['centreon']->optGen["global_sort_order"]) && $_SESSION['centreon']->optGen["global_sort_order"] != "") {
            $order = $_SESSION['centreon']->optGen["global_sort_order"];
        }
    } else {
        $order = $_GET["order"];
    }
}

/*
 * Check the _GET variables
 */
if (isset($_GET['host_search']) && $_GET['host_search'] != "") {
    $centreon->historySearch[$url] = $_GET['host_search'];
}
if (isset($_GET['output_search']) && $_GET['output_search'] != "") {
    $centreon->historySearchOutput[$url] = $_GET['output_search'];
}

$tab_class = array("0" => "list_one", "1" => "list_two");
$rows = 10;

if (isset($_REQUEST['hg'])) {
    $_SESSION['monitoring_default_hostgroups'] = $_REQUEST['hg'];
} else {
    if (isset($_GET["hostgroup"]) && $_GET["hostgroup"]) {
        $_SESSION['monitoring_default_hostgroups'] = $_GET['hostgroup'];
    }
}

include_once("./include/monitoring/status/Common/default_poller.php");
include_once("./include/monitoring/status/Common/default_hostgroups.php");
include_once($svc_path . "/serviceJS.php");

/*
 * Smarty template Init
 */
$tpl = new Smarty();
$tpl = initSmartyTpl($svc_path, $tpl, "/templates/");

$tpl->assign("p", $p);
$tpl->assign('o', $o);
$tpl->assign("sort_type", $sort_type);
$tpl->assign("num", $num);
$tpl->assign("limit", $limit);
$tpl->assign("mon_host", _("Hosts"));
$tpl->assign("mon_status", _("Status"));
$tpl->assign("mon_ip", _("IP"));
$tpl->assign("mon_last_check", _("Last Check"));
$tpl->assign("mon_duration", _("Duration"));
$tpl->assign("mon_status_information", _("Status information"));

/**
 * Check the _GET variables
 */
if (isset($_GET['host_search']) && $_GET['host_search'] != "") {
    $centreon->historySearch[$url] = $_GET['host_search'];
}
if (isset($_GET['output_search']) && $_GET['output_search'] != "") {
    $centreon->historySearchOutput[$url] = $_GET['output_search'];
}

$tab_class = array("0" => "list_one", "1" => "list_two");
$rows = 10;

if (isset($_REQUEST['hg'])) {
    $_SESSION['monitoring_default_hostgroups'] = $_REQUEST['hg'];
}
include_once("./include/monitoring/status/Common/default_poller.php");
include_once("./include/monitoring/status/Common/default_hostgroups.php");
include_once($svc_path . "/serviceJS.php");

/*
 * Smarty template Init
 */
$tpl = new Smarty();
$tpl = initSmartyTpl($svc_path, $tpl, "/templates/");

$tpl->assign("p", $p);
$tpl->assign('o', $o);
$tpl->assign("num", $num);
$tpl->assign("limit", $limit);
$tpl->assign("mon_host", _("Hosts"));
$tpl->assign("mon_status", _("Status"));
$tpl->assign("mon_ip", _("IP"));
$tpl->assign("mon_last_check", _("Last Check"));
$tpl->assign("mon_duration", _("Duration"));
$tpl->assign("mon_status_information", _("Status information"));
$sDefaultOrder = "0";

if (!isset($_GET['o'])) {
    $sSetOrderInMemory = "1";
} else {
    $sSetOrderInMemory = "0";
}

/*
 * Values
 */
if (isset($centreon->historySearch[$url])) {
    $tpl->assign("hostSearchValue", $centreon->historySearch[$url]);
}
if (isset($centreon->historySearchService[$url])) {
    $tpl->assign("serviceSearchValue", $centreon->historySearchService[$url]);
}
if (isset($centreon->historySearchOutput[$url])) {
    $tpl->assign("outputSearchValue", $centreon->historySearchOutput[$url]);
}

$form = new HTML_QuickForm('select_form', 'GET', "?p=" . $p);

$tpl->assign("order", strtolower($order));
$tab_order = array("sort_asc" => "sort_desc", "sort_desc" => "sort_asc");
$tpl->assign("tab_order", $tab_order);
?>
<script type="text/javascript">
    function setO(_i) {
        document.forms['form'].elements['cmd'].value = _i;
        document.forms['form'].elements['o1'].selectedIndex = 0;
        document.forms['form'].elements['o2'].selectedIndex = 0;
    }
</script>
<?php
$action_list = array();
$action_list[] = _("More actions...");

/*
 * Showing actions allowed for current user
 */
if (isset($authorized_actions) && $allActions == false) {
	if (isset($authorized_actions["service_schedule_check"]))
		$action_list[3] = _("Schedule immediate check");
	if (isset($authorized_actions["service_schedule_forced_check"]))
		$action_list[4] = _("Schedule immediate check (Forced)");
	if (isset($authorized_actions["service_acknowledgement"]))
		$action_list[70] = _("Services : Acknowledge");
	if (isset($authorized_actions["service_disacknowledgement"]))
		$action_list[71] = _("Services : Disacknowledge");
	if (isset($authorized_actions["service_notifications"]))
		$action_list[80] = _("Services : Enable Notification");
	if (isset($authorized_actions["service_notifications"]))
		$action_list[81] = _("Services : Disable Notification");
	if (isset($authorized_actions["service_checks"]))
		$action_list[90] = _("Services : Enable Check");
	if (isset($authorized_actions["service_checks"]))
		$action_list[91] = _("Services : Disable Check");
	if (isset($authorized_actions["service_schedule_downtime"]))
		$action_list[74] = _("Services : Set Downtime");
	if (isset($authorized_actions["host_acknowledgement"]))
		$action_list[72] = _("Hosts : Acknowledge");
	if (isset($authorized_actions["host_disacknowledgement"]))
		$action_list[73] = _("Hosts : Disacknowledge");
	if (isset($authorized_actions["host_notifications"]))
		$action_list[82] = _("Hosts : Enable Notification");
	if (isset($authorized_actions["host_notifications"]))
		$action_list[83] = _("Hosts : Disable Notification");
	if (isset($authorized_actions["host_checks"]))
		$action_list[92] = _("Hosts : Enable Check");
	if (isset($authorized_actions["host_checks"]))
		$action_list[93] = _("Hosts : Disable Check");
	if (isset($authorized_actions["host_schedule_downtime"]))
		$action_list[75] = _("Hosts : Set Downtime");
} else {
    $action_list[3] = _("Schedule immediate check");
    $action_list[4] = _("Schedule immediate check (Forced)");
    $action_list[70] = _("Services : Acknowledge");
    $action_list[71] = _("Services : Disacknowledge");
    $action_list[80] = _("Services : Enable Notification");
    $action_list[81] = _("Services : Disable Notification");
    $action_list[90] = _("Services : Enable Check");
    $action_list[91] = _("Services : Disable Check");
    $action_list[74] = _("Services : Set Downtime");
    $action_list[72] = _("Hosts : Acknowledge");
    $action_list[73] = _("Hosts : Disacknowledge");
    $action_list[82] = _("Hosts : Enable Notification");
    $action_list[83] = _("Hosts : Disable Notification");
    $action_list[92] = _("Hosts : Enable Check");
    $action_list[93] = _("Hosts : Disable Check");
    $action_list[75] = _("Hosts : Set Downtime");
}

$attrs = array('onchange' => "javascript: ".
    " var bChecked = isChecked(); ".
    " if (this.form.elements['o1'].selectedIndex != 0 && !bChecked) {".
    " alert('"._("Please select one or more items")."'); return false;} " .
    " if (this.form.elements['o1'].selectedIndex == 0) {".
    " return false;} ".
    " if (cmdCallback(this.value)) { setO(this.value); submit();} else { setO(this.value); }");
$form->addElement('select', 'o1', NULL, $action_list, $attrs);

$form->setDefaults(array('o1' => NULL));
$o1 = $form->getElement('o1');
$o1->setValue(NULL);

$attrs = array('onchange' => "javascript: ".
    " var bChecked = isChecked(); ".
    " if (this.form.elements['o2'].selectedIndex != 0 && !bChecked) {".
    " alert('"._("Please select one or more items")."'); return false;} ".
    " if (this.form.elements['o2'].selectedIndex == 0) {".
    " return false;} ".
    " if (cmdCallback(this.value)) { setO(this.value); submit();} else { setO(this.value); }");
$form->addElement('select', 'o2', NULL, $action_list, $attrs);
$form->setDefaults(array('o2' => NULL));
$o2 = $form->getElement('o2');
$o2->setValue(NULL);
$o2->setSelected(NULL);
$tpl->assign('limit', $limit);

$keyPrefix = "";
$statusList = array(
    "" => "",
    "ok" => _("OK"),
    "warning" => _("Warning"),
    "critical" => _("Critical"),
    "unknown" => _("Unknown"),
    "pending" => _("Pending"));

$statusService = array(
    "svc_unhandled" => _("Unhandled Problems"),
    "svcpb" => _("Service Problems"),
    "svc"   => _("All")
);

if ($o == "svc") {
    $keyPrefix = "svc";
} elseif ($o == "svcpb") {
    $keyPrefix = "svc";
    unset($statusList["ok"]);
} elseif ($o == "svc_unhandled") {
    $keyPrefix = "svc_unhandled";
    unset($statusList["ok"]);
    unset($statusList["pending"]);
} elseif (preg_match("/svc_([a-z]+)/", $o, $matches)) {
    if (isset($matches[1])) {
        $keyPrefix = "svc";
        $defaultStatus = $matches[1];
    }
}

$form->addElement('select', 'statusFilter', _('Status'), $statusList, array('id' => 'statusFilter', 'onChange' => "filterStatus(this.value);"));
if ((!isset($_GET['o']) || empty($_GET['o'])) && isset($_SESSION['monitoring_service_status_filter'])) {
    $form->setDefaults(array('statusFilter' => $_SESSION['monitoring_service_status_filter']));
    $sDefaultOrder = "1";
}

$form->addElement('select', 'statusService', _('Service Status'), $statusService, array('id' => 'statusService', 'onChange' => "statusServices(this.value);"));

/* Get default service status by GET */
if (isset($_GET['o']) && in_array($_GET['o'], array_keys($statusService))) {
    $form->setDefaults(array('statusService' => $_GET['o']));
/* Get default service status in SESSION */
} elseif ((!isset($_GET['o']) || empty($_GET['o'])) &&  isset($_SESSION['monitoring_service_status'])) {
    $o = $_SESSION['monitoring_service_status'];
    $form->setDefaults(array('statusService' => $_SESSION['monitoring_service_status']));
    $sDefaultOrder = "1";
}

$criticality = new CentreonCriticality($pearDB);
$crits = $criticality->getList(null, "level", 'ASC', null, null, true);
$critArray = array(0 => "");
foreach ($crits as $critId => $crit) {
    $critArray[$critId] = $crit['sc_name'] . " ({$crit['level']})";
}
$form->addElement('select', 'criticality', _('Severity'), $critArray, array('id' => 'critFilter', 'onChange' => "filterCrit(this.value);"));
$form->setDefaults(array('criticality' => isset($_SESSION['criticality_id']) ? $_SESSION['criticality_id'] : "0"));

$renderer = new HTML_QuickForm_Renderer_ArraySmarty($tpl);
$form->accept($renderer);
$tpl->assign('hostStr', _('Host'));
$tpl->assign('serviceStr', _('Service'));
$tpl->assign('statusService', _('Service Status'));
$tpl->assign("filters", _("Filters"));
$tpl->assign('outputStr', _('Output'));
$tpl->assign('poller_listing', $oreon->user->access->checkAction('poller_listing'));
$tpl->assign('pollerStr', _('Poller'));
$tpl->assign('hgStr', _('Hostgroup'));
$criticality = new CentreonCriticality($pearDB);
$tpl->assign('criticalityUsed', count($criticality->getList()));
$tpl->assign('form', $renderer->toArray());
$tpl->display("service.ihtml");

?>
<script type='text/javascript'>
   var tabSortPb = [];
   tabSortPb['champ'] = '<?php echo $problem_sort_type;?>';
   tabSortPb['ordre'] = '<?php echo $problem_sort_order;?>';

   var tabSortAll = [];
   tabSortAll['champ'] = '<?php echo $global_sort_type;?>'; 
   tabSortAll['ordre'] = '<?php echo $global_sort_order;?>';
   
    var ok = '<?php echo _("OK");?>';
    var warning = '<?php echo _("Warning");?>';
    var critical = '<?php echo _("Critical");?>';
    var unknown= '<?php echo _("Unknown");?>';
    var pending= '<?php echo _("Pending");?>';
    
    jQuery('#statusService').change(function() {
        updateSelect();
    });
    
    function updateSelect()
    {
        var oldStatus = jQuery('#statusFilter').val();
        var opts = document.getElementById('statusFilter').options;
        if (jQuery('#statusService').val() == 'svcpb' || jQuery('#statusService').val() == 'svc_unhandled') {
            opts.length = 0;
            opts[opts.length] = new Option("", "");
            opts[opts.length] = new Option(warning, "warning");
            opts[opts.length] = new Option(critical, "critical");
            opts[opts.length] = new Option(unknown, "unknown");
            change_type_order(tabSortPb['champ']);
        } else {
            opts.length = 0;
            opts[opts.length] = new Option("", "");
            opts[opts.length] = new Option(ok, "ok");
            opts[opts.length] = new Option(warning, "warning");
            opts[opts.length] = new Option(critical, "critical");
            opts[opts.length] = new Option(unknown, "unknown");
            opts[opts.length] = new Option(pending, "pending");
            change_type_order(tabSortAll['champ']);
        }
        
        if (jQuery("#statusFilter option[value='"+oldStatus+"']").length > 0) {
            jQuery("#statusFilter option[value='"+oldStatus+"']").prop('selected', true);
        } else {
            jQuery("#statusFilter option[value='']").prop('selected', true);
        }
    }
    
    
    var _keyPrefix;

    jQuery(function () {
        preInit();
        updateSelect();
    });
    function preInit()
    {
        _keyPrefix = '<?php echo $keyPrefix; ?>';
        _sid = '<?php echo $sid ?>';
        _tm = <?php echo $tM ?>;    
        _o = '<?php echo $o; ?>';
        _sDefaultOrder = '<?php echo $sDefaultOrder; ?>';
        sSetOrderInMemory = '<?php echo $sSetOrderInMemory; ?>';
    
        if (_sDefaultOrder == "0") {
            if (_o == 'svc') {
                jQuery("#statusService option[value='svc']").prop('selected', true);
                jQuery("#statusFilter option[value='']").prop('selected', true);
            } else if (_o == 'svc_ok') {
                jQuery("#statusService option[value='svc']").prop('selected', true);
                jQuery("#statusFilter option[value='ok']").prop('selected', true);
            } else if (_o == 'svc_warning') {
                jQuery("#statusService option[value='svc']").prop('selected', true);
                jQuery("#statusFilter option[value='warning']").prop('selected', true);
            } else if (_o == 'svc_critical') {
                jQuery("#statusService option[value='svc']").prop('selected', true);
                jQuery("#statusFilter option[value='critical']").prop('selected', true);
            } else if (_o == 'svc_unknown') {
                jQuery("#statusService option[value='svc']").prop('selected', true);
                jQuery("#statusFilter option[value='unknown']").prop('selected', true);
            } else if (_o == 'svc_pending') {
                jQuery("#statusService option[value='svc']").prop('selected', true);
                jQuery("#statusFilter option[value='pending']").prop('selected', true);
            } else {
               jQuery("#statusService option[value='svc_unhandled']").prop('selected', true);
               jQuery("#statusFilter option[value='']").prop('selected', true);
            }
        }
        filterStatus(document.getElementById('statusFilter').value, 1);
    }

    function filterStatus(value, isInit)
    {
        _o = jQuery('#statusService').val();
        if (value) {
            _o = _keyPrefix + '_' + value;
        } else if (!isInit && _o != 'svcpb') {
            _o = _keyPrefix;
        }
        window.clearTimeout(_timeoutID);
        initM(_tm, _sid, _o);
    }

    function filterCrit(value) {
        window.clearTimeout(_timeoutID);
        initM(_tm, _sid, _o);
    }
    function statusServices(value, isInit)
    {
        _o = value;
        window.clearTimeout(_timeoutID);
        initM(_tm, _sid, _o);
    }
</script>
