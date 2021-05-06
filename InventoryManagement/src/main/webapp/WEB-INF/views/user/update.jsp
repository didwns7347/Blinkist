<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
 <head>
        <title>회원수정 페이지</title>
        
       <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
        
        <!-- font awesome -->
        <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
        
         <!-- CSS -->
        <link href="${pageContext.request.contextPath }/assets/css/user.css" rel="stylesheet" type="text/css">      
</head>
    <body>
           	<c:import url="/WEB-INF/views/includes/header.jsp" />
	        <c:import url="/WEB-INF/views/includes/nav.jsp" />
	        

            <div id="wrap">
                <form role="form" method="post"  autocomplete="off" action="${pageContext.request.contextPath }/user/update">
                    <!-- 이름 -->
                    <div class="form-group">
                    	<label for="name"><strong>이름</strong></label> 
				        <input type="text"  class="form-control"  id="name"  name="name"  value="${userVo.name }"  required> 
                    </div>
                    
                    <!-- 아이디 -->
                    <div class="form-group">
                         <label for="id"><strong>아이디</strong></label>               
                        <h4>${userVo.id }</h4> 
                   </div>
                   
                   <!-- 비밀번호 -->
                    <div class="form-group">
                        <label for="password"><strong>비밀번호</strong></label>
                        <input type="password"  name="password" class="form-control"  id="password"  required>
                    </div>
                    
                    <!-- 비밀번호확인 -->
                    <div class="form-group">
                        <label for="confirmpassword"><strong>비밀번호 확인</strong></label>
                        <input type="password"  class="form-control" id="confirmpassword"  required>
                    </div>
                    
   		
			     <div id="same">등록하실 비밀번호를 동일하게 입력하셨습니다.</div>
			    <div id="notsame">등록하실 비밀번호가 동일하지 않습니다.</div>
                   

                    <div class="form-group text-center">
                        <button type="submit"  id="submit" class="btn btn-primary"> 정보수정<i class="fa fa-check spaceLeft"></i></button>
                        <input type="reset"  value="수정취소"  onclick="location.href='/'" class="btn btn-warning">
                    </div>    
                </form>
             </div>
        	<c:import url="/WEB-INF/views/includes/footer.jsp" />
        	
 <!-- jquery -->
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script type="text/javascript"  src="${pageContext.request.contextPath }/assets/javascript/join.js"></script>            	
 </body>       
</html>