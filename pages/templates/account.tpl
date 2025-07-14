<div class="col-md-6 dark_fon">
	<div class="box">
		<!--
			<div class="box-title">
				<h3><i class="fa fa-user"></i>Ваши данные</h3>
			</div> -->
		<br/>
		<div align=center>


			<table>
				<tr>
					<td>
						<div style='border-radius: 50%;'>
							<img src='<?php echo $user['vk_photo_100']?>' style='border-radius: 50%;' width=70/>
						</div>
					</td>
					<td>
						<div style='padding-left: 20px; font-size: 16px;'>
							Вы вошли как: <br/>
							<span style='font-size: 24px;'><?php echo $user['user_who'].' '.$user['vk_lname']?></span>
						</div>
					</td>
				</tr>
			</table>

			<br/>
	        <div><a href='/account/private'><button class="btn btn-primary" style='width: 70%'><i class="fa fa-shield"></i> Настройки приватности (В разработке)</button></a></div>
	        <br/>
	        <div><a href='/account/logs'><button class="btn btn-primary" style='width: 70%'><i class="fa fa-history"></i> История входов</button></a></div>
	        <br/>
	        <div><a href='/account/purses'><button class="btn btn-primary" style='width: 70%'><i class="fa fa-cog"></i> Привязать кошельки</button></a></div>

			<br/>
			<br/>
			<a href='/account/exit/'><button class="btn btn-inverse"><i class="fa fa-times-rectangle-o"></i> Выход</button></a>

			<br/>
			<br/>

			<div class='acc_string'>Разместите свою реф-ссылку в соц. сети:</div>
			<div class="share42init" data-url='<?php echo HREF_DOMAIN?>?i=<?php echo $user['id']?>' data-title='Fast-Win - Быстрые лотереи!' data-description='Проверьте свою удачу!' data-image='<?php echo HREF_DOMAIN?>img/vk.jpg'></div>
			<script type="text/javascript" src="/js/share42.js"></script>


			<br/>
			<br/>

			<div class='acc_string'>Вы выплатили: <?php echo (float)$sumpay?> руб. </div>

			<div class='acc_string'>Вы зарегистрированы: <span class=orange_text><?php echo date('d.m.Y',strtotime($user['date_created']));?></span></div>
			<div class='acc_string'> Ваш ID: <span class=orange_text><?php echo $user['id'];?></span> </div>

			<br/>
		</div>
	</div>
</div>

<div class="col-md-3 col-md-offset-0 " >


	<div  align=center class='dark_fon' style='padding: 1px;'>
		<h2><i class="fa fa-money"></i> Ваш баланс:</h2>


		<h1><?php echo $user['balance'];?> руб. </h1>
		<a href='/account/history/'>История операций</a>
		<br/>
		<br/>

		<a href='/account/insert_fk'><button class="btn btn-magenta" style='width: 95%'><i class="fa fa-long-arrow-right"></i> Пополнить баланс</button></a>
		<br/>
		<br/>
		<a href='/account/payment'><button class="btn btn-magenta" style='width: 95%'><i class="fa fa-long-arrow-left"></i> Заказать выплату</button></a>
		<br/>
		<br/>
		<a href='/account/send_money'><button class="btn btn-magenta" style='width: 95%'><i class="fa fa-user"></i> Перевести другому игроку</button></a>

		<br/>
		<br/>
	</div>

</div>


<div class="col-md-3">

	<div  align=center class='dark_fon' style='padding: 1px;'>

		<h3><i class="fa fa-users"></i> Реф. программа</h3>

		<div class="box-content" align=center>
			<BR />
			<b>Приглашая друзей, вы получаете до 5% от каждой их ставки навсегда! </b>
			<BR />	<BR />
			<a href='/account/referals/'><button class="btn btn-success">Подробнее >> </button></a>

			<BR />	<BR />

			<div class='acc_string'>Рефералов: <?php echo $rcnt['c'];?> чел.
				<div style='font-size: 14px;'>* Обновляется при входе в аккаунт.</div>
			</div>
			<BR />
			<div class='acc_string'>Получено от рефералов: 	<BR />
				<h2> <?php echo (float)$rsum ?> руб.</h2>
			</div>


		</div>

	</div>

</div>

<br/>
<br/>
<br/>

<div style='clear:both'></div>

<br/>
<br/>
<br/>

