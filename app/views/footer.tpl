{* {extends file="main.tpl"} *}
{block name=footer}
			<footer id="footer" class="bg-secondary border-0 mt-0">
				<div class="container-fluid py-4 px-5">
				</div>
				<div id="contact" class="footer-contact-form">
					<div id="hiddenContactForm" class="collapse">
						<div class="container container-xl-custom">
							<div class="row my-5">
								<div class="col text-center">
									<svg class="mb-4" width="20" height="72" viewBox="0 0 10 40" data-appear-animation-svg="true">
										<line x1="5" x2="5" y1="0" y2="40" stroke="#909294" stroke-width="1" class="appear-animation" data-appear-animation="customSVGLineAnim"></line>
									</svg>
									<div class="overflow-hidden">
										<span class="d-block text-color-light font-weight-bold d-block appear-animation" data-appear-animation="maskUp" data-appear-animation-delay="300">GET IN TOUCH</span>
									</div>
									<div class="overflow-hidden mb-3">
										<h2 class="font-weight-bold text-9 pb-1 mb-0 appear-animation" data-appear-animation="maskUp" data-appear-animation-delay="500">Contact Us</h2>
									</div>
									<div class="overflow-hidden mb-3">
										<p class="font-weight-bold text-4 mb-0 appear-animation" data-appear-animation="maskUp" data-appear-animation-delay="700">Feel free to ask any questions about the project</p>
									</div>
								</div>
							</div>
							<div class="row mb-5">
								<div class="col">
									<form class="contact-form form-style-4 form-errors-light appear-animation" data-appear-animation="fadeInUpShorter" data-appear-animation-delay="900" action="php/contact-form.php" method="POST">
										<div class="contact-form-success alert alert-success d-none mt-4">
											<strong>Success!</strong> Your message has been sent to us.
										</div>

										<div class="contact-form-error alert alert-danger d-none mt-4">
											<strong>Error!</strong> There was an error sending your message.
											<span class="mail-error-message text-1 d-block"></span>
										</div>
										
										<div class="row">
											<div class="form-group col-md-4">
												<input type="text" value="" data-msg-required="Please enter your name." maxlength="100" class="form-control" name="name" placeholder="Name" required>
											</div>
											<div class="form-group col-md-4">
												<input type="email" value="" data-msg-required="Please enter your email address." data-msg-email="Please enter a valid email address." maxlength="100" class="form-control" name="email" placeholder="E-mail" required>
											</div>
											<div class="form-group col-md-4">
												<input type="text" value="" data-msg-required="Please enter the subject." maxlength="100" class="form-control" name="subject" placeholder="Subject" required>
											</div>
										</div>
										<div class="row">
											<div class="form-group col">
												<textarea maxlength="5000" data-msg-required="Please enter your message." rows="8" class="form-control" name="message" placeholder="Message" required></textarea>
											</div>
										</div>
										<div class="row">
											<div class="form-group col join-section">
												<button type="button" class="btn btn-outline btn-rounded btn-with-arrow mb-2 login" data-loading-text="Loading...">Send message!</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="footer-copyright bg-tertiary py-3">
					<div class="container-fluid py-4 px-5">
						<div class="row justify-content-center">
							<div class="col-auto d-flex flex-column align-items-center">
							<div>
							<a href="{$conf->action_url}wallView">
							<img src="img/gcast-white.png" class="img-fluid" alt="gCast logo" style="max-height:60px;"/>
							</a>
							</div>
								<p class="text-color-light font-weight-light opacity-4 mb-0">© Copyright 2022. All Rights Reserved.</p>
							</div>
							<div class="col-auto d-flex">
								<ul class="list list-inline list-unstyled mb-0 d-flex align-items-center">
									<li class="list-inline-item me-0 mb-0"><a href="https://www.instagram.com/" class="text-color-light font-weight-bold" target="_blank"><i class="fab fa-instagram me-1"></i> INSTAGRAM</a></li>
									<li class="list-inline-item mb-0 mx-4"><a href="https://www.youtube.com/" class="text-color-light font-weight-bold" target="_blank"><i class="fab fa-youtube me-1"></i> YOUTUBE</a></li>
									<li class="list-inline-item mb-0"><a href="https://www.facebook.com/" class="text-color-light font-weight-bold" target="_blank"><i class="fab fa-facebook-f me-1"></i> FACEBOOK</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</footer>
{/block}