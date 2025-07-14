<div class="row">
<div class='col-md-10 col-md-offset-1 dark_fon' align=left>

<header class="post-header clearfix">
	<div class="post-header-container page-header-container">
		<h1 class="post-title">Ежедневный бонус</h1>
	</div>
</header>
<center><div id="linkslot_4334"></div><script src="https://www.linkslot.su/bancode.php?id=4334" async></script></center>
<div class="silver-bk" align=center>
<BR />

Бонус выдается 1 раз в 24 часа. Для получения бонуса нужно состоять в <a href='<?php echo $info['vk']?>' target='_blank'>нашей группе</a>.<BR />
<BR />
Сумма бонуса генерируется случайно, минимум от<b>1 копейки</b>, максимум до <b>1 рубля</b>
<BR />
<center><div class='faq_q'>Ваш индивидуальный процент к бонусу: <b>0%</b></div></center>
<BR /

<BR />
<?php if(!empty($need_group)){?>
	<div align=center>
		<br/>
		<center><h1><p style="color:#DC143C">Бонус не получен!</p></center>
		<h3><b class=orange_text>Для получения бонуса вступите в <a href='<?php echo $info['vk']?>' target='_blank'>нашу группу</a></b></h3>
		<br/>
	</div>
<?php }?>
<?php if(!empty($new_bonus)){?>
	<div align=center>
		<br/>
		<h3><b class=orange_text>Вы получили бонус <?php echo $new_bonus?> коп.</b></h3>
		<br/>
	</div>
<?php } else if(empty($last_time)){?>


<form action="" method="post">
	<div align=center>
		<input  type="submit" name="bonus" value="ПОЛУЧИТЬ БОНУС" style=" margin-top:20px;" class='btn btn-success'>
	</div>
</form>
<?php } else{?>
	<script>
		jQuery(function() {
			function time() {
				$('.lot_timertimer').each(function() {
					l_t = parseInt($(this).attr('last_time'));
					//if (l_t==0) return;
					today = l_t;
					tsec=today%60; today=Math.floor(today/60); if(tsec<10)tsec='0'+tsec;
					tmin=today%60; today=Math.floor(today/60); if(tmin<10)tmin='0'+tmin;
					thour=today%24;
					today=Math.floor(today/24);
					if(thour<10) thour='0'+thour;
					if (thour==0) thour = '00';
					timestr= thour+' ч. '+tmin+' мин. '+tsec+' сек.';
					if (today>0) timestr= today+' д. ' + timestr;

					$(this).html(timestr);

					l_t--;
					$(this).attr('last_time', l_t);
					if (l_t<=0) $(this).html('-------');
				});

			}
			time() ;
			setInterval(time,1000);
		})
	</script>
	<div align=center>
		<br/>
		<h3><b class=orange_text>Вы уже получали бонус за последние 24 часа</b></h3>
		<h2 class=orange_text>До следующего бонуса осталось:</h2>
		<br/>
		<div style='font-size: 28px; font-weight: bold;'>
			<div class='lot_timertimer' last_time='<?php echo $last_time?>'></div>
		</div>
	</div>
<?php }?>
<br/>





<table cellpadding='3' cellspacing='0' border='0' class=loto_table align='center' width="99%">
<tr>
	<td colspan="5" align="center"><h4>Последние 100 бонусов</h4></td>
</tr>
<tr>
	<td style="border: 1px dashed #db8;" align="center" class="m-tb">ID</td>
	<td style="border: 1px dashed #db8;" align="center" class="m-tb">Пользователь</td>
	<td style="border: 1px dashed #db8;" align="center" class="m-tb">Сумма</td>
	<td style="border: 1px dashed #db8;" align="center" class="m-tb">Дата</td>

</tr>
<?php foreach($bonuses as $b){?>
<tr class="htt">
	<td style="border: 1px dashed #db8;" align="center" ><?php echo $b['uid']?></td>
	<td style="border: 1px dashed #db8;" align="center" ><?php echo $b['vk_lname']?> <?php echo $b['user_who']?></td>
	<td style="border: 1px dashed #db8;" align="center" >
		<b STYLE='COLOR:#0ecc29'><?php echo (float)$b['sum']*100?> коп.</b>
	</td>
	<td style="border: 1px dashed #db8;" align="center" ><?php echo date('d.m в H:i',strtotime($b['odate']));?></td>
</tr>
<?php }?>

</table>
</div>
