

<div class="row">
	<div class='col-md-10 col-md-offset-1 dark_fon' align=left>

		<header class="post-header clearfix">
			<div class="post-header-container page-header-container">
				<h1 class="post-title">История операций</h1>
			</div>
		</header>

		<div align=center>
			В данном разделе отображается Ваша история пополнений, выплат и ставок. <BR />
			
			<BR />



			<center>
				<h4><a href='/account/insert_fk/'>Пополнить баланс</a> &nbsp;&nbsp;&nbsp; <a href='/account/payment/'>Заказать выплату</a></h4>
				<BR />
				<b>История за последние 10 дней</b>
			</center>

			<BR />
			<table cellpadding='3' cellspacing='0' border='0'  align='center' width="99%" class='loto_table'>
				<tr>
					<td align="center" class="m-tb" width="100">ID</td>
					<td align="center" class="m-tb" width="100">Сумма</td>
					<td align="center" class="m-tb">Комментарий</td>
					<td align="center" class="m-tb" width="200">Дата</td>
				</tr>
			<?php if(!empty($history)) foreach($history as $item){?>
				<tr>
					<td  align="center">
						<?php echo $item['id'];?>		</td>
					<td  align="center">
						<span style='font-size: 17px'><font color="#04f90a"><b><?php echo ($item['to']==$user['id'])?'+':'-'?> <?php echo $item['sum'];?><b></font></span>
					</td>
					<td>

						Операция: <span class="orange_text"><b>
								<?php echo $item['title'];?>
							</b></span>

					</td>
					<td align="center" width="100"><?php echo date('d.m в H:i',strtotime($item['odate']));?></td>
				</tr>
				<?php }?>
			</table>
			<BR />
			<BR />
			<BR />

		</div>
	</div>