

//사이드바 열고 닫기 
function w3_open() {
    document.getElementById("Sidebar").style.display = "block";
}

function w3_close() {
    document.getElementById("Sidebar").style.display = "none";
} 


//chapter 열고 닫기
function openNav() {
  document.getElementById("myNav").style.width = "30%";
}

function closeNav() {
  document.getElementById("myNav").style.width = "0%";
}


//content내용변경
$(document).ready(function () {

$('.chapter_title').click(function(){

    //a태그의 text값가져오기
    var chapter = $(this).text();
    
    //p태그 "chapter_title"값교체
	$("#chapter_title").text(chapter);
    
    	
	//a태그의 id값(content)가져오기
	var content = $(this).attr('id');
		
	//p태그 content값교제 
	$("#p_content").text(content);
	
 }); 
 });
 
 
//paging
 $(document).ready(function () {
 
   $('.page-link').click(function(){

     //해당페이지의 name값(chapter_title)가져오기
     var chapter = $(this).attr('name');
        
     //해당페이지의 id값(content)가져오기
     var content = $(this).attr('id');
     
     //p태그 "chapter_title"값교체
	 $("#chapter_title").text(chapter);
	 
	 //p태그 content값교제 
	 $("#p_content").text(content);
	 
	  //해당번호를 가져오기 
      var this_pagenum = $(this).text();
                  
   });
 });
 
 
 //progress
$(document).ready(function () {

   //책의 전체페이지수 구하기
   var chapter_total = $("li").length;

   //책을 읽으면 첫번째 페이지는 읽은것!
   var first_read = parseInt(1/chapter_total*100);
   
   
   //기존 progress보다 큰값이면 (즉 기존의 progress가 0 이면)
   if($('#existing_progress').val() < first_read){
   
      //progree tag에 값넣기
      $('#progress').val(first_read);
      
     //progress갱신
     var progress =  $('#progress').val();//progress값가져오기
   
     var book_no = $('#book_no').val();//book_no값가져오기
        
     var allData = { "progress": progress, "book_no" : book_no};
     $.ajax({
	
	    url : "/blinkist/library/update_progress",
        type : "post",
        data : allData,
	    success : function(data) {

	}});
   }
   
    
   $('.page-link').click(function(){
   
     //해당페이지번호 가져오기
     var this_pagenum = $(this).text();
     
     //중간 페이지를 건너뛰어도 중간페이지도 읽은걸로!
     var page_read = parseInt(this_pagenum/chapter_total*100);
     
     //이전 번호를 눌러도 큰 번호가 들어가도록
     if($('#progress').val()<page_read){
     
        //progree tag에 값넣기
        $('#progress').val(page_read);
     
     }
     
     //기존 progress보다 큰값이면 (즉 기존의 progress가 0 이면)
     if($('#existing_progress').val() < page_read){
     
     //progress갱신
     var progress =  $('#progress').val();//progress값가져오기
   
   var book_no = $('#book_no').val();//book_no값가져오기
        
   var allData = { "progress": progress, "book_no" : book_no};
   $.ajax({
	
	  url : "/blinkist/library/update_progress",
      type : "post",
      data : allData,
	  success : function(data) {

	}});}   
   });
   });