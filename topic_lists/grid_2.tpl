<div id="topic-thumbs" class="row">
	{foreach from=$aTopics item=oTopic name=foo}
		{if $smarty.foreach.foo.first}
			<article class="col-sm-12 topic topic-thumbnail topic-thumbnail-lg topic-type-{$oTopic->getType()}">
				{include file='topic_views/topic_thumbnail_lg.tpl'}
			</article>
			<div class="clearfix"></div>
		{else}
			<article class="col-sm-6 topic topic-thumbnail topic-type-{$oTopic->getType()}">
				{include file='topic_views/topic_thumbnail.tpl'}
			</article>
		{/if}
			
		{if $smarty.foreach.foo.iteration % 2 == 1}
			<div class="clearfix"></div>
		{/if}
	{/foreach}
</div>
