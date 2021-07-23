<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <!-- Google fonts-->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
  <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
  <!-- Core theme CSS (includes Bootstrap)-->
  <link href="${pageContext.request.contextPath }/css/styles.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath }/css/blog-home.css" rel="stylesheet">
  <!-- bootstrap -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script type="text/javascript"  src="${pageContext.request.contextPath }/js/update.js"></script>  
  <!-- modal login CSS -->
  <link href="${pageContext.request.contextPath }/css/loginform.css" rel="stylesheet" />
   <!-- Font Awesome icons (free version)-->
   <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
   <!-- Google fonts-->
   <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
   <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
</head>
<body>
<!-- navigation include -->
	<c:import url="/WEB-INF/jsp/include/navigation.jsp" />
<br>
	<s:authentication property="principal" var="authUser"/> 
	<div class="container">
		<div class="container">
			<h2>${langDict.setting }</h2>
		</div>
		<br>

		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">
			<li class="nav-item"><a class="nav-link active"
				data-toggle="tab" href="#update">${langDict.userInfo }</a></li>
		</ul>

		<!-- Tab panes -->
		<div class="tab-content mb-5">
			<div id="update" class="container tab-pane active">
				<br>
				<!-- 등급업데이트 -->
				<h3 class="mb-5" id="grade">${langDict.langSelect}: ${uservo.grade}</h3>

				<c:choose>
					<c:when test="${uservo.grade eq 'basic'}">

						<h4 class="mb-4" style="color: blue;">${langDict.chooseplan }</h4>
						<label class="radio-inline"><input type="radio"
							class="${uservo.email}" name="subscribe" id="16000"
							value="monthP" checked><strong style="font-size: 20px;">
								${langDict.mcost }</strong></label>

						<br />
						<br />

						<label class="radio-inline"><input type="radio"
							class="${uservo.email}" name="subscribe" id="98550" value="yearP"><strong
							style="font-size: 20px;">${langDict.ycost }</strong></label>

						<br />
						<br />

						<button type="button" class="btn btn-outline-success"
							data-toggle="modal" data-target="#gradeUpdate">${langDict.upgradePrimium }</button>
					</c:when>


					<c:otherwise>
                        <p class="finish_date" id="${uservo.finish_date}">${langDict.renew} ${uservo.finish_date}</p>
						<button type="button" class="btn btn-outline-success"
							data-toggle="modal" data-target="#primiumDeleteModal">
							<strong>${langDict.submanage }</strong>
						</button>
					</c:otherwise>


				</c:choose>
				<br />
				<br />
				<hr />
				

				<!-- 회원정보수정 -->
				<br />
				<br />
				<h3 class="mb-5" id="grade">${langDict.langSelect }</h3>
				<br />
				
				<!-- Button trigger modal -->
				<form action="${pageContext.request.contextPath }/user/changeLanguage">
				${langDict.language }
				<select name="language" style="height: 28px">
					<option>${langDict.select }</option>
					<option>KOR</option>
					<option>ENG</option>
				</select>
				<br/><br/>
				<button type="submit" class="btn btn-outline-success">${langDict.select }</button>
				</form>
				<br />
				<hr>
				<br/>
				<h4>${langDict.userInfo }</h4>
				Email : ${authUser.username} <br />
				<br />
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-outline-success"
					id="passwordUpdate" data-toggle="modal" data-target="#password">${langDict.passwordUpdate }</button>

				${message} <br />
				<br />
				<hr />

				<!-- 회원탈퇴 -->
				<br />
				<br />

				<h4>${langDict.leave }</h4>
				<br />
				<br />

				<p>${langDict.leaveText }</p>
				<p>${langDict.leaveText2 }</p>
				
				<br />
				<br />

				<c:choose>
					<c:when test="${uservo.grade eq 'basic'}">
						<button type="submit" class="btn btn-outline-success"
							data-toggle="modal" data-target="#delete">${langDict.leave }</button>
					</c:when>

					<c:otherwise>
						<button type="submit" class="btn btn-outline-success"
							data-toggle="modal" data-target="#delete" disabled='disabled'>${langDict.leave }</button>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<!-- navigation include -->
 <c:import url="/WEB-INF/jsp/include/footer.jsp" />
 
<c:import url="/WEB-INF/jsp/modal/updateModal.jsp" />
<c:import url="/WEB-INF/jsp/modal/gradeUpdateModal.jsp" />
<c:import url="/WEB-INF/jsp/modal/deleteModal.jsp" />
<c:import url="/WEB-INF/jsp/modal/primiumDeleteModal.jsp" />
</body>
</html>