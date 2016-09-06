<?php /* Smarty version 2.6.18, created on 2016-09-02 19:54:11
         compiled from formCentreonBroker.ihtml */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'math', 'formCentreonBroker.ihtml', 8, false),array('modifier', 'capitalize', 'formCentreonBroker.ihtml', 8, false),)), $this); ?>
<?php echo $this->_tpl_vars['form']['javascript']; ?>

<link rel="stylesheet" type="text/css" href="./include/common/javascript/jquery/plugins/qtip/jquery-qtip.css" />
<form <?php echo $this->_tpl_vars['form']['attributes']; ?>
>
	<div class="headerTabContainer">
	<ul id="mainnav">
		<li class="a" id='c1'><a href="#" onclick="javascript:montre('1'); changeTab('1');"><?php echo $this->_tpl_vars['sort1']; ?>
</a></li>
		<?php $_from = $this->_tpl_vars['tabs']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['tabForeach'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['tabForeach']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['tab']):
        $this->_foreach['tabForeach']['iteration']++;
?>
		<li class="b" id='c<?php echo smarty_function_math(array('equation' => "x + y",'x' => ($this->_foreach['tabForeach']['iteration']-1),'y' => 2), $this);?>
'><a href="#" onclick="javascript:montre('<?php echo smarty_function_math(array('equation' => "x + y",'x' => ($this->_foreach['tabForeach']['iteration']-1),'y' => 2), $this);?>
');changeTab('tab<?php echo smarty_function_math(array('equation' => "x + y",'x' => ($this->_foreach['tabForeach']['iteration']-1),'y' => 2), $this);?>
');"><?php echo ((is_array($_tmp=$this->_tpl_vars['tab']['id'])) ? $this->_run_mod_handler('capitalize', true, $_tmp) : smarty_modifier_capitalize($_tmp)); ?>
</a></li>
		<?php endforeach; endif; unset($_from); ?>
	</ul>
    <div id="validFormTop">
	<?php if ($this->_tpl_vars['o'] == 'a' || $this->_tpl_vars['o'] == 'c'): ?>
		<p class="oreonbutton"><?php echo $this->_tpl_vars['form']['submitC']['html']; ?>
<?php echo $this->_tpl_vars['form']['submitA']['html']; ?>
&nbsp;&nbsp;&nbsp;<?php echo $this->_tpl_vars['form']['reset']['html']; ?>
</p>
	<?php else: ?>
		<p class="oreonbutton"><?php echo $this->_tpl_vars['form']['change']['html']; ?>
</p>
	<?php endif; ?>
	</div>
	</div>
    <div id='tab1' class='tab'>
        <table class="formTable table">
            <tr class="list_lvl_1">
                <td class="ListColLvl1_name" colspan="2">
                    <h4><?php echo $this->_tpl_vars['centreonbroker_main_options']; ?>
</h4>
                </td>
            </tr>
            <tr class="list_one"><td class="FormRowField"><?php echo $this->_tpl_vars['form']['ns_nagios_server']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['ns_nagios_server']['html']; ?>
</td></tr>
            <tr class="list_two"><td class="FormRowField"><?php echo $this->_tpl_vars['form']['name']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['name']['html']; ?>
</td></tr>
            <tr class="list_one"><td class="FormRowField"><?php echo $this->_tpl_vars['form']['filename']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['filename']['html']; ?>
</td></tr>
            <tr class="list_two"><td class="FormRowField"><?php echo $this->_tpl_vars['form']['retention_path']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['retention_path']['html']; ?>
</td></tr>
            <tr class="list_one"><td class="FormRowField"><?php echo $this->_tpl_vars['form']['activate']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['activate']['html']; ?>
</td></tr>
            <tr class="list_lvl_1">
                <td class="ListColLvl1_name" colspan="2">
                    <h4><?php echo $this->_tpl_vars['centreonbroker_log_options']; ?>
</h4>
                </td>
            </tr>
            <tr class="list_one"><td class="FormRowField"><?php echo $this->_tpl_vars['form']['write_timestamp']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['write_timestamp']['html']; ?>
</td></tr>
            <tr class="list_two"><td class="FormRowField"><?php echo $this->_tpl_vars['form']['write_thread_id']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['write_thread_id']['html']; ?>
</td></tr>
            <tr class="list_lvl_1">
                <td class="ListColLvl1_name" colspan="2">
                    <h4><?php echo $this->_tpl_vars['centreonbroker_advanced_options']; ?>
</h4>
                </td>
            </tr>
            <tr class="list_one"><td class="FormRowField"><?php echo $this->_tpl_vars['form']['stats_activate']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['stats_activate']['html']; ?>
