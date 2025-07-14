<div class="row">
	<div class='col-md-10 col-md-offset-1 dark_fon' align=center>

		<header class="post-header clearfix">
			<div class="post-header-container page-header-container">
				<h1 class="post-title">Пополнение баланса</h1>
			</div>
		</header>

		<div align=center>


			<div align=center>
				<br/>
				<div id="linkslot_4271"></div><script src="https://www.linkslot.su/bancode.php?id=4271" async></script>
				<br>

				

			</div>



			<style>
				.tbl_insert td {
					vertical-align: top;
					text-align: center;
					border: 1px solid #000;
				}
				.tbl_insert td.active {
					background: #fff;
				}
				.tbl_insert td:hover {
					/*background: #fff;*/
				}
				.tbl_insert a {
					color: #000;
					font-size: 19px;
				}
				.tbl_insert a:hover {
					color: #000;
					font-size: 19px;
				}

				.gal_img {
					position: absolute; top: 0px; left: 0px;
					width: 60px;
					opacity: 0;
				}
				.tbl_insert td.active .gal_img {
					opacity: 1;
				}

				.tbl_insert td:not(.active):hover .gal_img {
					opacity: 0.4;
				}
			</style>
			<table style='margin: 0px auto; width: 100%; background: #fff; max-width: 800px;' class='tbl_insert'>
				<tr>

					<td style='width: 45%; position: relative' class=active >
						<img src='/img/gal.png' class='gal_img'/>
						<a href="/account/insert_fk/" >Использовать FreeKassa
							<br/>
							<img src='/img/freekassa.jpg' style='width: 115px'/> </a>
					</td>
					<td class=dark_fon >&nbsp;</td>
					<td style='width: 45%; position: relative'  >
						<img src='/img/gal.png' class='gal_img'/>
						<a style='width:30%' href="/account/insert/"  >Использовать Payeer
							<br/>
							<img src='/img/payeer.jpg' style='width: 70px'/></a> <!-- <span style='color:#000; font-size: 22px;'>+10%!</span> -->
					</td>
				</tr>
			</table>


			<div>

				<div align=center>
					<br/>
					<img src='/img/payeer.jpg'/></div>



				<BR />

				<p>Зачисление средств на баланс производится в автоматическом режиме.</p>
				<p>Введите сумму в РУБЛЯХ, которую вы хотите пополнить на баланс.</p>
				<BR />



			<?php if(empty($pdata))  {?>
				<div id="error3"></div>

				<div align=center  >


					<form method="POST" action="" id="f_sum">
						<input type="hidden" name="m" value="49150">
						<span style='font-size: 20px; font-weight: bold;'>Введите сумму:</span>
						<br/>
						<br/>
						<input type="text" value="100" name="sum" size="7" style='text-align: center' id="psevdo" onchange="calculate(this.value)" onkeyup="calculate(this.value)">
						<br/>
						<br/>
						<center><input type="submit" id="submit" value="Пополнить баланс" class='btn btn-magenta' style='width: 200px; height: 40px;' /></center>
					</form>

				</div>
				<?php } else{?>
				<br>
				<center>
					<form method="GET" action="//payeer.com/api/merchant/m.php" target=_blank>
						<input type="hidden" name="m_shop" value="<?php echo $pdata['shop'];?>">
						<input type="hidden" name="m_orderid" value="<?php echo $pdata['orderid'];?>">
						<input type="hidden" name="m_amount" value="<?php echo $pdata['amount'];?>">
						<input type="hidden" name="m_curr" value="RUB">
						<input type="hidden" name="m_desc" value="<?php echo $pdata['desc'];?>">
						<input type="hidden" name="m_sign" value="<?php echo $pdata['sign'];?>">
						<center><input type="submit" name="m_process" value="НАЖМИТЕ ЭТУ КНОПКУ ДЛЯ ПРОДОЛЖЕНИЯ ОПЛАТЫ" class="btn btn-magenta btn-xlarge" /></center>
					</form>
				</center>
				<?php }?>

			</div>



			<BR />


		</div>

	</div>


</div>
