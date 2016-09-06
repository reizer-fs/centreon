<?php /* Smarty version 2.6.18, created on 2016-09-05 17:10:45
         compiled from formGenerateFiles.ihtml */ ?>
<link rel="stylesheet" type="text/css" href="./include/common/javascript/scriptaculous/themes/test/theme.css" />
<?php echo $this->_tpl_vars['form']['javascript']; ?>

<form <?php echo $this->_tpl_vars['form']['attributes']; ?>
>
	 <input type="hidden" name="level" value="1"> 
	 <table class="formTable table">
	 	<tr class="ListHeader">
          <td class="FormHeader" colspan="2">
            <h3>| <?php echo $this->_tpl_vars['form']['header']['title']; ?>
</h3>
          </td>
        </tr>
	 	<tr class="list_lvl_1">
          <td class="ListColLvl1_name" colspan="2">
            <h4><?php echo $this->_tpl_vars['form']['header']['infos']; ?>
</h4>
          </td>
        </tr>	 	
		<tr class="list_one">
          <td class="FormRowField"><img class="helpTooltip" name="host">&nbsp;<?php echo $this->_tpl_vars['form']['nhost']['label']; ?>
</td>
          <td class="FormRowValue">
	        <i id="noSelectedPoller" style="color:red;margin-left:20px;" hidden><?php echo $this->_tpl_vars['noPollerSelectedLabel']; ?>
</i>
            <?php echo $this->_tpl_vars['form']['nhost']['html']; ?>

          </td>
        </tr>
	 	<tr class="list_lvl_1">
          <td class="ListColLvl1_name" colspan="2">
            <h4><?php echo $this->_tpl_vars['form']['header']['result']; ?>
</h4>
          </td>
        </tr>	 	
		<tr class="list_two">
			<td class="FormRowField">
				<img class="helpTooltip" name="gen">&nbsp;<?php echo $this->_tpl_vars['form']['gen']['html']; ?>
&nbsp;<?php echo $this->_tpl_vars['form']['gen']['label']; ?>
</td>
			<td class="FormRowValue"><?php echo $this->_tpl_vars['form']['comment']['html']; ?>
&nbsp;<?php echo $this->_tpl_vars['form']['comment']['label']; ?>
</td>
		</tr>
		<tr class="list_one">
			<td class="FormRowField" colspan="2"><img class="helpTooltip" name="debug">&nbsp;<?php echo $this->_tpl_vars['form']['debug']['html']; ?>
&nbsp;<?php echo $this->_tpl_vars['form']['debug']['label']; ?>
</td></tr>
		<tr class="list_two"><td class="FormRowValue" colspan="2"><img class="helpTooltip" name="move">&nbsp;<?php echo $this->_tpl_vars['form']['move']['html']; ?>
&nbsp;<?php echo $this->_tpl_vars['form']['move']['label']; ?>
</td></tr>
		<tr class="list_one"><td class="FormRowValue"><img class="helpTooltip" name="restart">&nbsp;<?php echo $this->_tpl_vars['form']['restart']['html']; ?>
&nbsp;<?php echo $this->_tpl_vars['form']['restart']['label']; ?>
</td>
		<td class="FormRowValue"><?php echo $this->_tpl_vars['form']['restart_mode']['label']; ?>
&nbsp;<?php echo $this->_tpl_vars['form']['restart_mode']['html']; ?>
</td></tr>
        <tr class="list_two"><td class="FormRowValue" colspan="2"><img class="helpTooltip" name="postcmd">&nbsp;<?php echo $this->_tpl_vars['form']['postcmd']['html']; ?>
&nbsp;<?php echo $this->_tpl_vars['form']['postcmd']['label']; ?>
</td></tr>
	</table>
	<div align="center" id="validForm"><p class="oreonbutton"><?php echo $this->_tpl_vars['form']['submit']['html']; ?>
