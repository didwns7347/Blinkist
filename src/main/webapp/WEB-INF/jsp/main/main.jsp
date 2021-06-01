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

<!-- modal login CSS -->
<link href="css/loginform.css" rel="stylesheet" />
<!-- SEARCH CSS -->
<link href="css/search.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
</head>
<body id="page-top" style="padding-top: 100px;">
	<!-- navigation include -->
	<c:import url="/WEB-INF/jsp/include/navigation.jsp" />
	<div>
		<div class="learning-page-hero__content">
			<h1 class="learning-page-hero__headline">Fit learning into
				your&nbsp;life</h1>
			<div class="learning-page-hero__subheadline">Blinkist brings
				you knowledge from top nonfiction and podcasts, so you can learn
				anytime, anywhere.</div>
			<div class="learning-page-hero__footer">
				<a data-event-category="body-20200416-life_fit_learning_hero"
					href="/en/nc/signup"
					class="button js-open-signup-popup learning-page-hero__cta"> <span>Start
						free trial</span>
				</a>
			</div>
		</div>
	</div>
	<div class="container">
		<h1>helloworld</h1>
	</div>

	<div class="context">
		<p>My text content</p>
	</div>
</body>
<script>
	var instance = new Mark(document.querySelector("div.context"));
	instance.mark("text", {
		"element" : "span",
		"className" : "highlight"
	});
</script>

</html>