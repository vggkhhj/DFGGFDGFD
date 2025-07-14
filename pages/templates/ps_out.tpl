<div class="row">
	<div class='col-md-10 col-md-offset-1 dark_fon' align=center>



		<header class="post-header clearfix">
			<div class="post-header-container page-header-container">
				<h1 class="post-title">Выплата на <?php echo $ps['title']?></h1>
			</div>
		</header>

		<div class="silver-bk" align=center>
			<div class="clr"></div>


			<BR />
			<center>
				<img src="/img/ps_logo/<?php echo $ps['alias']?>_logo.png" border="0" style="border: 1px solid #336699;" class='white_fon'/>
			</center>
			<BR />


			<?php echo $ps['content']?>


			<?php if(empty($purses)){?>
				<table cellpadding='3' cellspacing='0' border='0' bordercolor='#336633' align='center' width="95%" class=loto_table_no_hover>
					<tr bgcolor="#e5e5e5">
						<td style="border: 1px dashed #db8; padding: 5px;" class="m-tb"><b>Системное сообщение</b></td>
					</tr>
					<tr>
						<td style="border: 1px dashed #db8; padding:7px;" >
							<b><font color = "red">Настройки безопасности!</font></b><BR />
							Рекомендуем Вам указать свой кошелек, для повышения Вашей безопасности и сохранности средств аккаунта. <BR />
							В дальнейшем все выплаты будут возможны только на указанный ранее кошелек.
							<BR /><BR />
							Укажите свой кошелек в разделе <a href="/account/purses/">Ваши кошельки</a>
						</td>

					</tr>
				</table>
			<?php }else{?>
			<center><h3>Заказ выплаты:</h3></center><BR />
				<?php if(!empty($msg)){?>
					<center><font color="<?php echo $color;?>"><h3><?php echo $msg;?></h3></font></center>
					<br>
				<?php }?>
			<form action="" method="post">
				<table width="500px" border="0" align="center">
					<tr>
						<td>Выберите кошелек для выплаты: </td>
						<td>
							<select name="purse">
								<?php foreach($purses as $purse){?>
								<option value='<?php echo $purse['purse'];?>'><?php echo $purse['purse'];?></option>
								<?php }?>
							</select>
						</td>
					</tr>

					<tr>
						<td>Сумма:
							<?php if(!empty($ps['min'])){?>
							[Мин. <span id="res_min"><?php echo $ps['min']?> руб.</span>]
							<?php }?>
							<font color="#000;">:</font> </td>
						<td><input type="text" name="sum" id="sum" value="" size="15"  /></td>
					</tr>

					<tr>
						<td colspan="2" align="center">
							<input type="hidden" name="control_payment" value="b1855b4c8ea3f05d97da06f53a3ce019"/>
							<input type="submit" name="swap" value="Заказать выплату" style=" margin-top:10px;" class="btn btn-primary" /></td>
					</tr>
				</table>
			</form>
			<?php }?>
			<BR />
			<h3>Ваши последние 20 выплат</h3>

			<table cellpadding='3' cellspacing='0' border='0' bordercolor='#336633' align='center' width="99%" class='loto_table' >

				<tr>
					<td align="center" class="m-tb">Сумма</td>
					<td align="center" class="m-tb">Кошелек</td>
					<td align="center" class="m-tb">Дата</td>
					<td align="center" class="m-tb">Статус</td>
				</tr>
				<?php if(!empty($outs))foreach($outs as $item){?>
					<tr>
						<td  align="center">
							<?php echo $item['sum'];?>
						</td>
						<td  align="center">
							<?php echo $item['purse'];?>
						</td>
						<td align="center" width="100"><?php echo date('d.m в H:i',strtotime($item['idate']));?></td>
						<td  align="center">
							<?php echo $item['status'];?>
						</td>
					</tr>
				<?php }else{?>
				<tr><td align="center" colspan="4">Нет записей</td></tr>
				<?php }?>

			</table>
			<br/>
			<br/>
			<div class="clr"></div>
		</div></div></div>