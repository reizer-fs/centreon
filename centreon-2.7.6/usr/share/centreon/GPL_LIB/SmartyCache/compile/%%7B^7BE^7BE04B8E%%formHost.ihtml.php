<?php /* Smarty version 2.6.18, created on 2016-09-02 19:56:54
         compiled from formHost.ihtml */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('block', 't', 'formHost.ihtml', 28, false),)), $this); ?>
<?php echo $this->_tpl_vars['form']['javascript']; ?>
<?php echo $this->_tpl_vars['javascript']; ?>

<form <?php echo $this->_tpl_vars['form']['attributes']; ?>
>
     <div  class="headerTabContainer">
        <ul id="mainnav">
            <li class="a" id='c1'><a href="#"  style='cursor:pointer' onclick="javascript:montre('1');"><?php echo $this->_tpl_vars['sort1']; ?>
</a></li>
            <li class="b" id='c2'><a href="#" style='cursor:pointer' onclick="javascript:montre('2');"><?php echo $this->_tpl_vars['sort2']; ?>
</a></li>
            <li class="b" id='c3'><a href="#" style='cursor:pointer' onclick="javascript:montre('3');"><?php echo $this->_tpl_vars['sort3']; ?>
</a></li>
            <li class="b" id='c4'><a href="#" style='cursor:pointer' onclick="javascript:montre('4');"><?php echo $this->_tpl_vars['sort4']; ?>
</a></li>
            <li class="b" id='c5'><a href="#" style='cursor:pointer' onclick="javascript:montre('5');"><?php echo $this->_tpl_vars['sort5']; ?>
</a></li>
        </ul>
		<div id="validFormTop">
		<?php if ($this->_tpl_vars['o'] == 'a' || $this->_tpl_vars['o'] == 'c' || $this->_tpl_vars['o'] == 'mc'): ?>
			<p class="oreonbutton"><?php echo $this->_tpl_vars['form']['submitC']['html']; ?>
<?php echo $this->_tpl_vars['form']['submitMC']['html']; ?>
<?php echo $this->_tpl_vars['form']['submitA']['html']; ?>
&nbsp;&nbsp;&nbsp;<?php echo $this->_tpl_vars['form']['reset']['html']; ?>
</p>
		<?php else: ?>
			<p class="oreonbutton"><?php echo $this->_tpl_vars['form']['change']['html']; ?>
</p>
		<?php endif; ?>
		</div>
     </div>
     <div id='tab1' class='tab'>
        <table class="formTable table">
	        <tr class="ListHeader">
	            <td class="FormHeader"><h3>| <?php echo $this->_tpl_vars['form']['header']['title']; ?>
</h3></td>
	             <td style="text-align:right;">
	                <a href="./main.php?p=<?php echo $this->_tpl_vars['p']; ?>
&min=1&doc=1&page=configobject.html" target="_blank"  style='cursor:help' alt='<?php echo $this->_tpl_vars['topdoc']; ?>
'>
	             </td>
	        </tr>
 	        <tr class="list_lvl_1">
 	            <td class="ListColLvl1_name" colspan="2"><h4><?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Host basic information<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?></h4></td>
 	        </tr>
	    	<?php if ($this->_tpl_vars['o'] != 'mc'): ?>
		    <tr class="list_one">
		        <td class="FormRowField"><img class="helpTooltip" name="host_name"><?php echo $this->_tpl_vars['form']['host_name']['label']; ?>
</td>
		        <td class="FormRowValue"><?php echo $this->_tpl_vars['form']['host_name']['html']; ?>
</td>
		    </tr>
			<tr class="list_two">
			    <td class="FormRowField"><img class="helpTooltip" name="alias"> <?php echo $this->_tpl_vars['form']['host_alias']['label']; ?>
</td>
			    <td class="FormRowValue"><?php echo $this->_tpl_vars['form']['host_alias']['html']; ?>
</td>
			</tr>
	        <tr class="list_one">
	            <td class="FormRowField"><img class="helpTooltip" name="address"> <?php echo $this->_tpl_vars['form']['host_address']['label']; ?>
</td>
	            <td class="FormRowValue"><?php echo $this->_tpl_vars['form']['host_address']['html']; ?>
&nbsp;&nbsp;<?php echo $this->_tpl_vars['form']['host_resolve']['html']; ?>
</td>
	        </tr>
			<?php endif; ?>
		    <tr class="list_two">
		        <td class="FormRowField"><img class="helpTooltip" name="snmp_options"> <?php echo $this->_tpl_vars['form']['host_snmp_community']['label']; ?>
 & <?php echo $this->_tpl_vars['form']['host_snmp_version']['label']; ?>
</td>
		        <td class="FormRowValue"><?php echo $this->_tpl_vars['form']['host_snmp_community']['html']; ?>
&nbsp;&nbsp;<?php echo $this->_tpl_vars['form']['host_snmp_version']['html']; ?>
</td>
		    </tr>
			<?php if ($this->_tpl_vars['o'] == 'mc' && $this->_tpl_vars['form']['nagios_server_id']['label']): ?>
			<tr class="list_one">
				<td class="FormRowField"><img class="helpTooltip" name="mc_update"> <?php echo $this->_tpl_vars['form']['mc_mod_nsid']['label']; ?>
</td>
				<td class="FormRowValue"><?php echo $this->_tpl_vars['form']['mc_mod_nsid']['html']; ?>
</td>
			</tr>
			<?php endif; ?>
            <?php if ($this->_tpl_vars['form']['nagios_server_id']['label']): ?>
			<tr class="list_one">
			    <td class="FormRowField"><img class="helpTooltip" name="poller"> <?php echo $this->_tpl_vars['form']['nagios_server_id']['label']; ?>
</td>
			    <td class="FormRowValue"><?php echo $this->_tpl_vars['form']['nagios_server_id']['html']; ?>
