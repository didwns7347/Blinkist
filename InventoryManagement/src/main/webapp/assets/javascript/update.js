//체크박스 체크여부에 따른 <input type="file">보여주기

$(function(){
	
	$("#file").hide();
	
	
	// 체크박스체크여부 확인
	$('#checkbox').click(function(){
	
	if($('#checkbox').is(':checked')) {//체크박스체크시
	  
		$("#file").show();
		
	}else{
		
		$("#file").hide();
	}
	});
});