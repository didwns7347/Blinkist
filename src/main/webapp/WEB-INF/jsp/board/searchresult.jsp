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
	<c:import url="/WEB-INF/jsp/include/navigation.jsp" />

	<div class="container">
		<h3>${keyword }에대한 검색 결과</h3>
		<br/>
		<div class="row">
			<c:forEach items="${list }" var="list" varStatus="status">
				<div class="col-lg-4 col-md-6 mb-4">
				<div class="card h-100">
					<a href="#!"><img class="card-img-top"
						src="${list.img_path }" alt="..." /></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#!">${list.title }</a>
						</h4>
						<h5>${list.name }</h5>
						<p class="card-text">${list.running_time}</p>
					</div>
					<div class="card-footer">
						<small class="text-muted">★ ★ ★ ★ ☆</small>
					</div>
				</div>
			</div>
			</c:forEach>
			
			<div class="col-lg-4 col-md-6 mb-4">
				<div class="card h-100">
					<a href="#!"><img class="card-img-top"
						src="${pageContext.request.contextPath }/assets/coverimgs/jjang9.png" alt="..." /></a>
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
			<div class="col-lg-4 col-md-6 mb-4">
				<div class="card h-100">
					<a href="#!"><img class="card-img-top"
						src="/blinkist/assets/coverimgs/Senna_0.jpg" alt="..." /></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#!">Item Two</a>
						</h4>
						<h5>$24.99</h5>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Amet numquam aspernatur! Lorem ipsum dolor sit
							amet.</p>
					</div>
					<div class="card-footer">
						<small class="text-muted">★ ★ ★ ★ ☆</small>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 mb-4">
				<div class="card h-100">
					<a href="#!"><img class="card-img-top"
						src="https://via.placeholder.com/700x400" alt="..." /></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#!">Item Three</a>
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
			<div class="col-lg-4 col-md-6 mb-4">
				<div class="card h-100">
					<a href="#!"><img class="card-img-top"
						src="https://via.placeholder.com/700x400" alt="..." /></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#!">Item Four</a>
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
			<div class="col-lg-4 col-md-6 mb-4">
				<div class="card h-100">
					<a href="#!"><img class="card-img-top"
						src="https://via.placeholder.com/700x400" alt="..." /></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#!">Item Five</a>
						</h4>
						<h5>$24.99</h5>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Amet numquam aspernatur! Lorem ipsum dolor sit
							amet.</p>
					</div>
					<div class="card-footer">
						<small class="text-muted">★ ★ ★ ★ ☆</small>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 mb-4">
				<div class="card h-100">
					<a href="#!"><img class="card-img-top"
						src="https://via.placeholder.com/700x400" alt="..." /></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#!">Item Six</a>
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
</body>
</html>