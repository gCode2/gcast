{extends file="main.tpl"}
{block name=content}
<section id="home" class="section border-0 bg-dark overlay overlay-show overlay-op-8 overflow-hidden m-0" style="height:100vh;">
					<div class="background-image-wrapper position-absolute top-0 left-0 right-0 bottom-0 animated kenBurnsToLeft" style="background-image: url(img/bg.png); background-size: cover; background-position: center; animation-duration: 20s;"></div>
					<div class="container position-relative z-index-3 h-100 loginHolder">
					<div class="row align-items-center justify-content-center h-100 landing">
					<div class="box-content">
											<h4 class="color-primary font-weight-semibold text-7 text-uppercase mb-3">Log into your account</h4>
											<form action="{$conf->action_root}login" id="frmSignIn" method="post" class="needs-validation" novalidate="novalidate">
												<div class="row">
													<div class="form-group col">
														<label class="form-label">Username or E-mail Address</label>
														<input type="text" name="username" value="" class="form-control form-control-lg" required="">
													</div>
												</div>
												<div class="row">
													<div class="form-group col">
														
														<label class="form-label">Password</label>
														<input type="password" name="password" value="" class="form-control form-control-lg" required="">
														<a class="text-white float-end" href="{$conf->action_url}register">(No account yet? Register now for free!)</a>
													</div>
												</div>
												<div class="row justify-content-center">
													<div class="form-group col-lg-6 join-section">
														<button type="submit" class="btn btn-outline btn-rounded btn-with-arrow mb-2 login">Login</button>
													</div>
												</div>
											</form>
										</div>
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