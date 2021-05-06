
//아이디중복확인
$(function(){
	$("#id").change(function(){
		$('#img-check').hide();
		$('#idCheck').show();
	});
	
	$("#idCheck").click(function(){
		
		const id = $("#id").val();
		if(id == ''){
			alert('아이디를 입력해주세요.');
			$("#id")
			.focus();
		return;
		}
		$.ajax({
			url: "/api/user/existeid?id=" + id,
			async: true,
			data: '',
			dataType: 'json',
			success: function(response){
				if(response.result != 'success'){
					console.error(response.message);
					return;
				}
				
				if(response.data == true){
					alert('이미 존재하는 이메일입니다. 다른 이메일을 사용해 주세요');
					$("#id")
						.val('')
						.focus();
					return;
				}
				
				$('#img-check').show();
				$('#idCheck').hide();
			},
			error: function(xhr, status, e){
				console.error(status + ":" + e);
			}
		});
	});
})


// 비밀번호 확인
$(function() {
	$("#same").hide(); // 메세지숨김
	$("#notsame").hide();// 메세지숨김
	$('#submit').fadeTo(500, 0.5); //버튼 투명하게

	$("#password,#confirmpassword").keyup(function() {
		
		var password = $("#password").val(); //사용자가 입력한 password값 얻어오기
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