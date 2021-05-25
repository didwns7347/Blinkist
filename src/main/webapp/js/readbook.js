

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
 
 

 