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



		<center><h3>Привязка кошельков к аккаунту</h3></center><BR />
		<div align=center>

			<form action="<?php href('account',array('page'=>'purses','item'=>'add_purse'))?>" method="POST">
				<table cellpadding='3' cellspacing='0' border='0' bordercolor='#336633' align='center' width="390" class='loto_table no_hover'>
					<tr bgcolor="#efefef">
						<td style="border: 1px dashed #db8;" align="center" colspan="2" class="m-tb">Добавление нового кошелька</td>
					</tr>
					<tr>
						<td style="border: 1px dashed #db8;" align="left"> &nbsp;&nbsp;<b>Платежная система</b></td>
						<td style="border: 1px dashed #db8;" align="center">
							<select name = "psid">
								<?php foreach($pss as $s){?>
								<option value = "<?php echo $s['id'];?>"><?php echo $s['title'];?></option>
								<?php }?>

							</select>
						</td>
					</tr>
					<tr>
						<td style="border: 1px dashed #db8;" align="center" colspan="2">
							<input type="submit" value="Добавить кошелек" class='btn btn-magenta' /></td>
					</tr>
				</table>
			</form>
			<BR />
			- Вы можете добавить до 3х кошельков каждой из доступных платежных систем. <BR />

			<BR />

			<center><h3>Список Ваших кошельков</h3></center>
			<BR />
			<table cellpadding='3' cellspacing='0' border='0' bordercolor='#336633' align='center' width="99%" class=loto_table>
				<tr bgcolor="#efefef">
					<td style="border: 1px dashed #db8;" align="center" width="30" class="m-tb">#</td>
					<td style="border: 1px dashed #db8;" align="center" width="200" class="m-tb">Платежная система</td>
					<td style="border: 1px dashed #db8;" align="center" width="50" class="m-tb">Кошелек</td>
					<td style="border: 1px dashed #db8;" align="center" width="50" class="m-tb">Добавлен</td>
					<td style="border: 1px dashed #db8;" align="center" width="40" class="m-tb">Удалить</td>	</tr>
				<?php if(empty($purses)){?>
				<tr><td style="border: 1px dashed #db8;" align="center" colspan="5">Нет прикрепленных кошельков</td></tr>
				<?php }else foreach($purses as $purse){?>
					<tr class="htt">
						<td style="border: 1px dashed #db8;" align="center"><img src="/img/ps_logo/<?php echo $purse['alias'];?>.png" width="24" border="0"></td>
						<td style="border: 1px dashed #db8;" align="center"><?php echo $purse['title'];?></td>
						<td style="border: 1px dashed #db8;" align="center"><?php echo $purse['purse'];?></td>
						<td style="border: 1px dashed #db8;" align="center"><?php echo date('d.m.Y в H:i',strtotime($purse['add_date']));?></td>
						<td style="border: 1px dashed #db8;" align="center">

							<form action="" method="POST">
								<input type="hidden" name="delpurse" value="<?php echo $purse['id'];?>">
								<input type="submit" value="Удалить" class="btn btn-primary" onclick="return confirm(&quot;Удалить кошелек?&quot;)">
							</form>

						</td>
					</tr>
				<?php }?>
			</table>

			<BR />
		</div>

	</div>
</div>