</td>
			</tr>
            <?php endif; ?>
			<?php if ($this->_tpl_vars['tpl'] == 0 && $this->_tpl_vars['tzUsed']): ?>
			<tr class="list_two">
				<td class="FormRowField"><img class="helpTooltip" name="host_location"> <?php echo $this->_tpl_vars['form']['host_location']['label']; ?>
</td>
				<td class="FormRowValue"><?php echo $this->_tpl_vars['form']['host_location']['html']; ?>
</td>
			</tr>
			<?php endif; ?>
			<?php if ($this->_tpl_vars['o'] == 'mc'): ?>
			<tr class="list_two">	
				<td class="FormRowField"><img class="helpTooltip" name="mc_update"> <?php echo $this->_tpl_vars['form']['mc_mod_tplp']['label']; ?>
</td>
				<td class="FormRowValue"><?php echo $this->_tpl_vars['form']['mc_mod_tplp']['html']; ?>
</td>
			</tr>
			<?php endif; ?>
			<tr class="list_one">
				<td class="FormRowField"><img class="helpTooltip" name="use"> <?php echo $this->_tpl_vars['form']['host_parallel_template']['label']; ?>
<p class="description"><?php echo $this->_tpl_vars['form']['tplTextParallel']['label']; ?>
<p></td>
				<td class="FormRowValue" id="parallelTemplate"><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "file:".($this->_tpl_vars['centreon_path'])."/www/include/common/templates/clone.ihtml", 'smarty_include_vars' => array('cloneId' => 'template','cloneSet' => $this->_tpl_vars['cloneSetTemplate'])));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?></td>
			</tr>
            <?php if ($this->_tpl_vars['form']['dupSvTplAssocText']['label']): ?>
			<tr class="list_two">
				<td class="FormRowField"><img class="helpTooltip" name="create_linked_services"> <?php echo $this->_tpl_vars['form']['dupSvTplAssocText']['label']; ?>
</td>
				<td class="FormRowValue"><?php echo $this->_tpl_vars['form']['dupSvTplAssoc']['html']; ?>
</td>
			</tr>
            <?php endif; ?>
			<?php if ($this->_tpl_vars['form']['acl_groups']): ?>
		    <tr class="list_lvl_1">
		        <td class="ListColLvl1_name" colspan="2"><img src="./img/icones/16x16/lock_new.gif">&nbsp;&nbsp;<?php echo $this->_tpl_vars['accessgroups']; ?>
</td>
		    </tr>
		    <tr class="list_one">
		        <td class="FormRowField"><img class="helpTooltip" name="acl_groups"> <?php echo $this->_tpl_vars['form']['acl_groups']['label']; ?>
</td>
		        <td class="FormRowField"><?php echo $this->_tpl_vars['form']['acl_groups']['html']; ?>
</td>
		    </tr>
		    <?php endif; ?>
			<tr class="list_lvl_1">
			    <td class="ListColLvl1_name" colspan="2"><h4><?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Host check options<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?></h4></td>
			</tr>
		 	<tr class="list_one">
				<td class="FormRowField"><img class="helpTooltip" name="check_command"> <?php echo $this->_tpl_vars['form']['command_command_id']['label']; ?>
</td>
				<td class="FormRowValue">
					<?php echo $this->_tpl_vars['form']['command_command_id']['html']; ?>

					<?php if ($this->_tpl_vars['o'] == 'a' || $this->_tpl_vars['o'] == 'c'): ?>
					<span style="cursor:help; margin-left: 4px;">
						<img src='./img/icons/info.png' class='ico-14' style='vertical-align:middle;' onclick="window.open('main.php?p=60801&command_id='+ document.Form.elements['command_command_id'].options[document.Form.elements['command_command_id'].selectedIndex].value + '&o=w&min=1','','toolbar=no,location=no,directories=no,status=no,scrollbars=yes,resizable=yes,copyhistory=no, width=500, height=200');">
					</span>
					<?php endif; ?>
					<br>
					<br>
					<?php echo $this->_tpl_vars['form']['command_command_id_arg1']['html']; ?>

					<?php if ($this->_tpl_vars['o'] == 'a' || $this->_tpl_vars['o'] == 'c'): ?>
						<img src="./img/icons/arrow-left.png" style='cursor:pointer;margin: 0 6px;vertical-align: middle;' alt="*" class="ico-14" onclick="set_arg('example1','command_command_id_arg1');"><input type="text" name="example1" disabled>
					<?php endif; ?>
					<img class="helpTooltip" name="check_command_args" style="cursor: pointer; margin-left: 4px;vertical-align:middle;">
				</td>
			</tr>
			<tr class="list_two">
				<td class="FormRowField"><img class="helpTooltip" name="macro"> <?php echo $this->_tpl_vars['custom_macro_label']; ?>
 <br>
					<div class="macro_legend">
						<p><span class="state_badge" style="background-color: #ffcb6b;"></span><?php echo $this->_tpl_vars['template_inheritance']; ?>
</p>
						<p><span class="state_badge" style="background-color: #b6fca7;"></span><?php echo $this->_tpl_vars['command_inheritance']; ?>
</p>
					</div>
				</td>
				<td class="FormRowValue"><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "file:".($this->_tpl_vars['centreon_path'])."/www/include/common/templates/cloneMacro.ihtml", 'smarty_include_vars' => array('cloneId' => 'macro','cloneSet' => $this->_tpl_vars['cloneSetMacro'])));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?></td>
			</tr>
			<tr class="list_lvl_1">
			    <td class="ListColLvl1_name" colspan="2"><h4><?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Scheduling options<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?></h4></td>
			</tr>
			<tr class="list_one">
		 		<td class="FormRowField"><img class="helpTooltip" name="check_period"> <?php echo $this->_tpl_vars['form']['timeperiod_tp_id']['label']; ?>
</td>
		 		<td class="FormRowValue"><?php echo $this->_tpl_vars['form']['timeperiod_tp_id']['html']; ?>
</td>
			</tr>
		 	<tr class="list_two">
				<td class="FormRowField"><img class="helpTooltip" name="max_check_attempts"> <?php echo $this->_tpl_vars['form']['host_max_check_attempts']['label']; ?>
