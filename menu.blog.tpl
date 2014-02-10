<div class="row nav-filter-wrapper">
	<div class="col-lg-12">

		{if $sMenuItemSelect=='index' or $sMenuItemSelect=='feed'}
			<ul class="nav nav-pills pull-left">
				<li {if $sMenuSubItemSelect=='good'}class="active"{/if}><a href="{cfg name='path.root.web'}/">{$aLang.blog_menu_all_good}</a></li>
				<li {if $sMenuSubItemSelect=='new'}class="active"{/if}>
					{if $iCountTopicsNew>0}
						<a href="{router page='index'}new/" title="{$aLang.blog_menu_top_period_24h}">{$aLang.blog_menu_all_new} +{$iCountTopicsNew}</a>
					{else}
						<a href="{router page='index'}newall/" title="{$aLang.blog_menu_top_period_all}">{$aLang.blog_menu_all_new}</a>
					{/if}
				</li>
				<li {if $sMenuSubItemSelect=='discussed'}class="active"{/if}><a href="{router page='index'}discussed/">{$aLang.blog_menu_all_discussed}</a></li>
				<li {if $sMenuSubItemSelect=='top'}class="active"{/if}><a href="{router page='index'}top/">{$aLang.blog_menu_all_top}</a></li>
				{if $oUserCurrent}
					<li {if $sMenuItemSelect=='feed'}class="active"{/if}>
						<a href="{router page='feed'}">{$aLang.userfeed_title}</a>
					</li>
				{/if}
				{hook run='menu_blog_index_item'}
			</ul>
		{/if}

		{if $sMenuItemSelect=='blog'}
			<ul class="nav nav-pills pull-left">
				<li {if $sMenuSubItemSelect=='good'}class="active"{/if}><a href="{$sMenuSubBlogUrl}">{$aLang.blog_menu_collective_good}</a></li>
				<li {if $sMenuSubItemSelect=='new'}class="active"{/if}>
					{if $iCountTopicsNew>0}
						<a href="{router page='index'}new/" title="{$aLang.blog_menu_top_period_24h}">{$aLang.blog_menu_all_new} +{$iCountTopicsNew}</a>
					{else}
						<a href="{router page='index'}newall/" title="{$aLang.blog_menu_top_period_all}">{$aLang.blog_menu_all_new}</a>
					{/if}
				</li>
				<li {if $sMenuSubItemSelect=='discussed'}class="active"{/if}><a href="{$sMenuSubBlogUrl}discussed/">{$aLang.blog_menu_collective_discussed}</a></li>
				<li {if $sMenuSubItemSelect=='top'}class="active"{/if}><a href="{$sMenuSubBlogUrl}top/">{$aLang.blog_menu_collective_top}</a></li>
				{if $oUserCurrent}
					<li {if $sMenuItemSelect=='feed'}class="active"{/if}>
						<a href="{router page='feed'}">{$aLang.userfeed_title}</a>
					</li>
				{/if}
				{hook run='menu_blog_blog_item'}
			</ul>
		{/if}

		{if $sMenuItemSelect=='log'}
			<ul class="nav nav-pills pull-left">
				<li {if $sMenuSubItemSelect=='good'}class="active"{/if}><a href="{router page='personal_blog'}">{$aLang.blog_menu_personal_good}</a></li>
				<li {if $sMenuSubItemSelect=='new'}class="active"{/if}>
					{if $iCountTopicsNew>0}
						<a href="{router page='index'}new/" title="{$aLang.blog_menu_top_period_24h}">{$aLang.blog_menu_all_new} +{$iCountTopicsNew}</a>
					{else}
						<a href="{router page='index'}newall/" title="{$aLang.blog_menu_top_period_all}">{$aLang.blog_menu_all_new}</a>
					{/if}
				</li>
				<li {if $sMenuSubItemSelect=='discussed'}class="active"{/if}><a href="{router page='personal_blog'}discussed/">{$aLang.blog_menu_personal_discussed}</a></li>
				<li {if $sMenuSubItemSelect=='top'}class="active"{/if}><a href="{router page='personal_blog'}top/">{$aLang.blog_menu_personal_top}</a></li>
				{if $oUserCurrent}
					<li {if $sMenuItemSelect=='feed'}class="active"{/if}>
						<a href="{router page='feed'}">{$aLang.userfeed_title}</a>
					</li>
				{/if}
				{hook run='menu_blog_log_item'}
			</ul>
		{/if}

		{if $sPeriodSelectCurrent}
			<ul class="nav nav-pills pull-right nav-period">
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						{if $sPeriodSelectCurrent=='1'}{$aLang.blog_menu_top_period_24h}{/if}
						{if $sPeriodSelectCurrent=='7'}{$aLang.blog_menu_top_period_7d}{/if}
						{if $sPeriodSelectCurrent=='30'}{$aLang.blog_menu_top_period_30d}{/if}
						{if $sPeriodSelectCurrent=='all'}{$aLang.blog_menu_top_period_all}{/if}
						<b class="caret"></b>
					</a>
			
					<ul class="dropdown-menu">
						<li {if $sPeriodSelectCurrent=='1'}class="active"{/if}><a href="{$sPeriodSelectRoot}?period=1">{$aLang.blog_menu_top_period_24h}</a></li>
						<li {if $sPeriodSelectCurrent=='7'}class="active"{/if}><a href="{$sPeriodSelectRoot}?period=7">{$aLang.blog_menu_top_period_7d}</a></li>
						<li {if $sPeriodSelectCurrent=='30'}class="active"{/if}><a href="{$sPeriodSelectRoot}?period=30">{$aLang.blog_menu_top_period_30d}</a></li>
						<li {if $sPeriodSelectCurrent=='all'}class="active"{/if}><a href="{$sPeriodSelectRoot}?period=all">{$aLang.blog_menu_top_period_all}</a></li>
					</ul>
				</li>
			</ul>
		{/if}
		
		{hook run='menu_blog'}

	</div>
</div>
