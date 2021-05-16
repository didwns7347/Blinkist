<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
	<div class="container">
		<a class="navbar-brand" href="${pageContext.request.contextPath }">대신해주세요</a>
		<form action="${pageContext.request.contextPath }/book/search">
			<div class="input-group">
				<input class="searchform-control" type="text" placeholder="제목,작가"
					id="keyword"  name="keyword"/> <span class="input-group-append">
					<button class="btn-image" type="submit">
						<i class="fa fa-search"></i>
					</button>
				</span>
			</div>
		</form>

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">

				<li class="nav-item active"><a class="nav-link"
					href="${pageContext.request.contextPath }">홈으로 <span
						class="sr-only">(current)</span>

				</a></li>
				<c:choose>
					<c:when test="${empty authUser }">
						<li class="nav-item"><a id=login class="nav-link"
							href="${pageContext.request.contextPath }/user/joinprimium">프리미엄
								가입</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="modal"
							href="#myModal">로그인</a></li>

					</c:when>
					<c:otherwise>

						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath }/user/logout">로그아웃</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath }/board">게시판</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath }/board/myboard?writer=${authUser}">내글보기</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath }/apply/result?userno=${authUser}">지원결과</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</nav>
<c:import url="/WEB-INF/jsp/modal/loginModal.jsp" />
<script>
	$(document).ready(function() {
		$("#login").click(function() {
			$("#myModal").modal();
		});
	});
</script>
<script>
	function searchToggle(obj, evt) {
		var container = $(obj).closest('.search-wrapper');
		if (!container.hasClass('active')) {
			container.addClass('active');
			evt.preventDefault();
		} else if (container.hasClass('active')
				&& $(obj).closest('.input-holder').length == 0) {
			container.removeClass('active'); // clear input
			container.find('.search-input').val('');
		}
	}
</script>