</td>
				<td class="FormRowValue"><?php echo $this->_tpl_vars['form']['host_max_check_attempts']['html']; ?>
</td>
			</tr>
			<tr class="list_one">
				<td class="FormRowField"><img class="helpTooltip" name="check_interval"> <?php echo $this->_tpl_vars['form']['host_check_interval']['label']; ?>
</td>
				<td class="FormRowValue"><?php echo $this->_tpl_vars['form']['host_check_interval']['html']; ?>
 <?php echo $this->_tpl_vars['time_unit']; ?>
</td>
			</tr>
			<tr class="list_two">
				<td class="FormRowField"><img class="helpTooltip" name="retry_interval"> <?php echo $this->_tpl_vars['form']['host_retry_check_interval']['label']; ?>
</td>
				<td class="FormRowValue"><?php echo $this->_tpl_vars['form']['host_retry_check_interval']['html']; ?>
 <?php echo $this->_tpl_vars['time_unit']; ?>
</td>
			</tr>
			<tr class="list_one">
				<td class="FormRowField"><img class="helpTooltip" name="active_checks_enabled"> <?php echo $this->_tpl_vars['form']['host_active_checks_enabled']['label']; ?>
</td>
				<td class="FormRowValue"><?php echo $this->_tpl_vars['form']['host_active_checks_enabled']['html']; ?>
</td>
			</tr>
			<tr class="list_two">
				<td class="FormRowField"><img class="helpTooltip" name="passive_checks_enabled"> <?php echo $this->_tpl_vars['form']['host_passive_checks_enabled']['label']; ?>
</td>
				<td class="FormRowValue"><?php echo $this->_tpl_vars['form']['host_passive_checks_enabled']['html']; ?>
</td>
			</tr>
			<?php if ($this->_tpl_vars['o'] == 'a' || $this->_tpl_vars['o'] == 'c'): ?>
				<tr class="list_lvl_2"><td class="ListColLvl2_name" colspan="2"><?php echo $this->_tpl_vars['form']['required_note']; ?>
</td></tr>
			<?php endif; ?>
		<tbody>
	</table>
</div>
<div id='tab2' class='tab'>
	<table class="formTable table">
        <tr class="ListHeader">
            <td class="FormHeader"><h3>| <?php echo $this->_tpl_vars['form']['header']['title']; ?>
</h3></td>
        </tr>
        <tr class="list_lvl_1">
	 		<td class="ListColLvl1_name" colspan="2"><h4><?php echo $this->_tpl_vars['form']['header']['notification']; ?>
</h4></td>
	 	</tr>
		<tr class="list_one">
			<td class="FormRowField"><img class="helpTooltip" name="notifications_enabled"> <?php echo $this->_tpl_vars['form']['host_notifications_enabled']['label']; ?>
</td>
			<td class="FormRowValue"><?php echo $this->_tpl_vars['form']['host_notifications_enabled']['html']; ?>
</td>
		</tr>
	    <?php if ($this->_tpl_vars['o'] == 'mc'): ?>
		<tr class="list_two">
			<td class="FormRowField"><img class="helpTooltip" name="mc_update"> <?php echo $this->_tpl_vars['form']['mc_mod_notifopts']['label']; ?>
</td>
			<td class="FormRowValue"><?php echo $this->_tpl_vars['form']['mc_mod_notifopts']['html']; ?>
</td>
		</tr>
		<?php endif; ?>
		<tr class="list_two">
			<td class="FormRowField"><img class="helpTooltip" name="notification_options"> <?php echo $this->_tpl_vars['form']['host_notifOpts']['label']; ?>
</td>
			<td class="FormRowValue"><?php echo $this->_tpl_vars['form']['host_notifOpts']['html']; ?>
</td>
		</tr>
	    <?php if ($this->_tpl_vars['o'] == 'mc'): ?>
	    <tr class="list_two">
	    	<td class="FormRowField"><img class="helpTooltip" name="mc_update"> <?php echo $this->_tpl_vars['form']['mc_mod_hcg']['label']; ?>
</td>
	    	<td class="FormRowValue"><?php echo $this->_tpl_vars['form']['mc_mod_hcg']['html']; ?>
</td>
	    </tr>
		<?php endif; ?>
        <?php if ($this->_tpl_vars['o'] == 'mc'): ?>
		<tr class="list_one">
			<td class="FormRowField"><img class="helpTooltip" name="mc_update"> <?php echo $this->_tpl_vars['form']['mc_mod_notifopt_notification_interval']['label']; ?>
</td>
			<td class="FormRowValue"><?php echo $this->_tpl_vars['form']['mc_mod_notifopt_notification_interval']['html']; ?>
</td>
		</tr>
		<?php endif; ?>
		<tr class="list_one">
			<td class="FormRowField"><img class="helpTooltip" name="notification_interval"> <?php echo $this->_tpl_vars['form']['host_notification_interval']['label']; ?>
</td>
			<td class="FormRowValue"><?php echo $this->_tpl_vars['form']['host_notification_interval']['html']; ?>
<?php echo $this->_tpl_vars['time_unit']; ?>
</td>
		</tr>
		<?php if ($this->_tpl_vars['o'] == 'mc'): ?>
		<tr class="list_two">
			<td class="FormRowField"><img class="helpTooltip" name="mc_update"> <?php echo $this->_tpl_vars['form']['mc_mod_notifopt_timeperiod']['label']; ?>
</td>
			<td class="FormRowValue"><?php echo $this->_tpl_vars['form']['mc_mod_notifopt_timeperiod']['html']; ?>
</td>
		</tr>
		<?php endif; ?>
		<tr class="list_two">
			<td class="FormRowField"><img class="helpTooltip" name="notification_period"> <?php echo $this->_tpl_vars['form']['timeperiod_tp_id2']['label']; ?>
</td>
			<td class="FormRowValue"><?php echo $this->_tpl_vars['form']['timeperiod_tp_id2']['html']; ?>
