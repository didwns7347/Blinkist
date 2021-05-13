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
								<img class="kakaologin"
								src="${pageContext.request.contextPath }/assets/images/kakaologin.png" />
							</a>
						</div>
						<div class="social-login">
							<a href="${url }"> <img class="naverlogin"
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