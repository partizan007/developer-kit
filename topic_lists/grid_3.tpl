<div id="topic-thumbs" class="row">
	{foreach from=$aTopics item=oTopic name=foo}
		{if $smarty.foreach.foo.first}
			<article class="col-sm-12 topic topic-thumbnail topic-thumbnail-lg topic-type-{$oTopic->getType()}">
				{include file='topic_views/topic_thumbnail_lg.tpl'}
			</article>
			<div class="clearfix"></div>
		{elseif $smarty.foreach.foo.iteration % 4 == 2}
			<article class="col-md-6 col-lg-8 topic topic-thumbnail topic-type-{$oTopic->getType()}">
				{include file='topic_views/topic_thumbnail.tpl'}
			</article>
		{elseif $smarty.foreach.foo.iteration % 4 == 1}
			<article class="col-md-6 col-lg-8 topic topic-thumbnail topic-type-{$oTopic->getType()}">
				{include file='topic_views/topic_thumbnail.tpl'}
			</article>
			<div class="clearfix"></div>
		{elseif $smarty.foreach.foo.iteration % 4 == 3}
			<article class="col-md-6 col-lg-4 topic topic-thumbnail topic-thumbnail-sm topic-type-{$oTopic->getType()}">
				{include file='topic_views/topic_thumbnail_sm.tpl'}
			</article>
			<div class="clearfix"></div>
		{elseif $smarty.foreach.foo.iteration % 4 == 0}
			<article class="col-md-6 col-lg-4 topic topic-thumbnail topic-thumbnail-sm topic-type-{$oTopic->getType()}">
				{include file='topic_views/topic_thumbnail_sm.tpl'}
			</article>
		{/if}
	{/foreach}
</div>
