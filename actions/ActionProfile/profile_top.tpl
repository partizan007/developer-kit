<div class="profile">
	{hook run='profile_top_begin' oUserProfile=$oUserProfile}
	
	<a href="{$oUserProfile->getUserWebPath()}"><img src="{$oUserProfile->getProfileAvatarPath(64)}" alt="avatar" class="avatar" itemprop="photo" /></a>
	
	<div id="vote_area_user_{$oUserProfile->getId()}" class="pull-right vote {if $oUserProfile->getRating()>=0}vote-count-positive{else}vote-count-negative{/if} {if $oVote} voted {if $oVote->getDirection()>0}voted-up{elseif $oVote->getDirection()<0}voted-down{/if}{/if}">
		<div class="muted vote-label"><small>{$aLang.user_rating}</small></div>
		<a href="#" class="vote-down" onclick="return ls.vote.vote({$oUserProfile->getId()},this,-1,'user');"></a>
		<div id="vote_total_user_{$oUserProfile->getId()}" class="vote-count count" title="{$aLang.user_vote_count}: {$oUserProfile->getCountVote()}">{if $oUserProfile->getRating() > 0}+{/if}{$oUserProfile->getRating()}</div>
		<a href="#" class="vote-up" onclick="return ls.vote.vote({$oUserProfile->getId()},this,1,'user');"></a>
	</div>
	
	<div class="pull-right strength">
		<div class="muted vote-label"><small>{$aLang.user_skill}</small></div>
		<div class="text-info count" id="user_skill_{$oUserProfile->getId()}"><small>{$oUserProfile->getSkill()}</small></div>
	</div>
	
	<h2 class="user-login word-wrap {if !$oUserProfile->getProfileName()}no-user-name{/if}" itemprop="nickname">{$oUserProfile->getLogin()}</h2>
	
	{if $oUserProfile->getProfileName()}
		<p class="muted user-name" itemprop="name">{$oUserProfile->getProfileName()|escape:'html'}</p>
	{/if}
	
	{hook run='profile_top_end' oUserProfile=$oUserProfile}
</div>
