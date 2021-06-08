<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Hilight</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
	crossorigin="anonymous"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />

<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/hilight.js"></script>
<!-- bootstrap -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/css/styles.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath }/css/blog-home.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/hilight.css"
	rel="stylesheet" type="text/css">
</head>

<body>
	<!-- navigation include -->
	<c:import url="/WEB-INF/jsp/include/navigation.jsp" />

	<div class="container">
		<div class="container">
			<h1>Highlights</h1>
		</div>
		<hr />
		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">
			<li class="nav-item"><a class="nav-link" id="Sort"
				data-toggle="tab" href="#">Sort</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#Bybook">By book</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#Bydate">By date</a></li>
		</ul>

		<!-- Tab panes -->
		<div class="tab-content mb-5">
			<div id="Bybook" class="container tab-pane active">
				<c:forEach var="item" items="${Titlehilight}" varStatus="status">

					<div class="row">
						<!-- 책이름 -->
						<div class="col-4">
							<h5 id="h5">${item.title}</h5>
						</div>

						<!-- 삭제버튼 -->
						<div class="col-4">
							<button type="button" class="btn btn-outline-primary"
								id="Delete_Chapter" name="${item.hilight_no}">Delete</button>
						</div>
					</div>

					<div class="col-4"></div>

					<!-- 챕터제목 -->
					<span id="chapter">chapter: </span>
					<span id="chapter_title">${item.chapter_title}</span>

					<!-- 콘텐츠내용 -->
					<div class="row">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">${item.content }</h4>
								<p class="card-text">${item.reg_date}</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>


			<div id="Bydate" class="container tab-pane fade">
				<br>
				<c:forEach var="item" items="${Datehilight}" varStatus="status">

					<!-- 책을 라이브러라에 저장한지 24시간이상 즉 하루이상이면 -->
					<c:if test="${item.reg_date>=24}">

						<div class="row">
							<div class="col-4">
								<!-- 경과는 일로 나온다. -->
								<h5 id="h5">
									<fmt:parseNumber var="Day" value="${item.reg_date/24}"
										integerOnly="true" />${Day}
									days ago
								</h5>
							</div>
							<!-- 삭제버튼 -->
							<div class="col-4">
								<button type="button" class="btn btn-outline-primary"
									id="Delete_Date" name="${item.hilight_no}">Delete</button>
							</div>
						</div>

						<div class="col-4"></div>

						<!-- 책의 제목 -->
						<h6 id="Date_title">${item.title}</h6>

						<!-- 콘텐츠내용 -->
						<div class="row">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">${item.content }</h4>

									<p class="card-text">
										<span id="chapter">chapter: </span><span id="chapter_title">${item.chapter_title}</span>
									</p>

								</div>
							</div>
						</div>

					</c:if>

					<!-- 책을 라이브러라에 저장한지 24시간이하 즉 오늘저장한거면면 -->
					<div class="row">
						<div class="col-4">
							<!-- 경과는 일로 나온다. -->
							<h5 id="h5">about ${item.reg_date} hours</h5>
						</div>
						<!-- 삭제버튼 -->
						<div class="col-4">
							<button type="button" class="btn btn-outline-primary"
								id="Delete_Date" name="${item.hilight_no}">Delete</button>
						</div>
					</div>

					<div class="col-4"></div>

					<!-- 책의 제목 -->
					<h6 id="Date_title">${item.title}</h6>

					<!-- 콘텐츠내용 -->
					<div class="row">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">${item.content }</h4>

								<p class="card-text">
									<span id="chapter">chapter: </span><span id="chapter_title">${item.chapter_title}</span>
								</p>

							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<!-- navigation include -->
	<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	<!-- 팝업창  -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</body>
</html>