</td>
		</tr>
		<?php if ($this->_tpl_vars['o'] == 'mc'): ?>
		<tr class="list_one">
			<td class="FormRowField"><img class="helpTooltip" name="mc_update"> <?php echo $this->_tpl_vars['form']['mc_mod_notifopt_first_notification_delay']['label']; ?>
</td>
			<td class="FormRowValue"><?php echo $this->_tpl_vars['form']['mc_mod_notifopt_first_notification_delay']['html']; ?>
</td>
		</tr>
		<?php endif; ?>
		<tr class="list_two">
			<td class="FormRowField"><img class="helpTooltip" name="first_notification_delay"> <?php echo $this->_tpl_vars['form']['host_first_notification_delay']['label']; ?>
</td>
			<td class="FormRowValue"><?php echo $this->_tpl_vars['form']['host_first_notification_delay']['html']; ?>
 <?php echo $this->_tpl_vars['time_unit']; ?>
</td>
		</tr>
		<tr class="list_lvl_1">
		    <td class="ListColLvl1_name" colspan="2"><h4><?php $this->_tag_stack[] = array('t', array()); $_block_repeat=true;smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>Notification receivers<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?></h4></td>
		</tr>
                <?php if ($this->_tpl_vars['o'] == 'mc'): ?>
                    <tr class="list_one">
			<td class="FormRowField"><img class="helpTooltip" name="contact_additive_inheritance"> <?php echo $this->_tpl_vars['form']['mc_contact_additive_inheritance']['label']; ?>
</td>
			<td class="FormRowValue"><?php echo $this->_tpl_vars['form']['mc_contact_additive_inheritance']['html']; ?>
</td>
                    </tr>
                    <tr class="list_one">
			<td class="FormRowField"><img class="helpTooltip" name="contact_groups"> <?php echo $this->_tpl_vars['form']['host_cs']['label']; ?>
</td>
			<td class="FormRowValue"><?php echo $this->_tpl_vars['form']['host_cs']['html']; ?>
</td>
                    </tr>
		<?php else: ?>
                    <tr class="list_one">
                            <td class="FormRowField"><img class="helpTooltip" name="contacts"> <?php echo $this->_tpl_vars['form']['host_cs']['label']; ?>
</td>
                            <td class="FormRowValue">
                                <p style='margin-bottom : 6px;'>
                                    <?php echo $this->_tpl_vars['form']['contact_additive_inheritance']['html']; ?>
 <?php echo $this->_tpl_vars['form']['contact_additive_inheritance']['label']; ?>

                                    <img class="helpTooltip" name="contact_additive_inheritance">
                                </p>
                                <?php echo $this->_tpl_vars['form']['host_cs']['html']; ?>

                            </td>
                    </tr>
                <?php endif; ?>
                <?php if ($this->_tpl_vars['o'] == 'mc'): ?>
                    <tr class="list_one">
			<td class="FormRowField"><img class="helpTooltip" name="cg_additive_inheritance"> <?php echo $this->_tpl_vars['form']['mc_cg_additive_inheritance']['label']; ?>
</td>
			<td class="FormRowValue"><?php echo $this->_tpl_vars['form']['mc_cg_additive_inheritance']['html']; ?>
</td>
                    </tr>
                    <tr class="list_one">
			<td class="FormRowField"><img class="helpTooltip" name="contact_groups"> <?php echo $this->_tpl_vars['form']['host_cgs']['label']; ?>
</td>
			<td class="FormRowValue"><?php echo $this->_tpl_vars['form']['host_cgs']['html']; ?>
</td>
                    </tr>
		<?php else: ?>
                    <tr class="list_two">
                        <td class="FormRowField"><img class="helpTooltip" name="contact_groups"> <?php echo $this->_tpl_vars['form']['host_cgs']['label']; ?>
</td>
                        <td class="FormRowValue">
                            <p style='margin-bottom : 6px;'>
                                <?php echo $this->_tpl_vars['form']['cg_additive_inheritance']['html']; ?>
 <?php echo $this->_tpl_vars['form']['cg_additive_inheritance']['label']; ?>

                                <img class="helpTooltip" name="cg_additive_inheritance">
                            </p>
                            <?php echo $this->_tpl_vars['form']['host_cgs']['html']; ?>

                        </td>
                    </tr>
		<?php endif; ?>
	</table>
</div>
<div id='tab3' class='tab'>
 <table class="formTable table">
	<tr class="ListHeader">
      <td class="FormHeader" colspan="2">
        <h3>| <?php echo $this->_tpl_vars['form']['header']['title2']; ?>
</h3>
      </td>
    </tr>
	<tr class="list_lvl_1">
      <td class="ListColLvl1_name" colspan="2">
        <h4><?php echo $this->_tpl_vars['form']['header']['HGlinks']; ?>
</h4>
      </td>
    </tr>
	<?php if (! $this->_tpl_vars['msg']['tpl']): ?>
		<?php if ($this->_tpl_vars['o'] == 'mc'): ?>
			<tr class="list_one"><td class="FormRowField"><img class="helpTooltip" name="mc_update"> <?php echo $this->_tpl_vars['form']['mc_mod_hhg']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['mc_mod_hhg']['html']; ?>
</td></tr>
		<?php endif; ?>
		<tr class="list_one"><td class="FormRowField"><img class="helpTooltip" name="hostgroups"> <?php echo $this->_tpl_vars['form']['host_hgs']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['host_hgs']['html']; ?>
</td></tr>
        <tr class="list_lvl_1">
          <td class="ListColLvl1_name" colspan="2">
            <h4><?php echo $this->_tpl_vars['form']['header']['HClinks']; ?>
</h4>
          </td>
        </tr>
                <?php if ($this->_tpl_vars['o'] == 'mc'): ?>
			<tr class="list_one"><td class="FormRowField"><img class="helpTooltip" name="mc_update"> <?php echo $this->_tpl_vars['form']['mc_mod_hhc']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['mc_mod_hhc']['html']; ?>
