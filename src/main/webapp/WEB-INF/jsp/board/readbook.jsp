<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>책 읽기페이지</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/css/styles.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/css/blog-home.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/readbook.css" rel="stylesheet" type="text/css">   
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- bootstrap -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- w3 school -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- mark.js 추가하기 -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/mark.js/8.11.1/jquery.mark.min.js'></script>
</head>
<body>
	<s:authentication property="principal" var="authUser"/> 
   <!-- 책번호 -->
   <input type="hidden" id="book_no" value="${book_no}"/>
	<!-- 사용자 email -->
	<input type="hidden" id="authUser" value="${authUser.username }"/>

<!-- 기존의 progress -->
<input type="hidden" id="existing_progress" value="${progress}"/>
	
<!-- side bar -->	
<div class="w3-sidebar w3-bar-block w3-animate-left" style="display:none" id="Sidebar">
  <button class="w3-bar-item w3-button w3-xlarge" onclick="w3_close()">Close &times;</button>
  <a href="${pageContext.request.contextPath }" class="w3-bar-item w3-button w3-xlarge" id="home"><i class="fa fa-home"></i></a>

  <div id="chapter" class="overlay">
	<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	  <div class="overlay-content">
		 <c:forEach var="item" items="${Content}" varStatus="status">
		   <p style="margin-left:15px;" id="${status.count}" class="${item.content_no}"><a href="#" id="${item.content}" name="${item.content_no}" class="chapter_title"><c:out value="${item.chapter_title}"/></a></p>   
		</c:forEach>
	  </div>
  </div>
  <button type="button" class="w3-bar-item w3-button w3-xlarge" onclick="openNav()"><i class="fa fa-search"></i></button>
	
  <button class="w3-bar-item w3-button w3-xlarge" data-toggle="modal" data-target="#fontsize"><i class="fa fa-font"></i></button>
</div>


  <button class="w3-button w3-white w3-xxxlarge" onclick="w3_open()">&#9776;</button>
  <div class="container">
   <c:forEach var="item" items="${Content}" varStatus="status" begin="0" end="0">
       <h1 id="chapter_title" class="${item.content_no}">${item.chapter_title}</h1>

                                    <hr/> 
                                                         
         <p id="p_content" class="" name="">${item.content}</p>                         
   </c:forEach>      
   
                                   <hr/>                             
  </div>


<!-- 사용자가 hilight에 저장한텍스트 -->  
  <c:forEach var="item" items="${hilightContent}" varStatus="status">
     <p class="hilightContent" id="${item.content_no}" style="display: none;">${item.content}</p>                                
  </c:forEach> 

<!-- Highlights메뉴 -->  
<ul class="contextmenu">
  <li><a class="addHilight" href="#"><i class="fas fa-highlighter fa-2x" style="color:green"></i></a></li>
</ul>                                 


<!-- hilight에 넣을 문자열들 -->
<div id="hilight" style="display: none;"></div>


<!-- paging -->
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
	<c:forEach items="${Content}" varStatus="status" var="item">
	  <li class="page-item" id="${status.count}" name="${item.content_no}">
	     <a class="page-link" href="#" name="${item.chapter_title}" id="${item.content}">${status.count}</a>
	  </li>
	</c:forEach>
  </ul>
</nav>


<!-- progress -->
<input type="hidden" id="progress" name="progress" value=""/>

<!-- audio -->
<audio controls preload="metadata" style="position: absolute; bottom: 0;">
  <source src="https://www.w3schools.com/html/horse.ogg" type="audio/ogg">
</audio>

<c:import url="/WEB-INF/jsp/modal/fontsizeModal.jsp" />

</body>
<script type="text/javascript"  src="${pageContext.request.contextPath }/js/readbook.js"></script> 
<!-- 팝업창  -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>        
</html> 
	