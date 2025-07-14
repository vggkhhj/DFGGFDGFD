	<div class="row">
		<div class='col-md-10 col-md-offset-1 dark_fon' align=left>

			<header class="post-header clearfix">
				<div class="post-header-container page-header-container">
					<h1 class="post-title"><?php echo stripslashes($pageData['title'])?></h1>
				</div>
			</header>
			<?php if(!empty($pageData)){

				echo stripslashes($pageData['content']);

			}?>

	</div>
