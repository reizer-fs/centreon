<?php /* Smarty version 2.6.18, created on 2016-09-05 17:07:18
         compiled from index.ihtml */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('block', 't', 'index.ihtml', 13, false),array('function', 'cycle', 'index.ihtml', 195, false),)), $this); ?>
<div id='globalView'>
  <?php if ($this->_tpl_vars['aclParameters'] == 1): ?>
  <div class="toggleEdit">
    <a href="#" title="<?php echo $this->_tpl_vars['editMode']; ?>
"><img src="./img/icons/edit_mode.png" class="ico-14"></a>
  </div>
  <?php endif; ?>
  <!-- Action bar -->
  <div id='actionBar' style="display: none;">

  <?php if ($this->_tpl_vars['aclAddView'] == 1): ?>
    <!-- Button for add a view -->
    <div class="cntn">
      <button class='addView btnAction btc bt_success'><?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Add view<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?></button>
      <!-- Form for add a view -->
      <div class="toggle_wrapper inactive" id="addView">
        <div>
          <form <?php echo $this->_tpl_vars['formAddView']['attributes']; ?>
>
            <table class="table">
              <tr>
                <td class="FormHeader" colspan="2">
                  <h3 style="color:#88b917;"><?php echo $this->_tpl_vars['formAddView']['header']['title']; ?>
</h3>
                </td>
              </tr>
              <tr class="list_two">
                <td class="FormRowValue" colspan="2"><?php echo $this->_tpl_vars['formAddView']['create_load']['html']; ?>
</td>
              </tr>
              <tr class="create_field">
                <td class="FormRowField"><?php echo $this->_tpl_vars['formAddView']['name']['label']; ?>
</td>
                <td class="FormRowValue">
                  <div><?php echo $this->_tpl_vars['formAddView']['name']['html']; ?>
</div>
                  <span class="error-msg" style="display: none;"><?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>This view name is required<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?></span>
                </td>
              </tr>
              <tr class="load_field" style="display:none;">
                <td class="FormRowField"><?php echo $this->_tpl_vars['formAddView']['viewLoad']['label']; ?>
</td>
                <td class="FormRowValue"><?php echo $this->_tpl_vars['formAddView']['viewLoad']['html']; ?>
</td>
              </tr>
              <tr class="load_field" style="display:none;">
                <td class="FormRowField"><?php echo $this->_tpl_vars['formAddView']['viewLoadShare']['label']; ?>
</td>
                <td class="FormRowValue"><?php echo $this->_tpl_vars['formAddView']['viewLoadShare']['html']; ?>
</td>
              </tr>
              <tr class="create_field">
                <td class="FormRowField"><?php echo $this->_tpl_vars['formAddView']['layout']['label']; ?>
</td>
                <td class="FormRowValue"><?php echo $this->_tpl_vars['formAddView']['layout']['html']; ?>
</td>
              </tr>
              <tr class="create_field">
                <td class="FormRowField"><?php echo $this->_tpl_vars['formAddView']['public']['label']; ?>
</td>
                <td class="FormRowValue"><?php echo $this->_tpl_vars['formAddView']['public']['html']; ?>
</td>
              </tr>
              <tr>
                <td colspan="2" class="button_group">
                  <?php echo $this->_tpl_vars['formAddView']['submit']['html']; ?>
 <?php echo $this->_tpl_vars['formAddView']['reset']['html']; ?>

                </td>
              </tr>
            </table>
            <?php echo $this->_tpl_vars['formAddView']['hidden']; ?>

          </form>
        </div>
      </div>
    </div>
    <?php endif; ?>
    
    <!-- Button for edit a view -->
    <?php if ($this->_tpl_vars['aclEdit'] == 1): ?> 
    <div class="cntn">
      <button class='editView btnAction btnExtraAction btc bt_info'><?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Edit view<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?></button>
      <div class="toggle_wrapper inactive" id="editView">
        <div>
          <form <?php echo $this->_tpl_vars['formEditView']['attributes']; ?>
>
            <table class="table">
              <tr>
                <td class="FormHeader" colspan="2">
                  <h3 style="color:#00bfb3;"><?php echo $this->_tpl_vars['formEditView']['header']['title']; ?>
</h3>
                </td>
              </tr>
              <tr class="create_field">
                <td class="FormRowField"><?php echo $this->_tpl_vars['formEditView']['name']['label']; ?>
</td>
                <td class="FormRowValue">
                  <div><?php echo $this->_tpl_vars['formEditView']['name']['html']; ?>
</div>
                  <span class="error-msg" style="display: none;"><?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>This view name is required<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?></span>
                </td>
              </tr>
              <tr class="create_field">
                <td class="FormRowField"><?php echo $this->_tpl_vars['formEditView']['layout']['label']; ?>
</td>
                <td class="FormRowValue"><?php echo $this->_tpl_vars['formEditView']['layout']['html']; ?>