</td></tr>
            <tr class="list_two"><td class="FormRowField"><?php echo $this->_tpl_vars['form']['correlation_activate']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['correlation_activate']['html']; ?>
</td></tr>
            <tr class="list_one"><td class="FormRowField"><?php echo $this->_tpl_vars['form']['event_queue_max_size']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['event_queue_max_size']['html']; ?>
</td></tr>
            <tr class="list_two"><td class="FormRowField"><?php echo $this->_tpl_vars['form']['command_file']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['command_file']['html']; ?>
</td></tr>
            <tr class="list_lvl_2"><td class="ListColLvl2_name" colspan="2"><?php echo $this->_tpl_vars['form']['required']['_note']; ?>
</td></tr>
        </table>
    </div>
	<?php $_from = $this->_tpl_vars['tabs']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['tabForeach2'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['tabForeach2']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['tab']):
        $this->_foreach['tabForeach2']['iteration']++;
?>
	<div id='tab<?php echo smarty_function_math(array('equation' => "x + y",'x' => ($this->_foreach['tabForeach2']['iteration']-1),'y' => 2), $this);?>
' class='tab'>
		<table class="formTable table" id="<?php echo $this->_tpl_vars['tab']['id']; ?>
">
			<tbody id="<?php echo $this->_tpl_vars['tab']['id']; ?>
_0">
                </tr>
				<tr class="list_lvl_1">
                  <td class="ListColLvl1_name" colspan="2">
                    <h4><?php echo $this->_tpl_vars['tab']['name']; ?>
</h4>
                  </td>
                </tr>
				<tr class="list_one"><td class="FormRowValue" colspan="2"><select id="block_<?php echo $this->_tpl_vars['tab']['id']; ?>
" onchange="checkTypeValidity(this)"><?php $_from = $this->_tpl_vars['tab']['blocks']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['block']):
?>
				<option value="<?php echo $this->_tpl_vars['block']['id']; ?>
"><?php echo $this->_tpl_vars['block']['name']; ?>
</option>
				<?php endforeach; endif; unset($_from); ?></select>&nbsp;<a id="add_<?php echo $this->_tpl_vars['tab']['id']; ?>
" href="javascript:addInfo('<?php echo $this->_tpl_vars['tab']['id']; ?>
')" class='btc bt_success'><?php echo $this->_tpl_vars['tab']['link']; ?>
</a></td></tr>
			</tbody>
			<?php $_from = $this->_tpl_vars['tab']['forms']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['formForeach'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['formForeach']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['formBlock']):
        $this->_foreach['formForeach']['iteration']++;
?>
				<?php $this->assign('posAbs', ($this->_foreach['formForeach']['iteration']-1)); ?>
				<?php $this->assign('posBlock', $this->_tpl_vars['posAbs']+1); ?>
			<tbody id="<?php echo $this->_tpl_vars['tab']['id']; ?>
_<?php echo $this->_tpl_vars['posBlock']; ?>
">
				<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'blockConfig.ihtml', 'smarty_include_vars' => array('tagBlock' => $this->_tpl_vars['tab']['id'],'posBlock' => $this->_tpl_vars['posBlock'],'formBlock' => $this->_tpl_vars['formBlock'],'helps' => $this->_tpl_vars['tab']['helps'][$this->_tpl_vars['posAbs']])));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
			</tbody>
			<?php endforeach; endif; unset($_from); ?>
		</table>
	</div>
	<?php endforeach; endif; unset($_from); ?>
	<div id="validForm">
	<?php if ($this->_tpl_vars['o'] == 'a' || $this->_tpl_vars['o'] == 'c'): ?>
		<p class="oreonbutton"><?php echo $this->_tpl_vars['form']['submitC']['html']; ?>
<?php echo $this->_tpl_vars['form']['submitA']['html']; ?>
&nbsp;&nbsp;&nbsp;<?php echo $this->_tpl_vars['form']['reset']['html']; ?>
</p>
	<?php else: ?>
		<p class="oreonbutton"><?php echo $this->_tpl_vars['form']['change']['html']; ?>
</p>
	<?php endif; ?>
	</div>
	<?php echo $this->_tpl_vars['form']['hidden']; ?>

