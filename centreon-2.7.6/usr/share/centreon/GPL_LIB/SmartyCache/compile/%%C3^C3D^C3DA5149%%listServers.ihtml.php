<?php /* Smarty version 2.6.18, created on 2016-09-05 17:11:12
         compiled from listServers.ihtml */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('block', 't', 'listServers.ihtml', 20, false),)), $this); ?>
<?php echo '
<script type="text/javascript" src="./include/common/javascript/tool.js"></script>
<script type=\'text/javascript\'>

    function applyConfiguration() {
        var pollers = [];
        jQuery(\'form tr\').not(\'.row_disabled\').find(\'input[id^="poller_"]:checked\').each(function(){
            pollers.push(this.id.substr(7));
        });
        window.location.href = "?p=60902&poller=" + pollers.join(\',\');
    }

</script>
'; ?>


<form name='form' method='POST'>
    <table class="ajaxOption table">
    <tbody>
      <tr>
        <th><h5><?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Filters<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?></h5></th>
      </tr>
      <tr>
        <td><h4><?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Poller<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?></h4></td>
      </tr>
      <tr>
        <td><input type="text" name="searchP" value="<?php echo $this->_tpl_vars['searchP']; ?>
"></td>
        <td><input type="submit" value="<?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Search<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>" class="btc bt_success"></td>
      </tr>
    </tbody>
    </table>
	<table class="ToolbarTable table">
		<tr class="ToolbarTR">
                        <td>
			    <?php if ($this->_tpl_vars['mode_access'] == 'w'): ?>
				<?php echo $this->_tpl_vars['msg']['options']; ?>
 <?php echo $this->_tpl_vars['form']['o1']['html']; ?>

				&nbsp;&nbsp;&nbsp;
				<a href="<?php echo $this->_tpl_vars['msg']['addL']; ?>
" class="btc bt_success"><?php echo $this->_tpl_vars['msg']['addT']; ?>
</a>
			    <?php else: ?>
			    &nbsp;
			    <?php endif; ?>
                            <?php if ($this->_tpl_vars['mode_generate'] > 0): ?>
                            <?php echo $this->_tpl_vars['form']['apply_configuration']['html']; ?>

                            <?php endif; ?>
			</td>
			<input name="p" value="<?php echo $this->_tpl_vars['p']; ?>
" type="hidden">
			<?php 
			   include('./include/common/pagination.php');
			 ?>
		</tr>
	</table>
	<table class="ListTable">
		<tr class="ListHeader">
			<td class="ListColHeaderPicker"><input type="checkbox" name="checkall" onclick="checkUncheckAll(this);"/></td>
			<td class="ListColHeaderLeft"><?php echo $this->_tpl_vars['headerMenu_name']; ?>
</td>
			<td class="ListColHeaderCenter"><?php echo $this->_tpl_vars['headerMenu_ip_address']; ?>
</td>
			<td class="ListColHeaderCenter"><?php echo $this->_tpl_vars['headerMenu_localisation']; ?>
</td>
			<td class="ListColHeaderCenter"><?php echo $this->_tpl_vars['headerMenu_is_running']; ?>
</td>
			<td class="ListColHeaderCenter"><?php echo $this->_tpl_vars['headerMenu_hasChanged']; ?>
<font color='red' style='padding-left:3px;'>*</font></td>
			<td class="ListColHeaderCenter"><?php echo $this->_tpl_vars['headerMenu_pid']; ?>
</td>
			<td class="ListColHeaderCenter"><?php echo $this->_tpl_vars['headerMenu_startTime']; ?>
</td>
			<td class="ListColHeaderCenter"><?php echo $this->_tpl_vars['headerMenu_lastUpdateTime']; ?>
</td>
			<td class="ListColHeaderCenter"><?php echo $this->_tpl_vars['headerMenu_version']; ?>
</td>
			<td class="ListColHeaderCenter"><?php echo $this->_tpl_vars['headerMenu_default']; ?>
