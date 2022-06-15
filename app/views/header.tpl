{* {extends file="main.tpl"} *}

{block name=header}
			<header id="header" class="header-transparent header-effect-shrink header-no-border-bottom" data-plugin-options="{literal}{'stickyEnabled': true, 'stickyEffect': 'shrink', 'stickyEnableOnBoxed': true, 'stickyEnableOnMobile': false, 'stickyChangeLogo': true, 'stickyStartAt': 30, 'stickyHeaderContainerHeight': 70}{/literal}">
				<div class="header-body border-0 box-shadow-none bg-dark">
					<div class="header-container container container-xl-custom">
						<div class="header-row">
							<div class="header-column flex-row">
								<div class="header-logo d-lg-none">
									<a href="{$conf->app_root}">
										<img src="img/gcast-white.png" class="img-fluid" style="max-height:60px" alt="gCast logo"/>
									</a>
								</div>
								<div class="header-nav p-0">
									<div class="header-nav header-nav-line header-nav-bottom-line header-nav-light-text header-nav-line-under-text header-nav-bottom-line-effect-1 justify-content-start">
										<div class="header-nav-main header-nav-main-mobile-dark header-nav-main-square header-nav-main-dropdown-no-borders header-nav-main-effect-2 header-nav-main-sub-effect-1">
											<nav class="collapse">
												<ul class="nav nav-pills flex-column flex-lg-row" id="mainNav">
													<li><a href="{$conf->app_url}" class="nav-link">HOME</a></li>
													<li><a href="{$conf->action_url}login" class="nav-link">LISTEN</a></li>
													<li><a href="{$conf->app_url}#about" class="nav-link">ABOUT</a></li>
													<li><a href="#hiddenContactForm" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="hiddenContactForm" onclick="scrollAndFocus(this, '#contact', '#name', 70, true);" class="nav-link">CONTACT</a></li>
												</ul>
											</nav>
										</div>
									</div>
								</div>
							</div>
							<div class="header-column flex-row flex-lg-column justify-content-end justify-content-lg-center align-items-center align-items-lg-end">
								<ul class="list list-inline list-unstyled mb-0 d-none d-md-block">
									<li class="list-inline-item hover-effect-2 mb-0 me-0">
										<a href="https://www.instagram.com/" class="text-decoration-none font-weight-bold text-color-light text-1" target="_blank">
											<i class="fab fa-instagram text-5 position-relative top-2 me-1"></i> INSTAGRAM
										</a>
									</li>
									<li class="list-inline-item hover-effect-2 mb-0 mx-4 px-3">
										<a href="https://www.youtube.com/" class="text-decoration-none font-weight-bold text-color-light text-1" target="_blank">
											<i class="fab fa-youtube text-5 position-relative top-2 me-1"></i> YOUTUBE
										</a>
									</li>
									<li class="list-inline-item hover-effect-2 mb-0">
										<a href="https://www.facebook.com/" class="text-decoration-none font-weight-bold text-color-light text-1" target="_blank">
											<i class="fab fa-facebook-f text-5 position-relative top-2 me-1"></i> FACEBOOK
										</a>
									</li>
								</ul>
								<button class="btn header-btn-collapse-nav ms-5" data-bs-toggle="collapse" data-bs-target=".header-nav-main nav">
									<i class="fas fa-bars"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
			</header>
{/block}