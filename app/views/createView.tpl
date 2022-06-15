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

<section id="createContent" class="section border-0 bg-dark overlay overlay-show overlay-op-8 overflow-hidden m-0" style="height: max-content;">
					
					<div class="container position-relative z-index-3 h-100 loginHolder">
					<div class="row align-items-center justify-content-center h-100 landing">
					<div class="box-content">
											<h4 class="color-primary font-weight-semibold text-7 mb-3">{$user}, let's create some content!</h4>
											<form action="{$conf->action_root}createView" id="frmSignIn" method="post" class="needs-validation" novalidate="novalidate" enctype="multipart/form-data">
												<div class="row">
                                                    <div class="form-group col">
														<label class="form-label">Title</label>
														<input type="text" name="title" value="" class="form-control form-control-lg" minlength="3" required="">
													</div>
												</div>
                                                <div class="row">
													<div class="form-group col">
														<label class="form-label">Description (500 characters allowed)</label>
														<textarea class="form-control" aria-label="Description" maxlength="500" name="description"></textarea>
													</div>
												</div>
                                                <div class="row">
													<div class="form-group col">
                                                    <label for="category">Category</label>
														<select id="category" class="form-select form-control h-auto py-2" data-msg-required="Please select a category." name="category" required>
													        		<option value="" selected disabled>Choose...</option>
													        		<option value="1">Comedy</option>
													        		<option value="2">History</option>
													        		<option value="3">Lifestyle</option>
                                                                    <option value="4">Art</option>
													        		<option value="5">Politics</option>
													        		<option value="6">News</option>
                                                                    <option value="7">Education</option>
													        		<option value="8">Technology</option>
													        		<option value="9">Crime</option>
                                                                    <option value="10">Horror</option>
													        		<option value="11">Music</option>
																	<option value="12">Games</option>
													      		</select>
													</div>
												</div>
												<div class="row">
													<div class="form-group col">
														
														<label class="form-label">Upload your podcast!</label>
														<input type="file" name="podcast" id="podcast" class="form-control form-control-lg" required="" accept="audio/*">
													</div>
                                                    
												</div>
												<div class="row justify-content-center">
													<div class="form-group col-lg-6 join-section">
														<button type="submit" class="btn btn-outline btn-rounded btn-with-arrow mb-2 login">Upload!</button>
													</div>
												</div>
											</form>
										</div>
					</div>
						</div>
				</section>
				<script>
    if ( window.history.replaceState ) {
        window.history.replaceState( null, null, window.location.href );
    }
</script>
{/block}