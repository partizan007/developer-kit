{assign var="bTopicListPage" value=true}
{if !{cfg name='sidebar.main_pages'}}
	{assign var="noSidebar" value=true}
{/if}


{include file='header.tpl' menu='blog' menu_content='blog'}
{include file='topic_list.tpl'}
{include file='footer.tpl'}
