

//책을 라이브러리에 추가하면 버튼을 Read now로 바꾸기 
$(function () {
	let test = false;

$('#Add_Library').click(function(){

    //버튼의 내용바꾸기
    if(test==false){
        document.getElementById("Add_Library").innerText = "Read now";
        test = true;
        
        var book_no =  $('#book_no').val();//book_no가져오기
  
        var allData = { "book_no": book_no};
	    $.ajax({
	
		   url : "/blinkist/library/button_addlibrary",
		   type : "post",
		   data : allData,
		   success : function(data) {

		}});
        
    }
    else
	    $("#Add_Library").attr("href", "http://3.139.21.42:8080/blinkist/content/readbook?book_no="+$('#book_no').val());//하이퍼링크 활성화
 }); 
 });