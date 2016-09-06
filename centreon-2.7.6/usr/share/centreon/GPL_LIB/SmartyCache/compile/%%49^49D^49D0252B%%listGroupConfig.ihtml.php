<?php /* Smarty version 2.6.18, created on 2016-09-02 19:53:19
         compiled from listGroupConfig.ihtml */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('block', 't', 'listGroupConfig.ihtml', 6, false),)), $this); ?>
<script type="text/javascript" src="./include/common/javascript/tool.js"></script>
<form name='form' method='POST'>
    <table class="ajaxOption table">
    <tbody>
      <tr>
        <th><h5><?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Filters<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?></h5></th>
      </tr>
      <tr>
        <td><h4><?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>ACL Group<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?></h4></td>
      </tr>
      <tr>
        <td><input type="text" name="searchACLG" value="<?php echo $this->_tpl_vars['searchACLG']; ?>
"></td>
        <td><input type="submit" value="<?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Search<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>" class="btc bt_success"></td>
      </tr>
    </tbody>
    </table>
	<table class="ToolbarTable table">
		<tr class="ToolbarTR">
			<td>
				<?php echo $this->_tpl_vars['msg']['options']; ?>
 <?php echo $this->_tpl_vars['form']['o1']['html']; ?>

				&nbsp;&nbsp;&nbsp;
				<a href="<?php echo $this->_tpl_vars['msg']['addL']; ?>
" class="btc bt_success"><?php echo $this->_tpl_vars['msg']['addT']; ?>
</a>
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
			<td class="ListColHeaderCenter"><?php echo $this->_tpl_vars['headerMenu_desc']; ?>
</td>
			<td class="ListColHeaderCenter"><?php echo $this->_tpl_vars['headerMenu_contacts']; ?>
</td>
			<td class="ListColHeaderCenter"><?php echo $this->_tpl_vars['headerMenu_contactgroups']; ?>
</td>
			<td class="ListColHeaderCenter"><?php echo $this->_tpl_vars['headerMenu_status']; ?>
</td>
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
"><?php echo $this->_tpl_vars['elemArr'][$this->_sections['elem']['index']]['RowMenu_desc']; ?>
</a></td>
			<td class="ListColCenter"><?php echo $this->_tpl_vars['elemArr'][$this->_sections['elem']['index']]['RowMenu_contacts']; ?>
</td>
			<td class="ListColCenter"><?php echo $this->_tpl_vars['elemArr'][$this->_sections['elem']['index']]['RowMenu_contactgroups']; ?>
</td>
			<td class="ListColCenter"><?php echo $this->_tpl_vars['elemArr'][$this->_sections['elem']['index']]['RowMenu_status']; ?>
</td>
			<td class="ListColRight" align="right"><?php echo $this->_tpl_vars['elemArr'][$this->_sections['elem']['index']]['RowMenu_options']; ?>
</td>
		</tr>
		<?php endfor; endif; ?>	
	</table>
	<table class="ToolbarTable table">
		<tr class="ToolbarTR">
			<td>
				<?php echo $this->_tpl_vars['msg']['options']; ?>
 <?php echo $this->_tpl_vars['form']['o2']['html']; ?>

				&nbsp;&nbsp;&nbsp;
				<a href="<?php echo $this->_tpl_vars['msg']['addL']; ?>
" class="btc bt_success"><?php echo $this->_tpl_vars['msg']['addT']; ?>
</a>
			</td>
			<input name="p" value="<?php echo $this->_tpl_vars['p']; ?>
" type="hidden">
			<?php 
			   include('./include/common/pagination.php');
			 ?>
		</tr>
	</table>
<input type='hidden' name='o' id='o' value='42'>
<input type='hidden' id='limit' name='limit' value='<?php echo $this->_tpl_vars['limit']; ?>
'>	
<?php echo $this->_tpl_vars['form']['hidden']; ?>

</form>