</td></tr>
		<?php endif; ?>
                <tr class="list_one"><td class="FormRowField"><img class="helpTooltip" name="hostcategories"> <?php echo $this->_tpl_vars['form']['host_hcs']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['host_hcs']['html']; ?>
</td></tr>
	<tr class="list_lvl_1">
      <td class="ListColLvl1_name" colspan="2">
        <h4><?php echo $this->_tpl_vars['form']['header']['links']; ?>
</h4>
      </td>
   </tr>
		<?php if ($this->_tpl_vars['o'] == 'mc'): ?>
			<tr class="list_two"><td class="FormRowField"><img class="helpTooltip" name="mc_update"> <?php echo $this->_tpl_vars['form']['mc_mod_hpar']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['mc_mod_hpar']['html']; ?>
</td></tr>
		<?php endif; ?>
		<tr class="list_two"><td class="FormRowField"><img class="helpTooltip" name="parents"> <?php echo $this->_tpl_vars['form']['host_parents']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['host_parents']['html']; ?>
</td></tr>
		<?php if ($this->_tpl_vars['o'] == 'mc'): ?>
			<tr class="list_one"><td class="FormRowField"><img class="helpTooltip" name="mc_update"> <?php echo $this->_tpl_vars['form']['mc_mod_hch']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['mc_mod_hch']['html']; ?>
</td></tr>
		<?php endif; ?>
		<tr class="list_one"><td class="FormRowField"><img class="helpTooltip" name="child_hosts"> <?php echo $this->_tpl_vars['form']['host_childs']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['host_childs']['html']; ?>
</td></tr>
	<?php else: ?>
		<?php if ($this->_tpl_vars['o'] == 'mc'): ?>
			<tr class="list_one"><td class="FormRowField"><img class="helpTooltip" name="mc_update"> <?php echo $this->_tpl_vars['form']['mc_mod_htpl']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['mc_mod_htpl']['html']; ?>
</td></tr>
		<?php endif; ?>
		<tr class="list_one"><td class="FormRowField"><img class="helpTooltip" name="service_templates"> <?php echo $this->_tpl_vars['form']['host_svTpls']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['host_svTpls']['html']; ?>
</td></tr>
        <tr class="list_lvl_1">
          <td class="ListColLvl1_name" colspan="2">
            <h4><?php echo $this->_tpl_vars['form']['header']['HClinks']; ?>
</h4>
          </td>
        </tr>
        <?php if ($this->_tpl_vars['o'] == 'mc'): ?>
			<tr class="list_one"><td class="FormRowField"><img class="helpTooltip" name="mc_update"> <?php echo $this->_tpl_vars['form']['mc_mod_hhc']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['mc_mod_hhc']['html']; ?>
</td></tr>
		<?php endif; ?>
         <tr class="list_one"><td class="FormRowField"><img class="helpTooltip" name="hostcategories"> <?php echo $this->_tpl_vars['form']['host_hcs']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['host_hcs']['html']; ?>
</td></tr>
	<?php endif; ?>
	<?php if ($this->_tpl_vars['o'] == 'a' || $this->_tpl_vars['o'] == 'c'): ?>
		<tr class="list_lvl_2"><td class="ListColLvl2_name" colspan="2"><?php echo $this->_tpl_vars['form']['required_note']; ?>
</td></tr>
	<?php endif; ?>
 </table>
</div>
<div id='tab4' class='tab'>
 <table class="formTable table">
	<tr class="ListHeader">
      <td class="FormHeader" colspan="2">
        <h3>| <?php echo $this->_tpl_vars['form']['header']['title3']; ?>
</h3>
      </td>
    </tr>
	<tr class="list_lvl_1">
      <td class="ListColLvl1_name" colspan="2">
        <h4><?php echo $this->_tpl_vars['form']['header']['treatment']; ?>
</h4>
      </td>
    </tr>
	<tr class="list_one"><td class="FormRowField"><img class="helpTooltip" name="obsess_over_host"> <?php echo $this->_tpl_vars['form']['host_obsess_over_host']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['host_obsess_over_host']['html']; ?>
</td></tr>
	<tr class="list_lvl_1">
		<td class="ListColLvl1_name" colspan="2">
          <h4><?php echo $this->_tpl_vars['Freshness_Control_options']; ?>
</h4>
        </td>
	</tr>
	<tr class="list_two"><td class="FormRowField"><img class="helpTooltip" name="check_freshness"> <?php echo $this->_tpl_vars['form']['host_check_freshness']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['host_check_freshness']['html']; ?>
</td></tr>
	<tr class="list_one"><td class="FormRowField"><img class="helpTooltip" name="freshness_threshold"> <?php echo $this->_tpl_vars['form']['host_freshness_threshold']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['host_freshness_threshold']['html']; ?>
&nbsp;<?php echo $this->_tpl_vars['seconds']; ?>
</td></tr>
	<tr class="list_lvl_1">
      <td class="ListColLvl1_name" colspan="2">
        <h4><?php echo $this->_tpl_vars['Flapping_Options']; ?>
</h4>
      </td>
    </tr>
	<tr class="list_two"><td class="FormRowField"><img class="helpTooltip" name="flap_detection_enabled"> <?php echo $this->_tpl_vars['form']['host_flap_detection_enabled']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['host_flap_detection_enabled']['html']; ?>
</td></tr>
	<tr class="list_one"><td class="FormRowField"><img class="helpTooltip" name="low_flap_threshold"> <?php echo $this->_tpl_vars['form']['host_low_flap_threshold']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['host_low_flap_threshold']['html']; ?>
&nbsp;%</td></tr>
	<tr class="list_two"><td class="FormRowField"><img class="helpTooltip" name="high_flap_threshold"> <?php echo $this->_tpl_vars['form']['host_high_flap_threshold']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['host_high_flap_threshold']['html']; ?>
&nbsp;%</td></tr>
	<tr class="list_lvl_1">
      <td class="ListColLvl1_name" colspan="2">
        <h4><?php echo $this->_tpl_vars['Perfdata_Options']; ?>
