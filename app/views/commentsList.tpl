{foreach from=$comments item=comment}
							<div class="comment py-3 px-1">
								<div class="row">
									<div class="col-12">
									<span class="text-4 text-light">{$comment["name"]} {$comment["surname"]}</span><span class="text-1" style="color:#777"> @{$comment["display_name"]}</span>
                                    <p class="mb-1 text-1">{$comment["date"]}</p>
									<div class="text-3 text-light">{$comment["content"]}</div>
									</div>
								</div>
							</div>
{/foreach}
{if $comments|@count == 0}<div class="comment text-5 text-center">No comments yet!</div>{/if}