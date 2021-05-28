<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<link href="${pageContext.request.contextPath }/css/mycategory.css"
	rel="stylesheet">

<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>
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
	<div class=container>
		<h1>${category }</h1>
		<h3>All Books</h3>
		<br /> <br /> <input class="form-control" id="myInput" type="search"
			placeholder="Search.."> <br /> <br />
		<c:forEach items="${map}" var="map" varStatus="status">
			<div class="later-book-list" id="myDIV"
				style="border-bottom: 0.0625rem solid #BAC8CE;">
				<div class="letter-book-list__letter">
					<p>${map.key}</p>
				</div>
				<div class="letter-book-list__count">
					<p id="bookcnt">책 ${ fn:length(map.value)}권</p>
				</div>

				<c:forEach items="${map.value}" var="list" varStatus="status">
					<div class="letter-book-list__items">
						<a class="latter-book-list__item" id="mya"
							href="${pageContext.request.contextPath }/book/viewbookinfo?info=${list}&category=${category}">
							${list} </a>
					</div>
				</c:forEach>
				<br />
			</div>
		</c:forEach>

	</div>
	<br />
	<br />
	<c:import url="/WEB-INF/jsp/include/footer.jsp" />
</body>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
	$(document).ready(
			function() {
				$("#myInput").on(
						"keyup",
						function() {
							var value = $(this).val().toLowerCase();
							$("#myDIV ,#bookcnt,#mya").filter(
									function() {
										$(this).toggle(
												$(this).text().toLowerCase()
														.indexOf(value) > -1)
									});
						});
			});
</script>
</html>