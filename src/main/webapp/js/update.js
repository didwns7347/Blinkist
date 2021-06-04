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
	

//primium_date계산
   $(document).ready(function() {
   
     var grade = $('#grade').text();//회원의 등급구하기
     var primium_date = new Date($('#StartLine').text()); //프리미엄가입날구하기
            
    
     if(grade=='회원님의 등급: monthP'){//월구독자라면
     
              primium_date.setMonth(primium_date.getMonth()+1); //다음달구하기
                            
              new Date(primium_date).toLocaleString();
              
              $('#primium_date').text('Your subscription will renew on ' + new Date(primium_date).toLocaleString());
              
     
     }else if(grade=='회원님의 등급: yearP'){//다음해구하기
     
              primium_date.setFullYear(primium_date.getFullYear() + 1);
              
              $('#primium_date').text('Your subscription will renew on ' + new Date(primium_date).toLocaleString());
     
     } 
   });