</p></div>

	<div id='console' style='visibility: hidden;'>
		<table class="formTable table">
			<tr class="ListHeader">
				<td class="FormHeader" colspan="2">
                  <h3>| <?php echo $this->_tpl_vars['consoleLabel']; ?>
</h3>
                </td>
			</tr>
			<tr class="list_one">
				<td class="FormRowField">					
					<?php echo $this->_tpl_vars['progressLabel']; ?>
 (<label id='progressPct'></label>)
				</td>
				<td class="FormRowValue">
					<span id="progress_bar">0%</span>
				</td>
			</tr>
			<tr class="list_two">
				<td class="FormRowField">
					<div id="consoleContent"></div>
				</td>
				<td class="FormRowValue">
					<div id="consoleDetails"></div>
				</td>
			</tr>
			<tbody id="error_log">
			</tbody>
		</table>
	</div>
	<?php if ($this->_tpl_vars['msg_debug'] || $this->_tpl_vars['msg_copy'] || $this->_tpl_vars['msg_restart']): ?>
	<div>
		<ul id="mainnav">
		<?php $this->assign('cpt', 0); ?>
		<?php $_from = $this->_tpl_vars['host_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['item']):
?>
			<?php if ($this->_tpl_vars['msg_restart'][$this->_tpl_vars['key']] || $this->_tpl_vars['msg_copy'][$this->_tpl_vars['key']] || $this->_tpl_vars['msg_debug'][$this->_tpl_vars['key']]): ?>
			<?php $this->assign('cpt', $this->_tpl_vars['cpt']+1); ?>
			<li class="a" id='c<?php echo $this->_tpl_vars['cpt']; ?>
'><a href="#generate"  onclick="javascript:montre('<?php echo $this->_tpl_vars['cpt']; ?>
');"><?php echo $this->_tpl_vars['host_list'][$this->_tpl_vars['key']]; ?>
</a></li>
			<?php endif; ?>
		<?php endforeach; endif; unset($_from); ?>
		</ul>
	</div>
	<a name="generate">
	<?php $this->assign('cpt', 0); ?>
	<?php $_from = $this->_tpl_vars['tab_server']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['item']):
?>
	<?php $this->assign('cpt', $this->_tpl_vars['cpt']+1); ?>
	<div id='tab<?php echo $this->_tpl_vars['cpt']; ?>
' class='tab'>
	 	<table class="ListTable">
		 	<tr class="ListHeader">
		 		<td class="FormHeader"><img src='./img/icones/16x16/component_green.gif'>&nbsp;&nbsp;<?php echo $this->_tpl_vars['form']['header']['status']; ?>
</td>
		 	</tr>
		 	<?php if ($this->_tpl_vars['msg_debug'][$this->_tpl_vars['key']]): ?>
		 	<tr class="list_two_fixe">
		 		<td class="ListColLvl1_name"><?php echo $this->_tpl_vars['msg_debug'][$this->_tpl_vars['key']]; ?>
</td>
		 	</tr>
		 	<?php endif; ?>
		 	<?php if ($this->_tpl_vars['msg_copy'][$this->_tpl_vars['key']]): ?>
		 	<tr class="list_one_fixe">
		 		<td class="ListColLvl1_name"><?php echo $this->_tpl_vars['msg_copy'][$this->_tpl_vars['key']]; ?>
</td>
		 	</tr>
			<?php endif; ?>
		 	<?php if ($this->_tpl_vars['msg_restart'][$this->_tpl_vars['key']]): ?>
		 	<tr class="list_two_fixe">
		 		<td class="ListColLvl1_name"><?php echo $this->_tpl_vars['msg_restart'][$this->_tpl_vars['key']]; ?>
</td>
		 	</tr>
		 	<?php endif; ?>	
		 </table>
	</div>
	 	<?php endforeach; endif; unset($_from); ?> 	
	<?php endif; ?>
	<?php echo $this->_tpl_vars['form']['hidden']; ?>

</form>
<?php echo $this->_tpl_vars['helptext']; ?>