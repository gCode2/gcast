{extends file="main.tpl"}


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
<section class="page-header page-header-modern page-header-lg">
	<div class="container">
		<div class="row">
			<div class="col-md-12 align-self-center p-static order-2 text-center">
				<h1 class="font-weight-bold text-light">Hi, {$user}, let's check what's new!</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
			
					<form id="searchPodcasts" class="" oninput="ajaxPostForm('searchPodcasts','{$conf->action_root}wallViewList','searchList');">
				<div class="input-group mb-0 mt-3">
					<span class="input-group-text text-3" id="basic-addon1"><i class="icon-magnifier icons"></i></span>
					<input type="text" class="form-control searchBar" placeholder="@username or podcast title" name="searchPodcasts" aria-label="Podcasts" aria-describedby="basic-addon1" value="{$searchForm->search}"/>
				</div>
					</form>
			</div>
			
		</div>
		<div class="row">
		<div class="col-12 position-relative">
			<ul class="list searchList position-absolute" id="searchList">
			{include file="searchList.tpl"}
			</ul>
		</div>
		</div>	
	</div>
</section>

				<div class="container pt-3 pb-2" style="min-height:60vh">

					<div class="row pt-2">
						<div class="col-lg-2 mb-5 mb-lg-0">
							<aside class="sidebar">
								<div class="accordion" id="accordionQuaternary">
								<div class="card card-default">
									<div class="card-header bg-color-quaternary" id="collapseQuaternaryHeadingOne">
										<h4 class="card-title m-0">
											<a class="accordion-toggle text-color-light" data-bs-toggle="collapse" data-bs-target="#collapseQuaternaryOne" aria-expanded="true" aria-controls="collapseQuaternaryOne">
												Category list
											</a>
										</h4>
									</div>
									<div id="collapseQuaternaryOne" class="collapse" aria-labelledby="collapseQuaternaryHeadingOne" data-bs-parent="#accordionQuaternary" style="">
										<div class="card-body" style="padding:0.8rem">
											<ul class="nav nav-list flex-column mb-0">
									<li class="nav-item"><a class="nav-link" href="#">Comedy({$podcastsCats["1"]})</a></li>
									<li class="nav-item"><a class="nav-link" href="#">History ({$podcastsCats["2"]})</a></li>
									<li class="nav-item"><a class="nav-link" href="#">Lifestyle ({$podcastsCats["3"]})</a></li>
									<li class="nav-item"><a class="nav-link" href="#">Art ({$podcastsCats["4"]})</a></li>
									<li class="nav-item"><a class="nav-link" href="#">Politics ({$podcastsCats["5"]})</a></li>
									<li class="nav-item"><a class="nav-link" href="#">News ({$podcastsCats["6"]})</a></li>
									<li class="nav-item"><a class="nav-link" href="#">Education ({$podcastsCats["7"]})</a></li>
									<li class="nav-item"><a class="nav-link" href="#">Technology ({$podcastsCats["8"]})</a></li>
									<li class="nav-item"><a class="nav-link" href="#">Crime ({$podcastsCats["9"]})</a></li>
									<li class="nav-item"><a class="nav-link" href="#">Horror ({$podcastsCats["10"]})</a></li>
									<li class="nav-item"><a class="nav-link" href="#">Music ({$podcastsCats["11"]})</a></li>
									<li class="nav-item"><a class="nav-link" href="#">Games ({$podcastsCats["12"]})</a></li>
								</ul>
										</div>
									</div>
								</div>
								
							</div>
							</aside>
						</div>
						<div class="col-lg-7" id="podcastsContainer">
						{include file="podcastsList.tpl"}
						</div>
						<div class="col-lg-3 mt-4 mt-lg-0">
							<aside class="sidebar">
								<h5 class="font-weight-semi-bold">Recent followers</h5>
								<ul class="friendHolder list mt-2 text-light">
									{foreach from=$followers|@array_slice:0:5 item=follower}
										<li>&emsp;<a href="{$conf->action_url}profileView&user_id={$follower["id"]}" class="text-light">{$follower["name"]} {$follower["surname"]} @{$follower["display_name"]}</a></li>

									{/foreach}
									{if $followers|@count > 5}<li class="text-center">Show more</li>{/if}
									{if $followers|@count == 0}<li class="text-center">No followers</li>{/if}
								</ul>
							</aside>
							<aside class="sidebar">
								<h5 class="font-weight-semi-bold">Following</h5>
								<ul class="friendHolder list mt-2 text-light">
								{foreach from=$following|@array_slice:0:5 item=follow}
										<li>&emsp;<a href="{$conf->action_url}profileView&user_id={$follow["id"]}" class="text-light">{$follow["name"]} {$follow["surname"]} @{$follow["display_name"]}</a></li>

									{/foreach}
									{if $following|@count > 5}<li class="text-center">Show more</li>{/if}
									{if $following|@count == 0}<li class="text-center">No followers</li>{/if}
								</ul>
							</aside>
						</div>

					</div>

				</div>

			</div>

{/block}