</form>
<?php echo '
<style type="text/css">
span.v_required_star {
   font-size: 12px;
   padding-left: 5px; 
   color: red;
}
</style>
<script type="text/javascript" src="./include/common/javascript/jquery/plugins/qtip/jquery-qtip.js"></script>
<script type="text/javascript" src="./lib/HTML/QuickForm/qfamsHandler-min.js"></script>
<script type="text/javascript" src="./include/common/javascript/jquery/plugins/centreon/jquery.centreonValidate.js"></script>
<script type="text/javascript">
function mk_paginationFF(){};
function set_header_title(){};

function Infos() {
	this.tags = new Array();
	
	this.getPos = function(type){
		if (this.tags[type] == undefined) {
			this.tags[type] = 0;
		}
		return this.tags[type];
	};
	
	this.setPos = function(type, value){
		this.tags[type] = value;
	};
	
	this.incrementPos = function(type){
		this.tags[type]++;
	};
}

var infos = new Infos();
'; ?>

<?php $_from = $this->_tpl_vars['tabs']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['tab']):
?>
infos.setPos("<?php echo $this->_tpl_vars['tab']['id']; ?>
", <?php echo $this->_tpl_vars['tab']['nb']; ?>
);
<?php endforeach; endif; unset($_from); ?>
<?php echo '

var uniqueType = new Array();'; ?>

<?php $_from = $this->_tpl_vars['tabs']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['tab']):
?>
<?php $_from = $this->_tpl_vars['tab']['blocks']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['block']):
?>
<?php if ($this->_tpl_vars['block']['unique'] == 1): ?>
uniqueType["<?php echo $this->_tpl_vars['block']['id']; ?>
"] = true;
<?php else: ?>
uniqueType["<?php echo $this->_tpl_vars['block']['id']; ?>
"] = false;
<?php endif; ?>
<?php endforeach; endif; unset($_from); ?>
<?php endforeach; endif; unset($_from); ?><?php echo '

function addInfo(type) {
	var prev_id = infos.getPos(type);
        infos.incrementPos(type);
	var id = prev_id + 1;
	var id_name = type + \'_\' + id;
	var blockId = $(\'block_\' + type).getValue();
	var params;

    var tbody = new Element(\'tbody\');
    tbody.writeAttribute(\'id\', id_name);
    Element.insert($(type), {bottom: tbody});
    params = \'?p='; ?>
<?php echo $this->_tpl_vars['p']; ?>
<?php echo '&o=j&pos=\' + id + \'&min=1&blockId=\' + blockId + \'&tag=\' + type;
    new Ajax.Updater(
    		tbody,
    		\'main.php\' + params,
    		{
    			evalScripts: true,
    			onComplete: function(response) {
    				if (response.status == 200) {
	    				checkTypeValidity(\'block_\' + type);
                                        jQuery("#"+id_name).centreonValidate();
    				}
    			}
    		}
    		);
}

function deleteRow(type, id) {
	var row_name = type + \'_\' + id;
	var parent = document.getElementById(type);
	var delEl = document.getElementById(row_name);
        jQuery("#"+row_name).find(\'input\').qtip(\'destroy\');
	parent.removeChild(delEl);
	checkTypeValidity("block_" + type);
}

function checkTypeValidity(selectType) {
	var typeId = $(selectType).getValue();
	var tagName = $(selectType).id.replace(\'block_\', \'\');
	if (typeId in uniqueType && uniqueType[typeId] == true) {
		var blockNameArray = $$(\'input[value="\' + typeId + \'"]\');
		if (blockNameArray.length > 0) {
			$(\'add_\' + tagName).hide();
		} else {
			$(\'add_\' + tagName).show();
		}
	} else {
		$(\'add_\' + tagName).show();
	}
}

function loadedConfiguration() {
$$(\'table.ListTable\').each(function(el) {
	if (el.id != undefined && el.id != \'\') {
		checkTypeValidity("block_" + el.id);
	}
});
}

function changeTab(tab) {
	jQuery(\'#Form\').centreonValidate(\'validate\');
	purgeHideInput(tab);
}

function purgeHideInput(tab) {
	jQuery(\'.tab\').each(function(idx, el){
		if (el.id != tab) {
			jQuery(el).find(\':input\').each(function(idx, input){
				jQuery(input).qtip(\'destroy\');
			});
		}
	});
}

function formValidate() {
	jQuery(\'#Form\').centreonValidate(\'validate\');
	if (jQuery(\'#Form\').centreonValidate(\'hasError\')) {
		var activeTab = jQuery(\'.tab\').filter(function(index) { return jQuery(this).css(\'display\') === \'block\'; })[0];
		purgeHideInput(activeTab.id);
		return false;
	}
	return true;
}

jQuery(function() {
	jQuery(\'#Form\').centreonValidate();
});
</script> 
'; ?>
