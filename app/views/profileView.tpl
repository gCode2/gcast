a{extends file="main.tpl"}
{block name=header}
<header id="header" class="header-transparent header-effect-shrink header-no-border-bottom" data-plugin-options="{literal}{'stickyEnabled': true, 'stickyEffect': 'shrink', 'stickyEnableOnBoxed': true, 'stickyEnableOnMobile': false, 'stickyChangeLogo': true, 'stickyStartAt': 30, 'stickyHeaderContainerHeight': 70}{/literal}">
				<div class="header-body border-0 box-shadow-none bg-dark">
					<div class="header-container container container-xl-custom">
						<div class="header-row">
							<div class="header-column flex-row">
								<div class="header-logo d-lg-none">
									<a href="{$conf->action_url}wallView">
										<img src="img/gcast-white.png" class="img-fluid" style="max-height:60px;" alt="gCast logo" />
									</a>
								</div>
								<div class="header-nav p-0">
									<div class="header-nav header-nav-line header-nav-bottom-line header-nav-light-text header-nav-line-under-text header-nav-bottom-line-effect-1 justify-content-start">
										<div class="header-nav-main header-nav-main-mobile-dark header-nav-main-square header-nav-main-dropdown-no-borders header-nav-main-effect-2 header-nav-main-sub-effect-1">
											<nav class="collapse">
												<ul class="nav nav-pills flex-column flex-lg-row" id="mainNav">
													<li><a href="{$conf->action_url}wallView" class="nav-link">WALL</a></li>
													<li><a href="{$conf->action_url}createView" class="nav-link">CREATE</a></li>
                                                    <li><a href="{$conf->action_url}profile" class="nav-link">PROFILE</a></li>
													<li><a href="{$conf->action_url}logout" class="nav-link">LOGOUT</a></li>
												</ul>
											</nav>
										</div>
									</div>
								</div>
							</div>
							<div class="header-column flex-row flex-lg-column justify-content-end justify-content-lg-center align-items-center align-items-lg-end">
								<div class="logoHolder">
								<a href="{$conf->action_url}wallView">
										<img src="img/gcast-white.png" alt="gCast logo" class="d-none d-sm-none d-md-none d-lg-block" style="max-height:60px;"/>
								</a>
								</div>
								<button class="btn header-btn-collapse-nav ms-5" data-bs-toggle="collapse" data-bs-target=".header-nav-main nav">
									<i class="fas fa-bars"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
			</header>
{/block}
{block name=content}
<section class="page-header page-header-modern page-header-md ">
					<div class="container-fluid">
						<div class="row align-items-center">

							<div class="col">
								<div class="row">
									<div class="col-md-12 align-self-center p-static order-2 text-center">
										<div class="overflow-hidden pb-2">
											<h1 class="text-light font-weight-bold text-9">{$user["name"]} {$user["surname"]}</h1>
                                            <p class="text-3 mb-0">@{$user["display_name"]}</p>
											<form action="" method="post" id="follow">
											{if $user["id"] !== $smarty.session.id}
											{if $follows}
                                            <button type="button" class="btn btn-quaternary mt-2" onclick="ajaxPostForm('follow','{$conf->action_root}follow&user_id={$user['id']}','follow_icon');" id="follow_icon"><i class="icon-user-following icons" id="follow_icon"></i> following</button>
											</button>
											{else}
											<button type="button" class="btn btn-quaternary mt-2" onclick="ajaxPostForm('follow','{$conf->action_root}follow&user_id={$user['id']}','follow_icon');" id="follow_icon"><i class="icon-user-follow icons" id="follow_icon"></i> follow</button>
											</button>
											{/if}
											{/if}
											</form>
                                            {* check if follows *}
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</section>
<div class="container pt-3 pb-2" style="min-height:60vh">

					<div class="row pt-2">
						<div class="col-lg-9">

							<h2 class="font-weight-normal text-7 mb-2">About <strong class="font-weight-extra-bold">me</strong></h2>
                            <p class="lead">
							{if !empty($user["bio"])}
							{$user["bio"]}
							{else}
							This user haven't set his bio yet!
							{/if}
							</p>
                            <h2 class="font-weight-normal text-7 mb-4">My <strong class="font-weight-extra-bold">podcasts</strong></h2>
                            {* lista 5 ostatnich podcastow *}
                            {foreach from=$userPodcasts key=k item=i}
                                <div class="row podcastHolderSection">
								<a href="{$conf->action_url}podcastView&id={$i["id"]}">
                                    <div class="col-12 d-flex podcastHolder pt-3">
									
                                        <div class="col-4 podcastTitle"><h5 class="text-light">{$i["title"]}</h5></div>
                                        <div class="col-4 podcastCategory"><h6>{$i["description"]}</h6></div>
                                        <div class="col-4 podcastStats text-light">
                                            <div class="row">
                                                <div class="col-4"><i class="fas fa-heart"></i> {$i["likes"]}</div>
                                                <div class="col-4"><i class="fas fa-eye"></i> {$i["views"]}</div>
                                                <div class="col-4"><i class="fas fa-comment"></i> {$i["comments"]}</div>
                                            </div>
                                        </div>
										
                                    </div>
                            	</a>
                                </div>
                            {foreachelse}
                            <p class="lead">No podcasts to show</p>
                            {/foreach}
                            {* see more button *}
						</div>

						<div class="col-lg-3 mt-4 mt-lg-0">
							<aside class="sidebar">
								<h5 class="font-weight-semi-bold">Follows</h5>
								<ul class="friendHolder list mt-2 text-light">
									{foreach from=$userFollows key=k item=following}
										<li><a href="{$conf->action_url}profileView&user_id={$following["id"]}" class="text-light">{$following["name"]} {$following["surname"]} <span style="color:#777">@{$following["display_name"]}</span></a></li>
									{foreachelse}
										<li>Not following anyone</li>
									{/foreach}
								</ul>
							</aside>
						</div>
					</div>

				</div>
{/block}