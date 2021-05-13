<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Blinkist: Big ideas in small packages</title>
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
</head>
<body>
	<!-- navigation include -->
	<c:import url="/WEB-INF/jsp/include/navigation.jsp" />
	<div class="container">
		<div class="container"><h2>회원가입</h2></div>
	

		<br></br>
		<form action="${pageContext.request.contextPath }/user/join"
			method=post>
			
			<div class="form-group">
				<label for="usr">E-mail: ${email }</label> <input type="hidden"
					 id="email" name="email" value=${email }>
			</div>
			<div class="form-group">
				<label for="pwd">비밀번호:</label> <input type="password"
					class="form-control" id="password" name="password">
			</div>
			<div class="form-group form-check">
				<label class="form-check-label" for="radio1"> <input
					type="radio" class="form-check-input" id="radio1" name="gender"
					value="male" checked>남
				</label>
			</div>
			<div class="form-group form-check">
				<label class="form-check-label" for="radio2"> <input
					type="radio" class="form-check-input" id="radio2" name="gender"
					value="female">여
				</label>
			</div>
			<button type="submit" class="btn btn-secondary">가입하기</button>
		</form>
	</div>

</body>
</html>