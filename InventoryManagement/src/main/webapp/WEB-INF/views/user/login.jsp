<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>로그인 페이지</title>

<!-- CSS -->
 <link href="${pageContext.request.contextPath }/assets/css/user.css" rel="stylesheet" type="text/css">  
</head>

<body>
	<c:import url="/WEB-INF/views/includes/header.jsp" />
    <c:import url="/WEB-INF/views/includes/nav.jsp" />

	<!-- 로그인 form -->
	<form method="post"  autocomplete="off"">
	  <div id="wrap">
	         <h1>LOGIN</h1>
	     
			           <hr>
			           
			 <!-- 이미지사진 -->
			  <div>
				  <img src="${pageContext.request.contextPath }/assets/images/human.png"  id="login_img">
			  </div>

			        <br />
			 
			<label for="id"><strong>아이디</strong></label>
			<input type="text"  name="id"  id="id"   autofocus required>
			
			      <br /><br />
			 
			<label for="password"><strong>비밀번호</strong></label> 
			<input type="password"  name="password"  id="password"  required>
			 
			      <br /><br />
			 <c:if test="${'fail' == param.fail }">
			     <p>
							로그인이 실패 했습니다.
				</p>
			</c:if>

			<button type="submit"  id="login-submit">로그인</button>

			       <br /><br /> 
			
		      <input type="reset" value="취소"  id="login-reset" onclick="location.href='/'">
			
			 <br /><br />
	 </div>
  </form>

        <c:import url="/WEB-INF/views/includes/footer.jsp" />
	
</body>
</html>