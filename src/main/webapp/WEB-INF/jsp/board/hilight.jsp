<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8" />
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>Blinkist: Big ideas in small packages</title>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/images/favicon.ico" />

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>

<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />

<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/hilight.js"></script>

<!-- bootstrap -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- 카카오톡공유 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<!-- 팝업창  -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/css/styles.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/css/blog-home.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/hilight.css" rel="stylesheet" type="text/css">

<link rel="icon" href="data:;base64,iVBORw0KGgo=">

</head>

<body>
	<!-- navigation include -->
	<c:import url="/WEB-INF/jsp/include/navigation.jsp" />

	<div class="container">
		<div class="container">
			<h1>${langDict.hilights }</h1>
		</div>
		
		<hr />
		
		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">
			<li class="nav-item"><a class="nav-link" id="Sort" data-toggle="tab" href="#">${langDict.sort }</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#Bybook">${langDict.titleSort }</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#Bydate">${langDict.dateSort }</a></li>
		</ul>

		<!-- Tab panes -->
		<div class="tab-content mb-5">
			<div id="Bybook" class="container tab-pane active">
				<c:forEach var="item" items="${Titlehilight}" varStatus="status">
					<div class="row">
					
						<!-- 책이름 -->
						<div class="col-8 mt-5" >
							<h4 id="h4">${item.title}</h4>
						</div>

						<!-- 삭제버튼 -->
						<div class="col-4 mt-5">
							<button type="button" class="btn btn-outline-primary" id="Delete_Chapter" name="${item.hilight_no}">Delete</button>
							
						    <!-- 공유버튼 -->
						    <button type="button" class="btn btn-outline-secondary"  id="${item.content }" name="${item.title}" value="${item.book_no}">share
						              <input type="hidden"  class="share" name="${item.book_no}" id="${item.img_path}"/>
						    </button>					
					       
						</div>
					</div>

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
                  <c:choose>
					<c:when test="${item.reg_date>=24}">

						<div class="row">
							<div class="col-8 mt-5">
								<h4 id="h4">
									<fmt:parseNumber var="Day" value="${item.reg_date/24}" integerOnly="true" />${Day}days ago
								</h4>
							</div>
							<div class="col-4 mt-5 mb-5">
								<button type="button" class="btn btn-outline-primary" id="Delete_Date" name="${item.hilight_no}">Delete</button>
				                <!-- 공유버튼 -->
						        <button type="button" class="btn btn-outline-secondary"  id="${item.content }" name="${item.title}" value="${item.book_no}">share
						              <input type="hidden"  class="share" name="${item.book_no}" id="${item.img_path}"/>
						        </button>		
									
							</div>
						</div>

						<h6 id="Date_title">${item.title}</h6>

						<div class="row">
							<div class="card">
								<div class="card-body">
									<h6 class="card-title">${item.content }</h6>

									<p class="card-text">
										<span id="chapter">chapter: </span><span id="chapter_title">${item.chapter_title}</span>
									</p>
								</div>
							</div>
						</div>
					</c:when>

                    <c:otherwise>
					<div class="row">
						<div class="col-8 mt-5 mb-5">
							<h4 id="h4">${item.reg_date}hours ago</h4>
						</div>
						<div class="col-4 mt-5">
							<button type="button" class="btn btn-outline-primary"
								id="Delete_Date" name="${item.hilight_no}">Delete</button>
						</div>
					</div>
					
					<h6 id="Date_title">${item.title}</h6>

					<div class="row">
						<div class="card">
							<div class="card-body">
								<h6 class="card-title">${item.content }</h6>

								<p class="card-text">
									<span id="chapter">chapter: </span><span id="chapter_title">${item.chapter_title}</span>
								</p>

							</div>
						</div>
					</div>
					</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
		</div>
	</div>

	<!-- navigation include -->
	<c:import url="/WEB-INF/jsp/include/footer.jsp" />
</body>
</html>