<div class="breadcrumbs">
<?php if(!empty($breadcrumbs)):?>
  <?php $i = 0?>
  <?php foreach($breadcrumbs as $p):?>
    <nobr>
    <?php if(is_array($p)):?>
		<span <?php echo $i==0?'':'itemprop="child"'; ?> itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
			<a href="<?php echo @$p['href']; ?>" itemprop="url"><span itemprop="title"><?php echo $p['title']; ?></span></a>
		</span>
    <?php else:?>
      <?php echo $p?>
    <?php endif?>
    </nobr>
    <?php echo ($i++ < count($breadcrumbs)-1 ? '::' : '')?>
  <?php endforeach?>
<?php endif?>
</div>