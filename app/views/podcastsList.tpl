{* {foreach from=$podcastsToShow|@array_slice:0:10 item=podcast} *}
{foreach from=$podcastsToShow item=podcast}
							<div class="post py-3 px-1">
								<div class="row">
									<div class="col-10">
									<span class="text-5 text-light">{$podcast["title"]}<span class="text-1" style="color:#777"> #{$podcast["cat_name"]}</span></span>
									<p>{$podcast["name"]} {$podcast["surname"]} @{$podcast["display_name"]} | {$podcast["created_at"]}</p>
									<div class="desc"> {$podcast["description"]|truncate:100}
									</div>
									</div>
									<div class="col-2 d-flex justify-content-center">
									<a href="{$conf->action_url}podcastView&id={$podcast["id"]}" class="p-link"><div class="play-btn"><i class="fas fa-play"></i></div></a>
									</div>
								</div>
							</div>
						{/foreach}
{if $isMore}<form id="showMore" class="text-center"><button type="button" onclick="ajaxPostForm('showMore','{$conf->action_url}showMore','podcastsContainer')" class="btn text-light">Show more podcasts</button></form>{else}
<div></div>
{/if}
{if $podcastsToShow|@count == 0}<div class="post text-5 text-center">No podcast to show yet!</div>{/if}