</h4>
      </td>
    </tr>
	<tr class="list_one"><td class="FormRowField"><img class="helpTooltip" name="process_perf_data"> <?php echo $this->_tpl_vars['form']['host_process_perf_data']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['host_process_perf_data']['html']; ?>
</td></tr>
	<tr class="list_lvl_1"><td class="ListColLvl1_name" colspan="2">
      <h4><?php echo $this->_tpl_vars['History_Options']; ?>
</h4>
    </td></tr>
	<tr class="list_two"><td class="FormRowField"><img class="helpTooltip" name="retain_status_information"> <?php echo $this->_tpl_vars['form']['host_retain_status_information']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['host_retain_status_information']['html']; ?>
</td></tr>
	<tr class="list_one"><td class="FormRowField"><img class="helpTooltip" name="retain_nonstatus_information"> <?php echo $this->_tpl_vars['form']['host_retain_nonstatus_information']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['host_retain_nonstatus_information']['html']; ?>
</td></tr>
	<tr class="list_two"><td class="FormRowField"><img class="helpTooltip" name="stalking_options"> <?php echo $this->_tpl_vars['form']['host_stalOpts']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['host_stalOpts']['html']; ?>
</td></tr>
	<tr class="list_lvl_1"><td class="ListColLvl1_name" colspan="2">
      <h4><?php echo $this->_tpl_vars['Event_Handler']; ?>
</h4>
    </td></tr>
	<tr class="list_one"><td class="FormRowField"><img class="helpTooltip" name="event_handler_enabled"> <?php echo $this->_tpl_vars['form']['host_event_handler_enabled']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['host_event_handler_enabled']['html']; ?>
</td></tr>
	<tr class="list_two">
		<td class="FormRowField"><img class="helpTooltip" name="event_handler"> <?php echo $this->_tpl_vars['form']['command_command_id2']['label']; ?>
</td>
		<td class="FormRowValue">
			<?php echo $this->_tpl_vars['form']['command_command_id2']['html']; ?>

			<?php if ($this->_tpl_vars['o'] == 'a' || $this->_tpl_vars['o'] == 'c'): ?>
				&nbsp;<img class="ico-14" src='./img/icons/info.png' style='cursor:help;vertical-align:middle;' onclick="window.open('main.php?p=60801&command_id='+ document.Form.elements['command_command_id2'].options[document.Form.elements['command_command_id2'].selectedIndex].value + '&o=w&min=1','','toolbar=no,location=no,directories=no,status=no,scrollbars=yes,resizable=yes,copyhistory=no, width=1000, height=200');">
			<?php endif; ?>
		</td>
	</tr>
	<tr class="list_one"><td class="FormRowField"><img class="helpTooltip" name="event_handler_args"> <?php echo $this->_tpl_vars['form']['command_command_id_arg2']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['command_command_id_arg2']['html']; ?>

		<?php if ($this->_tpl_vars['o'] == 'a' || $this->_tpl_vars['o'] == 'c'): ?>
		&nbsp;<a><img src="./img/icons/arrow-left.png" class="ico-14" style='cursor: pointer;margin: 0 6px;vertical-align: middle;' alt="*" onclick="set_arg('example2','command_command_id_arg2');"></a><input type="text" name="example2" disabled>
		<?php endif; ?></td>
	</tr>
	<?php if ($this->_tpl_vars['o'] == 'a' || $this->_tpl_vars['o'] == 'c'): ?>
		<tr class="list_lvl_2"><td class="ListColLvl2_name" colspan="2"><?php echo $this->_tpl_vars['form']['required_note']; ?>
</td></tr>
	<?php endif; ?>
 </table>
</div>
<div id='tab5' class='tab'>
 <table class="formTable table">
	<tr class="ListHeader">
      <td class="FormHeader" colspan="2">
        <h3>| <?php echo $this->_tpl_vars['form']['header']['title4']; ?>
</h3>
      </td>
    </tr>
	<tr class="list_lvl_1">
      <td class="ListColLvl1_name" colspan="2">
        <h4><?php echo $this->_tpl_vars['form']['header']['nagios']; ?>
</h4>
      </td>
    </tr>
	<tr class="list_one"><td class="FormRowField"><img class="helpTooltip" name="notes_url"> <?php echo $this->_tpl_vars['form']['ehi_notes_url']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['ehi_notes_url']['html']; ?>
</td></tr>
 	<tr class="list_two"><td class="FormRowField"><img class="helpTooltip" name="notes"> <?php echo $this->_tpl_vars['form']['ehi_notes']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['ehi_notes']['html']; ?>
</td></tr>
	<tr class="list_one"><td class="FormRowField"><img class="helpTooltip" name="action_url"> <?php echo $this->_tpl_vars['form']['ehi_action_url']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['ehi_action_url']['html']; ?>
</td></tr>
 	<tr class="list_two"><td class="FormRowField"><img class="helpTooltip" name="icon_image"> <?php echo $this->_tpl_vars['form']['ehi_icon_image']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['ehi_icon_image']['html']; ?>
&nbsp;&nbsp;<img id='ehi_icon_image_img' src='./img/blank.gif'></td></tr>
	<tr class="list_one"><td class="FormRowField"><img class="helpTooltip" name="icon_image_alt"> <?php echo $this->_tpl_vars['form']['ehi_icon_image_alt']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['ehi_icon_image_alt']['html']; ?>
</td></tr>
	<tr class="list_two"><td class="FormRowField"><img class="helpTooltip" name="vrml_image"> <?php echo $this->_tpl_vars['form']['ehi_vrml_image']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['ehi_vrml_image']['html']; ?>
&nbsp;&nbsp;<img id='ehi_vrml_image_img' src='./img/blank.gif'></td></tr>
	<tr class="list_one"><td class="FormRowField"><img class="helpTooltip" name="statusmap_image"> <?php echo $this->_tpl_vars['form']['ehi_statusmap_image']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['ehi_statusmap_image']['html']; ?>
