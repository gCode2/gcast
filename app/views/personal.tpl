<div class="container position-relative z-index-3 h-100 loginHolder">
		<div class="row align-items-center justify-content-center h-100 landing">
			<div class="box-content personal">
											<h4 class="color-primary font-weight-semibold text-7 text-center mb-3">Personal information</h4>
											<form action="{$conf->action_root}editData" id="frmSignIn" method="post" class="">
												<div class="row">
													<div class="form-group col">
                                                   
														<label class="form-label">Name</label>
                                                         <div class="editHolder">
														<input type="text" name="name" value="{$userData["name"]}" class="form-control form-control-lg" required="">
                                                        <div class="edit"><i class="fas fa-edit"></i></div>
                                                        </div>
													</div>
                                                    <div class="form-group col">
														<label class="form-label">Surname</label>
                                                        <div class="editHolder">
														<input type="text" name="surname" value="{$userData["surname"]}" class="form-control form-control-lg" required="">
                                                        <div class="edit"><i class="fas fa-edit"></i></div>
                                                        </div>
													</div>
												</div>
                                                <div class="row">
													<div class="form-group col">
														<label class="form-label">Email</label>
                                                        <div class="editHolder">
														<input type="email" name="email" value="{$userData["email"]}" class="form-control form-control-lg" required="">
                                                        <div class="edit"><i class="fas fa-edit"></i></div>
                                                        </div>
													</div>
												</div>
                                                <div class="row">
													<div class="form-group col">
														<label class="form-label">Setup your bio (500 characters allowed)</label>
														<div class="editHolder">
														<textarea class="form-control text-light" aria-label="Description" maxlength="500" name="bio">{$userData["bio"]}</textarea>
														<div class="edit"><i class="fas fa-edit"></i></div>
														</div>
													</div>
												</div>
                                                <div class="row">
													<div class="form-group col">
														<label class="form-label">Phone number</label>
                                                        <div class="editHolder">
														<input type="text" name="phone" value="{$userData["phone"]}" class="form-control form-control-lg" pattern="{literal}\(?\+[0-9]{1,3}\)? ?-?[0-9]{1,3} ?-?[0-9]{3,5} ?-?[0-9]{4}( ?-?[0-9]{3})? ?(\w{1,10}\s?\d{1,6})?{/literal}" title="Please provide valid phone number (+00 000 000 000)" required>
                                                        <div class="edit"><i class="fas fa-edit"></i></div>
                                                        </div>
													</div>
												</div>
												<div class="row">
													<div class="form-group col">
														<label class="form-label">Password</label>
                                                        <div class="editHolder">
														<input type="password" name="password" value="{$userData["password"]}" class="form-control form-control-lg pass" required="" >
                                                        <div class="passEye"><i class="fas fa-eye-slash text-light passVisible"></i></div>
                                                        </div>
													</div>
												</div>
												<div class="row">
													<div class="form-group col">
														<label class="form-label">Confirm password</label>
                                                        <div class="editHolder">
														<input type="password" name="password2" value="{$userData["password"]}" class="form-control form-control-lg pass2" required="" >
                                                        <div class="edit"></div>
                                                        </div>
													</div>
												</div>
												<div class="row justify-content-center">
													<div class="form-group col-lg-6 join-section">
														<button type="submit" class="btn btn-outline btn-rounded btn-with-arrow mb-2 login">Save changes!</button>
													</div>
												</div>
											</form>
			</div>
		</div>
	</div>
	<script>
    if ( window.history.replaceState ) {
        window.history.replaceState( null, null, window.location.href );
    }
</script>
	<script>
	const passVisible = document.querySelector(".passVisible");
	const pass1 = document.querySelector('.pass');
	const pass2 = document.querySelector('.pass2');
	passVisible.addEventListener("click", function(ev){
		ev.preventDefault();


		if(passVisible.classList.contains("fa-eye-slash")){
        passVisible.classList.remove('fa-eye-slash');
        passVisible.classList.add('fa-eye');
		pass1.setAttribute("type", "text");
		pass2.setAttribute("type", "text");
    }
    else{
        passVisible.classList.remove('fa-eye');
        passVisible.classList.add('fa-eye-slash');
		pass1.setAttribute("type", "password");
		pass2.setAttribute("type", "password");
    }
	});

	</script>

