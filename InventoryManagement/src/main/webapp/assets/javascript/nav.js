//로그아웃
$(".logout").click(function() {

	var id = '<%= Session["authUser"] %>'; 
	var answer = confirm("정말로 로그아웃하시겠습니까?");

	if (answer == true) {
		$.ajax({
			url : "/api/user/logout",
			type : "post",
			data : id,
			success : function(data) {

					alert("로그아웃 하였습니다.");
					location.href = '/'

				}
		 });}
     });


//회원탈퇴
$(".delete").click(function() {

	var info = '<%= Session["authUser"] %>'; 
	var answer = confirm("정말로 탈퇴하시겠습니까?");

	if (answer == true) {
		$.ajax({
			url : "/api/user/delete",
			type : "post",
			data : info,
			success : function(data) {

					alert("회원탈퇴 하였습니다.");
					location.href = '/'

				}
		 });}
     });