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

	if (!isset($centreon))
		exit();

        include_once("./class/centreonUtils.class.php");

	include("./include/common/autoNumLimit.php");

	/*
	 * Search engine
	 */
	$SearchTool = NULL;
    $search = '';
	if (isset($_POST['searchR']) && $_POST['searchR']) {
        $search = $_POST['searchR'];
		$SearchTool = " WHERE resource_name LIKE '%".htmlentities($search, ENT_QUOTES, "UTF-8")."%'";
    }

    $aclCond = "";
    if (!$oreon->user->admin && count($allowedResourceConf)) {
        if (isset($search) && $search) {
            $aclCond = " AND ";
        } else {
            $aclCond = " WHERE ";
        }
        $aclCond .= "resource_id IN (".implode(',', array_keys($allowedResourceConf)).") ";
    }


	$DBRESULT = $pearDB->query("SELECT COUNT(*)
                                FROM cfg_resource $SearchTool $aclCond");

	$tmp = $DBRESULT->fetchRow();
	$rows = $tmp["COUNT(*)"];

	include("./include/common/checkPagination.php");

	/*
	 * Smarty template Init
	 */
	$tpl = new Smarty();
	$tpl = initSmartyTpl($path, $tpl);

	/* Access level */
	($centreon->user->access->page($p) == 1) ? $lvl_access = 'w' : $lvl_access = 'r';
	$tpl->assign('mode_access', $lvl_access);

	/*
	 * start header menu
	 */
	$tpl->assign("headerMenu_icone", "<img src='./img/icones/16x16/pin_red.gif'>");
	$tpl->assign("headerMenu_name", _("Name"));
	$tpl->assign("headerMenu_values", _("Values"));
	$tpl->assign("headerMenu_comment", _("Description"));
    $tpl->assign("headerMenu_associated_poller", _("Associated pollers"));
	$tpl->assign("headerMenu_status", _("Status"));
	$tpl->assign("headerMenu_options", _("Options"));

	/*
	 * resources list
	 */
	$rq = "SELECT *
           FROM cfg_resource $SearchTool $aclCond
           ORDER BY resource_name
           LIMIT ".$num * $limit.", ".$limit;
	$DBRESULT = $pearDB->query($rq);

	$form = new HTML_QuickForm('select_form', 'POST', "?p=".$p);

	/*
	 * Different style between each lines
	 */
	$style = "one";

	/*
	 * Fill a tab with a mutlidimensionnal Array we put in $tpl
	 */
	$elemArr = array();
	for ($i = 0; $resource = $DBRESULT->fetchRow(); $i++) {
		preg_match("\$USER([0-9]*)\$", $resource["resource_name"], $tabResources);
		$selectedElements = $form->addElement('checkbox', "select[".$resource['resource_id']."]");
		$moptions  = "";
		if ($resource["resource_activate"])
			$moptions .= "<a href='main.php?p=".$p."&resource_id=".$resource['resource_id']."&o=u&limit=".$limit."&num=".$num."&search=".$search."'><img src='img/icons/disabled.png' class='ico-14 margin_right' border='0' alt='"._("Disabled")."'></a>";
		else
			$moptions .= "<a href='main.php?p=".$p."&resource_id=".$resource['resource_id']."&o=s&limit=".$limit."&num=".$num."&search=".$search."'><img src='img/icons/enabled.png' class='ico-14 margin_right' border='0' alt='"._("Enabled")."'></a>";
		$moptions .= "<input onKeypress=\"if(event.keyCode > 31 && (event.keyCode < 45 || event.keyCode > 57)) event.returnValue = false; if(event.which > 31 && (event.which < 45 || event.which > 57)) return false;\" maxlength=\"3\" size=\"3\" value='1' style=\"margin-bottom:0px;\" name='dupNbr[".$resource['resource_id']."]'></input>";
		$elemArr[$i] = array(	"order" => $tabResources[1],
								"MenuClass"=>"list_".$style,
								"RowMenu_select"=>$selectedElements->toHtml(),
								"RowMenu_name"=>CentreonUtils::escapeSecure($resource["resource_name"]),
								"RowMenu_link"=>"?p=".$p."&o=c&resource_id=".$resource['resource_id'],
								"RowMenu_values"=>substr($resource["resource_line"], 0, 40),
								"RowMenu_comment"=>CentreonUtils::escapeSecure(substr(html_entity_decode($resource["resource_comment"], ENT_QUOTES, "UTF-8"), 0, 40)),
                                "RowMenu_associated_poller" => getLinkedPollerList($resource['resource_id']),
								"RowMenu_status"=>$resource["resource_activate"] ? _("Enabled") :  _("Disabled"),
								"RowMenu_options"=>$moptions);
		$style != "two" ? $style = "two" : $style = "one";
	}

	$flag = 1;
	while ($flag){
		$flag = 0;
		foreach ($elemArr as $key => $value){
			$key1 = $key+1;
			if (isset($elemArr[$key+1]) && $value["order"] > $elemArr[$key+1]["order"]){
				$swmapTab = $elemArr[$key+1];
				$elemArr[$key+1] = $elemArr[$key];
				$elemArr[$key] = $swmapTab;
				$flag = 1;
			} elseif (!isset($elemArr[$key+1]) && isset($elemArr[$key-1]["order"])){
				if ($value["order"] < $elemArr[$key-1]["order"]){
					$swmapTab = $elemArr[$key-1];
					$elemArr[$key-1] = $elemArr[$key];
					$elemArr[$key] = $swmapTab;
					$flag = 1;
				}
			}
		}
	}

	$tpl->assign("elemArr", $elemArr);
	/*
	 * Different messages we put in the template
	 */
	$tpl->assign('msg', array ("addL"=>"?p=".$p."&o=a", "addT"=>_("Add"), "delConfirm"=>_("Do you confirm the deletion ?")));

	/*
	 * Toolbar select
	 */
	?>
	<script type="text/javascript">
	function setO(_i) {
		document.forms['form'].elements['o'].value = _i;
	}
	</SCRIPT>
	<?php
	$attrs1 = array(
		'onchange'=>"javascript: " .
				"if (this.form.elements['o1'].selectedIndex == 1 && confirm('"._("Do you confirm the duplication ?")."')) {" .
				" 	setO(this.form.elements['o1'].value); submit();} " .
				"else if (this.form.elements['o1'].selectedIndex == 2 && confirm('"._("Do you confirm the deletion ?")."')) {" .
				" 	setO(this.form.elements['o1'].value); submit();} " .
				"else if (this.form.elements['o1'].selectedIndex == 3) {" .
				" 	setO(this.form.elements['o1'].value); submit();} " .
				"");
	$form->addElement('select', 'o1', NULL, array(NULL=>_("More actions"), "m"=>_("Duplicate"), "d"=>_("Delete")), $attrs1);
	$form->setDefaults(array('o1' => NULL));

	$attrs2 = array(
		'onchange'=>"javascript: " .
				"if (this.form.elements['o2'].selectedIndex == 1 && confirm('"._("Do you confirm the duplication ?")."')) {" .
				" 	setO(this.form.elements['o2'].value); submit();} " .
				"else if (this.form.elements['o2'].selectedIndex == 2 && confirm('"._("Do you confirm the deletion ?")."')) {" .
				" 	setO(this.form.elements['o2'].value); submit();} " .
				"else if (this.form.elements['o2'].selectedIndex == 3) {" .
				" 	setO(this.form.elements['o2'].value); submit();} " .
				"");
    $form->addElement('select', 'o2', NULL, array(NULL=>_("More actions"), "m"=>_("Duplicate"), "d"=>_("Delete")), $attrs2);
	$form->setDefaults(array('o2' => NULL));

	$o1 = $form->getElement('o1');
	$o1->setValue(NULL);
	$o1->setSelected(NULL);

	$o2 = $form->getElement('o2');
	$o2->setValue(NULL);
	$o2->setSelected(NULL);

	$tpl->assign('limit', $limit);
    $tpl->assign('searchR', $search);

	/*
	 * Apply a template definition
	 */
	$renderer = new HTML_QuickForm_Renderer_ArraySmarty($tpl);
	$form->accept($renderer);
	$tpl->assign('form', $renderer->toArray());
	$tpl->display("listResources.ihtml");
?>
