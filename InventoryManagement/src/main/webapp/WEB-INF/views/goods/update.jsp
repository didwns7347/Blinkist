<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>상품수정페이지</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<!-- CSS -->
<link href="${pageContext.request.contextPath }/assets/css/goods.css" rel="stylesheet" type="text/css">      
</head>
<body>
	<c:import url="/WEB-INF/views/includes/header.jsp" />
	<c:import url="/WEB-INF/views/includes/nav.jsp" />
	
	<article id="wrap">
		<div class="container"  role="main">
			<h2>상품수정Form</h2>
			<form  role="form"  method="post" autocomplete="off"  enctype="multipart/form-data">
			
			  <c:forEach items="${List}" var = "list" >
			    <!-- 상품이름 -->
				<div class="mb-3">
					<label for="name">상품이름</label> 
					<input type="text"  class="form-control"  name="name"  id="name"  value="${list.name}">
				</div>


                <!-- 상품정보 -->
				<div class="mb-3">
					<label for="info">상품정보</label>
					<textarea class="form-control"  rows="5"  name="info"  id="info" >${list.info}</textarea>
				</div>
				</c:forEach>  
				
				<!-- 상품이미지 -->
                <!-- 보안문제로 type="file"에 value값을 넣는건 안되다고한다..ㅠ --> 
                    <p id="p">[삭제를 원하면 체크박스를 체크해주세요]</p>
                   <input type="checkbox"  name="checkboximg"   id="checkbox" value="${img}"/>${img}<br/>
                   <input type="hidden" name="img"  value="${img}" />
                   	
			   <div id="file-list">
					  <input  multiple="multiple"  type="file"  id="file"  name="file"  accept="image/png, image/jpeg">
			  </div>
		<div>
		        <button type="submit"  id="submit"  class="btn btn-sm btn-primary" > 상품수정</button>
				<input type="reset"  value="취소"  onclick="location.href='${pageContext.servletContext.contextPath }/goods/view/${number}'" class="btn btn-sm btn-primary">
		</div>
	</form>	
	</div>
</article>
<c:import url="/WEB-INF/views/includes/footer.jsp" />

<!-- jquery -->
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script type="text/javascript"  src="${pageContext.request.contextPath }/assets/javascript/update.js"></script>    
</body>
</html>