
<div class="row">
	<div class='col-md-10 col-md-offset-1 dark_fon' align=center>

		<header class="post-header clearfix">
			<div class="post-header-container page-header-container">
				<h1 class="post-title">Пополнение баланса</h1>
			</div>
		</header>

		<div align=center>


<div id="linkslot_4271"></div><script src="https://www.linkslot.su/bancode.php?id=4271" async></script>



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



			<div>





				<BR />

				<p>Зачисление средств на баланс производится в автоматическом режиме.</p>
				<p>Введите сумму в РУБЛЯХ, которую вы хотите пополнить на баланс.</p>
				<BR />
				<?php if(empty($fdata))  {?>
					<div id="error3"></div>

					<div align=center  >


						<form method="POST" action="" id="f_sum">
							<input type="hidden" name="m" value="49150">
							<span style='font-size: 20px; font-weight: bold;'>Введите сумму:</span>
							<br/>
							<br/>
							<input type="text" value="100" name="sum" size="7" style='text-align: center' id="psevdo" >
							<br/>
							<br/>
							<center><input type="submit" id="submit" value="Пополнить баланс" class='btn btn-magenta' style='width: 200px; height: 40px;' /></center>
						</form>
						
										<div align=center>
					<br/>
					<img src='/img/valuty.jpg'/></div>
						
						
					</div>
				<?php } else{?>
					<br>
					<center>
						<form method=GET action="http://www.free-kassa.ru/merchant/cash.php">
							<input type='hidden' name='m' value='<?php echo $fdata['shop'];?>'>
							<input type='hidden' name='oa' value='<?php echo $fdata['oa'];?>'>
							<input type='hidden' name='o' value='<?php echo $fdata['o'];?>'>
							<input type='hidden' name='s' value='<?php echo $fdata['s'];?>'>
							<!--<input type='hidden' name='i' value='1'>-->
							<input type="hidden" name="in_currency" id="in_currency" value="1">
							<input type='hidden' name='lang' value='ru'>
							<!--<input type='hidden' name='us_login' value=''>-->

							<center><input type="submit" name="m_process" value="НАЖМИТЕ ЭТУ КНОПКУ ДЛЯ ПРОДОЛЖЕНИЯ ОПЛАТЫ" class="btn btn-magenta btn-xlarge" /></center>
						</form>
					</center>
				<?php }?>

				<BR />

			</div>
		</div>
	</div>
</div>