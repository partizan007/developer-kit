{if $oUserCurrent and $oUserCurrent->isAdministrator()}
	<section class="toolbar-admin">
		<a href="{router page='admin'}" title="{$aLang.admin_title}" class="muted">
			<i class="icon-cog"></i>
		</a>
	</section>
{/if}
