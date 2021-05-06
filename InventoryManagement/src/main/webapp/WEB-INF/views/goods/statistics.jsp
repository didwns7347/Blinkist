<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>상품통계</title>
<!--Bootstrap-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<!-- 부트스트랩 -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<!-- 차트 링크 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

<!-- CSS -->
<link href="${pageContext.request.contextPath }/assets/css/goods.css" rel="stylesheet" type="text/css">      	
</head>

<body>
		<c:import url="/WEB-INF/views/includes/header.jsp" />
	    <c:import url="/WEB-INF/views/includes/nav.jsp" />

       <div id="wrap">
			  <h1 id="h1">statistics</h1>
		
		<!-- 1. 카테고리별 입고량(매입)통계 -->	  
		<c:forEach items="${inputNum}"  var = "list"    varStatus="status">
					 <input type="hidden"  id="${status.count}"  value="${list.input}"/>
		</c:forEach>	  	
		<canvas id="Purchase"></canvas>

	
		<!-- 2. 카테고리별 출고량(판매)통계 -->	  
		<c:forEach items="${exportNum}"  var = "list"   varStatus="status">
					 <input type="hidden"  id="${status.count+4}"  value="${list.export}"/>
		</c:forEach>	  	
		<canvas id="Sales"></canvas>
		
		
		<!-- 3. 카테고리별 반품량통계 -->	  
		<c:forEach items="${backNum}"  var = "list"   varStatus="status">
					 <input type="hidden"  id="${status.count+8}"  value="${list.back}"/>
		</c:forEach>	  	
		<canvas id="Return"></canvas>
</div>
	
<c:import url="/WEB-INF/views/includes/footer.jsp" />


<!-- jquery -->
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script type="text/javascript"  src="${pageContext.request.contextPath }/assets/javascript/statistics.js" charset="utf-8"></script>  
</body>
</html>

