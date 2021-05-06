<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>상품출고페이지</title>

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
			<h2>출고Form</h2>
			<form  role="form"   autocomplete="off"  method="post">

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
		      
			
			    <!-- 상품이름 -->
				<div class="mb-3">
				     <label>상품이름</label>
				     	<select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example"  name="goodsName">	
				                       <option></option>
				       </select>    
				</div>
				<input type="hidden" name="name"  id="name" value="">
				
				
                <!-- 상품수량 -->
				<div class="mb-3">
				  <label for="export">출고할상품수량</label> 
				    <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example"  name="export">
				  	   <option></option>
				  	 </select>  
				</div>
				
				<!-- 남품업체 -->
				<div class="mb-3">
				  <label for="Supplier">남품업체</label> 
				    <input type="text"  class="form-control"  id="supplier"  name="supplier"  value=""  required> 
				</div>
				
				<div class="form-group text-center">
                        <button type="submit"  id="submit" class="btn btn-primary"> 상품출고<i class="fa fa-check spaceLeft"></i></button>
                        <input type="reset"  value="취소"  onclick="location.href='/'" class="btn btn-warning">
                </div>    
	</form>	
	</div>
</article>
<c:import url="/WEB-INF/views/includes/footer.jsp" />


<!-- jquery -->
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script type="text/javascript"  src="${pageContext.request.contextPath }/assets/javascript/goods.js"></script>      
</body>
</html>