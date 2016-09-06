<?php /* Smarty version 2.6.18, created on 2016-09-05 17:11:30
         compiled from BlockHeader.ihtml */ ?>
<div></div>
<div id="header">
    <div id="centreon_logo">
	    <img src='<?php echo $this->_tpl_vars['urlLogo']; ?>
' title='Centreon Logo' id="logo" />
	</div>
    <!-- stat -->
    	<div id="resume_light">
    		<?php if ($this->_tpl_vars['displayTopCounter'] == 1 || $this->_tpl_vars['displayPollerStats'] == 1): ?>
    		<table cellpadding="0" cellspacing="0" border="0">
    		<tr>
    			<?php if ($this->_tpl_vars['displayPollerStats'] == 1): ?>
    			<td>
    				<table class='Resume_light_table'>
    					<tr>
    					    <th><?php echo $this->_tpl_vars['ndoState']; ?>
</th>

    						<td>
    						    <span id='latency' >
    						        <img src='./img/icons/clock.png' class="ico-10" id="img_latency" />
    						    </span>
    						</td>
    						<td>
    						    <span id="pollingState">
    						        <img src='./img/icons/poller.png' class="ico-10" id="img_pollingState"/>
    						    </span>
    						</td>
    						<td>
    						    <span id="activity">
    						        <img src='./img/icons/database.png' class="ico-10" id="img_activity" />
    						    </span>
    						</td>
    					</tr>
    				</table>
    			</td>
    			<?php endif; ?>
    			<?php if ($this->_tpl_vars['displayTopCounter'] == 1): ?>
    			<td>
    				<table class='Resume_light_table'>

    					<tr>
    					    <th>
    					        <span id="hosts">?</span>
    					        <?php echo $this->_tpl_vars['Hosts']; ?>

    					    </th>
                            <td>
                                <span>&#8593;</span><span id="host_up" class="host_up" >?</span>
                            </td>
                            <td>
                                <span id="host_down" class="host_down" >?</span>
                            </td>
                            <td>
                                <span id="host_unreachable" class="host_unreachable">?</span>
                            </td>
                            <td>
                                <span id="host_pending" class="pending">?</span>
                            </td>

    					</tr>
    				</table>
    			</td>
    			<td>
    				<table class='Resume_light_table'>
    					<tr>
    					    <th>
    					        <span id="service_total">?</span>
    					        <?php echo $this->_tpl_vars['Services']; ?>

    					    </th>
                            <td>
                                <span id="service_ok" class="service_ok">?</span>
                            </td>
                            <td>
                                <span id="service_warning" class="service_warning">?</span>
                            </td>
                            <td>
                                <span id="service_critical" class="service_critical">?</span>
                            </td>
                            <td>
                                <span id="service_unknown" class="service_unknown">?</span>
                            </td>
                            <td>
                                <span id="service_pending" class="pending">?</span>
                            </td>
    					</tr>
    				</table>
    			</td>
    			<?php endif; ?>
    		</tr>
    		</table>
    		<?php endif; ?>
    	</div>
	<div id="logli">
        <?php echo $this->_tpl_vars['loggedlabel']; ?>

            <?php if ($this->_tpl_vars['topology'][50104]): ?>
            <a href="./main.php?p=50104&o=c">
            <?php endif; ?>
            <?php echo $this->_tpl_vars['user_login']; ?>

            <?php if ($this->_tpl_vars['topology'][50104]): ?>
            </a>
            <?php endif; ?>

            | <a href="<?php echo $this->_tpl_vars['LogOutUrl']; ?>
" class="red"><?php echo $this->_tpl_vars['Logout']; ?>
</a>

            <?php if ($this->_tpl_vars['autoLoginEnable']): ?>
				| <a onClick='return false;' href='<?php echo $this->_tpl_vars['autoLoginUrl']; ?>
' title='Centreon - IT and Network Monitoring'>
					<img src='./img/icons/unlocked.png' class="ico-16" title='<?php echo $this->_tpl_vars['CentreonAutologin']; ?>
'>
				</a>
			<?php endif; ?>

    </div>
    <div class="container">
        <span id="date"><?php echo $this->_tpl_vars['Date']; ?>
</span>
        <img id="sound_status" src="./img/icons/speaker_<?php echo $this->_tpl_vars['sound_status']; ?>
.png" style="cursor:pointer;vertical-align: bottom;" onClick="<?php echo $this->_tpl_vars['sound_action']; ?>
">
    </div>
	<div id="centreonMsg"></div>
</div>
<?php echo '
<script type=\'text/javascript\'>

/*
 * Toggle Header
 */
function toggleHeader()
{
	new Effect.toggle(\'header\', \'appear\', { afterFinish: function() {
															setQuickSearchPosition();
														  }
										  });
}
</script>
'; ?>
