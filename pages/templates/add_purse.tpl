<div class="row">
	<div class='col-md-10 col-md-offset-1 dark_fon' align=center>
		<br/>
		<!--
					<header class="post-header clearfix">
						<div class="post-header-container page-header-container">
							<h1 class="post-title">Настройки</h1>
						</div>
					</header>
		<br/>


		<div class="settings_links">
		<center>
			<a href="/account/config"  >Смена пароля</a> ||
			<a href="/account/config/security"  >Безопасность</a> ||
			<a href="/account/config/purses" class=active >Ваши кошельки</a> ||
			<a href="/account/config/logs"  >История входов</a>
		</center>
		<BR />
		</div>
		 -->



		<div align=center>
			<center><h3>Платежная система <?php echo $ps['title']?></h3></center>
			<BR />
			<?php if(!empty($purse)){?>
				<center><font color="green"><h3>Кошелек <?php echo $purse;?> закреплен за вашим аккаунтом.</h3></font></center>
			<?php }?>
			<?php if(!empty($msg)){?>
				<center><font color="<?php echo $color;?>"><h3><?php echo $msg;?></h3></font></center>
				<br>
			<?php }?>
			<form action="<?php href('account',array('page'=>'purses','item'=>'add_purse'))?>" method="POST">
				<input type="hidden" name="psid" value="<?php echo $ps['id']?>">
				<table cellpadding='3' cellspacing='0' border='0' bordercolor='#336633' align='center' width="350" class=loto_table_no_hover>
					<tr bgcolor="#efefef">
						<td style="border: 1px dashed #db8;" align="center" colspan="3" class="m-tb"><b>Новый кошелек</b></td>
					</tr>

					<tr>
						<td style="border: 1px dashed #db8;" align="center"><img src="/img/ps_logo/<?php echo $ps['alias']?>.png" width="22" /></td>
						<td style="border: 1px dashed #db8;" >&nbsp;<b>Кошелек:</b></td>
						<td style="border: 1px dashed #db8;" align="center" width="100"><input type="text" name = "purse" value="" /></td>
					</tr>

					<tr>
						<td style="border: 1px dashed #db8;" colspan="3">&nbsp;&nbsp;Пример кошелька: <?php echo $ps['example']?></td>
					</tr>

					<tr>
						<td style="border: 1px dashed #db8;" align="center" colspan="3">
							<input type="submit" value="Добавить" class="btn btn-primary" /></td>
					</tr>

				</table>

				<BR />
				<center><a href="<?php href('account',array('page'=>'purses'))?>">Вернуться к списку кошельков</a></center>
				<BR />

		</div>