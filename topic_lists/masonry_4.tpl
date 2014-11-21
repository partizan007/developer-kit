{if Router::GetAction() == 'feed'}
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
{elseif !$noSidebar}
	<div id="topic-thumbs" class="row">
		<div class="grid-sizer col-sm-6"></div>
		
		{foreach from=$aTopics item=oTopic name=foo}
			<article class="col-sm-6 topic topic-thumbnail masonry-item topic-type-{$oTopic->getType()}">
				{include file='topic_views/topic_thumbnail.tpl'}
			</article>
		{/foreach}
		
		<div id="loading-indicator" class="col-xs-12">
			<img src="{cfg name="path.static.skin"}/images/loader-circle.gif" />
		</div>
	</div>
{else}
	<div id="topic-thumbs" class="row">
		<div class="grid-sizer col-sm-6 col-md-4 col-lg-3"></div>
		
		{foreach from=$aTopics item=oTopic name=foo}
			<article class="col-sm-6 col-md-4 col-lg-3 topic topic-thumbnail topic-thumbnail-sm masonry-item topic-type-{$oTopic->getType()}">
				{include file='topic_views/topic_thumbnail_sm.tpl'}
			</article>
		{/foreach}
		
		<div id="loading-indicator" class="col-xs-12">
			<img src="{cfg name="path.static.skin"}/images/loader-circle.gif" />
		</div>
	</div>
{/if}
