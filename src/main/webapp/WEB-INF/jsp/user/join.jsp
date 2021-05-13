<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>대신해주세요 ${pageContext.request.contextPath }</title>

<!-- Core theme CSS (includes Bootstrap)-->
        <link href="${pageContext.request.contextPath }/css/styles.css" rel="stylesheet" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath }/css/blog_home.css" rel="stylesheet">

<title>로그인</title>
</head>
<body>
	<!-- Navigation -->
	<c:import url="/WEB-INF/jsp/include/navigation.jsp" />
	<br/>
	<div class="container">
		<div class="container"><h2>회원가입</h2></div>
		
		<br></br>
		<form action="${pageContext.request.contextPath }/user/join" method=post>
			<div class="form-group">
				<label for="usr">아이디:</label> <input type="text"
					class="form-control" id="id" name="id">
			</div>
			<div class="form-group">
				<label for="pwd">비밀번호:</label> <input type="password"
					class="form-control" id="password" name="password">
			</div>
			<div class="form-group">
				<label for="usr">이름:</label> <input type="text" class="form-control"
					id="name" name="name">
			</div>
			<div class="form-group">
				<label for="usr">E-mail:</label> <input type="text"
					class="form-control" id="email" name="email">
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