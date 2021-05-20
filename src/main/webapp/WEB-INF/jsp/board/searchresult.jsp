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
</head>
<body>
	<c:import url="/WEB-INF/jsp/include/navigation.jsp" />

	<div class="container">
		<h3>${keyword }에대한검색결과</h3>
		<br />
		<div class="row" id="demo">


			<c:forEach items="${list }" var="list" varStatus="status">
				<div class="col-lg-4 col-md-6 mb-4" id="test0">
					<div class="card h-100">
						<a
							href="${pageContext.request.contextPath }/book/viewbook?no=${list.book_no}"><img
							class="card-img-top" src="${list.img_path }" alt="..." /></a>
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
						</div>
						<div class="card-footer text-center" id="cardfooter">
							<a
								href="${pageContext.request.contextPath }/library/addlibrary?book_no=${list.book_no}&authUser=${authUser}">+
								Add Library</a>
						</div>
					</div>
				</div>
			</c:forEach>

			<!-- test code -->
			<c:forEach var="i" begin="1" end="100" step="1">
				<c:if test="${i<=15 }">
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
								<p class="card-text">Lorem ipsum dolor sit amet, consectetur
									adipisicing elit. Amet numquam aspernatur!</p>
							</div>
							<div class="card-footer text-center" id="cardfooter">
								<a
									href="${pageContext.request.contextPath }/book/addlibrary?no=3">+
									Add Library</a>
							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${i>15 }">
					<div class="col-lg-4 col-md-6 mb-4" id="test${i }"
						style="display: none">
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
				</c:if>
			</c:forEach>



		</div>
		<div class="row" id="do"></div>
		<div class="row">
			<div class="col-md-4 mb-5"></div>
			<div class="col-md-4 mb-5">
				<button id="loadMore" type="button"
					class="btn btn-outline-success btn-block">Load More</button>
			</div>
			<div class="col-md-4 mb-5"></div>
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
	<script>
		var myDiv = document.getElementById("cardfooter")
		myDiv.addEventListener("mouseover", changeGreen);
		myDiv.addEventListener("mouseout", changeWite);
		function changeGreen() {
			myDiv.style.backgroundColor = "#0365F2";
		}
		function changeWite() {
			myDiv.style.backgroundColor = "white";
		}
	</script>
</body>
</html>