</td>
              </tr>
              <tr class="create_field">
                <td class="FormRowField"><?php echo $this->_tpl_vars['formEditView']['public']['label']; ?>
</td>
                <td class="FormRowValue"><?php echo $this->_tpl_vars['formEditView']['public']['html']; ?>
</td>
              </tr>
              <tr>
                <td colspan="2" class="button_group">
                  <?php echo $this->_tpl_vars['formEditView']['submit']['html']; ?>
 <?php echo $this->_tpl_vars['formEditView']['reset']['html']; ?>

                </td>
              </tr>
            </table>
            <?php echo $this->_tpl_vars['formEditView']['hidden']; ?>

          </form>
        </div>
      </div>
    </div>
    <?php endif; ?>
    <!-- Button for delete a view -->
    <?php if ($this->_tpl_vars['aclDeleteView'] == 1): ?>
    <button class='deleteView btnExtraAction btc bt_danger'><?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Delete view<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?></button>
    <?php endif; ?>
    <!-- Button for set default a view -->
    <?php if ($this->_tpl_vars['aclSetDefault'] == 1): ?>
    <button class='setDefault btnExtraAction btc bt_default'><?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Set default<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?></button>
    <?php endif; ?>
    
    <!-- Button for share a view -->
    <?php if ($this->_tpl_vars['aclShare'] == 1): ?> 
    <div class="cntn">
      <button class='shareView btnAction btnExtraAction btc bt_info'><?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Share view<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?></button>
      <div class="toggle_wrapper inactive" id="shareView">
        <form <?php echo $this->_tpl_vars['formShareView']['attributes']; ?>
>
          <table class="table">
            <tr>
              <td class="FormHeader" colspan="2">
                <h3 style="color: #00bfb3;"><?php echo $this->_tpl_vars['formShareView']['header']['title']; ?>
</h3>
              </td>
            </tr>
            <tr class="list_lvl_1 viewerInfo">
              <td class="ListColLvl1_name" colspan="2">
                <h4><?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Viewers<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?></h4>
              </td>
            </tr>
            <tr class="viewerInfo">
              <td colspan="2" id="share_viewer"></td>
            </tr>
            <tr class="list_lvl_1 viewergroupInfo">
              <td class="ListColLvl1_name" colspan="2">
                <h4><?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Viewers group<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?></h4>
              </td>
            </tr>
            <tr class="viewergroupInfo">
              <td colspan="2" id="share_viewergroup"></td>
            </tr>
            <tr class="list_lvl_1">
              <td class="ListColLvl1_name" colspan="2"><h4><?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Add viewer / viewer group<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?></h4>
              </td>
            </tr>
            <tr>
              <td class="FormRowField"><?php echo $this->_tpl_vars['formShareView']['locked']['label']; ?>
</td>
              <td class="FormRowValue"><?php echo $this->_tpl_vars['formShareView']['locked']['html']; ?>
</td>
            </tr>
            <tr>
              <td  class="FormRowField FormHeader" colspan="2"><?php echo $this->_tpl_vars['formShareView']['user_id']['label']; ?>
</td>
            </tr>
            <tr>
              <td class="FormRowValue" colspan="2"><?php echo $this->_tpl_vars['formShareView']['user_id']['html']; ?>
</td>
            </tr>
            <tr>
              <td class="FormRowField FormHeader" colspan="2"><?php echo $this->_tpl_vars['formShareView']['usergroup_id']['label']; ?>
</td>
            </tr>
            <tr>
              <td class="FormRowValue" colspan="2"><?php echo $this->_tpl_vars['formShareView']['usergroup_id']['html']; ?>
</td>
            </tr>
          </table>
          <?php echo $this->_tpl_vars['formShareView']['hidden']; ?>

          <div class="button_group_center">
            <p><?php echo $this->_tpl_vars['formShareView']['submit']['html']; ?>
&nbsp;<?php echo $this->_tpl_vars['formShareView']['reset']['html']; ?>
</p>
          </div>
        </form>
      </div>
    </div>
    <?php endif; ?>
    <!-- Button for add a widget -->
    <?php if ($this->_tpl_vars['aclAddWidget'] == 1): ?>
    <div class="cntn">
      <button class='addWidget btnAction btnExtraAction btc bt_success'><?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Add widget<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?></button>
      <div class="toggle_wrapper inactive" id="addwdgt">
        <form <?php echo $this->_tpl_vars['formAddWidget']['attributes']; ?>
>
           <table  class="table ">
              <tr>
                <td class="FormHeader" colspan="2">
                  <h3 style="color:#88b917;"><?php echo $this->_tpl_vars['formAddWidget']['header']['title']; ?>
</h3>
                </td>
              </tr>
              <tr>
                <td class="FormRowValue" colspan="2" style="text-align: center;"><?php echo $this->_tpl_vars['formAddWidget']['widget_title']['label']; ?>
 <?php echo $this->_tpl_vars['formAddWidget']['widget_title']['html']; ?>
