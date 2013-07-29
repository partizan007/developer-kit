<nav id="nav" class="clearfix">
	<div class="container">
		<div class="nav-inner">
		
			<div class="row">
		
				<div class="col-lg-8">
					{if $menu}
						{if in_array($menu,$aMenuContainers)}{$aMenuFetch.$menu}{else}{include file="menu.$menu.tpl"}{/if}
					{/if}
				</div>
		
				<div class="col-lg-4 hidden-phone">
					{if $oUserCurrent}
						<a href="{router page='topic'}add/" class="btn btn-success btn-write pull-right" id="modal_write_show">{$aLang.block_create}</a>
					{/if}
				
					<form action="{router page='search'}topics/" class="navbar-search pull-right visible-desktop">
						<input type="text" placeholder="{$aLang.search}" maxlength="255" name="q" class="form-control">
					</form>
				</div>
		
			</div>
			
		</div>
	</div>
</nav>
