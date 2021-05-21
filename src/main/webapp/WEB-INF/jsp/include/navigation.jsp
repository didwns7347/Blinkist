<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">

	<!-- navbar-brand의 content 변경 -->
	<div class="col-lg-1"></div>

	<a class="navbar-brand" href="${pageContext.request.contextPath }">
		Blinkist</a>

	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarResponsive" aria-controls="navbarResponsive"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>


	<c:choose>
		<c:when test="${empty authUser }">
			<div class="col-lg-9"></div>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav naver-inverse">
					<!-- 로그인을 안했을때 -->
					<li class="nav-item"><a class="nav-link" data-toggle="modal"
						href="#myModal">로그인</a></li>
				</ul>
			</div>
		</c:when>
		<c:otherwise>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav naver-inverse">

					<!-- 로그인을 했을때 -->
					<li class="nav-item"><a class="nav-link">Explore</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath }/library/view?authUser=${authUser}">My
							Library</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath }/board/myboard?writer=">Highlights</a></li>

					<!-- 검색 -->
					<li class="nav-item">
						<form class="form-inline"
							action="${pageContext.request.contextPath }/book/search">
							<input class="form-control mr-sm-2" type="search"
								placeholder="제목,작가" aria-label="Search" id="keyword"
								name="keyword" />
							<button class="btn-image" type="submit">
								<i class="fa fa-search"></i>
							</button>
						</form>
					</li>
				</ul>
			</div>
			<div class="collapse navbar-collapse   " id="navbarResponsive"></div>
			<div class="collapse navbar-collapse   " id="navbarResponsive">

				<ul class="navbar-nav naver-inverse">

					<li class="nav-item"></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath }/apply/result?userno=">Upgrade
							to Premium</a></li>
					<li class="dropdown">
						<button type="button" class="btn dropdown-toggle"
							data-toggle="dropdown">Account</button>
						<div class="dropdown-menu">
							<a class="dropdown-item"
								href="${pageContext.request.contextPath}/user/update">설정</a> <a
								class="dropdown-item" data-toggle="modal" href="#logout">로그아웃</a>
						</div>
					</li>
				</ul>

			</div>
		</c:otherwise>
	</c:choose>


</nav>
<c:import url="/WEB-INF/jsp/modal/loginModal.jsp" />
<c:import url="/WEB-INF/jsp/modal/logoutModal.jsp" />