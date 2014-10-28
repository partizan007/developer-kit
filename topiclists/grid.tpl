<div id="topic-thumbs" class="row">
	{foreach from=$aTopics item=oTopic name=foo}
		<article class="col-sm-6 topic topic-thumbnail topic-type-{$oTopic->getType()}">
			{include file='topic_thumbnail.tpl'}
		</article>
			
		{if $smarty.foreach.foo.iteration % 2 == 0}
			<div class="clearfix"></div>
		{/if}
	{/foreach}
</div>
