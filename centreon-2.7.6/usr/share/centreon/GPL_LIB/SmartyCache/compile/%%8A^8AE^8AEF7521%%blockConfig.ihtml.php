<?php /* Smarty version 2.6.18, created on 2016-09-02 19:54:11
         compiled from blockConfig.ihtml */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'capitalize', 'blockConfig.ihtml', 2, false),array('modifier', 'is_array', 'blockConfig.ihtml', 18, false),array('block', 't', 'blockConfig.ihtml', 19, false),)), $this); ?>
<tr class="list_lvl_1">
  <td class="ListColLvl1_name"><?php echo ((is_array($_tmp=$this->_tpl_vars['tagBlock'])) ? $this->_run_mod_handler('capitalize', true, $_tmp) : smarty_modifier_capitalize($_tmp)); ?>
 <?php echo $this->_tpl_vars['posBlock']; ?>
 - <?php echo $this->_tpl_vars['formBlock']['header']['typeName']; ?>
</td>
  <td class="ListColLvl1_name" style="text-align: right;"><a href="javascript:deleteRow('<?php echo $this->_tpl_vars['tagBlock']; ?>
', <?php echo $this->_tpl_vars['posBlock']; ?>
);"><img class="ico-14" src="./img/icons/circle-cross.png" style="vertical-align:middle;"/></a></td>
</tr>
<?php $_from = $this->_tpl_vars['formBlock']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['tagKey'] => $this->_tpl_vars['tagEl']):
?>
<?php if ($this->_tpl_vars['tagKey'] == $this->_tpl_vars['tagBlock']): ?>
<?php $_from = $this->_tpl_vars['tagEl']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['posKey'] => $this->_tpl_vars['posEl']):
?>
<?php $_from = $this->_tpl_vars['posEl']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['elementFor'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['elementFor']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['element']):
        $this->_foreach['elementFor']['iteration']++;
?>
<?php if (($this->_foreach['elementFor']['iteration']-1) % 2 == 0): ?>
<?php $this->assign('classEl', 'list_one'); ?>
<?php else: ?>
<?php $this->assign('classEl', 'list_two'); ?>
<?php endif; ?>
<tr class="<?php echo $this->_tpl_vars['classEl']; ?>
">
  <td class="FormRowField">
  	<img class="helpTooltip" name="<?php echo $this->_tpl_vars['element']['name']; ?>
" />
  	<label for="<?php echo $this->_tpl_vars['element']['name']; ?>
">
        <?php if (((is_array($_tmp=$this->_tpl_vars['element']['label'])) ? $this->_run_mod_handler('is_array', true, $_tmp) : is_array($_tmp))): ?>
        <?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?><?php echo $this->_tpl_vars['element']['label'][0]; ?>
<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
        <?php else: ?>
        <?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?><?php echo $this->_tpl_vars['element']['label']; ?>
<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
        <?php endif; ?>
        </label>
  </td>
  <td class="FormRowValue"><?php echo $this->_tpl_vars['element']['html']; ?>
</td>
</tr>
<?php endforeach; endif; unset($_from); ?>
<?php endforeach; endif; unset($_from); ?> 
<?php endif; ?>
<?php endforeach; endif; unset($_from); ?>
<?php echo $this->_tpl_vars['formBlock']['hidden']; ?>

<?php $_from = $this->_tpl_vars['helps']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['help']):
?>
<span style="display: none;" id="help:<?php echo $this->_tpl_vars['help']['name']; ?>
"><?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?><?php echo $this->_tpl_vars['help']['desc']; ?>
<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?></span>
<?php endforeach; endif; unset($_from); ?>