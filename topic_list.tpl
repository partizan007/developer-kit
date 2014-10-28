{if count($aTopics)>0}
	{assign var="sTopicListTemplateName" value="topiclists/{cfg name='topic_list.view'}.tpl"}
	{include file=$sTopicListTemplateName}
	
	{include file='paging.tpl' aPaging=$aPaging}
{else}
	<div class="alert alert-info">
		{$aLang.blog_no_topic}
	</div>
{/if}
