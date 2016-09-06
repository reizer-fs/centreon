<?php /* Smarty version 2.6.18, created on 2016-09-02 19:56:54
         compiled from file:/usr/share/centreon//www/include/common/templates/cloneMacro.ihtml */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('block', 't', 'file:/usr/share/centreon//www/include/common/templates/cloneMacro.ihtml', 11, false),)), $this); ?>
<div id="<?php echo $this->_tpl_vars['cloneId']; ?>
_controls">
    <div id="<?php echo $this->_tpl_vars['cloneId']; ?>
_add">
        <p style="cursor:pointer; color: #4ccaff;">
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
        </p>
    </div>
</div>

<ul id="<?php echo $this->_tpl_vars['cloneId']; ?>
" class="macroclone no-deco-list">
    <li class="clone_template onemacro" id="<?php echo $this->_tpl_vars['cloneId']; ?>
_template">
        <hr style='margin:2;'/>
        <div class="clone-cell">
            <?php $_from = $this->_tpl_vars['cloneSet']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['v']):
?>
                <span>
                    <?php if ($this->_tpl_vars['v']->getLabel() != ""): ?>
                        <?php echo $this->_tpl_vars['v']->getLabel(); ?>

                    <?php endif; ?>
                    <?php echo $this->_tpl_vars['v']->toHtml(); ?>

                </span>
            <?php endforeach; endif; unset($_from); ?>
            <input type='hidden' id='macroTplValue_#index#' name='macroTplValue_#index#' value="" />
            <input type='hidden' id='macroTplValToDisplay_#index#' name='macroTplValToDisplay_#index#' value="0" />
            <input type='hidden' id='macroDescription_#index#' name='macroDescription_#index#' value="" />
            <input type='hidden' id='macroTpl_#index#' name='macroTpl_#index#' value="" />
            <input type='hidden' id='macroOldValue_#index#' name='macroOldValue_#index#' value="" />
            <input type='hidden' id='isFrozen_#index#' name='isFrozen_#index#' value="<?php echo $this->_tpl_vars['isFrozen']; ?>
" />
            <img src="./img/icons/description.png" style='vertical-align: middle;cursor:pointer;' class="ico-14" onclick='javascript:loadDescription(#index#)' />
        <?php if ($this->_tpl_vars['isFrozen'] == 0): ?>
              <span style="cursor:pointer;" class="clonehandle">
              <img src="./img/icons/move.png" class="ico-14" style="vertical-align:middle;">
            </span>

            <span id="<?php echo $this->_tpl_vars['cloneId']; ?>
_remove_current" style=''>
                <img src="./img/icons/circle-cross.png" class='ico-14' style="vertical-align:middle;">
            </span>
        <?php else: ?>
            <script>
            <?php echo '
                jQuery(document).find("input[name^=\'macroInput\'], input[name^=\'macroValue\']").prop("type", \'text\').attr(\'readonly\', \'readonly\');
            '; ?>

            </script>
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