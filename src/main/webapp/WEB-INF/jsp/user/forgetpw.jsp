<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html style="height: 100%">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>비밀번호 재설정</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/css/styles.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath }/css/blog-home.css"
	rel="stylesheet">
<!-- modal login CSS -->
<link href="${pageContext.request.contextPath }/css/loginform.css"
	rel="stylesheet" />
<!-- jquery -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/update.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</head>
<body style="height: 100%; width: 100%;">
	<!-- navigation include -->
	<c:import url="/WEB-INF/jsp/include/navigation.jsp" />
	<div class="container">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<h2>비밀번호 재설정</h2>
				<br />
				

				<div class="form-group">
					<label for="email">이메일 주소</label> <input type="text"
						class="form-control" name="email" id="email"
						placeholder="가입 이메일을 입력해 주세요" required>
					<button class="mail_check_button btn btn-primary" style="float:right">확인</button>

				</div>

				<div class="form-group">
					<label for="authkey">인증번호</label> <input type="text"
						class="form-control" name="authcode" id="authcode"
						placeholder="인증번호" required>
						
					<p id="compare-text" style="text-align:right">인증</p>

				</div>
				<form role="form" autocomplete="off"
					onsubmit="return submitCheck();"
					action="${pageContext.request.contextPath }/user/forgetUpdate" method=post>

					<input type="hidden" id="authmail" name="email" value="">

					<div class="form-group">
						<label for="password">비밀번호</label> <input type="password"
							class="form-control" name="newpassword" id="password"
							placeholder="재설정 비밀번호">
					</div>
					<div class="form-group">
						<label for="PasswordCheck">비밀번호 확인</label> <input type="password"
							class="form-control" id="PasswordCheck"
							placeholder="비밀번호 확인">
					</div>


					<div id="same"
						style="color: blue; font-weight: bold; text-align: center;">등록하실
						비밀번호를 동일하게 입력하셨습니다.</div>
					<div id="notsame"
						style="color: red; font-weight: bold; text-align: center;">등록하실
						비밀번호가 동일하지 않습니다.</div>

					<br /> <br />
					<div class="form-group text-center">
						<button type="submit" id="submit-btn" class="btn btn-primary">
							비밀번호수정<i class="fa fa-check spaceLeft"></i>
						</button>

					</div>
				</form>

			</div>
			<div class="col-md-4"></div>
		</div>
	</div>

	<!-- navigation include -->
	<div id="content"></div>
	<footer>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</footer>

	<script type="text/javascript" src="${pageContext.request.contextPath }/js/forgotpassword.js"></script>

</body>
</html>