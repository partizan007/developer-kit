<nav id="nav">
	<div class="container">
		<div class="row">
		
			<div class="span8">
				{if $menu}
					{if in_array($menu,$aMenuContainers)}{$aMenuFetch.$menu}{else}{include file="menu.$menu.tpl"}{/if}
				{/if}
			</div>
		
			<div class="span4">
				{if $oUserCurrent}
					<a href="{router page='topic'}add/" class="btn btn-write pull-right" id="modal_write_show">{$aLang.block_create}</a>
				{/if}
				
				<form action="{router page='search'}topics/" class="navbar-search pull-right">
					<input type="text" placeholder="{$aLang.search}" maxlength="255" name="q" class="search-query">
				</form>
			</div>
		
		</div>
	</div>
</nav>
