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

				<section class="page-header page-header-modern page-header-md ">
					<div class="container-fluid">
						<div class="row align-items-center">

							<div class="col">
								<div class="row">
									<div class="col-md-12 align-self-center p-static order-2 text-center">
										<div class="overflow-hidden pb-2">
											<h1 class="text-light font-weight-bold text-9">Profile setup</h1>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</section>

				<div class="container py-2" style="min-height:50vh">
                    <div class="row">
						<div class="col-lg-3 order-2 order-lg-1 mt-4 mt-lg-0 appear-animation animated fadeIn appear-animation-visible" data-appear-animation="fadeIn" data-appear-animation-delay="300" style="animation-delay: 300ms;">
							<aside class="sidebar">
								<h5 class="font-weight-semi-bold">What do you want to do?</h5>
								<ul class="nav nav-list flex-column mb-5 text-light">
									<li class="nav-item"><a class="nav-link" href="{$conf->action_url}profile&option=personal">Personal information</a></li>
									<li class="nav-item"><a class="nav-link" href="{$conf->action_url}profile&option=podcasts">Your podcasts</a></li>
									<li class="nav-item"><a class="nav-link" href="{$conf->action_url}profile&option=stats">Statistics</a></li>
								</ul>
								
							</aside>
						</div>
						<div class="col-lg-9 order-1 order-lg-2 appear-animation animated maskUp appear-animation-visible" data-appear-animation="maskUp" data-appear-animation-delay="100" style="animation-delay: 100ms;">

							<div class="row">
								<div class="col">

									<div class="card">


                                    {if !isset($smarty.get.option)}
                                    
                                    {include file="personal.tpl"}
                                    
                                    {else}
									{$legalLinks = ["personal", "podcasts", "stats"]}
									{assign var="link" value=$smarty.get.option}
										{if $link|in_array:$legalLinks}
											{assign var="link" value=$smarty.get.option|cat:".tpl"}
                                   			 {include file=$link}
										{else}
											<h2 class="text-center mt-4">No such profile option!</h2>
										{/if}

                                    
                                    {/if}
                                    </div>


								</div>
							</div>
							

						</div>

					</div>

				</div>
<script>
    if ( window.history.replaceState ) {
        window.history.replaceState( null, null, window.location.href );
    }
</script>


{/block}