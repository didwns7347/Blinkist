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
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<c:import url="/WEB-INF/jsp/include/navigation.jsp" />
	<div class="mb-5"></div>
	<div class="container">

		<div class="mb-5">
			<h3>My Library</h3>
			<br />

		</div>
		<div class="row mb-4">
			<div class="container">
				<ul class="nav nav-pills" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						data-toggle="pill" href="#home">Currently reading</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="pill"
						href="#menu1"> Finished </a></li>

				</ul>

				<div class="tab-content">
					<div id="home" class="container tab-pane active">
						<br />
						<div class="row">
							<br>
							<c:forEach items="${list }" var="list" varStatus="status">
								<div class="col-lg-4 col-md-6 mb-4" id="test">
									<div class="card h-100">
										<!-- img size 470x470 으로 고정 -->
										<a href="#!"><img class="card-img-top"
											src="${list.img_path }" width="282" height="282" alt="..." /></a>
										<div class="card-body">
											<h4 class="card-title">
												<a
													href="${pageContext.request.contextPath }/book/viewbook?no=${list.book_no}">${list.title }</a>
											</h4>
											<h5>${list.name }</h5>
											<p class="card-text">
												<i style='font-size: 20px' class='far'>&#xf017;</i>
												${list.running_time}분
											</p>
											<div class="dropdown float-right">
												<button type="button" class="btn btn-sm  "
													data-toggle="dropdown">. . .</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="#">Remove from library</a> <a
														class="dropdown-item" href="#">Buy book</a> <a
														class="dropdown-item" href="#">Send to Kindle</a>
												</div>
											</div>
										</div>
										<div class="card-footer">
											<!-- Blue -->
											<div class="progress">
												<div class="progress-bar bg-success" style="width: 10%"></div>
											</div>

										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>


					<div id="menu1" class="container tab-pane fade">
						<br>
						<div class="row">
							<br>
							<div class="col-lg-4 col-md-6 mb-4" id="test">
								<div class="card h-100">
									<a href="#!"><img class="card-img-top"
										src="${pageContext.request.contextPath }/assets/coverimgs/jjang9.png"
										alt="..." /></a>
									<div class="card-body">
										<h4 class="card-title">
											<a href="#!">Item One</a>
										</h4>
										<h5>$24.99</h5>
										<p class="card-text">Lorem ipsum dolor sit amet,
											consectetur adipisicing elit. Amet numquam aspernatur!</p>
									</div>
									<div class="card-footer">
										<small class="text-muted">★ ★ ★ ★ ☆</small>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 mb-4" id="test">
								<div class="card h-100">
									<a href="#!"><img class="card-img-top"
										src="${pageContext.request.contextPath }/assets/coverimgs/jjang9.png"
										alt="..." /></a>
									<div class="card-body">
										<h4 class="card-title">
											<a href="#!">Item One</a>
										</h4>
										<h5>$24.99</h5>
										<p class="card-text">Lorem ipsum dolor sit amet,
											consectetur adipisicing elit. Amet numquam aspernatur!</p>
									</div>
									<div class="card-footer">
										<small class="text-muted">★ ★ ★ ★ ☆</small>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 mb-4" id="test">
								<div class="card h-100">
									<a href="#!"><img class="card-img-top"
										src="${pageContext.request.contextPath }/assets/coverimgs/jjang9.png"
										alt="..." /></a>
									<div class="card-body">
										<h4 class="card-title">
											<a href="#!">Item One</a>
										</h4>
										<h5>$24.99</h5>
										<p class="card-text">Lorem ipsum dolor sit amet,
											consectetur adipisicing elit. Amet numquam aspernatur!</p>
									</div>
									<div class="card-footer">
										<small class="text-muted">★ ★ ★ ★ ☆</small>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	<script type="text/javascript">
		var cnt = 1;
		document.getElementById("loadMore").addEventListener("click",
				DisplayDate);
		function DisplayDate() {
			cnt += 1
			for (i = (cnt) * 15 + 1; i <= (cnt + 1) * 15; i++)
				document.getElementById("test" + i).style.display = "block";
		}
	</script>

</body>
</html>