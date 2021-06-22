<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Blinkist: Big ideas in small packages</title>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>

<!-- 설정 드랍 다운에 필요한 스크립트 코드임 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/blog-home.css" rel="stylesheet">

<!-- 아이콘  -->
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/css/styles.css" rel="stylesheet" />

<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/css/reviewwrite.css" rel="stylesheet" />

<!-- bootstrap -->
<script type="text/javascript" src="${pageContext.request.contextPath }/js/update.js"></script>
</head>
<body style="height:100%; width:100%;">
	<c:import url="/WEB-INF/jsp/include/navigation.jsp" />
	  <div class="container">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div class="mb-3">
					<div class="startRadio">
						<label class="startRadio__box"> <input type="radio" name="star" id=""> <span class="startRadio__img"><span class="blind">별 1개</span></span></label>
						<label class="startRadio__box"> <input type="radio" name="star" id=""> <span class="startRadio__img"><span class="blind">별 1개</span></span> </label>
						<label class="startRadio__box"> <input type="radio" name="star" id=""> <span class="startRadio__img"><span class="blind">별 1개</span></span> </label>

					</div>

					<textarea class="form-control" rows="10" name="content"
						id="content" placeholder="후기를 작성해주세요....."></textarea>

				</div>

			</div></div></div>
     <c:import url="/WEB-INF/jsp/include/footer.jsp" />

</body>
</html>