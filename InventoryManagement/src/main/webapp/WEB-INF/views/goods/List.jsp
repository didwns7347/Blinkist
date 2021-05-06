<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	          <title>상품리스트페이지</title>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		
		<!-- Load icon library:검색에 사용하는 돋보기 사진 -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
		<!-- CSS -->
       <link href="${pageContext.request.contextPath }/assets/css/goods.css" rel="stylesheet" type="text/css">      	
</head>
	<body>
		<c:import url="/WEB-INF/views/includes/header.jsp" />
	    <c:import url="/WEB-INF/views/includes/nav.jsp" />
	
		  <div id="wrap">
			  <h1 id="h1">goodsList</h1>	
			  
			  	<!-- 상품카테고리 -->
			   <select  id="category"  name="category">
			   <option value="base">----------------------------------</option>
				  <option value="아우터">아우터</option>
				  <option value="상의">상의</option>
				  <option value="하의">하의</option>
				  <option value="신발">신발</option>
		      </select>
		      
		      
			<section id="container">
				<form role="form"   method="get">
					<table class="table table-hover">
						<thead>
							<tr><th>번호</th><th>카테고리</th><th>상품이름</th><th>등록일</th></tr>
						</thead>
						<c:forEach items="${List}" var = "list" varStatus="status">
							<tr>
								<td class="number"><c:out value="${status.count}" /></td>
								<td class="category" id="${list.category}">${list.category}</td>
								<td class="name">
									<a  href="${pageContext.servletContext.contextPath }/goods/view/${list.number}"><c:out value="${list.name}" /></a>
								</td>
								<td class="regtime"><fmt:formatDate value="${list.regtime}" pattern="yyyy-MM-dd"/></td>
							</tr>
						</c:forEach>
					</table>
				</form>
			</section>
			</div>
			
			<!-- 페이징 -->
	       <div id="wrap">	
		        <c:if test="${pageMaker.prev}">
			            <a href="List${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a>
		        </c:if>

		       <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			           <a style="font-size:20px; " href="List${pageMaker.makeQuery(idx)}">${idx}</a>
		       </c:forEach>

		       <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			           <a href="List${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a>
		      </c:if>
	    </div>


	<br /><br />


	<!-- 검색 -->
	<div class="search">
		<select name="searchType" id="searchType">
			<!-- 상품이름으로 검색 -->
			<option value="g" <c:out value="${se.searchType eq 'g' ? 'selected' : ''}"/>>상품이름</option>
			<!-- 상품이름+내용으로 검색 -->
			<option value="gc" <c:out value="${se.searchType eq 'gc' ? 'selected' : ''}"/>>상품이름+상품정보</option>
		</select> 
		<input type="text" name="keyword"  placeholder="Search.." id="keyword" value="${se.keyword}" autocomplete="off" />
		<button id="searchbutton" type="button"><i class="fa fa-search"></i></button>
    </div>
    
    	<br /><br /><br /><br />
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
		

<!-- jquery -->
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script>
$(function() {
	  $("select[name=category]").change(function() {

			// select[name=category] option의 value값가져오기
		    var a = $(this).val(); 

		    
	$("td[class='category']").each(function (i) {	    
		  
		//일단 모든 <td>태그숨기기
		number = $("td[class='number']").eq(i).hide(); //number
		category=  $("td[class='category']").eq(i).hide(); //카테고리
		name = $("td[class='name']").eq(i).hide(); //name
		regtime = $("td[class='regtime']").eq(i).hide(); //regtime
						
		temp=  $("td[class='category']").eq(i).attr('id'); //카테고리
				  
		  if(a==temp){//해당카테고리의 <td>태그만보이게하기.
			  
			  number.show();
			  category.show();
			  $("td[class='name']").eq(i).show();
			  regtime.show();
			  
		  }else if(a=="base"){
			  
			  number.show();
			  category.show();
			  $("td[class='name']").eq(i).show();
			  regtime.show();
			  	  
		  }		  
	});
	  });
	  });


//검색버튼 클릭시 원하는 결과 나오기
$(function() {
	$('#searchbutton').click(
    function() {
	     self.location = "List"+ '${pageMaker.makeQuery(1)}' + "&searchType="+ $("select[name=searchType] option:selected").val()+ "&keyword="+ encodeURIComponent($('#keyword').val());
		});
		});
</script>    	
</body>	
</html>