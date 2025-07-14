<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<?php title()?>
		<?php keywords()?>
		<?php description()?>
		<link rel="Shortcut Icon" href="<?php echo HREF_DOMAIN?>favicon.ico"/>
		<!--<link rel="icon" href="<?php echo HREF_DOMAIN?>favicon.ico" type="image/x-icon" />-->
		<!--meta http-equiv="Content-Type" content="text/html; charset=utf-8"/-->
		<!--meta http-equiv="Content-Type" content="text/html; language=ru"/-->
		<!--<meta name="RESOURCE-TYPE" content="DOCUMENT">-->
		<!--meta name="DISTRIBUTION" content="GLOBAL"/-->
		<!--meta name="COPYRIGHT" content="Copyright (c) 2008-2013 Online studio. www.0nl1ne.com"/-->
		<!--meta name="author" content="Online studio: www.0nl1ne.com"/-->
		<!--meta http-equiv="Content-Script-Type" content="text/javascript"/-->
		<meta name="ROBOTS" content="INDEX, FOLLOW"/>
		<meta name="REVISIT-AFTER" content="5 DAYS"/>
		<?php includeJavascripts()?>
		<?php stylesheet('styles.css')?>
		<?php javascript('jquery-1.7.1.min.js'); ?>
		
	</head>
	<body>
		<?php printPageBlock('_getgeolocation'); ?>
		
		
		<?php getPageContent()?>
		
		
		<?php //var_dump($_SESSION['geolocatoin']); ?>
		
		<?php printPageBlock('_demo_printsitepages'); ?>
	
		<?php printPageBlock('_footer'); ?>
		
	</body>
</html>