&nbsp;&nbsp;<img id='ehi_statusmap_image_img' src='./img/blank.gif'></td></tr>
	<tr class="list_two"><td class="FormRowField"><img class="helpTooltip" name="2d_coords"> <?php echo $this->_tpl_vars['form']['ehi_2d_coords']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['ehi_2d_coords']['html']; ?>
</td></tr>
	<tr class="list_one"><td class="FormRowField"><img class="helpTooltip" name="3d_coords"> <?php echo $this->_tpl_vars['form']['ehi_3d_coords']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['ehi_3d_coords']['html']; ?>
</td></tr>
    <tr class="list_two"><td class="FormRowField"><img class="helpTooltip" name="criticality_id"> <?php echo $this->_tpl_vars['form']['criticality_id']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['criticality_id']['html']; ?>
</td></tr>
	<tr class="list_lvl_1">
      <td class="ListColLvl1_name" colspan="2">
        <h4><?php echo $this->_tpl_vars['form']['header']['furtherInfos']; ?>
</h4>
      </td>
    </tr>
	<tr class="list_two"><td class="FormRowField"><?php echo $this->_tpl_vars['form']['host_activate']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['host_activate']['html']; ?>
</td></tr>
	<tr class="list_one"><td class="FormRowField"><?php echo $this->_tpl_vars['form']['host_comment']['label']; ?>
</td><td class="FormRowValue"><?php echo $this->_tpl_vars['form']['host_comment']['html']; ?>
</td></tr>
	<?php if ($this->_tpl_vars['o'] == 'a' || $this->_tpl_vars['o'] == 'c'): ?>
		<tr class="list_lvl_2"><td class="ListColLvl2_name" colspan="2"><?php echo $this->_tpl_vars['form']['required_note']; ?>
</td></tr>
	<?php endif; ?>
</table>
</div>
<div id="validForm">
<?php if ($this->_tpl_vars['o'] == 'a' || $this->_tpl_vars['o'] == 'c' || $this->_tpl_vars['o'] == 'mc'): ?>
	<p class="oreonbutton"><?php echo $this->_tpl_vars['form']['submitC']['html']; ?>
<?php echo $this->_tpl_vars['form']['submitMC']['html']; ?>
<?php echo $this->_tpl_vars['form']['submitA']['html']; ?>
&nbsp;&nbsp;&nbsp;<?php echo $this->_tpl_vars['form']['reset']['html']; ?>
</p>
<?php else: ?>
	<p class="oreonbutton"><?php echo $this->_tpl_vars['form']['change']['html']; ?>
</p>
<?php endif; ?>
</div>
<?php echo $this->_tpl_vars['form']['hidden']; ?>

</form>
<?php echo $this->_tpl_vars['helptext']; ?>

<script>

var alert_check_interval = "<?php echo $this->_tpl_vars['alert_check_interval']; ?>
";

<?php echo '
jQuery(\'input[name=host_check_interval]\').change(function(){
    if (parseInt(jQuery(this).val()) >= 1440){
        alert(alert_check_interval);
    }
});

