{assign var="oBlog" value=$oTopic->getBlog()}
{assign var="oUser" value=$oTopic->getUser()}
{assign var="oFavourite" value=$oTopic->getFavourite()}


<div class="thumbnail">
	{if $oTopic->getPreviewImageWebPath()}
		<a href="{$oTopic->getUrl()}"><img class="topic_preview" src="{$oTopic->getPreviewImageWebPath({cfg name='topic.thumbnail_lg.img_size'})}"></a>
	{/if}
	
	
	<div class="caption">
		<header class="topic-header">
			<h2 class="topic-title"><a href="{$oTopic->getUrl()}">{$oTopic->getTitle()|escape:'html'}</a></h2>
			
			<div class="topic-info">
				<a href="{$oBlog->getUrlFull()}" class="topic-blog">{$oBlog->getTitle()|escape:'html'}</a>
			</div>
		</header>
		
		<footer class="topic-footer">
			<ul class="list-unstyled list-inline small topic-info">
				<li class="topic-info-author">
					<a href="{$oUser->getUserWebPath()}"><img src="{$oUser->getProfileAvatarPath(24)}" alt="{$oUser->getLogin()}" class="avatar" /></a>
					<a rel="author" href="{$oUser->getUserWebPath()}">{$oUser->getLogin()}</a>
				</li>
				<li class="topic-info-date">
					<time datetime="{date_format date=$oTopic->getDateAdd() format='c'}" title="{date_format date=$oTopic->getDateAdd() format='j F Y, H:i'}" class="text-muted">
						{date_format date=$oTopic->getDateAdd() hours_back="12" minutes_back="60" now="60" day="day H:i" format="j F Y, H:i"}
					</time>
				</li>
				<li class="hidden-xs topic-info-favourite">
					<a href="#" onclick="return ls.favourite.toggle({$oTopic->getId()},this,'topic');" class="favourite {if $oUserCurrent && $oTopic->getIsFavourite()}active{/if}"><span class="glyphicon glyphicon-star-empty"></span></a>
					<span class="text-muted favourite-count" id="fav_count_topic_{$oTopic->getId()}">{$oTopic->getCountFavourite()}</span>
				</li>
				<li class="topic-info-comments">
					{if $oTopic->getCountCommentNew()}
						<a href="{$oTopic->getUrl()}#comments" title="{$aLang.topic_comment_read}" class="new">
							<span class="glyphicon glyphicon-comment"></span>
							<span>{$oTopic->getCountComment()}</span>
							<span class="count">+{$oTopic->getCountCommentNew()}</span>
						</a>
					{elseif $oTopic->getCountComment()}
						<a href="{$oTopic->getUrl()}#comments" title="{$aLang.topic_comment_read}" class="icon-active">
							<span class="glyphicon glyphicon-comment"></span>
							<span>{$oTopic->getCountComment()}</span>
						</a>
					{else}
						<a href="{$oTopic->getUrl()}#comments" title="{$aLang.topic_comment_read}">
							<span class="glyphicon glyphicon-comment"></span>
							<span>{$oTopic->getCountComment()}</span>
						</a>
					{/if}
				</li>
			</ul>
		</footer>
	</div>
</div>
