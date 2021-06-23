<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>


<link href="${pageContext.request.contextPath }/css/searchbar.css" rel="stylesheet" />


<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">

	<!-- navbar-brand의 content 변경 -->
	<div class="col-lg-1"></div>

	<a class="navbar-brand" href="${pageContext.request.contextPath }">Blinkist</a>

	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>



	<s:authorize access="isAnonymous()">


		<div class="col-lg-9"></div>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav naver-inverse">
				<!-- 로그인을 안했을때 -->
				<li class="nav-item"><a class="nav-link" data-toggle="modal"
					href="#myModal">로그인</a></li>
			</ul>
		</div>
	</s:authorize>

	<s:authorize access="isAuthenticated()">
		<s:authentication property="principal" var="authUser" />
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav naver-inverse">

				<!-- 로그인을 했을때 -->
				<li id="explorehidden" class="nav-item"><a id="exploreA"class="nav-link"
					href="javascript:void(0)" onclick="openExplore()">Explore</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath }/library/view?authUser=${authUser.username}">My
						Library</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath }/hilight/hilight?authUser=${authUser.username}">Highlights</a></li>

				<!-- 검색 -->
				<li class="nav-item">
					<form class="form-inline"
						action="${pageContext.request.contextPath }/book/search">

						<input id="search" type="text" name="keyword" placeholder="제목,작가">
						<input id="authUser" type="hidden" name="authUser"
							value="${authUser.username }" />
						<!--  
							<input class="form-control mr-sm-2" type="search"
								placeholder="제목,작가" aria-label="Search" id="keyword"
								name="keyword" />-->

					</form>
				</li>
			</ul>
		</div>
		<div class="collapse navbar-collapse   " id="navbarResponsive"></div>
		<div class="collapse navbar-collapse   " id="navbarResponsive">

			<ul class="navbar-nav naver-inverse">

				<li class="nav-item"></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/user/update">Upgrade
						to Premium</a></li>
				<li class="dropdown">
					<button type="button" class="btn dropdown-toggle"
						data-toggle="dropdown">Account</button>
					<div class="dropdown-menu">
						<a class="dropdown-item"
							href="${pageContext.request.contextPath}/user/update">설정</a>
						<form action="${pageContext.request.contextPath}/logout"
							method="post">
							<button class="dropdown-item" data-toggle="modal" type="submit">로그아웃
							</button>
						</form>
					</div>
				</li>
			</ul>

		</div>
	</s:authorize>



</nav>
<s:authorize access="isAuthenticated()">
	<s:authentication property="principal" var="authUser"/> 
	<div id="explore" class="overlay">
		
		<div class="overlay-content container" id="olcontainer">
			<div class="discover-menu__header">
				<h4 class=discover-menu__headline>Explore by category</h4>
				<ul class="discover-menu__header-links">
					<li><a
						href="${pageContext.request.contextPath }/book/recentlyadded"
						class="discover-menuheader-link">See recently added titles</a></li>
					<li><a
						href="${pageContext.request.contextPath }/book/popular"
						class="discover-menu__header-link">See popular titles</a></li>
					
						
				</ul>
				<a href="javascript:void(0)" class="closebtn" onclick="closeExplore()">&times;</a>
					
			</div>
			<ul class="discover-menu__categories">
				<li class="discover-menu__category"><a
					href="${pageContext.request.contextPath }/book/category?category=인문학"
					class="discover-menu__category-link"> 인문학 </a></li>
				<li class="discover-menu__category"><a
					href="${pageContext.request.contextPath }/book/category?category=건강/생활/요리"
					class="discover-menu__category-link"> 건강/생활/요리 </a></li>
				<li class="discover-menu__category"><a
					href="${pageContext.request.contextPath }/book/category?category=소설"
					class="discover-menu__category-link"> 소설 </a></li>
				<li class="discover-menu__category"><a
					href="${pageContext.request.contextPath }/book/category?category=자기개발"
					class="discover-menu__category-link"> 자기개발 </a></li>
				<li class="discover-menu__category"><a
					href="${pageContext.request.contextPath }/book/category?category=사회"
					class="discover-menu__category-link"> 사회 </a></li>
				<li class="discover-menu__category"><a
					href="${pageContext.request.contextPath }/book/category?category=청소년"
					class="discover-menu__category-link"> 청소년 </a></li>
			</ul>
		</div>

	</div>
</s:authorize>
<script>
	function openExplore() {
		document.getElementById("explore").style.height = "424px";
	}
	function closeExplore() {
		document.getElementById("explore").style.height = "0%";
	}
</script>

<c:import url="/WEB-INF/jsp/modal/loginModal.jsp" />
<c:import url="/WEB-INF/jsp/modal/logoutModal.jsp" />