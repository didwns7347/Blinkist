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
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />

<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/viewbook.js"></script>
</head>
<body>
	<!-- navigation include -->
	<c:import url="/WEB-INF/jsp/include/navigation.jsp" />
	<div class="container">
		<div class="row">
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
						<a href="javascript:void(0)" class="btn btn-outline-success"
							role="button" id="Add_Library">Add to library</a>
					</div>
					<div class="col-sm-3">
						<a href="${map.buyLink }" class="btn btn-outline-primary"
							role="button"> Buy Book </a>
					</div>
					<div class="col-sm-3">
						<a href="#" class="btn btn-outline-light text-dark" role="button">Send
							to kindle</a>
					</div>
				</div>
				<s:authentication property="principal" var="authUser" />
				<input type="hidden" id="book_no" name="book_no"
					value="${map.book_no}" /> <input type="hidden" id="authUser"
					name="authUser" value="${authUser.username }" />

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
			<div class="col-sm-4">
				<div class="row mb-4">
					<img class="img-fluid mx-auto d-block img-thumbnail"
						src="${map.img_path}" alt="Chania" width="460" height="345">
				</div>



			</div>
		</div>
		<div class="row mb-4">
			<div class="col-sm-12">
				<h2 class="mb-4">이책을본 사람들이 많이 본 책</h2>
			</div>
			<c:forEach items="${recommendBooksByLog }" var="list"
				varStatus="status">
				<div class="col-lg-4 col-md-6 mb-4" id="test">
					<div class="card h-100">
						<a
							href="${pageContext.request.contextPath }/book/viewbook?no=${list.book_no}"
							style="background-color: #e2ae5f7a;"><br /> <img
							class="card-img-top" src="${list.img_path }" width="122"
							height="180" alt="..." /> <br /> </a>
						<div class="card-body">
							<h6 class="card-title">
								<a
									href="${pageContext.request.contextPath }/book/viewbook?no=${list.book_no}">${list.title }</a>
							</h6>
							<h5>${list.name }</h5>
							<p class="card-text">
								<i style='font-size: 20px' class='far'>&#xf017;</i>
								${list.running_time}분
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
			<div class="col-sm-12">
				<h2 class="mb-4">회원이 가장 많이 라이브러리에 추가한 카테고리에 따른 추천작</h2>
			</div>
			<c:forEach items="${trandBook }" var="list" varStatus="status">
				<div class="col-lg-4 col-md-6 mb-4" id="test">
					<div class="card h-100">
						<a href="#" style="background-color: #e2ae5f7a;"><br /> <img
							class="card-img-top" src="${list.img_path }" width="122"
							height="180" alt="..." /> <br /> </a>
						<div class="card-body">
							<h6 class="card-title">
								<a
									href="${pageContext.request.contextPath }/book/viewbook?no=${list.book_no}">${list.title }</a>
							</h6>
							<h5>${list.name }</h5>
							<p class="card-text">
								<i style='font-size: 20px' class='far'>&#xf017;</i>
								${list.running_time}분
							</p>
						</div>
						<div class="card-footer text-center">
							<a name="cardfooter"
								href="${pageContext.request.contextPath }/library/addlibrary?book_no=${list.book_no}&authUser=${authUser.username}">+
								Add Library</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>



	</div>
	<c:import url="/WEB-INF/jsp/include/footer.jsp" />

</body>
</html>