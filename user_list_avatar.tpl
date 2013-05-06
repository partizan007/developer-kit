<script type="text/javascript">
	jQuery(document).ready(function($) {
		$('.user-list-avatar').tooltip({
			trigger: "hover",
			selector: "a[data-toggle=tooltip]"
		})
	});
</script>


{if $aUsersList}
	<ul class="unstyled inline user-list-avatar">
		{foreach from=$aUsersList item=oUserList}
			{assign var="oSession" value=$oUserList->getSession()}
			
			<li>
				<a href="{$oUserList->getUserWebPath()}" data-toggle="tooltip" title="{$oUserList->getLogin()}"><img src="{$oUserList->getProfileAvatarPath(48)}" alt="{$oUserList->getLogin()}" class="avatar" /></a>
			</li>
		{/foreach}
	</ul>
{else}
	{if $sUserListEmpty}
		<div class="notice-empty">{$sUserListEmpty}</div>
	{else}
		<div class="notice-empty">{$aLang.user_empty}</div>
	{/if}
{/if}


{include file='paging.tpl' aPaging=$aPaging}
