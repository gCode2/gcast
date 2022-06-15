{extends file="main.tpl"}
{block name=content}
<section id="home" class="section border-0 bg-dark overlay overlay-show overlay-op-8 overflow-hidden m-0">
	<div class="background-image-wrapper position-absolute top-0 left-0 right-0 bottom-0 animated kenBurnsToLeft" style="background-image: url(img/bg.png); background-size: cover; background-position: center; animation-duration: 20s;"></div>
	<div class="container position-relative z-index-3 h-100 loginHolder">
		<div class="row align-items-center justify-content-center h-100 landing">
			<div class="box-content">
											<h4 class="color-primary font-weight-semibold text-7 text-uppercase mb-3">Create your account</h4>
											<form action="{$conf->action_root}register" id="frmSignIn" method="post">
												<div class="row">
													<div class="form-group col">
														<label class="form-label">Name</label>
														<input type="text" name="name" class="form-control form-control-lg" required="">
													</div>
                                                    <div class="form-group col">
														<label class="form-label">Surname</label>
														<input type="text" name="surname" class="form-control form-control-lg" required="">
													</div>
												</div>
                                                <div class="row">
													<div class="form-group col">
														<label class="form-label">Email</label>
														<input type="email" name="email" class="form-control form-control-lg" required="">
													</div>
												</div>
                                                <div class="row">
													<div class="form-group col">
														<label class="form-label">Display name (Username)</label>
														<input type="text" name="username" minlength="3" title="Username should be at least 3 characters long" class="form-control form-control-lg" required="">
													</div>
												</div>
                                                <div class="row">
													<div class="form-group col">
														<label class="form-label">Phone number</label>
														<input type="text" name="phone" pattern="{literal}\(?\+[0-9]{1,3}\)? ?-?[0-9]{1,3} ?-?[0-9]{3,5} ?-?[0-9]{4}( ?-?[0-9]{3})? ?(\w{1,10}\s?\d{1,6})?{/literal}" title="Please provide valid phone number (+00 000 000 000)" class="form-control form-control-lg" required>
													</div>
												</div>
												<div class="row">
													<div class="form-group col">
														
														<label class="form-label">Password</label>
														<input type="password" name="password" value="" class="form-control form-control-lg" required="">
													</div>
                                                    <div class="form-group col">
														
														<label class="form-label">Confirm Password</label>
														<input type="password" name="password2" value="" class="form-control form-control-lg" required="">
                                                        
														<a class="text-white float-end" href="{$conf->action_url}login">(Registered already? Login now!)</a>
													</div>
                                                    
												</div>
												<div class="row justify-content-center">
													<div class="form-group col-lg-6 join-section">
														<button type="submit" class="btn btn-outline btn-rounded btn-with-arrow mb-2 login">Register!</button>
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