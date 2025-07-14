<div id="page_content">
	<div id="page_content_breadcrumbs">
		<?php printPageBlock('_breadcrumbs')?>
	</div>
	
	<div class="inner_content">

		<div id="regist_form">
			<h1>Регистрация на сайте</h1> 
			<?php if(empty($user)){ ?>
			<div id='regist_form'>
				<?php if(!empty($succ) && $succ){ ?>
					<h4 align="center" style="margin: 5px 0; padding:2px 5px">Вы успешно зарегистрировались на сайте! На Ваш E-mail отправлена ссылка подтверждения, по который нужно пройти для активации аккаунта.</h4>
					<br>
					<h4><a href="#">Войти в кабинет</a></h4>
					<?php }else{ ?>
					
					<?php if(!empty($contForm_use) && $contForm_use){ ?>
						<div class="alert_message">
							<script type="text/javascript">
								var message="<?php echo htmlspecialchars($error_message, ENT_IGNORE, DEFAULT_CHARSET); ?>";
								alert(message);
							</script>
						</div>
					<?php }else{ ?>
						<p><?php $regForm->printSubmitErrors(); ?></p>
					<?php } ?>
					
					<?php $regForm->startForm();?>
					<table width="100%" cellspacing="0" cellpadding="0" id="form_regist">
						<tr>
							<td width="130"><?php $regForm->controlTitle('email');?></td>
							<td class="input"><div class="Reg_input_huger"><?php $regForm->controlBody('email');?></div></td>
						</tr>
						<tr><td colspan="2" height="15" style="line-height: 5px;">&nbsp;</td></tr>
						<tr>
							<td width="130"><?php $regForm->controlTitle('password');?></td>
							<td class="input"><div class="Reg_input_huger"><?php $regForm->controlBody('password');?></div></td>
						</tr>
						<tr><td colspan="2" height="10" style="line-height: 5px;">&nbsp;</td></tr>
						<tr>
							<td width="130"><?php $regForm->controlTitle('password2');?></td>
							<td class="input"><div class="Reg_input_huger"><?php $regForm->controlBody('password2');?></div></td>
						</tr>
						<tr><td colspan="2" height="10" style="line-height: 5px;">&nbsp;</td></tr>
						<tr>
							<td width="130" valign="top"><?php $regForm->controlTitle('name');?></td>
							<td class="input"><div class="Reg_input_huger"><?php $regForm->controlBody('name');?></div></td>
						</tr>
						<tr><td colspan="2" height="10" style="line-height: 5px;">&nbsp;</td></tr>
						<tr>
							<td width="130" valign="top"><?php $regForm->controlTitle('lastname');?></td>
							<td class="input"><div class="Reg_input_huger"><?php $regForm->controlBody('lastname');?></div></td>
						</tr>
						<tr><td colspan="2" height="10" style="line-height: 5px;">&nbsp;</td></tr>
						<tr>
							<td width="130" valign="top"><?php $regForm->controlTitle('phone');?></td>
							<td class="input"><div class="Reg_input_huger"><?php $regForm->controlBody('phone');?></div></td>
						</tr>
						<tr><td colspan="2" height="10" style="line-height: 5px;">&nbsp;</td></tr>
						<tr>
							<td colspan="2" align="center" valign="middle" class="reg_form_captcha"><?php $regForm->controlBody('captcha')?></td>
						</tr>
						<tr><td colspan="2" height="10" style="line-height: 5px;">&nbsp;</td></tr>
						<tr>
							<td colspan="2" align="center" style="text-align:center;">
							</td>
						</tr>
					</table>
					
					<?php $regForm->placeSubmit()?>
					<?php $regForm->endForm(); ?>


				<?php } ?>
			</div>
			<?php }else{ ?>
				<p>Вы уже зарегистрированы!</p>
				<meta http-equiv="Refresh" content="0;url='/'">
			<?php } ?>
		</div>
		
	</div>
</div>


