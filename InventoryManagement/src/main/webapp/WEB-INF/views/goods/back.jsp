<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>상품반품페이지</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

<!-- CSS -->
<link href="${pageContext.request.contextPath }/assets/css/goods.css" rel="stylesheet" type="text/css">      
</head>
<body>
	<c:import url="/WEB-INF/views/includes/header.jsp" />
	<c:import url="/WEB-INF/views/includes/nav.jsp" />
	
	<article id="wrap">
		<div class="container"  role="main">
			<h2>반품Form</h2>
			<form  role="form"  method="post" autocomplete="off"  enctype="multipart/form-data">
			
		    <c:forEach items="${goods}" var="i">
					<input type="hidden"  id="${i.category}"   class=" ${i.input-i.export-i.back}"  name="test"  value="${i.name}">
			</c:forEach>
			
			   <!-- 상품카테고리 -->
			   <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example"  name="category">
				  <option value="아우터">아우터</option>
				  <option value="상의">상의</option>
				  <option value="하의">하의</option>
				  <option value="신발">신발</option>
		      </select>
			
			
			   <!-- 반품할상품이름 -->
				<div class="mb-3">
				     <label>반품할상품이름</label>
				     	<select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example"  name="goodsName">	
				                       <option></option>
				       </select>    
				</div>
				<input type="hidden" name="name"  id="name" value="">


                 <!-- 반품할 상품수량 -->
				<div class="mb-3">
				  <label for="back">반품할상품수량</label> 
				    <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example"  name="back">
				  	   <option></option>
				  	 </select>  
				</div>

                <!-- 반품사유 -->
				<div class="mb-3">
					<label for="back_info">반품사유</label>
					<textarea class="form-control"  rows="5"  name="back_info"  id="back_info"></textarea>
				</div>
				
		<div>
		        <button type="submit"  id="submit"  class="btn btn-sm btn-primary" > 반품</button>
				<input type="reset"  value="취소"  onclick="location.href='/'" class="btn btn-sm btn-primary">
		</div>
	</form>	
	</div>
</article>

<!-- jquery -->
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script type="text/javascript"  src="${pageContext.request.contextPath }/assets/javascript/goods.js"></script>     
<c:import url="/WEB-INF/views/includes/footer.jsp" />
</body>
</html>