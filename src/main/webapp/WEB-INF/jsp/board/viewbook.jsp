<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Blinkist: Big ideas in small packages</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/css/styles.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/css/blog-home.css" rel="stylesheet">
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
</head>
<body>
	<!-- navigation include -->
	<c:import url="/WEB-INF/jsp/include/navigation.jsp" />
	<div class="container">
		<div class="row">
			<div class="col-sm-8">
				<h1 class="mb-4">${map.title }</h1>
				<h3 class="mb-4">소제목</h3>
				<h4 class="mb-4">${map.name }</h4>
				<div class="row mb-4">
					<div class="col-sm-5">
						<i style='font-size: 15px' class='far'>&#xf017;</i> ${map.running_Time}-minute read
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
						<a href="#" class="btn btn-outline-success" role="button">Add
							to library</a>
					</div>
					<div class="col-sm-3">
						<a href="${map.buyLink }" class="btn btn-outline-primary" role="button"> Buy
							Book </a>
					</div>
					<div class="col-sm-3">
						<a href="#" class="btn btn-outline-light text-dark" role="button">Send
							to kindle</a>
					</div>
				</div>

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
			<div class="col-sm-4" >
				<div class="row mb-4">
					<img class="img-fluid mx-auto d-block img-thumbnail"
						src="${map.img_path}"
						alt="Chania" width="460" height="345">
				</div>



			</div>
		</div>

		<div class="row mb-4" >
			<div class="col-sm-12">
				<h2 class="mb-4">추천작</h2>
			</div>

			<div class="col-lg-4 col-md-5 mb-3">
				<div class="card h-100">
					<a href="#!"><img class="card-img-top"
						src="${pageContext.request.contextPath }/assets/coverimgs/jjang9.png"
						alt="..." /></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#!">Item One</a>
						</h4>
						<h5>$24.99</h5>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Amet numquam aspernatur!</p>
					</div>
					<div class="card-footer">
						<small class="text-muted">★ ★ ★ ★ ☆</small>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-5 mb-3">
				<div class="card h-100">
					<a href="#!"><img class="card-img-top"
						src="${pageContext.request.contextPath }/assets/coverimgs/jjang9.png"
						alt="..." /></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#!">Item One</a>
						</h4>
						<h5>$24.99</h5>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Amet numquam aspernatur!</p>
					</div>
					<div class="card-footer">
						<small class="text-muted">★ ★ ★ ★ ☆</small>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-5 mb-3">
				<div class="card h-100">
					<a href="#!"><img class="card-img-top"
						src="${pageContext.request.contextPath }/assets/coverimgs/jjang9.png"
						alt="..." /></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#!">Item One</a>
						</h4>
						<h5>$24.99</h5>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Amet numquam aspernatur!</p>
					</div>
					<div class="card-footer">
						<small class="text-muted">★ ★ ★ ★ ☆</small>
					</div>
				</div>
			</div>


		</div>

	</div>
	<c:import url="/WEB-INF/jsp/include/footer.jsp" />

</body>
</html>