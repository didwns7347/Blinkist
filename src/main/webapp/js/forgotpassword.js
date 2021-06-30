var isCertification = false;
var emailCheck = false;
var key = "";
var email = "";
var ckemail = "";

$(".mail_check_button").click(function() {
	email = $("#email").val();
	if (email == "") {
		alert("이메일 주소가 입력되지 않았습니다.")
	} else {
		$.ajax({
			type: "post",
			url: "/blinkist/user/joincheck",
			data: {
				"email": email
			},
			dataType: 'json',
			success: function(data) {
				ckemail = data["email"];
				console.log("왜안되???:" + ckemail);
				if (ckemail == "")
					alert("가입되지 않은 email");
				else {
					alert("비밀번호 재설정");
					emailCheck=true;
					$.ajax({
						type: "post",
						url: "/blinkist/email/mailcheck",
						data: { "email": ckemail },
						dataType: 'json',
						success: function(data) {
							key = data["key"];
							console.log(key);
						
							isCertification=true;
						}

					});
					
				}
			},
		});
		
		
		

	}
});

$("#authcode")
	.on(
		"propertychange change keyup paste input",
		function() {
			if ($("#authcode").val() == key) { //인증 키 값을 비교를 위해 텍스트인풋과 벨류를 비교
				$("#compare-text").text("인증 성공!").css("color",
					"black");
				isCertification = true; //인증 성공여부 check
				$("#authmail").attr("value", $("#email").val());
			} else {
				$("#compare-text").text("불일치!").css("color",
					"red");
				isCertification = false; //인증 실패
			}
		});

$("#submit-btn").click(function submitCheck() {
	if (isCertification == false) {
		alert("메일 인증이 완료되지 않았습니다.");
		return false;
	} else
		true;
});

function submitCheck() {
	if (emailCheck==false) {
		alert("가입된 회원이 아닙니다.")
		return false;
	}

	else if (isCertification == false) {
		alert("메일일 인증이 완료되지 않았습니다.");
		return false;
	} else
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