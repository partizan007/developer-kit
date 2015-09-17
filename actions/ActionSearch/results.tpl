{include file='header.tpl'}

<div class="page-header">
	<h1>{$aLang.search_results}</h1>
</div>

<form action="{router page='search'}topics/" class="search">
	{hook run='search_form_begin'}
	<input type="text" value="{$aReq.q|escape:'html'}" placeholder="{$aLang.search}" maxlength="255" name="q" class="form-control">
	{hook run='search_form_end'}
</form>

{if $bIsResults}
	<ul class="nav nav-pills nav-filter-wrapper">
		{foreach from=$aRes.aCounts item=iCount key=sType name="sTypes"}
			<li {if $aReq.sType == $sType}class="active"{/if}>					
				<a href="{router page='search'}{$sType}/?q={$aReq.q|escape:'html'}">
					{$iCount} 
					{if $sType=="topics"}
						{$aLang.search_results_count_topics}
					{elseif $sType=="comments"}
						{$aLang.search_results_count_comments}
					{else}
						{hook run='search_result_item' sType=$sType}
					{/if}
				</a>
			</li>				
		{/foreach}
	</ul>
	
	{if $aReq.sType == 'topics'}
		{include file='topic_list.tpl'}
	{elseif $aReq.sType == 'comments'}
		{include file='comment_list.tpl'}
	{else}
		{hook run='search_result' sType=$aReq.sType}
	{/if}
{else}
	{$aLang.search_results_empty}
{/if}

{include file='footer.tpl'}
