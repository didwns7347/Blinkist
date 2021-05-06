<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>���������α׷�</title>
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
					<h2 style="margin-top: 30px;">�ȳ��ϼ���. �Ƿ����������α׷��� ���� ���� ȯ���մϴ�.</h2>
				</c:when>
				<c:otherwise>
					<h2 style="margin-top: 30px;">�ȳ��ϼ���. ${authUser.id}�� �Ƿ����������α׷��� ���� ���� ȯ���մϴ�.</h2>
				</c:otherwise>
			</c:choose>
			<p>
						1)�� ����Ʈ��  2021.0427~2021.0503���� �����ѻ���Ʈ�Դϴ�.<br>
						2) ��ǰ�� ��� ���� ���ϰ� �����Ҽ��ֵ��� ���������. ���ۿ� ����� ���α׷��� STS4�̰� ������  Apache Tomcat�� ����߽��ϴ�.<br>
						3) �޴���  ��ǰ�԰�,��ǰ���,��ǰ��ǰ,��ǰ����Ʈ �� �˻�, ��ǰ�� ���� �� �Ѹ��⺸��, �Խ���(�޸���)���ֽ��ϴ�.<br>
						4)  ����� ���α׷��־�� �� ��ũ�����: JAVA, MYSQL, JSP, JAVASCRIPT, AJAX, HTML/CSS, SPRING BOOT,BootStrap <br><br>
					</p>
				</div>
			</div>
	<c:import url="/WEB-INF/views/includes/footer.jsp" />
</body>
</html>