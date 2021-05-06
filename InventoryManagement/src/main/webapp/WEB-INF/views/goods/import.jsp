<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>상품입고페이지</title>

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
			<h2>입고Form</h2>
			<form  role="form"  method="post" autocomplete="off"  enctype="multipart/form-data">
			
			   <!-- 상품카테고리 -->
			   <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example"  name="category">
				<option>아우터</option>
				<option>상의</option>
				<option>하의</option>
				<option>신발</option>
		  </select>
			
			    <!-- 상품이름 -->
				<div class="mb-3">
					<label for="name">상품이름</label> 
					<input type="text"  class="form-control"  name="name"  id="name">
				</div>

                <!-- 상품수량 -->
				<div class="mb-3">
				  <label for="input">상품수량</label> 
				  <input type="text" class="form-control"  name="input"  id="input">
				</div>

                <!-- 상품정보 -->
				<div class="mb-3">
					<label for="info">상품정보</label>
					<textarea class="form-control"  rows="5"  name="info"  id="info"></textarea>
				</div>
				
				<!-- 상품이미지 -->
			   <div id="file-list">
					  <input multiple="multiple"  type="file"  id="file"  name="file"  accept="image/png, image/jpeg">
			  </div>
		<div>
		        <button type="submit"  id="submit"  class="btn btn-sm btn-primary" > 저장</button>
				<input type="reset"  value="취소"  onclick="location.href='/'" class="btn btn-sm btn-primary">
		</div>
	</form>	
	</div>
</article>
<c:import url="/WEB-INF/views/includes/footer.jsp" />
</body>
</html>