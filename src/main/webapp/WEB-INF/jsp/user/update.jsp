<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
      <h4>회원님의 등급</h4>
      
                              <br/><br/>
                              
      <h5>${uservo.grade}</h5>
       
                              <br/><br/>
      
      <button type="button" class="btn btn-outline-success">Upgrade to Premium</button>
      
                             
                              <br/><br/><hr/>
                              
      <!-- 회원정보수정 -->  
                               <br/><br/>
                               
      <h4>회원님의 정보</h4>
      Email : ${uservo.email}                                 
     
                                <br/><br/>
    <!-- Button trigger modal -->
    <button type="button" class="btn btn-outline-success" id="passwordUpdate" data-toggle="modal" id="password">비밀번호수정</button>

      ${message}
                              <br/><br/><hr/>
                              
      <!-- 회원탈퇴 -->                         
                              <br/><br/>
      
      <h4>회원탈퇴</h4>
                                <br/><br/>
     <button type="submit" class="btn btn-outline-success" data-toggle="modal" data-target="#delete">회원탈퇴</button>
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
<c:import url="/WEB-INF/jsp/modal/deleteModal.jsp" />
</body>
</html>