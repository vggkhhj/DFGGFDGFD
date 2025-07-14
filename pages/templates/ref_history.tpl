<div class="row">
	<div class='col-md-10 col-md-offset-1 dark_fon' align=left>


		<header class="post-header clearfix">
			<div class="post-header-container page-header-container">
				<h1 class="post-title">Рекламные материалы</h1>
			</div>
		</header>

		<div align=center> <BR />
			<center><a href="/account/referals">Перейти к списку рефералов</a></center>
			<BR />
			
			
	<div class='acc_string'>Разместите свою реф-ссылку в соц. сети:</div>
	<div class="share42init" data-url='<?php echo HREF_DOMAIN?>?i=<?php echo $user['id']?>' data-title='Fast Win - Быстрые лотереи! 2 рубля за регистрацию!' data-description='2 рубля в подарок!' data-image='<?php echo HREF_DOMAIN?>img/vk.jpg'></div>
	<script type="text/javascript" src="/js/share42.js"></script>
				
</div>

            <div align=center>	


           	
Выберите размер баннера. Чтобы получить код, нажмите на картинку.
<br/><br/>


<div class="tabbable">
<ul id="myTab1" class="nav nav-tabs">
<li class="active"><a href="#b200_200" data-toggle="tab"><i class="fa fa-file-image-o"></i> 200*200</a></li>
<li><a href="#b200_300" data-toggle="tab"><i class="fa fa-file-image-o"></i> 200*300</a></li>
<li><a href="#b240_400" data-toggle="tab"><i class="fa fa-file-image-o"></i> 240*400</a></li>
<li><a href="#b468_60" data-toggle="tab"><i class="fa fa-file-image-o"></i> 468*60</a></li>
<li><a href="#b728_90" data-toggle="tab"><i class="fa fa-file-image-o"></i> 728*90</a></li>
</ul>

	<div id="myTabContent1" class="tab-content">
	<div class="tab-pane fade in active" id="b200_200">
			<img src="/img/banners/fast-win-200x200-01.gif" width="200"> &nbsp;&nbsp;&nbsp;&nbsp;
			<img src="/img/banners/fast-win-200x200-02.gif" width="200"> &nbsp;&nbsp;&nbsp;&nbsp;
			<img src="/img/banners/fast-win-200x200-03.jpg" width="200"> &nbsp;&nbsp;&nbsp;&nbsp;
			<img src="/img/banners/fast-win-200x200-04.jpg" width="200"> &nbsp;&nbsp;&nbsp;&nbsp;
	</div>
	<div class="tab-pane fade" id="b200_300">
			<img src="/img/banners/fast-win-200x300-01.gif" width="200"> &nbsp;&nbsp;&nbsp;&nbsp;
			<img src="/img/banners/fast-win-200x300-02.gif" width="200"> &nbsp;&nbsp;&nbsp;&nbsp;
			<img src="/img/banners/fast-win-200x300-03.jpg" width="200"> &nbsp;&nbsp;&nbsp;&nbsp;
			<img src="/img/banners/fast-win-200x300-04.jpg" width="200"> &nbsp;&nbsp;&nbsp;&nbsp;
	</div>

	<div class="tab-pane fade" id="b240_400">
			<img src="/img/banners/fast-win-240x400-01.gif" width="200"> &nbsp;&nbsp;&nbsp;&nbsp;
			<img src="/img/banners/fast-win-240x400-02.gif" width="200"> &nbsp;&nbsp;&nbsp;&nbsp;
			<img src="/img/banners/fast-win-240x400-03.jpg" width="200"> &nbsp;&nbsp;&nbsp;&nbsp;
			<img src="/img/banners/fast-win-240x400-04.jpg" width="200"> &nbsp;&nbsp;&nbsp;&nbsp;

	</div>

	<div class="tab-pane fade" id="b468_60">
			<img src="/img/banners/fast-win-468x60-01.gif" width="468"> &nbsp;&nbsp;&nbsp;&nbsp;
			<img src="/img/banners/fast-win-468x60-02.gif" width="468"> &nbsp;&nbsp;&nbsp;&nbsp;
			<img src="/img/banners/fast-win-468x60-03.jpg" width="468"> &nbsp;&nbsp;&nbsp;&nbsp;
			<img src="/img/banners/fast-win-468x60-04.jpg" width="468"> &nbsp;&nbsp;&nbsp;&nbsp;
	</div>
	<div class="tab-pane fade" id="b728_90">
			<img src="/img/banners/fast-win-728x90-01.gif" width="728"> <br/><br/>
			<img src="/img/banners/fast-win-728x90-02.gif" width="728"> <br/><br/>
			<img src="/img/banners/fast-win-728x90-03.jpg" width="728"> <br/><br/>
			<img src="/img/banners/fast-win-728x90-04.jpg" width="728"> <br/>

	</div>


	</div>
</div>


<div id='popup' style='display: none; position: fixed; width: 100%; height: 100%; z-index: 1000; top: 0px; left: 0px;'>
	<div style='background: #000000; opacity: 0.3;position: absolute; width: 100%; height: 100%; z-index: 100' class='close_popup'></div>
	<div style='background: #fff; color: #000; position: absolute; width:600px; height: 220px; z-index: 105; border-radius: 6px; left: 30%; top: 20%' align=center>
		<br/>
		<b>HTML код баннера:</b>
		<br/>
		<textarea style='width: 550px; word-wrap:break-word; background-color: white; border: solid 1px; height: 50px' id=banner_code></textarea>
			<br/>	<br/>
		<b>Адрес изображения:</b>
		<br/>
		<textarea style='width: 550px; word-wrap:break-word; background-color: white; border: solid 1px; height: 20px' id=img_url></textarea>
			<br/>	<br/>
		<input type="button" class="button login close_popup" data-effect="mfp-zoom-in" value="ЗАКРЫТЬ"/>
	</div>
</div>



<style>

.tab-content img {
	cursor: pointer;
}
<style>

.tab-content img {
	cursor: pointer;
}
</style>
	
<script>
(function($){				
    jQuery.fn.lightTabs = function(options){
        
        var createTabs = function(){
            tabs = this;
            i = 0;
            
            showPage = function(i){
				$(tabs).children("div").children("div").eq(i).css('display', 'block');
                $(tabs).children("div").children("div").hide();
                $(tabs).children("div").children("div").eq(i).show();
                $(tabs).children("ul").children("li").removeClass("active");
                $(tabs).children("ul").children("li").eq(i).addClass("active");
            }
            
            showPage(0);				
            
            $(tabs).children("ul").children("li").each(function(index, element){
                $(element).attr("data-page", i);
                i++;                        
            });
            
            $(tabs).children("ul").children("li").click(function(){
                showPage(parseInt($(this).attr("data-page")));
				changetree();
            });				
        };		
        return this.each(createTabs);
    };	
})(jQuery);
$(document).ready(function(){
    $(".tabs").lightTabs();
	
	$('.tab-content img').click(function() {
		t = $(this).attr('src');
		//$('#popup').css('display', 'block');
		//$('#popup').css('opacity', 'block');
		$('#popup').fadeIn(300);
		$('#banner_code').text('<a href="http://fast-win.top/" target=_blank><img src="http://fast-win.top'+t+'" alt="Быстрые лотереи FAST WIN"></a>');
		$('#img_url').text('http://fast-win.top'+t);
	});
	
	$('.close_popup').click(function() {
		$('#popup').fadeOut(300);
	});
	
});
</script>
	
	

</div>
<br/><br/>


</div>
</div>

