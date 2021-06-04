//회원정보수정모달
   $(document).ready(function() {
      $("#passwordUpdate").click(function() {
         $("#password").modal();
      });
   });
   

// update비밀번호 확인
$(function() {
	$("#same").hide(); // 메세지숨김
	$("#notsame").hide();// 메세지숨김
	$('#submit').fadeTo(500, 0.5); //버튼 투명하게

	$("#newpassword,#confirmpassword").keyup(function() {
		
		var password = $("#newpassword").val(); //사용자가 입력한 password값 얻어오기
		var confirmpassword = $("#confirmpassword").val(); //사용자가 입력한 confirmpassword값얻어오기

		if (password != "" && confirmpassword != "") { // 작성안하면 ""값일때 동일한 비밀번호라고 나옴
			if (password == confirmpassword) {
				
				$("#same").show();
				$("#notsame").hide();
				$("#submit").removeAttr("disabled");//가입버튼 활성화
				$('#submit').fadeTo(100, 1); // 버튼 색 다시 나오게
				
			}else {
				
				$("#same").hide();
				$("#notsame").show();
				$("#submit").attr("disabled", "disabled");//가입버튼 비활성화
				$('#submit').fadeTo(100, 0.5); //버튼 투명하게
				
			}
		}
		else {
			
			$("#submit").attr("disabled", "disabled"); // 한개의 값이라도 입력안하면 가입버튼을 못누름
			$('#submit').fadeTo(100, 0.5); //버튼 투명하게

		}
	});}); 