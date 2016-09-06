<?php /* Smarty version 2.6.18, created on 2016-09-05 17:07:17
         compiled from login.ihtml */ ?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>Centreon - IT & Network Monitoring</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="Generator" content="Centreon - Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved." />
        <meta name="robots" content="index, nofollow" />
        <meta http-equiv="refresh" content="840">
        <link href="<?php echo $this->_tpl_vars['skin']; ?>
login.css" rel="stylesheet" type="text/css">
        <link rel="shortcut icon" href="./img/favicon.ico">
    </head>
    <body OnLoad="document.login.useralias.focus();">
        <form action="./index.php" method="post" name="login" style="height: 100%;">
                <div class="login_wrapper">
                    <div class="LoginInvitLogo">
                        <?php $_from = $this->_tpl_vars['loginMessages']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['message']):
?>
                            <div class="error_msg"><span class='msg'><?php echo $this->_tpl_vars['message']; ?>
</span></div>
                        <?php endforeach; endif; unset($_from); ?>
                       <img src="img/centreon.png" alt="Centreon Logo" title="Centreon Logo" />
                    </div>
                    <div class="logintab">
                        <table id="logintab1" style="text-align:center;" align="center">
                           <tr>
                                <td align='right'>
                                    <?php echo $this->_tpl_vars['form']['useralias']['label']; ?>

                                </td>
                                <td>
                                    <?php echo $this->_tpl_vars['form']['useralias']['html']; ?>

                                </td>
                            </tr>
                            <tr>
                                <td align='right'>
                                    <?php echo $this->_tpl_vars['form']['password']['label']; ?>

                                </td>
                                <td>
                                    <?php echo $this->_tpl_vars['form']['password']['html']; ?>

                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align='center'>
                                    <?php echo $this->_tpl_vars['form']['submitLogin']['html']; ?>

                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="LoginInvitVersion">
                        <span id="LoginInvitcpy">
                            &copy; <a href="mailto:contact@centreon.com">Centreon</a> 2005 - <?php echo $this->_tpl_vars['copyrightend']; ?>

                        </span>
                        <br>
                        <span>
                            <?php echo $this->_tpl_vars['centreonVersion']; ?>

                        </span>
                    </div>
                </div>
            <?php echo $this->_tpl_vars['form']['hidden']; ?>

        </form>
    </body>
</html>