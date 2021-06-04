<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html style="height:100%" xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>회원가입</title>
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
</head>
<body style="height:100%; width:100%;">
	<!-- navigation include -->
	<c:import url="/WEB-INF/jsp/include/navigation.jsp" />
	<div class="container">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<h2 align="center">로그인</h2>
				<c:url value="/loginprocess" var="loginUrl"/>
				<form role="form" autocomplete="off"
					action="${loginUrl }" method=post>
					<div class="form-group">
						<label for="email">이메일 주소</label> <input type="text"
							class="form-control" name="email" id="email" 
						placeholder="이메일을 입력해주세요">
					</div>
					<div class="form-group">
						<label for="password">비밀번호</label> <input type="password"
							class="form-control" name="password" id="password"
							placeholder="비밀번호를 입력해주세요" required>
					</div>
				
					<div class="form-group text-right">
						<button type="submit" id="submit" class="btn btn-primary">
						로그인<i class="fa fa-check spaceLeft"></i>
						</button>
					</div>
					<br/><br/>
				</form>

			</div>
			<div class="col-md-4"></div>
		</div>
	</div>

	<!-- navigation include -->
	<div id="content"></div>
  <footer><c:import url="/WEB-INF/jsp/include/footer.jsp" /></footer>

	
</body>
</html>