</td>
			<td class="ListColHeaderCenter"><?php echo $this->_tpl_vars['headerMenu_status']; ?>
</td>
            <td class="ListColHeaderCenter"><?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Actions<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?></td>
			<td class="ListColHeaderRight"><?php echo $this->_tpl_vars['headerMenu_options']; ?>
</td>
		</tr>
		<?php unset($this->_sections['elem']);
$this->_sections['elem']['name'] = 'elem';
$this->_sections['elem']['loop'] = is_array($_loop=$this->_tpl_vars['elemArr']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['elem']['show'] = true;
$this->_sections['elem']['max'] = $this->_sections['elem']['loop'];
$this->_sections['elem']['step'] = 1;
$this->_sections['elem']['start'] = $this->_sections['elem']['step'] > 0 ? 0 : $this->_sections['elem']['loop']-1;
if ($this->_sections['elem']['show']) {
    $this->_sections['elem']['total'] = $this->_sections['elem']['loop'];
    if ($this->_sections['elem']['total'] == 0)
        $this->_sections['elem']['show'] = false;
} else
    $this->_sections['elem']['total'] = 0;
if ($this->_sections['elem']['show']):

            for ($this->_sections['elem']['index'] = $this->_sections['elem']['start'], $this->_sections['elem']['iteration'] = 1;
                 $this->_sections['elem']['iteration'] <= $this->_sections['elem']['total'];
                 $this->_sections['elem']['index'] += $this->_sections['elem']['step'], $this->_sections['elem']['iteration']++):
$this->_sections['elem']['rownum'] = $this->_sections['elem']['iteration'];
$this->_sections['elem']['index_prev'] = $this->_sections['elem']['index'] - $this->_sections['elem']['step'];
$this->_sections['elem']['index_next'] = $this->_sections['elem']['index'] + $this->_sections['elem']['step'];
$this->_sections['elem']['first']      = ($this->_sections['elem']['iteration'] == 1);
$this->_sections['elem']['last']       = ($this->_sections['elem']['iteration'] == $this->_sections['elem']['total']);
?>
		<tr class=<?php echo $this->_tpl_vars['elemArr'][$this->_sections['elem']['index']]['MenuClass']; ?>
>
			<td class="ListColPicker"><?php echo $this->_tpl_vars['elemArr'][$this->_sections['elem']['index']]['RowMenu_select']; ?>
</td>
			<td class="ListColLeft"><a href="<?php echo $this->_tpl_vars['elemArr'][$this->_sections['elem']['index']]['RowMenu_link']; ?>
"><?php echo $this->_tpl_vars['elemArr'][$this->_sections['elem']['index']]['RowMenu_name']; ?>
</a></td>
			<td class="ListColCenter"><a href="<?php echo $this->_tpl_vars['elemArr'][$this->_sections['elem']['index']]['RowMenu_link']; ?>
"><?php echo $this->_tpl_vars['elemArr'][$this->_sections['elem']['index']]['RowMenu_ip_address']; ?>
</a></td>
			<td class="ListColCenter"><?php echo $this->_tpl_vars['elemArr'][$this->_sections['elem']['index']]['RowMenu_localisation']; ?>
</td>
			<td class="ListColCenter">
              <span class="badge <?php if ($this->_tpl_vars['elemArr'][$this->_sections['elem']['index']]['RowMenu_is_runningFlag']): ?>service_ok<?php else: ?>service_critical<?php endif; ?>">
                <?php echo $this->_tpl_vars['elemArr'][$this->_sections['elem']['index']]['RowMenu_is_running']; ?>

              </span>
            </td>
			<td class="ListColCenter" class="<?php if ($this->_tpl_vars['elemArr'][$this->_sections['elem']['index']]['RowMenu_hasChangedFlag']): ?><?php else: ?>service_critical<?php endif; ?>">
              <?php echo $this->_tpl_vars['elemArr'][$this->_sections['elem']['index']]['RowMenu_hasChanged']; ?>

            </td>
			<td class="ListColCenter"><?php echo $this->_tpl_vars['elemArr'][$this->_sections['elem']['index']]['RowMenu_pid']; ?>
</td>
			<td class="ListColCenter"><?php echo $this->_tpl_vars['elemArr'][$this->_sections['elem']['index']]['RowMenu_startTime']; ?>
</td>
			<td class="ListColCenter"<?php if ($this->_tpl_vars['elemArr'][$this->_sections['elem']['index']]['RowMenu_statusVal'] == 1): ?> style='background-color:#<?php if ($this->_tpl_vars['elemArr'][$this->_sections['elem']['index']]['RowMenu_lastUpdateTimeFlag']): ?>F7D507;<?php endif; ?>'<?php endif; ?>><?php echo $this->_tpl_vars['elemArr'][$this->_sections['elem']['index']]['RowMenu_lastUpdateTime']; ?>
</td>
			<td class="ListColCenter"><?php echo $this->_tpl_vars['elemArr'][$this->_sections['elem']['index']]['RowMenu_version']; ?>
</td>
			<td class="ListColCenter"><?php echo $this->_tpl_vars['elemArr'][$this->_sections['elem']['index']]['RowMenu_is_default']; ?>
</td>
			<td class="ListColCenter"><?php echo $this->_tpl_vars['elemArr'][$this->_sections['elem']['index']]['RowMenu_status']; ?>
</td>
            <td class="ListColCenter">
              <?php if ($this->_tpl_vars['mode_access'] == 'w' && $this->_tpl_vars['elemArr'][$this->_sections['elem']['index']]['RowMenu_cfg_id'] != ""): ?> 
              <!-- Link for edit poller monitoring engine configuration -->
              <a href="./main.php?p=60903&o=c&nagios_id=<?php echo $this->_tpl_vars['elemArr'][$this->_sections['elem']['index']]['RowMenu_cfg_id']; ?>
">
                <img src="./img/icons/edit_conf.png" class="ico-16" title="Edit monitoring engine configuration">
              </a>
              <?php endif; ?>
            </td>
			<td class="ListColRight"><?php if ($this->_tpl_vars['mode_access'] == 'w'): ?><?php echo $this->_tpl_vars['elemArr'][$this->_sections['elem']['index']]['RowMenu_options']; ?>
<?php else: ?>&nbsp;<?php endif; ?></td>
		</tr>
		<?php endfor; endif; ?>
	</table>
	<table class="ToolbarTable table">
		<tr class="ToolbarTR">
			<?php if ($this->_tpl_vars['mode_access'] == 'w'): ?>
			<td>
				<?php echo $this->_tpl_vars['msg']['options']; ?>
 <?php echo $this->_tpl_vars['form']['o2']['html']; ?>

				&nbsp;&nbsp;&nbsp;
				<a href="<?php echo $this->_tpl_vars['msg']['addL']; ?>
" class="btc bt_success"><?php echo $this->_tpl_vars['msg']['addT']; ?>
</a>
			</td>
			<?php else: ?>
			<td>&nbsp;</td>
			<?php endif; ?>
			<input name="p" value="<?php echo $this->_tpl_vars['p']; ?>
" type="hidden">
			<?php 
			   include('./include/common/pagination.php');
			 ?>
		</tr>
		<tr>
			<td colspan='3' style='text-align:right;vertical-align:bottom; height: 50px;'><font color='red'>*</font>&nbsp;<?php echo $this->_tpl_vars['notice']; ?>
</td>
		</tr>
	</table>
<input type='hidden' name='o' id='o' value='42'>
<input type='hidden' id='limit' name='limit' value='<?php echo $this->_tpl_vars['limit']; ?>
'>	
<?php echo $this->_tpl_vars['form']['hidden']; ?>

</form>
<?php echo '
<script type=\'text/javascript\'>

    setDisabledRowStyle();

</script>
'; ?>
