<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html style="height: 100%">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>회원가입</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/css/styles.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath }/css/blog-home.css"
	rel="stylesheet">
<!-- modal login CSS -->
<link href="${pageContext.request.contextPath }/css/loginform.css"
	rel="stylesheet" />
<!-- jquery -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/update.js"></script>

</head>
<body style="height: 100%; width: 100%;">
	<!-- navigation include -->
	<c:import url="/WEB-INF/jsp/include/navigation.jsp" />
	<div class="container">
		<div class="row">
			<div class="col-md-4"></div>    
			<div class="col-md-4">
				<h2>회원가입</h2>
				<br/>
				<c:if test="${not empty Fail}">
					<div class="alert alert-info">
						<strong>이미가입된 이메일 입니다.</strong>
					</div>
				</c:if>
				
				<div class="form-group">
					<label for="email">이메일 주소</label>
					<div class="form-inline">
						<input type="text" class="form-control" name="email" id="email"
							placeholder="이메일을 입력해 주세요" required>
						<button class="mail_check_button btn-primary">인증</button>
					</div>
				</div>

				<div class="form-group inline">
					<label for="authkey">인증번호</label> 
					<input type="text"
						class="form-control" name="authcode" id="authcode"
						placeholder="인증번호" required>
					<p id="compare-text">인증</p>
				</div>
				<form role="form" autocomplete="off" onsubmit="return submitCheck();"
					action="${pageContext.request.contextPath }/user/join" method=post>
					
					<input type="hidden" id="authmail" name="email" value="">
					
					<div class="form-group">
						<label for="password">비밀번호</label> <input type="password"
							class="form-control" name="password" id="password"
							placeholder="비밀번호를 입력해주세요" >
					</div>
					<div class="form-group">
						<label for="PasswordCheck">비밀번호 확인</label> <input type="password"
							class="form-control" id="PasswordCheck"
							placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요" >
					</div>


					<div id="same"
						style="color: blue; font-weight: bold; text-align: center;">등록하실
						비밀번호를 동일하게 입력하셨습니다.</div>
					<div id="notsame"
						style="color: red; font-weight: bold; text-align: center;">등록하실
						비밀번호가 동일하지 않습니다.</div>

					<br /> <br />
					<div class="form-group text-center">
						<button type="submit" id="submit-btn" class="btn btn-primary">
							회원가입<i class="fa fa-check spaceLeft"></i>
						</button>
						
					</div>
				</form>

			</div>
			<div class="col-md-4"></div>
		</div>
	</div>

	<!-- navigation include -->
	<div id="content"></div>
	<footer>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</footer>

	<script>
		//join비밀번호 확인
		var isCertification=false;
		var key="";
		var email="";
		$(".mail_check_button").click(function(){
			email=$("#email").val();
			if(email==""){
				alert("이메일 주소가 입력되지 않았습니다.")
			}
			else{
				$.ajax({
					type:"post",
					url:"/blinkist/user/mailcheck",
					data:{ "email": email},
					dataType:'json',
					success: function(data){
						key=data["key"];
						
					},
				});
				alert("인증번호가 전송되었습니다.");
				
				console.log(key)
			}
		});
		
		
		$("#authcode").on("propertychange change keyup paste input", function() {
			if ($("#authcode").val() == key) {   //인증 키 값을 비교를 위해 텍스트인풋과 벨류를 비교
				$("#compare-text").text("인증 성공!").css("color", "black");
				isCertification = true;  //인증 성공여부 check
				$("#authmail").attr("value",$("#email").val());
			} else {
				$("#compare-text").text("불일치!").css("color", "red");
				isCertification = false; //인증 실패
			}
		});
		
		$("#submit-btn").click(function submitCheck(){
			if(isCertification==false){
				alert("메일 인증이 완료되지 않았습니다.");
				return false;
			}else
				true;
		});
		
		function submitCheck(){
			if(isCertification==false){
				alert("메일 인증이 완료되지 않았습니다.");
				return false;
			}else
				true;
		}
		$(function() {
			$("#same").hide(); // 메세지숨김
			$("#notsame").hide();// 메세지숨김
			$('#submit').fadeTo(500, 0.5); //버튼 투명하게

			$("#password,#PasswordCheck").keyup(function() {

				var password = $("#password").val(); //사용자가 입력한 password값 얻어오기
				var confirmpassword = $("#PasswordCheck").val(); //사용자가 입력한 confirmpassword값얻어오기

				if (password != "" && confirmpassword != "") { // 작성안하면 ""값일때 동일한 비밀번호라고 나옴
					if (password == confirmpassword) {

						$("#same").show();
						$("#notsame").hide();
						$("#submit").removeAttr("disabled");//가입버튼 활성화
						$('#submit').fadeTo(100, 1); // 버튼 색 다시 나오게

					} else {

						$("#same").hide();
						$("#notsame").show();
						$("#submit").attr("disabled", "disabled");//가입버튼 비활성화
						$('#submit').fadeTo(100, 0.5); //버튼 투명하게

					}
				} else {

					$("#submit").attr("disabled", "disabled"); // 한개의 값이라도 입력안하면 가입버튼을 못누름
					$('#submit').fadeTo(100, 0.5); //버튼 투명하게

				}
			});
		});
		
	</script>
</body>
</html>