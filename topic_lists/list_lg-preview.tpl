{add_block group='toolbar' name='toolbar_topic.tpl' iCountTopic=count($aTopics)}

{foreach from=$aTopics item=oTopic name=foo}
	<article class="topic topic-lg-preview topic-type-{$oTopic->getType()}">
		{include file='topic_views/topic_lg-preview.tpl'}
	</article>
{/foreach}
