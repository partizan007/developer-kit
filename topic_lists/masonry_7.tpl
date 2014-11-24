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
		<div id="loading-indicator" class="col-sm-12 col-md-8 col-lg-9">
			<img src="{cfg name="path.static.skin"}/images/loader-circle.gif" />
		</div>
		
		<div class="grid-sizer col-sm-6 col-md-4 col-lg-3"></div>
		
		{foreach from=$aTopics item=oTopic name=foo}
			{if $smarty.foreach.foo.iteration == 1}
				<article class="col-sm-6 col-md-4 col-lg-3 topic topic-thumbnail masonry-item topic-type-{$oTopic->getType()}">
					{include file='topic_views/topic_thumbnail.tpl'}
				</article>
			{elseif $smarty.foreach.foo.iteration == 2}
				<article class="col-sm-6 col-md-4 col-lg-3 topic topic-thumbnail topic-thumbnail-xs masonry-item topic-type-{$oTopic->getType()}">
					{include file='topic_views/topic_thumbnail_xs.tpl'}
				</article>
			{elseif $smarty.foreach.foo.iteration == 3}
				<article class="col-sm-6 col-md-4 col-lg-3 topic topic-thumbnail topic-thumbnail masonry-item topic-type-{$oTopic->getType()}">
					{include file='topic_views/topic_thumbnail.tpl'}
				</article>
				
			{elseif $smarty.foreach.foo.iteration == 4}
				<article class="col-sm-6 col-md-4 col-lg-3 topic topic-thumbnail topic-thumbnail-sq masonry-item topic-type-{$oTopic->getType()}">
					{include file='topic_views/topic_thumbnail_sq.tpl'}
				</article>
			{elseif $smarty.foreach.foo.iteration == 5}
				<article class="col-sm-6 col-md-4 col-lg-3 topic topic-thumbnail topic-thumbnail-xs masonry-item topic-type-{$oTopic->getType()}">
					{include file='topic_views/topic_thumbnail_xs.tpl'}
				</article>
			{elseif $smarty.foreach.foo.iteration == 6}
				<article class="col-sm-6 col-md-4 col-lg-3 topic topic-thumbnail topic-thumbnail-xs masonry-item topic-type-{$oTopic->getType()}">
					{include file='topic_views/topic_thumbnail_xs.tpl'}
				</article>
			{elseif $smarty.foreach.foo.iteration == 7}
				<article class="col-sm-6 col-md-4 col-lg-3 topic topic-thumbnail topic-thumbnail-xs masonry-item topic-type-{$oTopic->getType()}">
					{include file='topic_views/topic_thumbnail_xs.tpl'}
				</article>
			{elseif $smarty.foreach.foo.iteration == 8}
				<article class="col-sm-6 col-md-4 col-lg-3 topic topic-thumbnail topic-thumbnail-xs masonry-item topic-type-{$oTopic->getType()}">
					{include file='topic_views/topic_thumbnail_xs.tpl'}
				</article>
			{elseif $smarty.foreach.foo.iteration == 9}
				<article class="col-sm-6 col-md-4 col-lg-3 topic topic-thumbnail topic-thumbnail-xs masonry-item topic-type-{$oTopic->getType()}">
					{include file='topic_views/topic_thumbnail_xs.tpl'}
				</article>
				
			{elseif $smarty.foreach.foo.iteration == 10}
				<article class="col-sm-6 col-md-4 col-lg-3 topic topic-thumbnail topic-thumbnail-sq masonry-item topic-type-{$oTopic->getType()}">
					{include file='topic_views/topic_thumbnail_sq.tpl'}
				</article>
			{elseif $smarty.foreach.foo.iteration == 11}
				<article class="col-sm-6 col-md-4 col-lg-3 topic topic-thumbnail topic-thumbnail-sq masonry-item topic-type-{$oTopic->getType()}">
					{include file='topic_views/topic_thumbnail_sq.tpl'}
				</article>
			{elseif $smarty.foreach.foo.iteration == 12}
				<article class="col-sm-6 col-md-4 col-lg-3 topic topic-thumbnail masonry-item topic-type-{$oTopic->getType()}">
					{include file='topic_views/topic_thumbnail.tpl'}
				</article>
			{elseif $smarty.foreach.foo.iteration == 13}
				<article class="col-sm-6 col-md-4 col-lg-3 topic topic-thumbnail topic-thumbnail-xs masonry-item topic-type-{$oTopic->getType()}">
					{include file='topic_views/topic_thumbnail_xs.tpl'}
				</article>
				
			{elseif $smarty.foreach.foo.iteration == 14}
				<article class="col-sm-6 col-md-4 col-lg-3 topic topic-thumbnail masonry-item topic-type-{$oTopic->getType()}">
					{include file='topic_views/topic_thumbnail.tpl'}
				</article>
			{elseif $smarty.foreach.foo.iteration == 15}
				<article class="col-sm-6 col-md-4 col-lg-3 topic topic-thumbnail topic-thumbnail-xs masonry-item topic-type-{$oTopic->getType()}">
					{include file='topic_views/topic_thumbnail_xs.tpl'}
				</article>
			{elseif $smarty.foreach.foo.iteration == 16}
				<article class="col-sm-6 col-md-4 col-lg-3 topic topic-thumbnail topic-thumbnail-xs masonry-item topic-type-{$oTopic->getType()}">
					{include file='topic_views/topic_thumbnail_xs.tpl'}
				</article>
				
			{elseif $smarty.foreach.foo.iteration == 17}
				{if {cfg name='masonry_7.centerbar'} == true and $sAction=='index'}
					<div class="hidden-xs hidden-sm col-md-12 masonry-item centerbar">
						<div class="row">
							<div class="col-md-6">
								{include file='blocks.tpl' group='centerbar-first'}
							</div>
							
							<div class="col-md-6">
								{include file='blocks.tpl' group='centerbar-second'}
							</div>
						</div>
					</div>
				{/if}
				
				<article class="col-sm-6 col-md-4 col-lg-3 topic topic-thumbnail masonry-item topic-type-{$oTopic->getType()}">
					{include file='topic_views/topic_thumbnail.tpl'}
				</article>
				
			{elseif $smarty.foreach.foo.iteration == 18}
				<article class="col-sm-6 col-md-4 col-lg-3 topic topic-thumbnail topic-thumbnail-sq masonry-item topic-type-{$oTopic->getType()}">
					{include file='topic_views/topic_thumbnail_sq.tpl'}
				</article>
			{elseif $smarty.foreach.foo.iteration == 19}
				<article class="col-sm-6 col-md-4 col-lg-3 topic topic-thumbnail masonry-item topic-type-{$oTopic->getType()}">
					{include file='topic_views/topic_thumbnail.tpl'}
				</article>
			{elseif $smarty.foreach.foo.iteration == 20}
				<article class="col-sm-6 col-md-4 col-lg-3 topic topic-thumbnail topic-thumbnail-sq masonry-item topic-type-{$oTopic->getType()}">
					{include file='topic_views/topic_thumbnail_sq.tpl'}
				</article>
				
			{elseif $smarty.foreach.foo.iteration == 21}
				<article class="col-sm-6 col-md-4 col-lg-3 topic topic-thumbnail topic-thumbnail-xs masonry-item topic-type-{$oTopic->getType()}">
					{include file='topic_views/topic_thumbnail_xs.tpl'}
				</article>
			{elseif $smarty.foreach.foo.iteration == 22}
				<article class="col-sm-6 col-md-4 col-lg-3 topic topic-thumbnail topic-thumbnail-xs masonry-item topic-type-{$oTopic->getType()}">
					{include file='topic_views/topic_thumbnail_xs.tpl'}
				</article>
			{elseif $smarty.foreach.foo.iteration == 23}
				<article class="col-sm-6 col-md-4 col-lg-3 topic topic-thumbnail topic-thumbnail-xs masonry-item topic-type-{$oTopic->getType()}">
					{include file='topic_views/topic_thumbnail_xs.tpl'}
				</article>
			{elseif $smarty.foreach.foo.iteration == 24}
				<article class="col-sm-6 col-md-4 col-lg-3 topic topic-thumbnail topic-thumbnail-xs masonry-item topic-type-{$oTopic->getType()}">
					{include file='topic_views/topic_thumbnail_xs.tpl'}
				</article>
				
			{elseif $smarty.foreach.foo.iteration == 25}
				<article class="col-sm-6 col-md-4 col-lg-3 topic topic-thumbnail topic-thumbnail-sq masonry-item topic-type-{$oTopic->getType()}">
					{include file='topic_views/topic_thumbnail_sq.tpl'}
				</article>
				
			{elseif $smarty.foreach.foo.iteration == 29}
				<article class="col-sm-6 col-md-4 col-lg-3 topic topic-thumbnail topic-thumbnail-sq masonry-item topic-type-{$oTopic->getType()}">
					{include file='topic_views/topic_thumbnail_sq.tpl'}
				</article>
				
			{elseif $smarty.foreach.foo.iteration % 3 == 0}
				<article class="col-sm-6 col-md-4 col-lg-3 topic topic-thumbnail masonry-item topic-type-{$oTopic->getType()}">
					{include file='topic_views/topic_thumbnail.tpl'}
				</article>
			{else}
				<article class="col-sm-6 col-md-4 col-lg-3 topic topic-thumbnail topic-thumbnail-xs masonry-item topic-type-{$oTopic->getType()}">
					{include file='topic_views/topic_thumbnail_xs.tpl'}
				</article>
			{/if}
		{/foreach}
		
		<div class="hidden-xs hidden-sm col-md-4 col-lg-3 stamp">
			{include file='blocks.tpl' group='stamp'}
		</div>
	</div>
{/if}
