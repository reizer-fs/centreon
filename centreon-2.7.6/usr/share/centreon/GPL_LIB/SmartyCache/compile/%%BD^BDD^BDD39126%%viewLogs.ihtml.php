<?php /* Smarty version 2.6.18, created on 2016-09-02 19:53:12
         compiled from viewLogs.ihtml */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('block', 't', 'viewLogs.ihtml', 5, false),)), $this); ?>
<form name='form' method='POST'>
<table class="ajaxOption table">
  <tbody>
    <tr>
      <th><h5><?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Filters<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?></h5></th>
    </tr>
	<tr>
        <td><h4><?php echo $this->_tpl_vars['search_object_str']; ?>
</h4></td>
		<td><h4><?php echo $this->_tpl_vars['search_user_str']; ?>
</h4></td>
        <td><h4><?php echo $this->_tpl_vars['obj_str']; ?>
</h4></td>
		<td></td>
	</tr>
    <tr>
      <td><input type='text' name='searchO' value='<?php echo $this->_tpl_vars['searchO']; ?>
' /></td>
      <td><input type='text' name='searchU' value='<?php echo $this->_tpl_vars['searchU']; ?>
' /></td>
      <td><select name='otype'><?php echo $this->_tpl_vars['obj_type']; ?>
</select></td>
      <td><input type='submit' class="btc bt_success" name='SearchB' value='<?php echo $this->_tpl_vars['Search']; ?>
' /></td>
    </tr>
  </tbody>
</table>
<br />
<table class="ToolbarTable table">
        <tr class="ToolbarTR">
                <td style='width:30%;'><input name="p" value="<?php echo $this->_tpl_vars['p']; ?>
" type="hidden">&nbsp;</td>
                <?php 
                   include('./include/common/pagination.php');
                 ?>
        </tr>
</table>
<table class="ListTable">
	<tr class="ListHeader">
		<td class="ListColHeaderCenter" style='width:120px'><?php echo $this->_tpl_vars['time']; ?>
</td>
		<td class="ListColHeaderCenter" style="white-space:nowrap;"><?php echo $this->_tpl_vars['modification_type']; ?>
</td>		
		<td class="ListColHeaderCenter" style="white-space:nowrap;"><?php echo $this->_tpl_vars['type']; ?>
</td>
		<td class="ListColHeaderCenter" style="white-space:nowrap;"><?php echo $this->_tpl_vars['object_name']; ?>
</td>
		<td class="ListColHeaderCenter" style="white-space:nowrap;"><?php echo $this->_tpl_vars['author']; ?>
</td>
	</tr>
	<?php $this->assign('classStyle', 'list_two'); ?>
	<?php $_from = $this->_tpl_vars['tabz_obj_name']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['item']):
?>
		<?php if ($this->_tpl_vars['classStyle'] == 'list_two'): ?>
			<?php $this->assign('classStyle', 'list_one'); ?>
		<?php else: ?>
			<?php $this->assign('classStyle', 'list_two'); ?>
		<?php endif; ?>
		<tr class='<?php echo $this->_tpl_vars['classStyle']; ?>
'>
			<td class='ListColCenter'><?php echo $this->_tpl_vars['tabz_obj_time'][$this->_tpl_vars['key']]; ?>
</td>
			<?php $this->assign('currenttype', $this->_tpl_vars['tabz_event_type'][$this->_tpl_vars['key']]); ?>
			<td class='ListColCenter' style='width:120px;background-color:<?php echo $this->_tpl_vars['color'][$this->_tpl_vars['currenttype']]; ?>
'><b><?php echo $this->_tpl_vars['tabz_event_type'][$this->_tpl_vars['key']]; ?>
</b></td>
			<td class='ListColCenter'><?php echo $this->_tpl_vars['tabz_obj_type'][$this->_tpl_vars['key']]; ?>
</td>
			<td class='ListColLeft'>
			<a href="./main.php?p=<?php echo $this->_tpl_vars['p']; ?>
&object_type=<?php echo $this->_tpl_vars['tabz_obj_type'][$this->_tpl_vars['key']]; ?>
&object_id=<?php echo $this->_tpl_vars['tabz_obj_id'][$this->_tpl_vars['key']]; ?>
&searchU=<?php echo $this->_tpl_vars['searchU']; ?>
&searchO=<?php echo $this->_tpl_vars['searchO']; ?>
&otype=<?php echo $this->_tpl_vars['type_id']; ?>
">
			<?php if ($this->_tpl_vars['tabz_host'][$this->_tpl_vars['key']]): ?>
			    <?php echo $this->_tpl_vars['tabz_host'][$this->_tpl_vars['key']]; ?>
 - 
			<?php endif; ?>
			<?php echo $this->_tpl_vars['tabz_obj_name'][$this->_tpl_vars['key']]; ?>
</a> 
			
			<?php if ($this->_tpl_vars['tabz_hosts'][$this->_tpl_vars['key']]): ?>
			(
			<?php $this->assign('flag', 0); ?>
			<?php $_from = $this->_tpl_vars['tabz_hosts']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key2'] => $this->_tpl_vars['item2']):
?>
				 <?php $this->assign('flag', 1); ?>
				 <?php if ($this->_tpl_vars['flag'] == 1): ?> / <?php endif; ?>
				 <?php echo $this->_tpl_vars['item2']; ?>

			<?php endforeach; endif; unset($_from); ?>
			)
			<?php endif; ?>
			
			</td>
			<td class='ListColCenter'><?php echo $this->_tpl_vars['tabz_contact'][$this->_tpl_vars['key']]; ?>
</td>
		</tr>
	<?php endforeach; endif; unset($_from); ?>
</table>
<table class="ToolbarTable table">
        <tr class="ToolbarTR">
                <td style='width:30%;'><input name="p" value="<?php echo $this->_tpl_vars['p']; ?>
" type="hidden">&nbsp;</td>
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