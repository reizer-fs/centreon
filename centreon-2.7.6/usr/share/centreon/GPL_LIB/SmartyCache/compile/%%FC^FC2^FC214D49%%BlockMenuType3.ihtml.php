<?php /* Smarty version 2.6.18, created on 2016-09-05 17:11:30
         compiled from BlockMenuType3.ihtml */ ?>
<!-- begin contener -->
<div id="contener">
<?php $this->assign('cpt', 0); ?>
<table id="Tcontener">
	<tr>
		<td id="Tmenu" class="TcTD">
			<div id="<?php echo $this->_tpl_vars['Menu3Color']; ?>
">
				<div class="menuLeft">
				<?php $_from = $this->_tpl_vars['elemArr3']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['curr_id']):
?>				
					<div class="title_menu"><?php if ($this->_tpl_vars['cpt']): ?><br /><?php endif; ?><h4><?php echo $this->_tpl_vars['curr_id']['title']; ?>
</h4></div>
					<div style="margin:0px;padding-top:6px;">
						<ul>
						<?php $_from = $this->_tpl_vars['curr_id']['tab']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['curr_id2']):
?>
							<li<?php if ($this->_tpl_vars['curr_id2']['MenuIsOnClick']): ?> onclick="<?php echo $this->_tpl_vars['curr_id2']['MenuOnClick']; ?>
()"<?php endif; ?> id="menu_<?php echo $this->_tpl_vars['curr_id2']['Menu3ID']; ?>
">
							<?php if ($this->_tpl_vars['curr_id2']['Menu3Popup']): ?>
								<a href=<?php echo $this->_tpl_vars['curr_id2']['Menu3UrlPopup']; ?>
 target="_blank" title="<?php echo $this->_tpl_vars['curr_id2']['Menu3Name']; ?>
"><?php echo $this->_tpl_vars['curr_id2']['Menu3Name']; ?>
</a>											
							<?php else: ?>
								<?php if ($this->_tpl_vars['curr_id2']['MenuIsOnClick']): ?><?php echo $this->_tpl_vars['curr_id2']['Menu3Name']; ?>
<?php else: ?><a href=<?php echo $this->_tpl_vars['curr_id2']['Menu3Url']; ?>
 title="<?php echo $this->_tpl_vars['curr_id2']['Menu3Name']; ?>
"><?php echo $this->_tpl_vars['curr_id2']['Menu3Name']; ?>
</a><?php endif; ?>
							<?php endif; ?>
							</li>
							<li>
							<ul>
	                            <?php $_from = $this->_tpl_vars['elemArr4'][$this->_tpl_vars['curr_id2']['Menu3ID']]; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['menu4']):
?>
	                                <li <?php if ($this->_tpl_vars['menu4']['MenuIsOnClick']): ?>onclick="<?php echo $this->_tpl_vars['menu4']['MenuOnClick']; ?>
()"<?php endif; ?>>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;
	                                <?php if ($this->_tpl_vars['menu4']['Menu4Popup']): ?><?php if ($this->_tpl_vars['menu4']['MenuIsOnClick']): ?><?php echo $this->_tpl_vars['menu4']['Menu4Name']; ?>
<?php else: ?><a href=<?php echo $this->_tpl_vars['menu4']['Menu4UrlPopup']; ?>
 target="_blank" style="white-space:nowrap;" title="<?php echo $this->_tpl_vars['menu4']['Menu4Name']; ?>
"><?php echo $this->_tpl_vars['menu4']['Menu4Name']; ?>
</a><?php endif; ?>
	                                <?php else: ?><?php if ($this->_tpl_vars['menu4']['MenuIsOnClick']): ?><?php echo $this->_tpl_vars['menu4']['Menu4Name']; ?>
<?php else: ?><a href=<?php echo $this->_tpl_vars['menu4']['Menu4Url']; ?>
 style="white-space:nowrap;" title="<?php echo $this->_tpl_vars['menu4']['Menu4Name']; ?>
"><?php echo $this->_tpl_vars['menu4']['Menu4Name']; ?>
</a><?php endif; ?>
	                                <?php endif; ?>
	                                </li>
	                            <?php endforeach; endif; unset($_from); ?>
	                        </ul><?php if ($this->_tpl_vars['elemArr4'][$this->_tpl_vars['curr_id2']['Menu3ID']]): ?><?php endif; ?>
	                    </li>
						<?php endforeach; endif; unset($_from); ?>
			        	</ul>
					</div>
					<?php $this->assign('cpt', 1); ?>
				<?php endforeach; endif; unset($_from); ?>
				</div>
				<?php if ($this->_tpl_vars['amIadmin']): ?>
				<div class="menuLeft">
					<div class="title_menu"><h4><?php echo $this->_tpl_vars['connected_users']; ?>
</h4></div>
	  	            <div  style="margin:0px;padding-top:6px;">
	  	             	<ul>
		  	            <?php $_from = $this->_tpl_vars['tab_user']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['user']):
?>
		  	            	<li>
								<?php if ($this->_tpl_vars['user']['admin'] == 1): ?>
								<img src='./img/icons/admin.png' style="vertical-align: middle;" class="ico-18" title='<?php echo $this->_tpl_vars['user']['ip']; ?>
'>
								<?php else: ?>
								<img src='./img/icons/user.png' class="ico-18" style="vertical-align: middle;" title='<?php echo $this->_tpl_vars['user']['ip']; ?>
'>
								<?php endif; ?>
								<?php if ($this->_tpl_vars['user']['alias'] == $this->_tpl_vars['UserName']): ?>
								<a href="<?php echo $this->_tpl_vars['UserInfoUrl']; ?>
" style="vertical-align: middle;"><?php echo $this->_tpl_vars['user']['alias']; ?>
</a>
								<?php else: ?>
								<?php echo $this->_tpl_vars['user']['alias']; ?>

								<?php endif; ?>
		  	             	</li>
		  	            <?php endforeach; endif; unset($_from); ?> 
						</ul>
					</div>
				</div>
				<?php endif; ?>
			</div>
		</td>
		<td id="Tmainpage" class="TcTD" valign="top">