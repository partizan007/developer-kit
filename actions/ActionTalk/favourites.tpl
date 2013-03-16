{include file='header.tpl'}
{include file='menu.talk.tpl'}


{if $aTalks}
	<table class="table table-talk">
		<thead>
			<tr>
				<th class="cell-recipients">{$aLang.talk_inbox_target}</th>
				<th class="cell-favourite"></th>
				<th class="cell-title">{$aLang.talk_inbox_title}</th>
				<th class="cell-date ta-r">{$aLang.talk_inbox_date}</th>
			</tr>
		</thead>

		<tbody>
		{foreach from=$aTalks item=oTalk}
			{assign var="oTalkUserAuthor" value=$oTalk->getTalkUser()}
			<tr>
				<td>
					{strip}
						{assign var="aTalkUserOther" value=[]}
						{foreach from=$oTalk->getTalkUsers() item=oTalkUser name=users}
							{if $oTalkUser->getUserId()!=$oUserCurrent->getId()}
								{$aTalkUserOther[]=$oTalkUser}
							{/if}
						{/foreach}
						{foreach from=$aTalkUserOther item=oTalkUser name=users}
							{assign var="oUser" value=$oTalkUser->getUser()}
							{if !$smarty.foreach.users.first}, {/if}<a href="{$oUser->getUserWebPath()}" class="user {if $oTalkUser->getUserActive()!=$TALK_USER_ACTIVE}inactive{/if}">{$oUser->getLogin()}</a>
						{/foreach}
					{/strip}
				</td>
				<td class="cell-favourite">
					<a href="#" onclick="return ls.favourite.toggle({$oTalk->getId()},this,'talk');" class="favourite {if $oTalk->getIsFavourite()}active{/if}"></a>
				</td>
				<td>
				{if $oTalkUserAuthor->getCommentCountNew() or !$oTalkUserAuthor->getDateLast()}
					<a href="{router page='talk'}read/{$oTalk->getId()}/"><strong>{$oTalk->getTitle()|escape:'html'}</strong></a>
				{else}
					<a href="{router page='talk'}read/{$oTalk->getId()}/">{$oTalk->getTitle()|escape:'html'}</a>
				{/if}
				&nbsp;
				{if $oTalk->getCountComment()}
					({$oTalk->getCountComment()}{if $oTalkUserAuthor->getCommentCountNew()} +{$oTalkUserAuthor->getCommentCountNew()}{/if})
				{/if}
				</td>
				<td class="cell-date ta-r">{date_format date=$oTalk->getDate()}</td>
			</tr>
		{/foreach}
		</tbody>
	</table>
{else}
	<div class="notice-empty">{$aLang.talk_favourite_empty}</div>
{/if}


{include file='paging.tpl' aPaging=$aPaging}
{include file='footer.tpl'}
