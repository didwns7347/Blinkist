<!-- The Modal -->
<div class="modal" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">

			

			<!-- Modal body -->
			<div class="modal-body">
				<div id="logreg-forms">
					<form class="form-signin">
						<h1 class="h3 mb-3 font-weight-normal" style="text-align: center">
							LOGIN</h1>
						<div class="social-login">
							<a
								href="https://kauth.kakao.com/oauth/authorize?client_id=43af0ecd5ee53917f6ec8b05c026e768&redirect_uri=http://localhost:8080/blinkist/user/kakaoLogin&response_type=code">
								<img class="img-fluid"
								src="${pageContext.request.contextPath }/assets/images/kakaoLogin.JPG" />
							</a>

						</div>
						<div class="social-login">
							<a href="${url }"> <img class="img-fluid"
								src="${pageContext.request.contextPath }/assets/images/naverlogin.png" /></a>
						</div>
						
						<input type="email" id="inputEmail" class="form-control"
							placeholder="Email address" required="" autofocus=""> <input
							type="password" id="inputPassword" class="form-control"
							placeholder="Password" required="">

						<button class="btn btn-success btn-block" type="submit">
							<i class="fas fa-sign-in-alt"></i> Sign in
						</button>
						<a href="#" id="forgot_pswd">Forgot password?</a>
						<hr>
						<!-- <p>Don't have an account!</p>  -->
						<button class="btn btn-primary btn-block" type="button"
							id="btn-signup">
							<i class="fas fa-user-plus"></i> Sign up New Account
						</button>
					</form>

					<form action="/reset/password/" class="form-reset">
						<input type="email" id="resetEmail" class="form-control"
							placeholder="Email address" required="" autofocus="">
						<button class="btn btn-primary btn-block" type="submit">Reset
							Password</button>
						<a href="#" id="cancel_reset"><i class="fas fa-angle-left"></i>
							Back</a>
					</form>

					<form action="/signup/" class="form-signup">
						<div class="social-login">
							<button class="btn facebook-btn social-btn" type="button">
								<span><i class="fab fa-facebook-f"></i> Sign up with
									Facebook</span>
							</button>
						</div>
						<div class="social-login">
							<button class="btn google-btn social-btn" type="button">
								<span><i class="fab fa-google-plus-g"></i> Sign up with
									Google+</span>
							</button>
						</div>

						<p style="text-align: center">OR</p>

						<input type="text" id="user-name" class="form-control"
							placeholder="Full name" required="" autofocus=""> <input
							type="email" id="user-email" class="form-control"
							placeholder="Email address" required autofocus=""> <input
							type="password" id="user-pass" class="form-control"
							placeholder="Password" required autofocus=""> <input
							type="password" id="user-repeatpass" class="form-control"
							placeholder="Repeat Password" required autofocus="">

						<button class="btn btn-primary btn-block" type="submit">
							<i class="fas fa-user-plus"></i> Sign Up
						</button>
						<a href="#" id="cancel_signup"><i class="fas fa-angle-left"></i>
							Back</a>
					</form>
					<br>

				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>
</div>