<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <!-- Google fonts-->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
  <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
  <!-- Core theme CSS (includes Bootstrap)-->
  <link href="${pageContext.request.contextPath }/css/styles.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath }/css/blog-home.css" rel="stylesheet">
  <!-- bootstrap -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script type="text/javascript"  src="${pageContext.request.contextPath }/js/update.js"></script>  
  <!-- modal login CSS -->
  <link href="${pageContext.request.contextPath }/css/loginform.css" rel="stylesheet" />
   <!-- Font Awesome icons (free version)-->
   <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
   <!-- Google fonts-->
   <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
   <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
</head>
<body>
<!-- navigation include -->
	<c:import url="/WEB-INF/jsp/include/navigation.jsp" />
<br>

<div class="container">
		<div class="container"><h2>설정</h2></div>
                             <br>
                      
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
      <a class="nav-link active" data-toggle="tab" href="#update">회원정보수정</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#menu1">Menu 1</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#menu2">Menu 2</a>
    </li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content mb-5">
    <div id="update" class="container tab-pane active"><br>
      <!-- 등급업데이트 -->
      <h3 class="mb-5" id="grade">회원님의 등급: ${uservo.grade}</h3>
      
  <c:choose>
    <c:when test="${uservo.grade eq 'basic'}">

	  <h4 class="mb-4" style="color: blue;">Choose the plan that fits you</h4>
	  <label class="radio-inline"><input type="radio" class="${uservo.email}" name="subscribe" id="16000" value="monthP" checked><strong style="font-size: 20px;"> Premium Monthly 16,000₩/month</strong></label> 
	  
	                                                                                <br/><br/>
	                                                                                
	  <label class="radio-inline"><input type="radio" class="${uservo.email}" name="subscribe" id="99000" value="yearP"><strong style="font-size: 20px;"> Premium Yearly 99,000₩/annually</strong></label> 
				
				                                                                    <br /><br />

	  <button type="button" class="btn btn-outline-success" data-toggle="modal" data-target="#gradeUpdate">Upgrade to Premium</button>
  </c:when>
  
                       
  <c:otherwise>
  <p id="primium_date">
              <fmt:parseDate  value="${uservo.primium_date}" pattern="yyyy-MM-dd" var="StartLine" />
              <p style="display:none" id="StartLine"><fmt:formatDate value="${StartLine}" type="DATE" pattern="yyyy-MM-dd"/></p>
  </p>
  <a href="#" style="color:blue"><strong>구독관리</strong></a> 
  </c:otherwise>     
       
       
       </c:choose>                      
                              <br/><br/><hr/>
                              
      <!-- 회원정보수정 -->  
                               <br/><br/>
                               
      <h4>회원님의 정보</h4>
      Email : ${uservo.email}                                 
     
                                <br/><br/>
    <!-- Button trigger modal -->
    <button type="button" class="btn btn-outline-success" id="passwordUpdate" data-toggle="modal" id="password" data-target="#password">비밀번호수정</button>

      ${message}
                              <br/><br/><hr/>
                              
      <!-- 회원탈퇴 -->                         
                              <br/><br/>
      
      <h4>회원탈퇴</h4>
                                <br/><br/>
                                
      <p>계정을 삭제하면 모든 콘텐츠가 삭제되고 계정과 관련된 모든 데이터가 삭제됩니다. 구매한 구독은 종료되지 않습니다.</p>
      <p>계정을 삭제하려면 먼저 활성 구독을 취소해야 합니다.</p>
      
                                 <br/><br/>
                        
      <c:choose>
        <c:when test="${uservo.grade eq 'basic'}">                  
           <button type="submit" class="btn btn-outline-success" data-toggle="modal" data-target="#delete">회원탈퇴</button>
        </c:when> 
        
        <c:otherwise>
            <button type="submit" class="btn btn-outline-success" data-toggle="modal" data-target="#delete" disabled='disabled'>회원탈퇴</button>
        </c:otherwise>
     </c:choose>   
     </div>












			<div id="menu1" class="container tab-pane fade"><br>
      <h3>Menu 1</h3>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>
    <div id="menu2" class="container tab-pane fade"><br>
      <h3>Menu 2</h3>
      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
    </div>
  </div>
</div>
 <!-- navigation include -->
 <c:import url="/WEB-INF/jsp/include/footer.jsp" />
 
<c:import url="/WEB-INF/jsp/modal/updateModal.jsp" />
<c:import url="/WEB-INF/jsp/modal/gradeUpdateModal.jsp" />
<c:import url="/WEB-INF/jsp/modal/deleteModal.jsp" />
</body>
</html>