<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>다이어리 시스템</title>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
</head>

<body>
<h1>안녕하세요. 다이어리시스템입니다.</h1>
<!-- 현재 시간을 출력해준다. -->
<%=new SimpleDateFormat("yyyy년MM월dd일").format(new Date()) %><br>
<a href="register">회원가입</a>
<a href="login">로그인</a>
<a href="diarylist">다이어리게시판</a>
<br/>



<script>
  $(function(){
      var responseMessage = "<c:out value="${message}" />";
      if (responseMessage != ""){//메세지가 있으면
           alert(responseMessage)
        }
    })
</script>
<script>
    document.getElementById("loadMore").addEventListener("click",DisplayDate);
    function
</script>
</body>
</html>
