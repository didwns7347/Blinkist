<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 상품이미지가 나오게 하려고:외부경로이미지 -->
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>
<title>상품상세페이지</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		
<!-- CSS -->
<link href="${pageContext.request.contextPath }/assets/css/goods.css" rel="stylesheet" type="text/css">      	

</head>
<body>
    <c:import url="/WEB-INF/views/includes/header.jsp" />
	<c:import url="/WEB-INF/views/includes/nav.jsp" />
		
	<div id="wrap">
		<h1 id="h1">상품상세보기</h1>
		
		    <table class="list-table">
			   <thead>
				   <tr>
				       <th>상품정보</th>
					  <th width="50"><button type="button"   class="btn btn-outline-primary"   id="update" onclick="location.href='${pageContext.servletContext.contextPath }/goods/update/${number}'">상품수정</button></th>
					  <th><a href="${pageContext.servletContext.contextPath }/goods/Delete?number=${number}"  class="btn btn-outline-primary"    id="delete">상품삭제</a></th>
					  
			</tr>
		</thead>

        <!-- 게시물의 내용출력  -->
		<tbody>
		   <tr>
			       <!-- 해당 게시물의 내용출력 -->
				   <td>${Info}</td>
		 </tr>
		 <tr>
			  <!-- 해당 게시물의 이미지출력 -->
				   <td><img id="img" src="<spring:url value='/img/${img}'/>" /></td>
		 </tr>
	   </tbody>
   </table>
		<br /><br />

	  <button style="padding: 10px 30px;" type="reset"  onclick="location.href='/goods/List'" class="btn btn-sm btn-primary">목록</button>
</div>

	   

    <c:import url="/WEB-INF/views/includes/footer.jsp" />
    

<!-- jquery -->
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script type="text/javascript"  src="${pageContext.request.contextPath }/assets/javascript/update.js"></script>        
</body>
</html>