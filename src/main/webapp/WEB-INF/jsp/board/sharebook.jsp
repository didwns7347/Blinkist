<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>View Book</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/images/favicon.ico" />
<link rel="shortcut icon" href="#">

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>

<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />

<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/css/styles.css" rel="stylesheet" />
<!-- modal login CSS -->
<link href="${pageContext.request.contextPath }/css/loginform.css" rel="stylesheet" />

<!-- SEARCH CSS -->
<link href="css/search.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/css/sample.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/js/viewbook.js"></script>
</head>
<body  id="page-top">
	<!-- navigation include -->
	<c:import url="/WEB-INF/jsp/include/navigation.jsp" />
	<br/><br/><br/><br/><br/>
	<div class="container">
		<div class="row">
			<div class="col-sm-4" id="smallbookimg">
				<div class="row mb-4">
					<img class="img-fluid mx-auto d-block img-thumbnail"
						src="${map.img_path}" alt="Chania" width="460" height="345">
				</div>

			</div>
			<div class="col-sm-8">
				<h1 class="mb-4">${map.title }</h1>
				<h3 class="mb-4">${map.subtitle }</h3>
				<h4 class="mb-4">${map.name }</h4>
				<div class="row mb-4">
					<div class="col-sm-5">
						<i style='font-size: 15px' class='far'>&#xf017;</i>
						${map.running_Time}-minute read
					</div>
					<div class="col-sm-5">
						<i class="fas fa-headphones"></i>
						<c:if test="${map.audio_Check eq true}">
								Audio available
							</c:if>
						<c:if test="${map.audio_Check ne true}">
								Audio unavailable
							</c:if>
					</div>
				</div>

				<div class="row mb-4">
					<div class="col-sm-3">
						<a href="${map.buyLink }" class="btn btn-outline-primary"
							role="button"> Buy Book </a>
					</div>
				</div>
				<s:authentication property="principal" var="authUser" />
				

				<div class="row mb-4">
					<div class="container">
						<ul class="nav nav-pills" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="pill" href="#home">Synopsis</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="pill"
								href="#menu1">Who is it for?</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="pill"
								href="#menu2">About Author</a></li>
						</ul>

						<div class="tab-content">
							<div id="home" class="container tab-pane active">
								<br>
								<p>${map.synopsis }</p>
							</div>
							<div id="menu1" class="container tab-pane fade">
								<br>
								<p>${map.target }</p>
							</div>
							<div id="menu2" class="container tab-pane fade">
								<br>
								<p>${map.introduce }</p>
							</div>
						</div>
					</div>

				</div>

			</div>
			<div class="col-sm-4" id="bigbookimg">
				<div class="row mb-4">
					<img class="img-fluid mx-auto d-block img-thumbnail"
						src="${map.img_path}" alt="Chania" width="460" height="345">
				</div>

			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/jsp/include/footer.jsp" />

</body>
</html>