</td>
              </tr>
              <tr>
                <td colspan="2">
                  <table class="subTable ListTable">
                  <tr class="ListHeader">
                    <th class="ListColHeaderPicker"></th>
                    <th class="ListColHeaderLeft"><?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Title<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?></th>
                    <th class="ListColHeaderLeft"><?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Version<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?></th>
                    <th class="ListColHeaderLeft"><?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Description<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?></th>
                    <th class="ListColHeaderLeft"><?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Author<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?></th>
                  </tr>
                  <?php $_from = $this->_tpl_vars['widgetModels']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['elem']):
?>
                  <?php echo smarty_function_cycle(array('values' => 'list_one,list_two','assign' => 'rowStyle'), $this);?>

                  <tr class=<?php echo $this->_tpl_vars['rowStyle']; ?>
>
                    <td class="ListColPicker"><input type='radio' name='widget_model_id' value='<?php echo $this->_tpl_vars['elem']['widget_model_id']; ?>
'/></td>

                    <!--<td clss="ListColLeft">
                        <?php if ($this->_tpl_vars['elem']['thumbnail']): ?>
                            <img src='<?php echo $this->_tpl_vars['elem']['thumbnail']; ?>
'/>
                        <?php endif; ?>
                    </td>-->

                    <td class="ListColLeft"><?php echo $this->_tpl_vars['elem']['title']; ?>
</td>
                    <td class="ListColLeft"><?php echo $this->_tpl_vars['elem']['version']; ?>
</td>
                    <td class="ListColLeft"><?php echo $this->_tpl_vars['elem']['description']; ?>
</td>
                    <td class="ListColLeft"><?php echo $this->_tpl_vars['elem']['author']; ?>
</td>
                  </tr>
                  <?php endforeach; endif; unset($_from); ?>
                </table>
              </td>
            </tr>
            <tr>
              <td colspan="2" class="button_group">
                <?php echo $this->_tpl_vars['formAddWidget']['submit']['html']; ?>
 <?php echo $this->_tpl_vars['formAddWidget']['reset']['html']; ?>

              </td>
            </tr>
          </table>
          <?php echo $this->_tpl_vars['formAddWidget']['hidden']; ?>

        </form>
      </div>
    </div>
    <?php endif; ?>
    <!-- Button for activate rotation -->
    <?php if ($this->_tpl_vars['aclRotation'] == 1): ?> 
    <div class="cntn">
      <button class='setRotate btnAction btnExtraAction btc bt_info'><?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Rotation<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?></button>
      <div class="toggle_wrapper inactive" id="rotationTabs">
          <div id='rotation_timer'></div>
          <div id='timer_value'></div>
          <div class="button_group_center">

            <input type='button' value='<?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Apply<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>' class="btc bt_success" onClick='submitRotation();'/>
          </div>
      </div>
    </div>
    <?php endif; ?>
  </div>
  
  <!-- Tab for list of views -->
  <div id="tabs">
    <div class="info_box">
      <h4><img src='./img/icones/16x16/help_button.png' style='padding-right:5px;'> <?php echo $this->_tpl_vars['msg']; ?>
</h4>
    </div>
    <ul class="tabs_header">
    </ul>
  </div>

</div>
<div hidden>
  <div id="deleteViewConfirm">
    <p><?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Deleting this view might impact other users. Are you sure you want to do it?<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?></p>
    <div class="button_group_center">
      <button type="button" class="btc bt_danger"><?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Delete<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?></button>
      <button type="button" class="btc bt_default"><?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Cancel<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?></button>
    </div>
  </div>
    <div id="dissociateViewConfirm">
    <p><?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Dissociate this view ?<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?></p>
    <div class="button_group_center">
      <button type="button" class="btc bt_danger"><?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Dissociate<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?></button>
      <button type="button" class="btc bt_default"><?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Cancel<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?></button>
    </div>
  </div>
  <div id="setDefaultConfirm">
    <p><?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Set this view as your default view<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?></p>
    <div class="button_group_center">
      <button type="button" class="btc bt_success"><?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Save<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?></button>
      <button type="button" class="btc bt_default"><?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Cancel<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?></button>
    </div>
  </div>
