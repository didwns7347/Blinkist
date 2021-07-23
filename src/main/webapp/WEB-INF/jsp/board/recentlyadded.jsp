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
<!-- bootstrap -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/update.js"></script>


</head>
<body>
	<c:import url="/WEB-INF/jsp/include/navigation.jsp" />
	<s:authentication property="principal" var="authUser"/> 
	<div class="container">
		<h3>${langDict.recentlyadded }</h3>
		<br />
		<div class="row" id="demo">
			<c:forEach items="${list }" var="list" varStatus="status">
				<!-- 처음 여섯개는 보이게 하기 -->
				<c:if test="${status.index <6 }">
					<!-- 라이브러리에 있는 책인가???? -> true일경우 있음 -->
					<c:if test="${list.user_no eq userNo }">

						<div class="col-lg-4 col-md-6 mb-4" id="test">
							<div class="card h-100">
								<!-- img size 470x470 으로 고정 -->
								<a href="${pageContext.request.contextPath }/content/readbook?book_no=${list.book_no}" style="background-color: #e2ae5f7a;"><br /> <img
									class="card-img-top" src="${list.img_path }" width="122"
									height="180" alt="..." /> <br /> </a>
								<div class="card-body">
									<h6 class="card-title">
										<a
											href="${pageContext.request.contextPath }/content/readbook?book_no=${list.book_no}">${list.title }${status.index } ${userNo }</a>
									</h6>
									<h5>${list.name }</h5>
									<p class="card-text">
										<i style='font-size: 20px' class='far'>&#xf017;</i>
										${list.running_time}분
									</p>
									<div class="dropdown float-left">
										<button type="button" class="btn btn-sm  "
											data-toggle="dropdown">. . .</button>
										<div class="dropdown-menu">
											<a class="dropdown-item" href="${pageContext.request.contextPath }/library/removelibrary?authUser=${authUser.username}&book_no=${list.book_no}">Remove from library</a> 
											<a class="dropdown-item" href="${list.buyLink }">Buy book</a> 
										</div>
									</div>
								</div>
								<div>
									<!-- Blue -->
									<div class="progress" style="height: 50px;">
										<div class="progress-bar" role="progressbar"
											aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"
											style="width:${list.progress}%; height:50px">${list.progress}%</div>
									</div>
								</div>
							</div>
						</div>

					</c:if>

					<!-- 라이브러리에 없는 책일 경우 false -->
					<c:if test="${list.user_no ne userNo }">

						<div class="col-lg-4 col-md-6 mb-4" id="test">
							<div class="card h-100">
								<a href="${pageContext.request.contextPath }/book/viewbook?no=${list.book_no}" style="background-color: #e2ae5f7a;"><br /> <img
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

					</c:if>

				</c:if>

				<!-- 나중 6개는 read more버튼 클릭시 style display block로 보이게 해나가기 -->
				<c:if test="${status.index>=6 }">
					<!-- 라이브러리에 있는 책인가???? -> true일경우 있음 -->
					<c:if test="${list.user_no eq userNo }">
						<div class="col-lg-4 col-md-6 mb-4" id="test${status.index}" style="display: none">
							<div class="card h-100">
								<!-- img size 470x470 으로 고정 -->
								<a href="${pageContext.request.contextPath }/content/readbook?book_no=${list.book_no}" style="background-color: #e2ae5f7a;"><br /> <img
									class="card-img-top" src="${list.img_path }" width="122"
									height="180" alt="..." /> <br /> </a>
								<div class="card-body">
									<h6 class="card-title">
										<a
											href="${pageContext.request.contextPath }/content/readbook?book_no=${list.book_no}">${list.title }</a>
									</h6>
									<h5>${list.name }</h5>
									<p class="card-text">
										<i style='font-size: 20px' class='far'>&#xf017;</i>
										${list.running_time}분
									</p>
									<div class="dropdown float-left">
										<button type="button" class="btn btn-sm  "
											data-toggle="dropdown">. . .</button>
										<div class="dropdown-menu">
											<a class="dropdown-item" href="${pageContext.request.contextPath }/library/removelibrary?authUser=${authUser.username}&book_no=${list.book_no}">Remove from library</a> 
											<a class="dropdown-item" href="${list.buyLink }">Buy book</a> 
										</div>
									</div>
								</div>
								<div>
									<!-- Blue -->
									<div class="progress" style="height: 50px;">
										<div class="progress-bar" role="progressbar"
											aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"
											style="width:${list.progress}%; height:50px">${list.progress}%</div>
									</div>
								</div>
							</div>
						</div>

					</c:if>


					<!-- 라이브러리에 있는 책인가???? -> false일경우 없음 -->
					<c:if test="${list.user_no ne userNo }">
						<div class="col-lg-4 col-md-6 mb-4" id="test${status.index}"
							style="display: none">
							<div class="card h-100">
								<a href="${pageContext.request.contextPath }/book/viewbook?no=${list.book_no}" style="background-color: #e2ae5f7a;"><br /> <img
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
					</c:if>
				</c:if>

			</c:forEach>
		</div>
		<div class="row" id="do"></div>
		<div class="row">
			<div class="col-md-4 mb-5"></div>
			<div class="col-md-4 mb-5">
				<button id="loadMore" type="button"
					class="btn btn-outline-success btn-block">${langDict.loadMore }</button>
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
			for (i = (cnt) * 6; i < (cnt + 1) * 6; i++)
				document.getElementById("test" + i).style.display = "block";
		}
	</script>
	<script>
		var divs = document.getElementsByName('cardfooter')
		for (var i = 0; i < divs.length; i++) {
			divs.item(i).addEventListener("mouseover", changeGreen, false);
			divs.item(i).addEventListener("mouseout", changeWite, false);
		}
		function changeGreen(e) {
			e.target.parentNode.style.backgroundColor = "#0365F2";
		}
		function changeWite(e) {
			e.target.parentNode.style.backgroundColor = "white";
		}
	</script>
</body>
</html>