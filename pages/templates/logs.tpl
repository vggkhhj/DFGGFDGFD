<div class="row">
	<div class='col-md-10 col-md-offset-1 dark_fon' align=center>
		<!--br/>
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
			<a href="/account/config/purses"  >Ваши кошельки</a> ||
			<a href="/account/config/logs" class=active >История входов</a>
		</center>
		<BR />
		</div>
		 -->



		<center><h3>История входов в аккаунт за последние 10 дней</h3></center>
		<BR />
		<?php if(!empty($logs)){?>
		<table cellpadding='3' cellspacing='0' border='0' align='center' width="99%" class='loto_table'>
			<tr bgcolor="#efefef">
				<!--<td align="center" width="35" class="m-tb">#</td>-->
				<td align="center" width="35" class="m-tb">Код</td>
				<td align="center"  class="m-tb">Город</td>
				<td align="center"  class="m-tb">IP</td>
				<td align="center" class="m-tb">Дата</td>
			</tr>
			<?php foreach($logs as $log){?>
			<tr class="htt">
				<!--<td align="center"><img src="/img/flags/UA.png"> </td>-->
				<td align="center"><?php echo $log['code']?></td>
				<td align="center"><?php echo $log['city']?></td>
				<td align="center"><?php echo $log['ip']?></td>
				<td align="center"><?php echo date('d.m.Y H:m',strtotime($log['l_date']))?></td>
			</tr>
			<?php }?>
		</table>
		<?php }?>
		<br/>
		<br/-->



	</div>
</div>