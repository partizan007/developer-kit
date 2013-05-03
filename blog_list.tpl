<table class="table table-hover table-blogs">
	{if $bBlogsUseOrder}
		<thead>
			<tr>
				<th class="cell-name"><small><a href="{$sBlogsRootPage}?order=blog_title&order_way={if $sBlogOrder=='blog_title'}{$sBlogOrderWayNext}{else}{$sBlogOrderWay}{/if}" {if $sBlogOrder=='blog_title'}class="{$sBlogOrderWay}"{/if}><span>{$aLang.blogs_title}</span></a></small></th>

				{if $oUserCurrent}
					<th class="cell-join"><small>{$aLang.blog_join_leave}</small></th>
				{/if}

				<th class="cell-readers">
					<small><a href="{$sBlogsRootPage}?order=blog_count_user&order_way={if $sBlogOrder=='blog_count_user'}{$sBlogOrderWayNext}{else}{$sBlogOrderWay}{/if}" {if $sBlogOrder=='blog_count_user'}class="{$sBlogOrderWay}"{/if}><span>{$aLang.blogs_readers}</span></a></small>
				</th>
				<th class="cell-rating align-center"><small><a href="{$sBlogsRootPage}?order=blog_rating&order_way={if $sBlogOrder=='blog_rating'}{$sBlogOrderWayNext}{else}{$sBlogOrderWay}{/if}" {if $sBlogOrder=='blog_rating'}class="{$sBlogOrderWay}"{/if}><span>{$aLang.blogs_rating}</span></a></small></th>
			</tr>
		</thead>
	{else}
		<thead>
			<tr>
				<th class="cell-name"><small>{$aLang.blogs_title}</small></th>

				{if $oUserCurrent}
					<th class="cell-join"><small>{$aLang.blog_join_leave}</small></th>
				{/if}

				<th class="cell-readers"><small>{$aLang.blogs_readers}</small></th>
				<th class="cell-rating align-center"><small>{$aLang.blogs_rating}</small></th>
			</tr>
		</thead>
	{/if}

	<tbody>
		{if $aBlogs}
			{foreach from=$aBlogs item=oBlog}
				{assign var="oUserOwner" value=$oBlog->getOwner()}

				<tr>
					<td class="cell-name">
						<a href="{$oBlog->getUrlFull()}">
							<img src="{$oBlog->getAvatarPath(48)}" width="48" height="48" class="avatar visible-desktop" />
						</a>
						
						<p>
							<a href="{$oBlog->getUrlFull()}" class="blog-name">{$oBlog->getTitle()|escape:'html'}</a>

							<a href="#" onclick="return ls.infobox.showInfoBlog(this,{$oBlog->getId()});" class="muted question-sign"><i class="icon-question-sign"></i></a>

							{if $oBlog->getType() == 'close'}
								<i title="{$aLang.blog_closed}" class="icon-lock muted"></i>
							{/if}

						</p>
						
						<span class="user-avatar">
							<a href="{$oUserOwner->getUserWebPath()}"><img src="{$oUserOwner->getProfileAvatarPath(24)}" /></a>
							<small><a href="{$oUserOwner->getUserWebPath()}">{$oUserOwner->getLogin()}</a></small>
						</span>
					</td>

					{if $oUserCurrent}
						<td class="cell-join">
							<small>
								{if $oUserCurrent->getId() != $oBlog->getOwnerId() and $oBlog->getType() == 'open'}
									<a href="#" onclick="ls.blog.toggleJoin(this, {$oBlog->getId()}); return false;" class="link-dotted">
										{if $oBlog->getUserIsJoin()}
											{$aLang.blog_leave}
										{else}
											{$aLang.blog_join}
										{/if}
									</a>
								{else}
									&mdash;
								{/if}
							</small>
						</td>
					{/if}

					<td class="cell-readers" id="blog_user_count_{$oBlog->getId()}"><small>{$oBlog->getCountUser()}</small></td>
					<td class="text-success cell-rating align-center"><small>{$oBlog->getRating()}</small></td>
				</tr>
			{/foreach}
		{else}
			<tr>
				<td colspan="3">
					{if $sBlogsEmptyList}
						{$sBlogsEmptyList}
					{else}

					{/if}
				</td>
			</tr>
		{/if}
	</tbody>
</table>
