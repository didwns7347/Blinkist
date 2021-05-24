<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script type="text/javascript"  src="${pageContext.request.contextPath }/js/readbook.js"></script>  
<!-- bootstrap -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- w3 school -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
	
<!-- side bar -->	
<div class="w3-sidebar w3-bar-block w3-animate-left" style="display:none" id="Sidebar">
  <button class="w3-bar-item w3-button w3-xlarge" onclick="w3_close()">Close &times;</button>
  <a href="${pageContext.request.contextPath }" class="w3-bar-item w3-button w3-xlarge"><i class="fa fa-home"></i></a>

  <div id="myNav" class="overlay">
	<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	  <div class="overlay-content">
		 <c:forEach var="item" items="${Content}" varStatus="status">
		   <p style="margin-left:15px;"><a href="#" id="${item.content}" class="chapter_title"><c:out value="${item.chapter_title}" /></a></p>
		   <input type="hidden" id="${item.content}" class="chapter_title" value="${item.chapter_title}"/>
		</c:forEach>
	  </div>
  </div>
  <button type="button" class="w3-bar-item w3-button w3-xlarge" onclick="openNav()"><i class="fa fa-search"></i></button>
	
  <button class="w3-bar-item w3-button w3-xlarge" data-toggle="modal" data-target="#fontsize"><i class="fa fa-font"></i></button>
</div>

<div>
  <button class="w3-button w3-white w3-xxxlarge" onclick="w3_open()">&#9776;</button>
  <div class="container">
   <c:forEach var="item" items="${Content}" varStatus="status" begin="0" end="0">
       <h1 id="chapter_title">${item.chapter_title}</h1>
   
                                    <hr/>
                                    
       <p id="p_content">${item.content}</p>                            
   </c:forEach>      
   
                                   <hr/>                             
  </div>                                 
</div>


<nav aria-label="Page navigation example">
  <ul class="pagination">
    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link" href="#">Next</a></li>
  </ul>
</nav>


<!-- audio -->
<audio controls preload="metadata" style="position: absolute; bottom: 0;">
  <source src="https://www.w3schools.com/html/horse.ogg" type="audio/ogg">
</audio>

<c:import url="/WEB-INF/jsp/modal/fontsizeModal.jsp" /> 
</body>
</html> 
	