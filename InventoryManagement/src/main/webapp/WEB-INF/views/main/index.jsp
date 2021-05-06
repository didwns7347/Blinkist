<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>재고관리프로그램</title>
<link href="${pageContext.request.contextPath }/assets/css/main.css" rel="stylesheet" type="text/css">
</head>
<body>

	<c:import url="/WEB-INF/views/includes/header.jsp" />
	<c:import url="/WEB-INF/views/includes/nav.jsp" />
	
	<div id="wrap">
			<div id="content">
			<img id="profile" src="${pageContext.request.contextPath }/assets/images/profile.jpg">
			<c:choose>
				<c:when test="${empty authUser }">
					<h2 style="margin-top: 30px;">안녕하세요. 의류재고관리프로그램에 오신 것을 환영합니다.</h2>
				</c:when>
				<c:otherwise>
					<h2 style="margin-top: 30px;">안녕하세요. ${authUser.id}님 의류재고관리프로그램에 오신 것을 환영합니다.</h2>
				</c:otherwise>
			</c:choose>
			<p>
						1)이 사이트는  2021.0427~2021.0503까지 제작한사이트입니다.<br>
						2) 상품의 재고를 쉽고 편리하게 관리할수있도록 만들었구요. 제작에 사용한 프로그램은 STS4이고 서버는  Apache Tomcat을 사용했습니다.<br>
						3) 메뉴는  상품입고,상품출고,상품반품,상품리스트 및 검색, 상품별 매출 및 총매출보기, 게시판(메모장)이있습니다.<br>
						4)  사용한 프로그래밍언어 및 마크업언어: JAVA, MYSQL, JSP, JAVASCRIPT, AJAX, HTML/CSS, SPRING BOOT,BootStrap <br><br>
					</p>
				</div>
			</div>
	<c:import url="/WEB-INF/views/includes/footer.jsp" />
</body>
</html>