<?php /* Smarty version 2.6.18, created on 2016-09-02 19:56:54
         compiled from file:/usr/share/centreon//www/include/common/templates/clone.ihtml */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('block', 't', 'file:/usr/share/centreon//www/include/common/templates/clone.ihtml', 11, false),)), $this); ?>
<div id="<?php echo $this->_tpl_vars['cloneId']; ?>
_controls">
    <div id="<?php echo $this->_tpl_vars['cloneId']; ?>
_add">
        <span style="cursor:pointer;">
            <?php $this->assign('isFrozen', 0); ?>
            <?php $_from = $this->_tpl_vars['cloneSet']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['v']):
?>
                <?php if ($this->_tpl_vars['v']->isFrozen()): ?>
               	    <?php $this->assign('isFrozen', 1); ?>
                <?php endif; ?>
            <?php endforeach; endif; unset($_from); ?>
            <?php if ($this->_tpl_vars['isFrozen'] == 0): ?>
                <?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?> + Add a new entry<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
            <?php endif; ?>
        </span>
    </div>
</div>

<ul id="<?php echo $this->_tpl_vars['cloneId']; ?>
" class="clonable no-deco-list">
    <li class="clone_template" id="<?php echo $this->_tpl_vars['cloneId']; ?>
_template">
        <hr style='margin:2;'/>
        <div class="clone-cell">
            <?php $_from = $this->_tpl_vars['cloneSet']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['v']):
?>
		<?php if ($this->_tpl_vars['v']->isFrozen()): ?>
	   		<?php echo $this->_tpl_vars['v']->getLabel(); ?>
 : <?php echo $this->_tpl_vars['v']->unfreeze(); ?>
<?php echo $this->_tpl_vars['v']->setAttribute('disabled','disabled'); ?>
<?php echo $this->_tpl_vars['v']->toHtml(); ?>

		<?php else: ?>
                   <?php echo $this->_tpl_vars['v']->getLabel(); ?>
  <?php echo $this->_tpl_vars['v']->toHtml(); ?>

		<?php endif; ?>
            <?php endforeach; endif; unset($_from); ?>
        <?php if ($this->_tpl_vars['isFrozen'] == 0): ?>
            <span style="margin-left: 4px;cursor: pointer;">
                <img src="./img/icons/move.png" class="clonehandle ico-14" style="vertical-align:middle;">
            </span>
            <a id="<?php echo $this->_tpl_vars['cloneId']; ?>
_remove_current" style="margin-right: 4px;">
                <img src="./img/icons/circle-cross.png" class="ico-14" style="vertical-align:middle;">
            </a>
        <?php endif; ?>
        </div>
        <input type="hidden" name="clone_order_<?php echo $this->_tpl_vars['cloneId']; ?>
_#index#" id="clone_order_#index#" />
    </li>
    <li id="<?php echo $this->_tpl_vars['cloneId']; ?>
_noforms_template">
        <p class="muted"><?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Nothing here, use the "Add" button<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?></p>
    </li>
</ul>