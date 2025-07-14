<div class="row">
	<div class='col-md-10 col-md-offset-1 dark_fon' align=center>

		<header class="post-header clearfix">
			<div class="post-header-container page-header-container">
				<h1 class="post-title">Раздаем деньги за друзей!</h1>
			</div>
		</header>





		<div align=center>


За каждого человека который пришел по вашей ссылке, Вы будете получать проценты от каждой его ставки,
а также от всех ставок его рефералами вплоть до 3-го уровня (Глубины). Доход ни чем не ограничен. Даже несколько приглашенных могут 
принести вам ощутимые деньги. <br /><br />
Вы получите <b>5%</b> от ставок рефералов <b>1</b>-го уровня<span class='orange_text'>*</span>; <BR />
Вы получите <b>2%</b> от ставок рефералов <b>2</b>-го уровня<span class='orange_text'>*</span>; <BR />
Вы получите <b>1%</b> от ставок рефералов <b>3</b>-го уровня<span class='orange_text'>*</span>; <BR />
<span class='orange_text'>* В том случае если со ставки берется комиссия.</span>
 <BR />
 
<div style='width:100%; border-bottom: 1px solid #fff; margin-top: 20px'></div>

<div class='col-md-6' align=center>

	<center><h3><a href="/account/ref_history">Ссылки и баннеры для привлечения рефералов</a></h3></center>

	<div class='acc_string'>Ваша уникальная ссылка для приглашения друзей (рефералов):</div>
	
				
			<img src="/img/piar-link.png" style="vertical-align:-2px; margin-right:5px;" /><font color="#e51400;" size=4><b><?php echo HREF_DOMAIN?>?i=<?php echo $uid?></b></font>
			<br/><br/>
			
	<div class='acc_string'>Разместите свою реф-ссылку в соц. сети:</div>
	<div class="share42init" data-url='<?php echo HREF_DOMAIN?>?i=<?php echo $user['id']?>' data-title='Fast Win - Быстрые лотереи! 2 рубля за регистрацию!' data-description='2 рубля в подарок!' data-image='<?php echo HREF_DOMAIN?>img/vk.jpg'></div>
	<script type="text/javascript" src="/js/share42.js"></script>
				
</div>

<div class='col-md-5 col-md-offset-1' align=center>
	<span style='font-size:16px'>Если вы не знакомы с понятиями "Реферал" и "Партнерская программа", посмотрите это видео:</span>
	<br/>	<br/>
	<iframe width="100%" height="250px" src="https://www.youtube.com/embed/HhjYredHIzE?rel=0" frameborder="0" allowfullscreen></iframe>
</div>



<BR />
		<BR />
		<p><center><b>Ваши рефералы по уровням:</b></center></p>
		<table cellpadding='3' cellspacing='0' border='0' bordercolor='#336633' align='center' width="95%" class='loto_table'>
			<tr bgcolor="#efefef">
				<td style="border: 1px dashed #db8;" width="19%" align="center" class="m-tb"><b>1 Ур.</b></td>
				<td style="border: 1px dashed #db8;" width="19%" align="center" class="m-tb"><b>2 Ур.</b></td>
				<td style="border: 1px dashed #db8;" width="19%" align="center" class="m-tb"><b>3 Ур.</b></td>
				<!-- <td style="border: 1px dashed #db8;" width="19%" align="center" class="m-tb"><b>&nbsp;Excel&nbsp;</b></td>
				<td style="border: 1px dashed #db8;" width="19%" align="center" class="m-tb"><b>&nbsp;HTML&nbsp;</b></td> -->
			</tr>
			<tr>
				<td style="border: 1px dashed #db8;" align="center"><a href="/account/referals/" style="text-decoration:none"><?php echo $rcnt['c1'];?> чел.</a></td>
				<td style="border: 1px dashed #db8;" align="center"><a href="/account/referals/level_2/" style="text-decoration:none"><?php echo $rcnt['c2'];?> чел.</a></td>
				<td style="border: 1px dashed #db8;" align="center"><a href="/account/referals/level_3/" style="text-decoration:none"><?php echo $rcnt['c3'];?> чел.</a></td>
				<!--
				<td style="border: 1px dashed #db8;" align="center">
				<a href="/other/referals/csv/level_1_15dad21691d8159d3755d4be369a8adc" style="text-decoration:none;"><img src="/img/exel_ico.png" border="0"/></a></td>
				<td style="border: 1px dashed #db8;" align="center">
				<a href="/other/referals/html/level_1_15dad21691d8159d3755d4be369a8adc" style="text-decoration:none;"><img src="/img/html_ico.png" border="0"/></a></td>
				-->
			</tr>

		</table>
		<BR />
		<!--<center><b><font color = "green"><a href="/report/ref_<?php /*echo $level;*/?>/" target="_BLANK" style="">Подробная статистика по рефералам <?php /*echo $level;*/?>-го уровня</a></font></b></center>-->
		<BR />

		<center>
			<form action = "" method="POST">
				<b>Сортировать рефералов: </b>
				<select name="sort" onchange="this.form.submit ()">
					<option value="1" selected="selected" >По ID</option>
					<option value="2"  >По доходу</option>
					<option value="3"  >По кол-ву рефералов</option>
					<option value="4"  >По последней активности</option>
					<option value="5"  >По Дате регистрации</option>

				</select>
			</form>



		</center>


		<p><center><b>Ваши рефералы <?php echo $level;?>-го уровня:</b> <BR /></center></p>
		<?php if(!empty($refinfo)){?>
		<table cellpadding='3' cellspacing='0' border='0' class=loto_table align='center' width="99%">
			<tr bgcolor="#efefef">
				<td style="border: 1px dashed #db8;" align="center" class="m-tb">ID</td>
				<td style="border: 1px dashed #db8;" align="center" class="m-tb">Рефералов</td>
				<td style="border: 1px dashed #db8;" align="center" class="m-tb">Отчисления</td>
				<td style="border: 1px dashed #db8;" align="center" class="m-tb">Зарегистрирован</td>
				<td style="border: 1px dashed #db8;" align="center" class="m-tb">Последний вход</td>
			</tr>
			<?php foreach($refinfo as $ref){?>
			<tr class="htt">
				<td style="border: 1px dashed #db8;" align="center"><?php echo $ref['id'];?></td>
				<td style="border: 1px dashed #db8;" align="center"><?php echo $ref['refs'];?></td>
				<td style="border: 1px dashed #db8;" align="center">
					<span class='orange_text'><b><?php echo (float)$ref['sums'];?> руб.</b></span>
				</td>
				<td style="border: 1px dashed #db8;" align="center"><?php echo date('d.m.Y H:i',strtotime($ref['rdate']));?></td>
				<td style="border: 1px dashed #db8;" align="center">
					<?php echo date('d.m.Y H:i',strtotime($ref['ldate']));?></td>
			</tr>
			<?php }?>
		</table>
		<?php }else{?>
		<center><b><font color = 'red'>У вас нет рефералов <?php echo $level;?>-го уровня</font></b></center>
		<BR />
		<?php }?>




		<BR />


		<BR />


	</div>
</div>
