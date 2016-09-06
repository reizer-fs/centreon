<?php /* Smarty version 2.6.18, created on 2016-09-02 19:56:39
         compiled from host.ihtml */ ?>
<script type="text/javascript" src="./include/common/javascript/tool.js"></script>
<form name='form'>
<input name="p" value="<?php echo $this->_tpl_vars['p']; ?>
" type="hidden">
<input name="o" value="svc" type="hidden">
<?php $this->assign('nbCol', '4'); ?>
<?php if ($this->_tpl_vars['criticalityUsed']): ?>
<?php $this->assign('nbCol', '$nbCol+1'); ?>
<?php endif; ?>
<?php if ($this->_tpl_vars['poller_listing']): ?>
<?php $this->assign('nbCol', '$nbCol+1'); ?>
<?php endif; ?>
<table class="ajaxOption table">
  <tbody>
    <tr>
      <th colspan="<?php echo $this->_tpl_vars['nbCol']; ?>
"><h5>Filters</h5></th>
    </tr>
	  <tr>
      <td><h4><?php echo $this->_tpl_vars['statusHost']; ?>
</h4></td>
      <td><h4><?php echo $this->_tpl_vars['hostStr']; ?>
</h4></td>
      <td><h4><?php echo $this->_tpl_vars['form']['statusFilter']['label']; ?>
</h4></td>
      <?php if ($this->_tpl_vars['criticalityUsed']): ?>
          <td><h4><?php echo $this->_tpl_vars['form']['criticality']['label']; ?>
</h4></td>
      <?php endif; ?>
      <?php if ($this->_tpl_vars['poller_listing']): ?>
          <td><h4><?php echo $this->_tpl_vars['pollerStr']; ?>
</h4></td>
      <?php endif; ?>
      <td><h4><?php echo $this->_tpl_vars['hgStr']; ?>
</h4></td>
    </tr>
    <tr>
      <td><?php echo $this->_tpl_vars['form']['statusHost']['html']; ?>
</td>
  		<td><input type='text' name='host_search' id='host_search'></td>
  		<td><?php echo $this->_tpl_vars['form']['statusFilter']['html']; ?>
</td>
          <?php if ($this->_tpl_vars['criticalityUsed']): ?>       
          <td><?php echo $this->_tpl_vars['form']['criticality']['html']; ?>
</td>
          <?php endif; ?>
  		<?php if ($this->_tpl_vars['poller_listing']): ?>
  		<td><span id="instance_selected"></span></td>
  		<?php endif; ?>
      <td><span id="hostgroups_selected"></span></td>
 	  </tr>
  </tbody>
</table>
<table class="ToolbarTable table">
  <tbody>
	<tr class="ToolbarTR">
		<td>
        <span class="consol_button"><?php echo $this->_tpl_vars['form']['o1']['html']; ?>
</span>
        <input name="p" value="<?php echo $this->_tpl_vars['p']; ?>
" type="hidden">
        <div class="Toolbar_TDSelectAction_Top">
          <span class="consol_button"><div id="JS_monitoring_refresh" style="cursor:pointer" onclick="javascript:monitoring_refresh('');"><img src='./img/icons/refresh.png' alt='Refresh' title='Refresh'></div></span>
          <span class="consol_button"><div id="JS_monitoring_play" class="cachediv" style="cursor:pointer" onclick="javascript:monitoring_play('');"><img src='./img/icons/media_play.png' alt='Play' title='Play'></div></span>
          <span class="consol_button"><img id="JS_monitoring_play_gray"  src='./img/icons/media_play_gray.png' alt='Play' title='Play'></span>
          <span class="consol_button"><div class="" id="JS_monitoring_pause" style="cursor:pointer" onclick="javascript:monitoring_pause('');"><img src='./img/icons/media_pause.png' alt='Pause' title='Pause'></div></span>
          <span class="consol_button"><img id="JS_monitoring_pause_gray" class="cachediv" src='./img/icons/media_pause_gray.png' alt='Pause' title='Pause'></span>
        </div>
		</td>
		<td id="pagination1" class="ToolbarPagination"></td>
		<td id="sel1" class="Toolbar_pagelimit"></td>
	</tr>
  </tbody>
</table>
<div id="forAjax"></div>
<table class="ToolbarTable table">
	<tr class="ToolbarTR">
		<td width="330"><?php echo $this->_tpl_vars['form']['o2']['html']; ?>
<input name="p" value="<?php echo $this->_tpl_vars['p']; ?>
" type="hidden"></td>
		<td id="pagination2" class="ToolbarPagination"></td>
		<td id="sel2" class="Toolbar_pagelimit"></td>
	</tr>
</table>
<?php if ($this->_tpl_vars['host_name']): ?>
<input type='hidden' name='host_name' value='<?php echo $this->_tpl_vars['host_name']; ?>
'>
<?php endif; ?>
<input name='cmd' id='cmd' value='42' type='hidden'>
<input name='o' value='<?php echo $this->_tpl_vars['o']; ?>
' type='hidden'>
<input type='hidden' id='limit' name='limit' value='<?php echo $this->_tpl_vars['limit']; ?>
'>	
<?php echo $this->_tpl_vars['form']['hidden']; ?>

</form>