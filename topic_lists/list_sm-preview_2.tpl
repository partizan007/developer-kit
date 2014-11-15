{add_block group='toolbar' name='toolbar_topic.tpl' iCountTopic=count($aTopics)}

{foreach from=$aTopics item=oTopic name=foo}
	<article class="topic topic-sm-preview-inner topic-type-{$oTopic->getType()} js-topic">
		{include file='topic_views/topic_sm-preview_2.tpl'}
	</article>
{/foreach}
