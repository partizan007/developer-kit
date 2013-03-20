{include file='header.tpl' menu='people'}


<h2 class="page-header">{$aLang.people}</h2>

<table class="table table-hover table-users">
	<thead>
		<tr>
			<th class="cell-name">{$aLang.user}</th>
			<th class="cell-date">{$aLang.user_date_registration}</th>
			<th class="cell-skill">{$aLang.user_skill}</th>
			<th class="cell-rating">{$aLang.user_rating}</th>
		</tr>
	</thead>

	<tbody>
		{if $aUsersRegister}
			{foreach from=$aUsersRegister item=oUserList}
				{assign var="oSession" value=$oUserList->getSession()}
				{assign var="oUserNote" value=$oUserList->getUserNote()}
				<tr>
					<td class="cell-name">
						<a href="{$oUserList->getUserWebPath()}"><img src="{$oUserList->getProfileAvatarPath(48)}" alt="avatar" class="avatar" /></a>
						<div class="name {if !$oUserList->getProfileName()}no-realname{/if}">
							<p class="username">
								<a href="{$oUserList->getUserWebPath()}">{$oUserList->getLogin()}</a>
								{if $oUserNote}
									<i class="icon-comment js-infobox" title="{$oUserNote->getText()|escape:'html'}"></i>
								{/if}
							</p>
							{if $oUserList->getProfileName()}<p class="realname">{$oUserList->getProfileName()}</p>{/if}
						</div>
					</td>
					<td class="cell-date">{date_format date=$oUserList->getDateRegister() format="d.m.y, H:i"}</td>
					<td class="cell-skill">{$oUserList->getSkill()}</td>
					<td class="cell-rating{if $oUserList->getRating() < 0} negative{/if}"><strong>{$oUserList->getRating()}</strong></td>
				</tr>
			{/foreach}
		{else}
			<tr>
				<td colspan="5">
					{if $sUserListEmpty}
						{$sUserListEmpty}
					{else}
						{$aLang.user_empty}
					{/if}
				</td>
			</tr>
		{/if}
	</tbody>
</table>


{include file='paging.tpl' aPaging=$aPaging}

{include file='footer.tpl'}
