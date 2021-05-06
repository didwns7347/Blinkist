<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">

<!-- 아이콘 -->
<script src="https://kit.fontawesome.com/a076d05399.js"  crossorigin="anonymous"></script>

</head>
<body>
<!-- 메뉴바 -->
  <!-- 메뉴바에는 navbar 클래스를 추가해야한다.  -->
  <nav id="nav" class="navbar navbar-expand-sm navbar-dark bg-secondary">
     <!-- Logo -->
	  <a class="navbar-brand" href="/" style="color: black"><i class="fas fa-home"></i>HOME</a>
	  
	   <!-- menu -->
	  <div class="topnav">
	     <a id="menu1"  href="${pageContext.request.contextPath }/goods/import">상품입고</a>
		 <a id="menu1"  href="${pageContext.request.contextPath }/goods/export">상품출고</a>
		 <a id="menu1"  href="${pageContext.request.contextPath }/goods/back">상품반품</a> 
		 <a id="menu1"  href="/goods/List">상품리스트 및 검색</a> 
		 <a style="margin-right:250px;" id="menu1"  href="/goods/statistics">통계</a>
		 
		  
		 <c:choose>
					<c:when test="${empty authUser }">
						<a id="menu2"  href="${pageContext.request.contextPath }/user/join">회원가입</a>
						<a id="menu2"  href="${pageContext.request.contextPath }/user/login">로그인</a>
					</c:when>
					<c:otherwise>
						<a id="menu2"  href="${pageContext.request.contextPath }/user/update">회원정보수정</a>
						<button type="submit"  class="logout">로그아웃</button>
						<button type="submit"  class="delete">회원탈퇴</button>
					</c:otherwise>
				</c:choose>
    </div>
  </nav>
<!-- jquery -->
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script type="text/javascript"  src="${pageContext.request.contextPath }/assets/javascript/nav.js" charset="utf-8"></script>     
</body>
</html>