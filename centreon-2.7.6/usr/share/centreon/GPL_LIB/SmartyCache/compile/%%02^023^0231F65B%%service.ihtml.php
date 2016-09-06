<?php /* Smarty version 2.6.18, created on 2016-09-05 17:11:30
         compiled from service.ihtml */ ?>
<script type="text/javascript" src="./include/common/javascript/tool.js"></script>
<form name='form'>
<input name="p" value="<?php echo $this->_tpl_vars['p']; ?>
" type="hidden">
<input name="o" value="svc" type="hidden">
<table class="ajaxOption table">
    <tr>
        <th colspan="6"><h5><?php echo $this->_tpl_vars['filters']; ?>
</h5></th>
    </tr>
    <tr>
        <td><h4><?php echo $this->_tpl_vars['statusService']; ?>
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
    </tr>
    <tr>
      <td><?php echo $this->_tpl_vars['form']['statusService']['html']; ?>
</td>
      <td><?php echo $this->_tpl_vars['form']['statusFilter']['html']; ?>
</td>
      <?php if ($this->_tpl_vars['criticalityUsed']): ?>
      <td><?php echo $this->_tpl_vars['form']['criticality']['html']; ?>
</td>
      <?php endif; ?>
      <?php if ($this->_tpl_vars['poller_listing']): ?>
      <td><span id="instance_selected"></span></td>
      <?php endif; ?>
    </tr>
    <tr>
        <td><h4><?php echo $this->_tpl_vars['hostStr']; ?>
</h4></td>
        <td><h4><?php echo $this->_tpl_vars['serviceStr']; ?>
</h4></td>
        <td><h4><?php echo $this->_tpl_vars['hgStr']; ?>
</h4></td>
        <td><h4><?php echo $this->_tpl_vars['outputStr']; ?>
</h4></td>
    </tr>
    <tr>
        <td><input type='text' name='host_search' id='host_search'></td>
        <td><input type='text' name='search' id='input_search'></td>
        <td id="hostgroups_selected"></td>
        <td><input type='text' name='output_search' id='output_search'></td>
    </tr>
</table>
<table class="ToolbarTable table">
    <tr class="ToolbarTR">
        <td>
        <span class="consol_button"><?php echo $this->_tpl_vars['form']['o1']['html']; ?>
</span>
        <input name="p" value="<?php echo $this->_tpl_vars['p']; ?>
" type="hidden">

        <div class="Toolbar_TDSelectAction_Top">
            <span class="consol_button">
                <div id="JS_monitoring_refresh" style="cursor:pointer" onclick="javascript:monitoring_refresh('');">
                    <img src='./img/icons/refresh.png' title='Refresh'>
                </div>
            </span>
            <span class="consol_button">
                <div id="JS_monitoring_play" style="cursor:pointer" class="cachediv"  onclick="javascript:monitoring_play('');">
                    <img src='./img/icons/media_play.png' title='Play'>
                </div>
            </span>

            <span class="consol_button"><img id="JS_monitoring_play_gray" src='./img/icons/media_play_gray.png' class="ico-20" title='Play'></span>
            <span class="consol_button">
                <div class="" id="JS_monitoring_pause" style="cursor:pointer" onclick="javascript:monitoring_pause('');">
                    <img src='./img/icons/media_pause.png' title='Pause'>
                </div>
            </span>
            <span class="consol_button"><img id="JS_monitoring_pause_gray" class="cachediv" src='./img/icons/media_pause_gray.png' title='Pause'></span>
        </div>
    </td>

    <td id="pagination1" class="ToolbarPagination"></td>
    <td id="sel1" class="Toolbar_pagelimit"></td>
    </tr>
</table>
<div id="forAjax"></div>
<table class="ToolbarTable table">
    <tr class="ToolbarTR">
        <td class="Toolbar_TDSelectAction_Bottom" width="330">
            <span class="consol_button"><?php echo $this->_tpl_vars['form']['o2']['html']; ?>
</span>
            <input name="p" value="<?php echo $this->_tpl_vars['p']; ?>
" type="hidden">
        </td>
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