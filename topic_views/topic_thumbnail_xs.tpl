{assign var="oBlog" value=$oTopic->getBlog()}
{assign var="oUser" value=$oTopic->getUser()}
{assign var="oFavourite" value=$oTopic->getFavourite()}


<div class="media">
	{if $oTopic->getPreviewImageWebPath()}
		<a class="pull-left" href="{$oTopic->getUrl()}"><img class="topic_preview" src="{$oTopic->getPreviewImageWebPath({cfg name='topic.thumbnail_xs.img_size'})}"></a>
	{/if}
	
	<div class="media-body">
		<header class="topic-header">
			<h3 class="topic-title"><a href="{$oTopic->getUrl()}">{$oTopic->getTitle()|escape:'html'}</a></h3>
			
			<div class="topic-info">
				<a href="{$oBlog->getUrlFull()}" class="topic-blog">{$oBlog->getTitle()|escape:'html'}</a>
			</div>
		</header>
	</div>
</div>
