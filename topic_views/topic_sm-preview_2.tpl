{assign var="oBlog" value=$oTopic->getBlog()}
{assign var="oUser" value=$oTopic->getUser()}
{assign var="oVote" value=$oTopic->getVote()}
{assign var="oFavourite" value=$oTopic->getFavourite()}


<header class="topic-header">
	<h2 class="topic-title">
		<a href="{$oTopic->getUrl()}">{$oTopic->getTitle()|escape:'html'}</a>
		
		{if $oTopic->getPublish() == 0}   
			<span class="glyphicon glyphicon-file text-muted" title="{$aLang.topic_unpublish}"></span>
		{/if}
	</h2>
	
	<ul class="list-unstyled list-inline topic-info">
		<li>
			<a href="{$oBlog->getUrlFull()}" class="topic-blog">{$oBlog->getTitle()|escape:'html'}</a>
		</li>
		<li>
			<time datetime="{date_format date=$oTopic->getDateAdd() format='c'}" title="{date_format date=$oTopic->getDateAdd() format='j F Y, H:i'}" class="text-muted">
				{date_format date=$oTopic->getDateAdd() hours_back="12" minutes_back="60" now="60" day="day H:i" format="j F Y, H:i"}
			</time>
		</li>
		{if $oUserCurrent and ($oUserCurrent->getId()==$oTopic->getUserId() or $oUserCurrent->isAdministrator() or $oBlog->getUserIsAdministrator() or $oBlog->getUserIsModerator() or $oBlog->getOwnerId()==$oUserCurrent->getId())}
			<li><a href="{cfg name='path.root.web'}/{$oTopic->getType()}/edit/{$oTopic->getId()}/" title="{$aLang.topic_edit}" class="actions-edit">{$aLang.topic_edit}</a></li>
			
			{if $oUserCurrent->isAdministrator() or $oBlog->getUserIsAdministrator() or $oBlog->getOwnerId()==$oUserCurrent->getId()}
				<li><a href="{router page='topic'}delete/{$oTopic->getId()}/?security_ls_key={$LIVESTREET_SECURITY_KEY}" title="{$aLang.topic_delete}" onclick="return confirm('{$aLang.topic_delete_confirm}');" class="actions-delete">{$aLang.topic_delete}</a></li>
			{/if}
		{/if}
	</ul>
</header>
	
<div class="row topic-main-content">
	<div class="col-md-4">
		{if $oTopic->getPreviewImageWebPath()}
			<a href="{$oTopic->getUrl()}"><img class="topic_preview" src="{$oTopic->getPreviewImageWebPath({cfg name='topic.sm_preview_2.img_size'})}"></a>
		{/if}
	</div>
	
	<div class="col-md-8">
		<div class="topic-content text">
			{$oTopic->getText()|strip_tags|truncate:{cfg name='topic.sm_preview_2.text_length'}:"..."}
		</div>
	</div>
</div>

<footer class="topic-footer">
	<ul class="list-unstyled list-inline small topic-info">
		<li class="topic-info-author">
			<a href="{$oUser->getUserWebPath()}"><img src="{$oUser->getProfileAvatarPath(24)}" alt="{$oUser->getLogin()}" class="avatar" /></a>
			<a rel="author" href="{$oUser->getUserWebPath()}">{$oUser->getLogin()}</a>
		</li>
		<li class="topic-info-favourite">
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
		<li id="vote_area_topic_{$oTopic->getId()}" class="pull-right vote 
															{if $oVote || ($oUserCurrent && $oTopic->getUserId() == $oUserCurrent->getId()) || strtotime($oTopic->getDateAdd()) < $smarty.now-$oConfig->GetValue('acl.vote.topic.limit_time')}
																{if $oTopic->getRating() > 0}
																	vote-count-positive
																{elseif $oTopic->getRating() < 0}
																	vote-count-negative
																{/if}
															{/if}
															
															{if $oVote} 
																voted
																
																{if $oVote->getDirection() > 0}
																	voted-up
																{elseif $oVote->getDirection() < 0}
																	voted-down
																{/if}
															{/if}">
			{if $oVote || ($oUserCurrent && $oTopic->getUserId() == $oUserCurrent->getId()) || strtotime($oTopic->getDateAdd()) < $smarty.now-$oConfig->GetValue('acl.vote.topic.limit_time')}
				{assign var="bVoteInfoShow" value=true}
			{/if}
			<div class="vote-down" onclick="return ls.vote.vote({$oTopic->getId()},this,-1,'topic');"><span class="glyphicon glyphicon-thumbs-down"></span></div>
			<div class="vote-count {if $bVoteInfoShow}js-infobox-vote-topic{/if}" id="vote_total_topic_{$oTopic->getId()}" title="{$aLang.topic_vote_count}: {$oTopic->getCountVote()}">
				{if $bVoteInfoShow}
					{if $oTopic->getRating() > 0}+{/if}{$oTopic->getRating()}
				{else} 
					<a href="#" onclick="return ls.vote.vote({$oTopic->getId()},this,0,'topic');">?</a> 
				{/if}
			</div>
			<div class="vote-up" onclick="return ls.vote.vote({$oTopic->getId()},this,1,'topic');"><span class="glyphicon glyphicon-thumbs-up"></span></div>
			{if $bVoteInfoShow}
				<div id="vote-info-topic-{$oTopic->getId()}" style="display: none;">
					<ul class="list-unstyled vote-topic-info">
						<li><span class="glyphicon glyphicon-thumbs-up"></span>{$oTopic->getCountVoteUp()}</li>
						<li><span class="glyphicon glyphicon-thumbs-down"></span>{$oTopic->getCountVoteDown()}</li>
						<li><span class="glyphicon glyphicon-eye-open"></span>{$oTopic->getCountVoteAbstain()}</li>
						{hook run='topic_show_vote_stats' topic=$oTopic}
					</ul>
				</div>
			{/if}
		</li>
		
		{hook run='topic_show_info' topic=$oTopic}
	</ul>
</footer>
