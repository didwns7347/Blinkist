<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="" />
<meta name="author" content="" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
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
<script type="text/javascript" src="${pageContext.request.contextPath }/js/payment.js"></script>	

<script type="text/javascript" src="${pageContext.request.contextPath }/js/payment.js"></script>
<!-- 팝업창  -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>   
<title>Update Premium</title>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/css/styles.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath }/css/blog-home.css"
	rel="stylesheet">
</head>
<body>
	<!-- navigation include -->
	<c:import url="/WEB-INF/jsp/include/navigation.jsp" />

  <form>
	<div>
     <section>
         <div>
           <img style="width:40%;  display: block; margin: 0px auto;" src="${pageContext.request.contextPath }/assets/images/Audiobooks.jpg"/>
       </div>
     </section>


  <section class="choose-plan__faq">
	<div style="margin: 0 auto; text-align: center;">
		<h3 class="mb-4" style="color: blue; margin-top:20px;">Choose the plan that fits you</h3>
		   <label class="radio-inline"><input type="radio" class="${email}" name="subscribe" id="16000" value="monthP" checked><strong style="font-size: 20px;"> Premium Monthly 16,000₩/month</strong></label>

				<br /><br />

		   <label class="radio-inline"><input type="radio" class="${email}" name="subscribe" id="98550" value="yearP"><strong style="font-size: 20px;"> Premium Yearly 98,550₩/annually</strong></label>

				<br /><br />

		   <button type="button" class="btn btn-outline-success" data-toggle="modal" data-target="#gradeUpdate">Upgrade to Premium</button>
	</div> 
  </section>
  
           <div class="mb-5"></div>
</div>
</form>


    <!-- navigation include -->
	<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
	
<c:import url="/WEB-INF/jsp/modal/gradeUpdateModal.jsp" />	
</body>
</html>