</div>
<script>  
<?php echo '
/* Display or hide the information for add a new view */
function infoEmptyTab() {
  if (jQuery(\'#tabs .tabs_header > li\').length > 0) {
    jQuery(\'#tabs .info_box\').hide();
    jQuery(\'.btnExtraAction\').show();
  } else {
    jQuery(\'#tabs .info_box\').show();
    jQuery(\'.btnExtraAction\').hide();
  }
}
  
function addTab(info, init) {
  var init = init || false;
  var $tabEl = jQuery(\'<li></li>\');
  if (info.default) {
    $tabEl.append(jQuery(info.default));
  }
  jQuery(\'<a></a>\')
    .attr(\'href\', \'./include/home/customViews/views.php?currentView=\' + info.custom_view_id)
    .text(info.name).appendTo($tabEl);
  $tabEl.data(\'name\', info.name);
  $tabEl.data(\'cvId\', info.custom_view_id);
  $tabEl.data(\'public\', info.public);
  $tabEl.data(\'nbCols\', info.nbCols);
  jQuery(\'#tabs .tabs_header\').append($tabEl);
  if (false === init) {
    jQuery(\'#tabs\').tabs("destroy");
    jQuery("#tabs").tabs({
      ajaxOptions: { async: true },
      select: function(event, ui) {
        jQuery(\'.viewBody\').empty();
      },
      selected: -1,
      load: function () {
        displayBtnToggleEdit();
      }
    });
    infoEmptyTab();
  }
}
  
function deleteTab(viewId) {
  jQuery(\'#tabs .tabs_header > li\').each(function (idx, elem) {
    if (jQuery(elem).data(\'cvId\') == viewId) {
      jQuery(elem).remove();
    }
  });
  jQuery(\'#tabs\').tabs("destroy");
  jQuery("#tabs").tabs({
    ajaxOptions: { async: true },
    select: function(event, ui) {
      jQuery(\'.viewBody\').empty();
    },
    selected: -1,
    load: function () {
      displayBtnToggleEdit();
    }
  });
  
  if (jQuery(\'#tabs .tabs_header > li\').length > 0) {
    jQuery(\'#tabs\').tabs(\'select\', 1);
  }
  
  infoEmptyTab();
}
  
function getTabPos(id) {
  var index = -1;
  jQuery(\'#tabs .tabs_header > li\').each(function (idx, elem) {
    if (jQuery(elem).data(\'cvId\') == id) {
      index = idx;
    }
  });
  return index;
}
  
/* Set value of timer in the label */ 
function setTimerLabel() {
  var val = jQuery("#rotation_timer").slider("value");
  jQuery("#timer_value").html(val + " seconds");
}

/* Submit action for add a view */
function submitAddView() {
  if(jQuery(\'input[name="create_load[create_load]"]:checked\').val() === "create"){
    if (jQuery("#formAddView input[name=\'name\']").val().trim() === \'\') {
      jQuery(\'.create_field .error-msg\').show();
      return false;
    }
  }
  jQuery.ajax({
    type: "post",
    dataType: "xml",
    url: "./include/home/customViews/action.php",
    data: jQuery("#formAddView").serialize(),
    success: function (response) {
      var view = response.getElementsByTagName(\'custom_view_id\');
      var error = response.getElementsByTagName(\'error\');
      if (typeof(view) != \'undefined\') {
        var viewId = view.item(0).firstChild.data;
        var widgetName = "";
        if(parseInt(viewId) && getTabPos(viewId) == -1){
            if(jQuery(\'input[name="create_load[create_load]"]:checked\').val() === "create"){
                widgetName = jQuery("#formAddView input[name=\'name\']").val();
            }else if(jQuery(\'input[name="create_load[create_load]"]:checked\').val() === "load"){
                if(jQuery("#formAddView select[name=\'viewLoad\']").val() != -1){
                    widgetName = jQuery("#formAddView select[name=\'viewLoad\']").find(":selected").text();
                }else if(jQuery("#formAddView select[name=\'viewLoadShare\']").val() != -1){
                    widgetName = jQuery("#formAddView select[name=\'viewLoadShare\']").find(":selected").text();
                }
            }



            addTab({
              default: false,
              name: widgetName,
              custom_view_id: viewId,
              public: (jQuery(\'#formAddView input[name="public"]:checked\').length ? true : false),
              nbCols: jQuery(\'#formAddView input[name="layout[layout]"]:checked\').val()
            });
            jQuery("#tabs").tabs(\'select\', getTabPos(viewId));
            jQuery(\'#formAddView\').parents(\'.toggle_wrapper\').hide();
        }else{
            jQuery(\'#formAddView\').parents(\'.toggle_wrapper\').hide();
        }
      } else if (typeof(error) != \'undefined\') {
        var errorMsg = error.item(0).firstChild.data;
      }
    }
  });
}
             
/* Submit action for edit a view */
function submitEditView() {
  if (jQuery("#formEditView input[name=\'name\']").val().trim() === \'\') {
    jQuery(\'.create_field .error-msg\').show();
    return false;
  }
  jQuery.ajax({
    type: "post",
    dataType: "xml",
    url: "./include/home/customViews/action.php",
    data: jQuery("#formEditView").serialize(),
    success: function (response) {
      var view = response.getElementsByTagName(\'custom_view_id\');
      var error = response.getElementsByTagName(\'error\');
      if (typeof(view) != \'undefined\') {
        var viewId = view.item(0).firstChild.data;
        jQuery(\'#tabs .tabs_header > li\').each(function (idx, elem) {
          if (jQuery(elem).data(\'cvId\') == viewId) {
            jQuery(elem).data(\'name\', jQuery("#formEditView input[name=\'name\']").val());
            jQuery(elem).data(\'nbCols\', jQuery(\'#formEditView input[name="layout[layout]"]:checked\').val());
            jQuery(elem).data(\'public\', (jQuery(\'#formEditView input[name="public"]:checked\').length ? true : false));
            jQuery(elem).find(\'a\').text(jQuery("#formEditView input[name=\'name\']").val());
          }
        });
        jQuery(\'#formEditView\').parents(\'.toggle_wrapper\').hide();
        /* Reload tabs for apply */
        jQuery("#tabs").tabs(\'load\', getTabPos(viewId));
      } else if (typeof(error) != \'undefined\') {
        var errorMsg = error.item(0).firstChild.data;
      }
    }
  });
}
 
/* Submit action for add a widget */
function submitAddWidget() {
  jQuery("#formAddWidget input[name=\'custom_view_id\']").val(viewId);
  jQuery.ajax({
    type: "POST",
    dataType: "xml",
    url : "./include/home/customViews/action.php",
    data: jQuery("#formAddWidget").serialize(),
    success: function (response) {
      var view = response.getElementsByTagName(\'custom_view_id\');
      var error = response.getElementsByTagName(\'error\');
      if (view !== undefined) {
        var viewId = view.item(0).firstChild.data;
        jQuery(\'#tabs\').tabs(\'load\', getTabPos(viewId));
        jQuery(\'#addwdgt\').hide();
      } else if (err !== undefined) {
        var errorMsg = err.item(0).firstChild.data;
      }
    }
  });
}

/* Delete action */
function submitDeleteView() {
  var viewId = jQuery(
    jQuery(\'#tabs .ui-tabs-selected.ui-state-active\')[0]
  ).data(\'cvId\');
  jQuery.ajax({
    type: "POST",
    dataType: "xml",
    url: "./include/home/customViews/action.php",
    data: {
      action: "deleteView",
      custom_view_id: viewId
    },
    success :	function(response) {
      var view = response.getElementsByTagName(\'custom_view_id\');
      if (typeof(view) != \'undefined\') {
        deleteTab(viewId);
      } else if (typeof(error) != \'undefined\') {
        var errorMsg = error.item(0).firstChild.data;
      }
    }
  });
}
 
/* Set default action */
function submitSetDefaultView() {
  var viewId = jQuery(
    jQuery(\'#tabs .ui-tabs-selected.ui-state-active\')[0]
  ).data(\'cvId\');
  jQuery.ajax({
    type: "POST",
    dataType: "xml",
    url: "./include/home/customViews/action.php",
    data: {
      action: "setDefault",
      custom_view_id: viewId
    }
  });
}
 
/* Submit action for set rotation */
function submitRotation() {
  var rotationTimer = jQuery("#rotation_timer").slider("value");
  jQuery.ajax({
    type: "POST",
    dataType: "xml",
    url :  "./include/home/customViews/action.php",
    data: {
      action: "setRotate",
      timer: rotationTimer
    },
    success: function (response) {
      var view = response.getElementsByTagName(\'custom_view_id\');
      var error = response.getElementsByTagName(\'error\');
      if (typeof(view) != \'undefined\') {
        jQuery("#tabs").tabs(\'rotate\', (rotationTimer * 1000));
        jQuery(\'#rotation_timer\').parents(\'.toggle_wrapper\').hide();
      } else if (typeof(err) != \'undefined\') {
        var errorMsg = err.item(0).firstChild.data;
      }
    }
  });
}
  
/* Submit action for share views */
function submitShareView()
{
  var viewId = jQuery(
    jQuery(\'#tabs .ui-tabs-selected.ui-state-active\')[0]
  ).data(\'cvId\');
  var users = jQuery("#formShareView").find(\'select[name="user_id[]"]\').val();
  var usergroups = jQuery("#formShareView").find(\'select[name="usergroup_id[]"]\').val();
  var postData = {
    custom_view_id: viewId,
    \'locked[locked]\': jQuery("#formShareView").find(\'input[name="locked[locked]"]:checked\').val(),
    action: \'share\',
    centeon_token: jQuery("#formShareView").find(\'input[name="centreon_token"]\').val(),
  };
  
  if (users) {
    postData[\'user_id[]\'] = users.filter(function (elem) {
      return elem !== \'\';
    });
  }
  if (usergroups) {
    postData[\'usergroup_id[]\'] = usergroups.filter(function (elem) {
      return elem !== \'\';
    });
  }
  
  jQuery.ajax({
    type: "POST",
    dataType: "xml",
    url: "./include/home/customViews/action.php",
    data: postData,
    success: function (response) {
      var view = response.getElementsByTagName(\'custom_view_id\');
      var error = response.getElementsByTagName(\'error\');
      if (typeof(view) != \'undefined\') {
        jQuery(\'#shareView\').hide();
      } else if (typeof(error) != \'undefined\') {
        var errorMsg = error.item(0).firstChild.data;
      }
    }
  });
}
             
/**
 * Initializes Colorbox
 */
function initColorbox(selector, url, w, h)
{
  jQuery(selector).colorbox({
    href: url,
    iframe: true,
    overlayClose: false,
    width: w,
    height: h,
    opacity: 0.7
  });
}
  
function displayBtnToggleEdit() {
  if (jQuery(\'.tabs_header\').children().length > 0
      && jQuery(\'.portlet\').length > 0) {
    toggleEdit(modeEdit);
  } else {
    toggleEdit(true);
  }
}
  
function toggleEdit(forceShow) {
  var $el = jQuery(\'.toggleEdit\');

  if (false === forceShow || (forceShow === undefined && $el.hasClass(\'edit\'))) {
    $el.removeClass(\'edit\');
    jQuery(\'#actionBar\').hide();
    jQuery(\'.portlet-header\').each(function(index) {
        var widgetTitle = jQuery(this).find(\'.widgetTitle\').text().trim();
        if (widgetTitle == \'Click to edit\' || widgetTitle == \'\') {
            jQuery(this).hide();
        } else {
            jQuery(this).find(\'.ui-icon\').hide();
        }
    });
    $img1 = $el.find(\'img\').attr(\'src\',\'./img/icons/edit_mode.png\');
    if (forceShow === undefined) {
      modeEdit = false;
    }
  } else {
    $el.addClass(\'edit\');
    jQuery(\'#actionBar\').show();
    jQuery(\'.portlet-header\').each(function(index) {
        jQuery(this).show();
        jQuery(this).find(\'.ui-icon\').show();
    });
    $el.find(\'img\').attr(\'src\',\'./img/icons/no_edit_mode.png\');

    if (forceShow === undefined) {
      modeEdit = true;
    }
  }
  if (forceShow === undefined) {
    jQuery.ajax({
      url: \'./include/home/customViews/action.php\',
      data: {
        action: \'defaultEditMode\',
        editMode: modeEdit
      },
      type: \'POST\'
    });
  }
}

/* Share view functions */
  
function removeUserFromView(user_id) {
    
  var viewId = jQuery(
    jQuery(\'#tabs .ui-tabs-selected.ui-state-active\')[0]
  ).data(\'cvId\');
  jQuery.ajax({
    type: "POST",
    dataType: "xml",
    url: "./include/home/customViews/action.php",
    data: {
      action: "remove",
      custom_view_id: viewId,
      user_id: user_id
    },
    success: function(response) {
      var view = response.getElementsByTagName(\'custom_view_id\');
      var error = response.getElementsByTagName(\'error\');
      if (typeof(view) != \'undefined\') {
        jQuery(\'.removeViewer\').each(function () {
          var $el = jQuery(this);
          if ($el.data(\'id\') == user_id) {
            $el.parents(\'.badge\').remove();
          }
        });
      } else if (typeof(error) != \'undefined\') {
        var errorMsg = error.item(0).firstChild.data;
      }
    }
  });
}

function removeUsergroupFromView(usergroup_id) {
  var viewId = jQuery(
    jQuery(\'#tabs .ui-tabs-selected.ui-state-active\')[0]
  ).data(\'cvId\');
  jQuery.ajax({
    type: "POST",
    dataType: "xml",
    url: "./include/home/customViews/action.php",
    data: {
      action: "removegroup",
      custom_view_id: viewId,
      usergroup_id:	usergroup_id
    },
    success: function(response) {
      var view = response.getElementsByTagName(\'custom_view_id\');
      var error = response.getElementsByTagName(\'error\');
      if (typeof(view) != \'undefined\') {
        jQuery(\'.removeViewergroup\').each(function () {
          var $el = jQuery(this);
          if ($el.data(\'id\') == usergroup_id) {
            $el.parents(\'.badge\').remove();
          }
        });
      } else if (typeof(error) != \'undefined\') {
        var errorMsg = error.item(0).firstChild.data;
      }
    }
  });
}
  
jQuery(function () {
  /* Initialize buttons */
  jQuery(\'.addView\').button({ icons : { primary: \'ui-icon-plus\'}}).on(\'click\', function () {
    jQuery(\'#formAddView input[name="name"]\').val(\'\');
    jQuery(\'#formAddView input[name="layout[layout]"][value="column_1"]\').prop(\'checked\', true);
    jQuery(\'#formAddView input[name="public"]\').prop(\'checked\', false);
  });
  jQuery(\'.editView\').button({ icons : { primary: \'ui-icon-gear\'}});
  jQuery(\'.deleteView\').button({ icons : { primary: \'ui-icon-trash\'}}).on(\'click\', function () {
    jQuery("#deleteViewConfirm").centreonPopin("open");
  });
  jQuery(\'.shareView\').button({ icons : { primary: \'ui-icon-folder-open\'}}).on(\'click\', function () {
    /* Get default information for a share view */
    var viewId = jQuery(
      jQuery(\'#tabs .ui-tabs-selected.ui-state-active\')[0]
    ).data(\'cvId\');
    if (jQuery(\'#user_id\').val() !== null) {
      jQuery(\'#user_id\').val(\'\').empty().append(jQuery("<option>")).trigger(\'change\');
    }
    if (jQuery(\'#usergroup_id\').val() !== null) {
      jQuery(\'#usergroup_id\').val(\'\').empty().append(jQuery("<option>")).trigger(\'change\');
    }
    jQuery.ajax({
      url: \'./include/home/customViews/action.php\',
      type: \'post\',
      dataType: \'xml\',
      data: {
        action: \'get_share_info\',
        viewId: viewId
      },
      success: function (data) {
        var viewerList = jQuery(\'#share_viewer\');
        var viewergroupList = jQuery(\'#share_viewergroup\');
        viewerList.html(\'\');
        viewergroupList.html(\'\');
        jQuery(".viewerInfo").hide();
        jQuery(".viewergroupInfo").hide();
        /* Add viewer who have the view partaged */
        jQuery.map(data.getElementsByTagName(\'contact\'), function (node) {
          var viewerBadge = jQuery(\'<span></span>\')
            .addClass(\'badge default_badge\')
            .text(node.firstChild.data);
          var closeButton = jQuery(\'<a></a>\')
            .attr(\'href\', \'#\')
            .addClass(\'removeViewer\')
            .data(\'id\', node.getAttribute(\'id\'))
            .append(
              jQuery(\'<img/>\')
                .attr(\'src\', \'./img/icons/delete.png\')
                .addClass(\'ico-10\')
            );
          viewerBadge.append(closeButton);
          if (node.getAttribute(\'locked\') == 1) {
            viewerBadge.prepend(
              jQuery(\'<img/>\')
                .attr(\'src\', \'./img/icons/lock_closed.png\')
                .addClass(\'ico-10\')
            );
          }
          jQuery(".viewerInfo").show();
          viewerList.append(viewerBadge);
        });
        /* Add viewergroup who have the view partaged */
        jQuery.map(data.getElementsByTagName(\'contactgroup\'), function (node) {
          var viewerBadge = jQuery(\'<span></span>\')
            .addClass(\'badge default_badge\')
            .text(node.firstChild.data);
          var closeButton = jQuery(\'<a></a>\')
            .attr(\'href\', \'#\')
            .addClass(\'removeViewergroup\')
            .data(\'id\', node.getAttribute(\'id\'))
            .append(
              jQuery(\'<img/>\')
                .attr(\'src\', \'./img/icons/delete.png\')
                .addClass(\'ico-10\')
            );
          viewerBadge.append(closeButton);
          if (node.getAttribute(\'locked\') == 1) {
            viewerBadge.prepend(
              jQuery(\'<img/>\')
                .attr(\'src\', \'./img/icons/lock_closed.png\')
                .addClass(\'ico-10\')
            );
          }
          jQuery(".viewergroupInfo").show();
          viewergroupList.append(viewerBadge);
        });
      }
    });
  });
  jQuery(\'.addWidget\').button({ icons : { primary: \'ui-icon-plus\'}});
  jQuery(\'.setRotate\').button({ icons : { primary: \'ui-icon-play\'}});
  jQuery(\'.setDefault\').button({ icons : { primary: \'ui-icon-arrowreturnthick-1-w\'}}).on(\'click\', function () {
    jQuery("#setDefaultConfirm").centreonPopin("open");
  });
  
  /* Initialize action for share views */
  jQuery(\'#shareView\').on(\'click\', \'.removeViewer\', function (event) {
    var id = jQuery(this).data(\'id\');
    if (confirm(\'Remove user from viewer list?\')) {
      removeUserFromView(id);
    }
  });
  jQuery(\'#shareView\').on(\'click\', \'.removeViewergroup\', function (event) {
    var id = jQuery(this).data(\'id\');
    if (confirm(\'Remove user group from viewer list?\')) {
      removeUsergroupFromView(id);
    }
  });
  
  jQuery(\'input[name="create_load[create_load]"]\').change(function (){
    if (jQuery(this).val() == \'load\'){
        jQuery(\'.load_field\').css(\'display\',\'table-row\');
        jQuery(\'.create_field\').css(\'display\',\'none\');
    } else if (jQuery(this).val() == \'create\'){
        jQuery(\'.load_field\').css(\'display\',\'none\');
        jQuery(\'.create_field\').css(\'display\',\'table-row\');
    }
  });
  
  jQuery(\'.addWidget\').on(\'click\', function (event) {
      jQuery("#formAddWidget input[name=\'widget_title\']").val(\'\');
  });
  
  jQuery("#formAddView select[name=\'viewLoad\']").change(function (){
      jQuery("#formAddView select[name=\'viewLoadShare\']").val(-1);
  });
  jQuery("#formAddView select[name=\'viewLoadShare\']").change(function (){
      jQuery("#formAddView select[name=\'viewLoad\']").val(-1);
  });
  
  /* Initialize tabs */
  jQuery(".ui-tabs-panel").css(\'overflow\', \'auto\');
  
  jQuery("#rotation_timer").slider({
    value: 0,
    min: 0,
    max: 300,
    step: 5,
    slide: function(event, ui) {
      jQuery("#timer_value").html(ui.value + " seconds");
    },
    stop: function(event, ui) {
      setTimerLabel();
    }
  });
  jQuery("input[type=button]").button();
  
  
  /* Add event for close all form */
  jQuery(document).on(\'click\', function (e) {
    if (jQuery(e.target).parents(\'.cntn\').length === 0
       && jQuery(e.target).hasClass(\'select2-selection__choice__remove\') === false) {
      jQuery(\'.toggle_wrapper\').hide();
    }
  });
  
  jQuery(\'.editView\').on(\'click\', function () {
    var tabActive = jQuery(
      jQuery(\'#tabs .ui-tabs-selected.ui-state-active\')[0]
    );

    jQuery(\'#formEditView input[name="custom_view_id"]\').val(tabActive.data(\'cvId\'));
    jQuery(\'#formEditView input[name="name"]\').val(tabActive.data(\'name\'));
    jQuery(\'#formEditView input[name="layout[layout]"][value="\' + tabActive.data(\'nbCols\') + \'"]\').prop(\'checked\', true);
    if (tabActive.data(\'public\') == \'1\') {
        jQuery(\'#formEditView input[name="public"]\').prop(\'checked\', true);
    } else {
        jQuery(\'#formEditView input[name="public"]\').prop(\'checked\', false);
    }
  });
  
  /* Initialize popin */
  jQuery(\'#deleteViewConfirm\').centreonPopin();
  jQuery(\'#deleteViewConfirm button.btc\').on(\'click\', function () {
    jQuery(\'#deleteViewConfirm\').centreonPopin("close");
  });
  jQuery(\'#deleteViewConfirm button.bt_danger\').on(\'click\', function () {
    submitDeleteView();
  });
  
  jQuery(\'#dissociateViewConfirm\').centreonPopin();
  jQuery(\'#dissociateViewConfirm button.btc\').on(\'click\', function () {
    jQuery(\'#dissociateViewConfirm\').centreonPopin("close");
  });
  jQuery(\'#dissociateViewConfirm button.bt_danger\').on(\'click\', function () {
    removeUserFromView(idUser);
    window.top.location = \'./main.php?p=103\';
  });
  
  jQuery(\'#setDefaultConfirm\').centreonPopin();
  jQuery(\'#setDefaultConfirm button.btc\').on(\'click\', function () {
    jQuery(\'#setDefaultConfirm\').centreonPopin("close");
  });
  jQuery(\'#setDefaultConfirm button.bt_success\').on(\'click\', function () {
    submitSetDefaultView();
  });
  
  /* Add event action for display form */
  jQuery(\'.btnAction\').on(\'click\', function (e) {
    var self = this;
    e.stopPropagation();
    e.preventDefault();
    jQuery(\'.toggle_wrapper\').filter(function () {
      if (jQuery(this).parents(\'.cntn\').find(self).length === 0) {
        return true;
      }
      return false;
    }).hide();
    jQuery(this).parents(\'.cntn\').find(\'.error-msg\').hide();
    jQuery(this).parents(\'.cntn\').find(\'.toggle_wrapper\').toggle();
  });
  
  infoEmptyTab();
  
  /* Load custom views */
  jQuery.ajax({
    url: \'./include/common/webServices/rest/internal.php?object=centreon_wscustomview&action=listViews\',
    method: \'get\',
    methodType: \'json\',
    success: function (data) {
      jQuery.each(data.tabs, function (idx, tab) {
        addTab(tab, true);
      });
      if (data.tabs.length > 0) {
        jQuery("#tabs").tabs({
          ajaxOptions: { async: true },
          select: function(event, ui) {
            jQuery(\'.viewBody\').empty();
          },
          selected: -1,
          load: function () {
            displayBtnToggleEdit();
          }
        });
      }
      jQuery("#tabs").tabs(\'select\', getTabPos(data.current));
      infoEmptyTab();
    }
  });
    
  /* Toggle edit mode or view mode */
  jQuery(".toggleEdit > a").on(\'click\', function (e) {
    e.preventDefault();
    e.stopPropagation();
    toggleEdit();
  });
});
'; ?>

</script>