{if $bBlogsTopicList or $sAction=='profile' or Router::GetAction() == 'feed'}
	<div id="topic-thumbs" class="row">
		{foreach from=$aTopics item=oTopic name=foo}
			<article class="col-sm-6 topic topic-thumbnail topic-type-{$oTopic->getType()}">
				{include file='topic_views/topic_thumbnail.tpl'}
			</article>
			
			{if $smarty.foreach.foo.iteration % 2 == 0}
				<div class="clearfix"></div>
			{/if}
		{/foreach}
	</div>
{else}
	<div id="topic-thumbs" class="row">
		{foreach from=$aTopics item=oTopic name=foo}
			{if $smarty.foreach.foo.iteration % 10 == 1}
				<article class="col-md-8 topic topic-thumbnail topic-thumbnail-lg topic-type-{$oTopic->getType()}">
					{include file='topic_views/topic_thumbnail_lg.tpl'}
				</article>
			{elseif $smarty.foreach.foo.iteration % 10 == 7}
				<article class="col-md-8 topic topic-thumbnail topic-thumbnail-lg topic-type-{$oTopic->getType()}">
					{include file='topic_views/topic_thumbnail_lg.tpl'}
				</article>
			{else}
				<article class="col-md-4 topic topic-thumbnail topic-thumbnail-sm topic-type-{$oTopic->getType()}">
					{include file='topic_views/topic_thumbnail_sm.tpl'}
				</article>
			{/if}
			
			{if $smarty.foreach.foo.iteration % 5 == 0 or $smarty.foreach.foo.iteration % 5 == 2}
				<div class="clearfix"></div>
			{/if}
		{/foreach}
	</div>
{/if}
