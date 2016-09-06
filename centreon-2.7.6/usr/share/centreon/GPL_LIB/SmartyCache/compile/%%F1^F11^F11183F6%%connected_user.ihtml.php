<?php /* Smarty version 2.6.18, created on 2016-09-02 19:53:04
         compiled from connected_user.ihtml */ ?>
<div align="center">
<form id="Form">
	<table class="ListTableMedium">
		<tr class="ListHeader">
			<td class="ListColHeaderLeft"><?php echo $this->_tpl_vars['wi_user']; ?>
</td>
			<td class="ListColHeaderCenter"><?php echo $this->_tpl_vars['distant_location']; ?>
</td>
			<td class="ListColHeaderCenter"><?php echo $this->_tpl_vars['wi_where']; ?>
</td>
			<td class="ListColHeaderCenter"><?php echo $this->_tpl_vars['wi_last_req']; ?>
</td>
			<td class="ListColHeaderCenter">&nbsp;</td>
		</tr>
		<?php $_from = $this->_tpl_vars['session_data']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['outer'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['outer']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['sd']):
        $this->_foreach['outer']['iteration']++;
?>
		<tr class="<?php echo $this->_tpl_vars['sd']['class']; ?>
">
			<td class="ListColLeft"><?php if ($this->_tpl_vars['sd']['admin'] == 1): ?><img src='./img/icons/admin.png' class="ico-18"><?php else: ?><img src='./img/icons/user.png' class="ico-18"><?php endif; ?>&nbsp;&nbsp;<a href='./main.php?p=60301&o=w&contact_id=<?php echo $this->_tpl_vars['sd']['user_id']; ?>
'><?php echo $this->_tpl_vars['sd']['user_alias']; ?>
</a></td>
			<td class="ListColCenter"><?php echo $this->_tpl_vars['sd']['ip_address']; ?>
</td>
			<td class="ListColCenter"><a href='./main.php?p=<?php echo $this->_tpl_vars['sd']['current_page']; ?>
'><?php echo $this->_tpl_vars['sd']['topology_name']; ?>
</a></td>
			<td class="ListColCenter" align=right><?php echo $this->_tpl_vars['sd']['last_reload']; ?>
</td>
			<td class="ListColCenter" align=right><?php echo $this->_tpl_vars['sd']['actions']; ?>
</td>
		</tr>
		<?php endforeach; endif; unset($_from); ?>
	</table>
</form>
</div>