jQuery(function() {
    setListener(jQuery(\'select[name=command_command_id]\'));

    sheepIt = jQuery("#macro").sheepIt({
        separator: \'\',
        allowRemoveLast: true,
        allowRemoveCurrent: true,
        allowRemoveAll: true,
        minFormsCount: 0,
        maxFormsCount: 200,
        continuousIndex : false,
        iniFormsCount: jQuery("#clone-count-macro").data("clone-count-macro"),
        data: jQuery("#clone-values-macro").data("clone-values-macro"),
        afterAdd: function(source, newForm) {
            jQuery(newForm).find("input[id^=\'macroPassword_\']").parent().show();
        }

    });
    jQuery(".onemacro").each(function(idx,elem){
        var from = jQuery(elem).find(\'input[name^=macroFrom]\').val();
        if (from === "direct") {
            jQuery(elem).find("input[name^=\'macroInput\']").css("background","white");
            jQuery(elem).find("input[name^=\'macroValue\']").css("background","white");
        } else if(from === "fromTpl"){
            jQuery(elem).find("input[name^=\'macroInput\']").css({\'background-color\' : \'#ffcb6b\',border : \'1px solid #ffa600\'});
            jQuery(elem).find("input[name^=\'macroValue\']").css({\'background-color\' : \'#ffcb6b\',border : \'1px solid #ffa600\'});
        } else {
            jQuery(elem).find("input[name^=\'macroInput\']").css({\'background-color\' : \'#b6fca7\',border : \'1px solid #50ce36\'});
            jQuery(elem).find("input[name^=\'macroValue\']").css({\'background-color\' : \'#b6fca7\',border : \'1px solid #50ce36\'});
        }

        if (jQuery(elem).find("input[id^=\'macroPassword_\']").is(\':checked\')) {
            jQuery(elem).find("input[name^=\'macroValue\']").prop(\'type\', \'password\');
        }

        '; ?>
<?php if ($this->_tpl_vars['form']['frozen'] == false): ?><?php echo '
        // Display undo button on template macro
        if (typeof jQuery(elem).find("input[name^=\'macroTplValToDisplay\']") != \'undefined\'){
            if (jQuery(elem).find("input[name^=\'macroTplValToDisplay\']").val() == "1"){
                var tplValueField = jQuery(elem).find("input[name^=\'macroTplValue\']");
                var tplValue = tplValueField.val();

                tplValueField.after(jQuery(\'<img/>\',{src : \'./img/icons/undo.png\', class : \'ico-14\', style : \'vertical-align : middle;\'}).on(\'click\',function(){
                    jQuery(elem).find("input[name^=\'macroValue\']").val(tplValue);
                    jQuery(elem).find(\'input[name^=macroFrom]\').val("fromTpl");
                    jQuery(elem).find("input[name^=\'macroInput\']").css({\'background-color\' : \'#ffcb6b\',border : \'1px solid #ffa600\'});
                    jQuery(elem).find("input[name^=\'macroValue\']").css({\'background-color\' : \'#ffcb6b\',border : \'1px solid #ffa600\'});
                }));
            }
        }
        '; ?>
<?php endif; ?><?php echo '

        jQuery(elem).find("input[name^=\'macroInput\']").on("input",function(){
            jQuery(elem).find(\'input[name^=macroFrom]\').val("direct");
            jQuery(elem).find("input[name^=\'macroInput\']").css("background","white");
            jQuery(elem).find("input[name^=\'macroValue\']").css("background","white");
        });
        jQuery(elem).find("input[name^=\'macroValue\']").on("input",function(){
            jQuery(elem).find(\'input[name^=macroFrom]\').val("direct");
            jQuery(elem).find("input[name^=\'macroInput\']").css("background","white");
            jQuery(elem).find("input[name^=\'macroValue\']").css("background","white");
        });
    });

    jQuery(".macroclone").sortable(
        {
           handle: ".clonehandle",
           axis: "y",
           helper: "clone",
           opacity: 0.5,
           placeholder: "clone-placeholder",
           tolerance: "pointer"
        }
    );
});

    function setListener(elem){
        elem.on(\'change\',function(event,data){
            if(typeof data != "undefined" && typeof data.origin !=undefined 
                && data.origin == "select2defaultinit"){
                return false;
            }
            doAjaxLoad(this);
        });

        elem.on("remove", function () {
            jQuery(this).val("");
            doAjaxLoad(this);
        });
    }

    function clonerefreshListener(el){
        setListener(el.find(\'select[name^=tpSelect]\'));
    }

'; ?>
<?php if ($this->_tpl_vars['o'] != 'mc'): ?><?php echo ' 
    function doAjaxLoad(elems){
        jQuery.ajax({
            url: "./include/configuration/configObject/host/refreshMacroAjax.php",
            type: "POST",
            dataType : "json",
            data: elems.form.serialize(),
            success : function(json){

                jQuery("#clone-count-macro").data("clone-count-macro",json.count);
                jQuery("#clone-values-macro").data("clone-values-macro",json.macros);
                sheepIt.removeAllForms();
                for (i = 0; i < jQuery("#clone-count-macro").data("clone-count-macro"); i++) {
                    sheepIt.addForm();	
                }

                sheepIt.inject(jQuery("#clone-values-macro").data("clone-values-macro"));

                jQuery(".macroclone").sortable(
                    {
                       handle: ".clonehandle",
                       axis: "y",
                       helper: "clone",
                       opacity: 0.5,
                       placeholder: "clone-placeholder",
                       tolerance: "pointer"
                    }
                );

                jQuery(".onemacro").each(function(idx,elem){
                    var from = jQuery(elem).find(\'input[name^=macroFrom]\').val();
                    if (from === "direct") {
                        jQuery(elem).find("input[name^=\'macroInput\']").css("background","white");
                        jQuery(elem).find("input[name^=\'macroValue\']").css("background","white");
                    } else if (from === "fromTpl"){
                        jQuery(elem).find("input[name^=\'macroInput\']").css({\'background-color\' : \'#ffcb6b\',border : \'1px solid #ffa600\'});
                        jQuery(elem).find("input[name^=\'macroValue\']").css({\'background-color\' : \'#ffcb6b\',border : \'1px solid #ffa600\'});
                    } else {
                        jQuery(elem).find("input[name^=\'macroInput\']").css({\'background-color\' : \'#b6fca7\',border : \'1px solid #50ce36\'});
                        jQuery(elem).find("input[name^=\'macroValue\']").css({\'background-color\' : \'#b6fca7\',border : \'1px solid #50ce36\'});
                    }
                    

                    if (jQuery(elem).find("input[id^=\'macroPassword_\']").is(\':checked\')) {
                        jQuery(elem).find("input[name^=\'macroValue\']").prop(\'type\', \'password\');
                    }

                    '; ?>
<?php if ($this->_tpl_vars['form']['frozen'] == false): ?><?php echo '
                    // Display undo button on template macro
                    if (typeof jQuery(elem).find("input[name^=\'macroTplValToDisplay\']") != \'undefined\'){
                        if (jQuery(elem).find("input[name^=\'macroTplValToDisplay\']").val() == "1"){
                            var tplValueField = jQuery(elem).find("input[name^=\'macroTplValue\']");
                            var tplValue = tplValueField.val();
                            
                            var tplInputField = jQuery(elem).find("input[name^=\'macroInput\']");
                            var tplInput = tplInputField.val();

                            tplValueField.after(jQuery(\'<img/>\',{src : \'./img/icons/undo.png\', class : \'ico-14\', style : \'vertical-align : middle;\'}).on(\'click\',function(){
                                jQuery(elem).find("input[name^=\'macroValue\']").val(tplValue);
                                jQuery(elem).find("input[name^=\'macroInput\']").val(tplInput);
                                jQuery(elem).find(\'input[name^=macroFrom]\').val("fromTpl");
                                jQuery(elem).find("input[name^=\'macroInput\']").css({\'background-color\' : \'#ffcb6b\',border : \'1px solid #ffa600\'});
                                jQuery(elem).find("input[name^=\'macroValue\']").css({\'background-color\' : \'#ffcb6b\',border : \'1px solid #ffa600\'});
                            }));
                        }
                    }
                    '; ?>
<?php endif; ?><?php echo '

                    jQuery(elem).find("input[name^=\'macroInput\']").on("input",function(){
                        jQuery(elem).find(\'input[name^=macroFrom]\').val("direct");
                        jQuery(elem).find("input[name^=\'macroInput\']").css("background","white");
                        jQuery(elem).find("input[name^=\'macroValue\']").css("background","white");
                    });
                    jQuery(elem).find("input[name^=\'macroValue\']").on("input",function(){
                        jQuery(elem).find(\'input[name^=macroFrom]\').val("direct");
                        jQuery(elem).find("input[name^=\'macroInput\']").css("background","white");
                        jQuery(elem).find("input[name^=\'macroValue\']").css("background","white");
                    });

                });
            }
        });
    }
'; ?>
<?php endif; ?><?php echo '
'; ?>

</script>