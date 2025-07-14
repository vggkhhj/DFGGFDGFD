<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<?php title()?>
	<?php keywords()?>
	<?php description()?>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="Shortcut Icon" href="<?php echo HREF_DOMAIN?>favicon.ico"/>
    <?php stylesheet('bootstrap.min.css')?>
    <?php stylesheet('font-awesome.min.css')?>

	<meta property="og:image" content="/img/vk.jpg" />

    <?php stylesheet('main.css')?>
    <?php stylesheet('main-responsive.css')?>
    <?php stylesheet('add_style.css')?>

    <?php javascript('jquery.min.js'); ?>
    <?php javascript('jquery-ui.js'); ?>
	
</head>
<body class='skin-black'>


<!-- BEGIN Navbar -->
<div id="navbar" class="navbar">
<button type="button" class="navbar-toggle navbar-btn collapsed" data-toggle="collapse" data-target="#sidebar">
<span class="fa fa-bars"></span>
</button>


<a class="navbar-brand" href="/" style='padding-top: 0px;'>
	<img src='/img/logo.jpg'/>
</a>



    <div class='hidden-xs' align=center>
        <?php foreach($rooms as $room){?>
        <a href='/?room=<?php echo $room['id']?>'>
            <div class='room_div<?php echo ($room['id']== $active_room['id'])?'  active_room':''?>' >
                <div><?php echo $room['title'];?></div>
                <?php if (empty($active_room)){?>
	                <div id='div_room_players_<?php echo $room['id']?>' class='rooms_small_text'>Ставки <br/> <?php echo $room['min_bet'].'-'.$room['max_bet'] ?> р.</div>
                <?php } else {?>
                    <div id='div_room_players_<?php echo $room['id']?>' class='rooms_small_text' style='display: none;'>Игроков: <span id='room_players_<?php echo $room['id']?>'></span> </div>
                    <div id='div_room_prize_<?php echo $room['id']?>' class='rooms_small_text' style='display: none;'>Приз: <span id='room_prize_<?php echo $room['id']?>'></span> </div>
                    <div id='div_room_wait_<?php echo $room['id']?>' style='display: none;'> <img src='img/wait.gif' style='width: 35px;'/> </div>
                <?php }?>
            </div>
        </a>
        <?php }?>
    </div>
    <div class='visible-xs' align=center>
        <div class=orange_text style='margin-top: 30px; font-size: 14px;'>Выберите комнату:</div>
	    <?php foreach($rooms as $room){?>
	        <a href='/?room=<?php echo $room['id']?>'>
	            <div class='room_div<?php echo ($room['id']== $active_room['id'])?'  active_room':''?>'>
	                <div>&nbsp;&nbsp;<?php echo $room['id']?>&nbsp;&nbsp;</div>
	            </div>
	        </a>
	    <?php }?>
    </div>


    <!-- END Navbar Buttons -->
</div>
<!-- END Navbar -->

<!-- BEGIN Container -->
<div class="container" id="main-container">

<?php printPageBlock('_sidebar'); ?>
	<div id="main-content">
<?php getPageContent()?>
<?php printPageBlock('_footer'); ?>