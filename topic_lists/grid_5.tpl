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
			<article class="col-sm-4 topic topic-thumbnail topic-type-{$oTopic->getType()}">
				{include file='topic_views/topic_thumbnail_sm.tpl'}
			</article>
				
			{if $smarty.foreach.foo.iteration % 3 == 0}
				<div class="clearfix"></div>
			{/if}
		{/foreach}
	</div>
{/if}
