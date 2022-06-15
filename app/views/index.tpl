{extends file="main.tpl"}
{* {include file="header.tpl"} *}

{block name=content}
				
				<section id="home" class="section border-0 bg-dark overlay overlay-show overlay-op-8 overflow-hidden m-0" style="height:100vh;">
					<div class="background-image-wrapper position-absolute top-0 left-0 right-0 bottom-0 animated kenBurnsToLeft" style="background-image: url(img/bg.png); background-size: cover; background-position: center; animation-duration: 20s;"></div>
					<div class="container position-relative z-index-3 h-100">
						<div class="row align-items-center justify-content-center h-100 landing">
							<div class="col-12 pt-5 mt-3">
                                <div class="row">
                                <div class="col-5 landing-left"><img src="img/gcast-white.png" class="logo" alt="Gcast Logo"></div>
                                <div class="col-7 landing-right">
								<div class="lr-heading">
									<h1>Welcome to the World of Podcasts!</h1>
									<p>&bdquo;Listening is hearing what isn't said&rdquo; ~ Simon Sinek</p>
									</div>
									<div class="lr-content">
									<ul class="list list-icons list-primary">
										<li class="appear-animation animated fadeInUp appear-animation-visible" data-appear-animation="fadeInUp" data-appear-animation-delay="0" style="animation-delay: 0ms;"><i class="fas fa-globe"></i>Access unlimited podcasts from all around the World</li>
										<li class="appear-animation animated fadeInUp appear-animation-visible" data-appear-animation="fadeInUp" data-appear-animation-delay="300" style="animation-delay: 300ms;"><i class="icon-magic-wand icons"></i>Create your own content.</li>
										<li class="appear-animation animated fadeInUp appear-animation-visible" data-appear-animation="fadeInUp" data-appear-animation-delay="600" style="animation-delay: 600ms;"><i class="fas fa-star"></i>Interact with others.</li>
										<li class="appear-animation animated fadeInUp appear-animation-visible" data-appear-animation="fadeInUp" data-appear-animation-delay="1200" style="animation-delay: 1200ms;"><i class="icon-puzzle icons"></i>Be a part of our Community!</li>
									</ul>
									<div class="join-section">
									<a href="{$conf->action_url}register">
							<button type="button" class="btn btn-outline btn-rounded btn-with-arrow mb-2 register" href="#">Join now!<span><i class="fas fa-chevron-right"></i></span></button>
</a>
							<a href="{$conf->action_root}login">
							<button type="button" class="btn btn-outline btn-rounded btn-with-arrow mb-2 login" href="#">Log in!<span><i class="fas fa-chevron-right"></i></span></button>
							</a>
							</div>
									</div>
								</div>
                                </div>

								
							</div>
							
						</div>
						
					</div>
				</section>

				<section class="section bg-secondary border-0 py-0 m-0">
					<div class="container container-xl-custom">
						<div class="row custom-borders-divider-style-1">
							<div class="col-sm-6 col-lg-3 text-center px-0">
								<a href="#" class="custom-spotify-hover-effect text-decoration-none text-color-light text-4 d-block py-5 appear-animation" target="_blank" data-appear-animation="fadeInRightShorter"><i class="fab fa-spotify me-1"></i> SPOTIFY</a>
							</div>
							<div class="col-sm-6 col-lg-3 text-center px-0">
								<a href="#" class="custom-itunes-hover-effect text-decoration-none text-color-light text-4 d-block py-5 appear-animation" target="_blank" data-appear-animation="fadeInRightShorter" data-appear-animation-delay="200"><i class="fab fa-apple me-1"></i> ITUNES</a>
							</div>
							<div class="col-sm-6 col-lg-3 text-center px-0">
								<a href="#" class="custom-amazon-hover-effect text-decoration-none text-color-light text-4 d-block py-5 appear-animation" target="_blank" data-appear-animation="fadeInRightShorter" data-appear-animation-delay="400"><i class="fab fa-amazon me-1"></i> AMAZON</a>
							</div>
							<div class="col-sm-6 col-lg-3 text-center px-0">
								<a href="#" class="custom-googlemusic-hover-effect text-decoration-none text-color-light text-4 d-block py-5 appear-animation" target="_blank" data-appear-animation="fadeInRightShorter" data-appear-animation-delay="600"><i class="fab fa-google me-1"></i> GOOGLE MUSIC</a>
							</div>
						</div>
					</div>
				</section>

				<section id="about" class="section section-height-4 border-0 m-0">
					<div class="container container-xl-custom">
						<div class="row">
							<div class="col text-center">
								<svg class="mb-4" width="20" height="72" viewBox="0 0 10 40" data-appear-animation-svg="true">
									<line x1="5" x2="5" y1="0" y2="40" stroke="#909294" stroke-width="1" class="appear-animation" data-appear-animation="customSVGLineAnim"></line>
								</svg>
								<div class="overflow-hidden">
									<span class="d-block text-color-light font-weight-bold d-block appear-animation" data-appear-animation="maskUp" data-appear-animation-delay="300">ABOUT US</span>
								</div>
								<div class="overflow-hidden mb-3">
									<h2 class="font-weight-bold text-9 pb-1 mb-0 appear-animation" data-appear-animation="maskUp" data-appear-animation-delay="500">GCast</h2>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<p class="font-weight-bold line-height-9 text-4 mb-4 pb-2 appear-animation" data-appear-animation="fadeInUpShorter" data-appear-animation-delay="700">GCast is a non-profit project powered by one person. It allows you to enter the World of Podcasts, communicate with your friends or favourite content creators and much more!</p>
								<p class="line-height-9 text-4 mb-4 pb-2 appear-animation" data-appear-animation="fadeInUpShorter" data-appear-animation-delay="850">Project is still in work. </p>
								<p class="line-height-9 text-4 mb-4 pb-2 appear-animation" data-appear-animation="fadeInUpShorter" data-appear-animation-delay="850">
								Used technologies: <strong>HTML, CSS, JavaScript, PHP</strong>.</p>
								<p class="line-height-9 text-4 pb-2 appear-animation" data-appear-animation="fadeInUpShorter" data-appear-animation-delay="850">
								Frameworks used: <strong><a href="http://amelia-framework.eu/" target="_blank">Amelia</a>, <a href="https://getbootstrap.com/" target="_blank">Bootstrap</a>, <a href="https://medoo.in/" target="_blank">Medoo</a></strong>
								</p>
							</div>
						</div>
					</div>
				</section>

{/block}
{* {include file="footer.tpl"} *}