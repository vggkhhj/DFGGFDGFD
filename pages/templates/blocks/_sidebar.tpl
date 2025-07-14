<!-- BEGIN Sidebar -->
<div id="sidebar" class="navbar-collapse collapse">
	<!-- BEGIN Navlist -->
	<ul class="nav nav-list">

	<?php if(empty($user)){?>
		<li>
			<div style='height: 45px; text-align: center'>
				<a href='<?php href('signin');?>'><button class="btn btn-Default btn-green" style='width:95%'><i class="fa fa-user-plus"></i> ВОЙТИ НА САЙТ</button></a>
			</div>
		</li>
		<?php }else {?>
		<li>
			<table>
				<tr>
					<td>
						<div style='border-radius: 50%;'>
							<img src='<?php echo $user['vk_photo_100']?>' style='border-radius: 50%;' width=70/>
						</div>
					</td>
					<td style='width: 100%'>
						<div style='color: white; padding-left: 10px; font-size: 14px; position: relative; width: 100%'>
							<div style='position: absolute; top: 0px; right: 10px;'>
								<a href="/account/exit/" title='Выход' style='font-size:15px; color: white'><i class="fa fa-times-rectangle-o"></i></a>
							</div>

							<?php echo $user['user_who']?>			<br/>
							<?php echo $user['vk_lname']?>
							<br/>
							<h3><a href='/account/history/' style='text-decoration:underline' class=orange_text><span class='user_balance'><?php echo number_format($user['balance'],2)?></span> р.</a></h3>
						</div>
					</td>
				</tr>
			</table>
			<br/>
		</li>
	<?php }?>


		<li style='width:100%'>
			<div align=center >
				<a href='/?room=1'><button class="btn btn-Default btn-green" style='width:95%'><i class="fa fa-gamepad"></i> Играть</button></a>
			</div>
		</li>

		<br/>

		<?php if(!empty($user)){?>
			<li>
				<a href="/account/"><i class="fa fa-briefcase"></i><span class='left_menu_item'>Личный кабинет</span></a>
			</li>

			<li class='left_menu_item'>
				<a href="/account/insert_fk"><i class="fa fa-arrow-circle-right"></i><span class='left_menu_item'>Пополнить баланс</span></a>
			</li>

			<li class='left_menu_item'>
				<a href="/account/payment/"><i class="fa fa-arrow-circle-down"></i><span>Заказать выплату</span></a>
			</li>
			
			<li class='left_menu_item'>
	            <a href="/account/referals"><i class="fa fa-money" style='color: #ffaf13'></i><span style='color: #ffaf13'>Заработать</span></a>
            </li>

			<li class='left_menu_item'>
				<a href="/account/bonus/"><i class="fa fa-gift"></i><span>Ежедневный бонус</span></a>
			</li>

		<?php }?>


		<li class='left_menu_item'>
			<a href="<?php href('faq');?>"><i class="fa fa-question-circle-o"></i><span>FAQ</span></a>
		</li>
		
		<li class='left_menu_item'>
	        <a href="https://vk.cc/8iIXWU" ><i class="fa fa-bookmark-o"></i><span>Новости</span></a>
        </li>	
		
		<li class='left_menu_item'>
	       <a href="https://vk.cc/8iIYJk"><i class="fa fa-trophy"></i><span>ТОП пользователей</span></a>
       </li>

       <li class='left_menu_item'> 
          <a href="https://vk.cc/8iIYQ6"><i class="fa fa-support"></i><span>Служба поддержки</span></a> 
       </li>

<!--
<li class='left_menu_item'>
	<a href="#" id='chat_button'><i class="fa fa-wechat"></i><span>Чат</span></a>
</li>
-->

<!-- <li><a href="/contacts"><i class="fa fa-envelope"></i><span>Контакты</span></a></li> -->

<li>
<br/>

<div style='height: 190px; text-align: center; color: #fff'>
Следите за новостями и получайте бонусы! 
<br style='clear:both;'/><a href='https://vk.com/fast_win_top' target='_blank'><button class="btn btn-Default" style='width:100%; background: #507299; color: #fff;  margin-top: 4px;'><i class="fa fa-vk"></i> МЫ ВКОНТАКТЕ</button></a>
<!--
<br style='clear:both'/><a href='https://www.facebook.com/fast-win.top' target='_blank'><button class="btn btn-Default" style='width:100%; background: #4267b2; color: #fff;margin-top: 4px;'><i class="fa fa-facebook-official"></i> МЫ В FACEBOOK</button></a>
-->
<br style='clear:both'/><a href='https://ok.ru/group/54322693275732' target='_blank'><button class="btn btn-Default" style='width:100%; background: #ee8208; color: #fff;margin-top: 4px; font-size: 13px;'><i class="fa fa-odnoklassniki"></i> МЫ В ОДНОКЛАССНИКАХ</button></a>
<br/>
<span style='font-size:11px'>При возникновении проблем с сайтом, используйте адрес:</span> <br/>
<b><u><a href='http://fast-win-info.tk/' target='_blank' style='color:#fff'>fast-win-info.tk</a></u></b>
<br>
<br>	  	 		   
           <div id="linkslot_4333"></div><script src="https://www.linkslot.su/bancode.php?id=4333" async></script>
		   <br>
		   <br>
		   <div id="linkslot_4338"></div><script src="https://www.linkslot.su/bancode.php?id=4338" async></script>
		   <br>
		</li>

	</ul>
	<!-- END Navlist -->

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
	<!--div id="sidebar-collapse" class="visible-lg">
	<i class="fa fa-angle-double-left"></i>
	</div-->
	 
	<div id="sidebar-collapse" style='padding-top: 50px'>
		<!--LiveInternet counter--><script type="text/javascript"><!--
			document.write("<a href='http://www.liveinternet.ru/click' "+
				"target=_blank><img src='//counter.yadro.ru/hit?t13.2;r"+
				escape(document.referrer)+((typeof(screen)=="undefined")?"":
				";s"+screen.width+"*"+screen.height+"*"+(screen.colorDepth?
					screen.colorDepth:screen.pixelDepth))+";u"+escape(document.URL)+
				";"+Math.random()+
				"' alt='' title='Страница сгенерирована за 0.00820 сек.' "+
				"border='0' width='88' height='31'><\/a>")
			//--></script><!--/LiveInternet-->
	</div>

</div>
<!-- END Sidebar -->