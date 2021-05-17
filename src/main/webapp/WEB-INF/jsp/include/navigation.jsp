<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>	
	
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
	<div class="container">
		<a class="navbar-brand" href="${pageContext.request.contextPath }">Blinkist</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<c:choose>  
					<c:when test="${empty authUser }">
					    <!-- 로그인을 안했을때 -->
						<li class="nav-item"><a class="nav-link" data-toggle="modal" href="#myModal">로그인</a></li>
					</c:when>
					<c:otherwise> 
					<!-- 로그인을 했을때 -->
						<li class="nav-item"><a class="nav-link">Explore</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath }/board">My Library</a></li>
						<li class="nav-item" id="Highlights"><a class="nav-link"
							href="${pageContext.request.contextPath }/board/myboard?writer=">Highlights</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath }/apply/result?userno=">Upgrade to Premium</a></li>


					    <li class="dropdown">
                          <button type="button" class="btn dropdown-toggle" data-toggle="dropdown">Account</button>
                              <div class="dropdown-menu">
                                  <a class="dropdown-item" href="${pageContext.request.contextPath}/user/update">설정</a>
                                  <a class="dropdown-item" data-toggle="modal" href="#logout">로그아웃</a>
                              </div>
                       </li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</nav>
<c:import url="/WEB-INF/jsp/modal/loginModal.jsp" />
<c:import url="/WEB-INF/jsp/modal/logoutModal.jsp" />