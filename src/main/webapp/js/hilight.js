

//제목 hilight삭제
   $(document).ready(function() {
$('.btn').click(function(){
	
	console.log("반응");
	
    var hilight_no =  $(this).attr('name');//hilight_no가져오기
        
        var allData = { "hilight_no": hilight_no};
	    $.ajax({
	
		   url : "http://localhost:8080/blinkist/hilight/deleteHilight",
		   type : "post",
		   data : allData,
		   success : function(data) {

                     swal("success", "hilight에서 삭제했습니다.", "success");
                     
                     $('.swal-button').click(function(){//팝업창 ok눌렀을때
                     
                           location.reload();
                      });               
             }
		}); 
 });});
 

//날짜 hilight삭제
   $(document).ready(function() {
$('#Delete_Date').click(function(){
	
	
    var hilight_no =  $(this).attr('name');//hilight_no가져오기
        
    var allData = { "hilight_no": hilight_no};
	
	$.ajax({
	
		   url : "http://localhost:8080/blinkist/hilight/deleteHilight",
		   type : "post",
		   data : allData,
		   success : function(data) {

                     swal("success", "hilight에서 삭제했습니다.", "success");
                     
                     $('.swal-button').click(function(){//팝업창 ok눌렀을때
                     
                           location.reload();
                      });               
             }
		}); 
 });}); 