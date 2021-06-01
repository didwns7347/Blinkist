<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">

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
<link href="css/styles.css" rel="stylesheet" />
<!-- modal login CSS -->
<link href="css/loginform.css" rel="stylesheet" />
<!-- SEARCH CSS -->
<link href="css/search.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/css/sample.css"
	rel="stylesheet">
</head>
<body onload="dayFunction()" id="page-top">
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
<link href="css/styles.css" rel="stylesheet" />
<!-- modal login CSS -->
<link href="css/loginform.css" rel="stylesheet" />
<!-- SEARCH CSS -->
<link href="css/search.css" rel="stylesheet" />

</head>
<body id="page-top">

	<!-- navigation include -->
	<c:import url="/WEB-INF/jsp/include/navigation.jsp" />




	<!-- navigation include -->
	<c:import url="/WEB-INF/jsp/include/navigation.jsp" />

	${message }
	<!-- MAIN SECTION-->
	<header class="masthead bg-primary text-white text-center">
		<div class="container d-flex align-items-center flex-column">
			<!-- Masthead Avatar Image-->
			<img class="masthead-avatar mb-5" src="assets/images/markany.png"
				alt="..." />
			<!-- Masthead Heading-->
			<h1 class="masthead-heading text-uppercase mb-0">Start Blinkist</h1>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Masthead Subheading-->
			<p class="masthead-subheading font-weight-light mb-0">언제 어디서나
				블링키스트로 독서해 보세요</p>
		</div>
	</header>

	<!-- SLIDE SECTION -->
	<div class="slideshow-container">
		<br /> <br />
		<h2
			class="page-section-heading text-center text-uppercase text-secondary mb-0"
			style="color: white;">카테고리 TOP6</h2>


		<!-- Icon Divider-->
		<div class="divider-custom">
			<div class="divider-custom-line"></div>
			<div class="divider-custom-icon">
				<i class="fas fa-star"></i>
			</div>
			<div class="divider-custom-line"></div>
		</div>
		<div class="container">
			<div class="mySlides">

				<h4 class="masthead-heading text-uppercase mb-0">TOP 6 인문학</h4>
				<div class="row" style="padding: 30px">
					<c:forEach items="${humanlist }" var="list" varStatus="status">
						<div class="col-lg-4 col-md-6 mb-4" id="test">
							<div class="card h-100">
								<a
									href="${pageContext.request.contextPath }/book/viewbook?no=${list.book_no}"
									style="background-color: #e2ae5f7a;"> <br /> <img
									class="card-img-top" src="${list.img_path }" width="122"
									height="180" alt="..." /> <br />
								</a>
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
				</div>

			</div>

			<div class="mySlides">
				<h2 class="masthead-heading text-uppercase mb-0">TOP 6 건강/생활/요리</h2>
				<div class="row" style="padding: 30px">
					<c:forEach items="${lifelist }" var="list" varStatus="status">
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
				</div>
			</div>

			<div class="mySlides">
				<h2 class="masthead-heading text-uppercase mb-0">TOP 6 소설</h2>
				<div class="row" style="padding: 30px">
					<c:forEach items="${novellist }" var="list" varStatus="status">
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
				</div>
			</div>

			<div class="mySlides">
				<h2 class="masthead-heading text-uppercase mb-0">TOP 6 자기개발</h2>
				<div class="row" style="padding: 30px">
					<c:forEach items="${selfdevlist }" var="list" varStatus="status">
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
				</div>
			</div>
			<div class="mySlides">
				<h2 class="masthead-heading text-uppercase mb-0">TOP 6 사회</h2>
				<div class="row" style="padding: 30px">
					<c:forEach items="${sociallist }" var="list" varStatus="status">
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
				</div>
			</div>
			<div class="mySlides">
				<h2 class="masthead-heading text-uppercase mb-0">TOP 6 청소년</h2>
				<div class="row" style="padding: 30px">
					<c:forEach items="${teenagelist }" var="list" varStatus="status">
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
				</div>
			</div>
			<a class="prev" onclick="plusSlides(-1)">❮</a> <a class="next"
				onclick="plusSlides(1)">❯</a>

		</div>
	</div>

	<!-- 궁금해 섹션 -->
	<div class="slideshow-container" style="background-color: #babaef">
		<div class="container">
			<br />
			<h2
				class="page-section-heading text-center text-uppercase text-secondary mb-0"
				style="color: white;">궁금해? 시작해봐</h2>


			<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<div class="trial-duration-explanation__timeline">
				<div class="trial-timeline">
					<ul class="timeline timeline--default">
						<li class="timeline__step"><div class="timeline__axis">
								<div class="timeline__bullet"></div>
								<div class="timeline__line"></div>
							</div>
							<h3 class="timeline__label" _msthash="3028714"
								_msttexthash="12613484" style="color: white" id="now"></h3>
							<p class="timeline__text" _msthash="2987543"
								_msttexthash="243250033">깜박임과 쇼의 전체 라이브러리를 즐기기 시작합니다.</p></li>
						<li
							class="timeline__step timeline__step--last timeline__step--before-finish"><div
								class="timeline__axis">
								<div class="timeline__bullet"></div>
								<div class="timeline__line"></div>
							</div>
							<h3 class="timeline__label" _msthash="3028715"
								_msttexthash="11943789" id="freeday"></h3>
							<p class="timeline__text" _msthash="2987544"
								_msttexthash="82970953">무료 평가판이 종료됩니다.</p></li>
						<li class="timeline__finish" _msthash="2705131"
							_msttexthash="107613376">블링키스트와 함께 계속 배우기! <br
							_istranslated="1"></li>
					</ul>
				</div>
			</div>
			<h3 style="color: white">블링키스트는 7일 동안 무료로 이용하실 수 있습니다. 무료 기간 내에
				취소하면 요금이 청구되지 않으므로 걱정하지 마십시오.</h3>
			<br />

			<form action="${pageContext.request.contextPath }/user/premiumyear">
				<button id="goprimiun" type="submit"
					class="btn btn-outline-success btn-block">무료로 시작하러 가기</button>
			</form>
			<br /> <br />


		</div>
	</div>
	<!-- 카테고리 사진 섹션 -->
	<section class="page-section portfolio" id="portfolio">
		<div class="container">
			<!-- Portfolio Section Heading-->


			<h2
				class="page-section-heading text-center text-uppercase text-secondary mb-0"
				style="color: white;">카테고리</h2>

			<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>


			<br /> <br />

			<!-- Portfolio Grid Items-->
			<div class="row justify-content-center">
				<!-- Portfolio Item 1-->
				<div class="col-md-6 col-lg-4 mb-5">
					<a
						href="${pageContext.request.contextPath }/book/category?category=인문학"">
						<br /> <img class="img-fluid" src="assets/images/humanity.jpg"
						alt="..." /> <br />
					</a>
				</div>
				<!-- Portfolio Item 2-->
				<div class="col-md-6 col-lg-4 mb-5">
					<a
						href="${pageContext.request.contextPath }/book/category?category=건강/생활/요리">
						<br /> <img class="img-fluid" src="assets/images/life.jpg"
						alt="..." /> <br />
					</a>
				</div>
				<!-- Portfolio Item 3-->
				<div class="col-md-6 col-lg-4 mb-5">
					<a
						href="${pageContext.request.contextPath }/book/category?category=소설">
						<br /> <img class="img-fluid" src="assets/images/novel.jpg"
						alt="..." /> <br />
					</a>
				</div>
				<!-- Portfolio Item 4-->
				<div class="col-md-6 col-lg-4 mb-5 mb-lg-0">
					<a
						href="${pageContext.request.contextPath }/book/category?category=자기개발">
						<br /> <img class="img-fluid" src="assets/images/selfdev.jpg"
						alt="..." /> <br />
					</a>
				</div>
				<!-- Portfolio Item 5-->
				<div class="col-md-6 col-lg-4 mb-5 mb-md-0">
					<a
						href="${pageContext.request.contextPath }/book/category?category=사회">
						<br /> <img class="img-fluid" src="assets/images/social.jpg"
						alt="..." /> <br />
					</a>
				</div>
				<!-- Portfolio Item 6-->
				<div class="col-md-6 col-lg-4">

					<a
						href="${pageContext.request.contextPath }/book/category?category=청소년">
						<br /> <img class="img-fluid" src="assets/images/teenage.jpg"
						alt="..." /> <br />
					</a>

				</div>
			</div>
		</div>

	</section>
	<!-- About Section-->
	<section class="page-section bg-primary text-white mb-0" id="about">
		<div class="container">
			<!-- About Section Heading-->
			<h2
				class="page-section-heading text-center text-uppercase text-white">About</h2>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- About Section Content-->
			<div class="row">
				<div class="col-lg-4 ml-auto">
					<img class="mx-auto d-block mb-5"
						src="assets/images/easy-to-use.png" width="300px" height="200px"
						alt="..." />
					<h4>편리성</h4>
					<p class="lead">시간과 장소에 구애받지 않고 책 내용을 들을 수 있습니다.</p>
				</div>
				<div class="col-lg-4 mr-auto">
					<img class="mx-auto d-block mb-5"
						src="assets/images/audio-book.png" width="300px" height="200px"
						alt="..." />
					<h4>요약</h4>
					<p class="lead">15분 이내에 베스트셀러 도서의 주요 아이디어를 읽거나 들어보십시오.</p>
				</div>
				<div class="col-lg-4 mr-auto">
					<img class="mx-auto d-block mb-5" src="assets/images/diversify.png"
						width="300px" height="200px" alt="..." />
					<h4>다양한 컨텐츠</h4>
					<p class="lead">직접 고른 추천 제품, 관심 있는 것에 맞춘 컬렉션 등 다양한 도서</p>
				</div>
			</div>
			<!-- About Section Button-->
			<div class="text-center mt-4">
				<a class="btn btn-xl btn-outline-light"
					href="https://startbootstrap.com/theme/freelancer/"> <i
					class="fas fa-download mr-2"></i>START Free TRIAL!
				</a>
			</div>
		</div>
	</section>

	<!-- Footer-->
	<c:import url="/WEB-INF/jsp/include/footer.jsp" />

	<!-- Scroll to Top Button (Only visible on small and extra-small screen sizes)-->
	<div class="scroll-to-top d-lg-none position-fixed">
		<a class="js-scroll-trigger d-block text-center text-white rounded"
			href="#page-top"><i class="fa fa-chevron-up"></i></a>
	</div>




	<!-- Bootstrap core JS-->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Third party plugin JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/animejs/3.2.1/anime.min.js"></script>
	<!-- Contact form JS-->
	<script src="assets/mail/jqBootstrapValidation.js"></script>
	<script src="assets/mail/contact_me.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- 팝업창  -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		$(function() {

			var SuccessMessage = "<c:out value="${Success}" />";
			var ErrorMessage = "<c:out value="${Error}" />";

			if (SuccessMessage != "") {//메세지가 있으면

				swal("success", SuccessMessage, "success");

			} else if (ErrorMessage != "") {

				swal("Error", ErrorMessage, "error");

			}
		})
	</script>

</body>

<script src="${pageContext.request.contextPath }/js/mainpage.js"></script>


</html>