

//사이드바 열고 닫기 
function w3_open() {
    document.getElementById("Sidebar").style.display = "block";
}

function w3_close() {
    document.getElementById("Sidebar").style.display = "none";
} 


//chapter 열고 닫기
function openNav() {
  document.getElementById("chapter").style.width = "30%";
}

function closeNav() {
  document.getElementById("chapter").style.width = "0%";
}


//책을 처음읽을때의 progress
$(document).ready(function () {


   //책의 전체페이지수 구하기
   var chapter_total = $(".page-item").length;
   
   //책을 읽으면 첫번째 페이지는 읽은것!
   var first_read = parseInt(1/chapter_total*100);
   
   //첫페이지의 chapter_title가져오기
   var chapter_title = $('#chapter_title').text();
   
   //p_content name값교체
   $("#p_content").attr("name",chapter_title);
   
   //첫페이지의 content_no가져오기
   var content_no = $('#chapter_title').attr('class');
	
   //p_content class값교체 
   $("#p_content").addClass(content_no);
      
   //첫번째 페이지 active
   $('li#1.page-item').addClass('active');
   
   
   //책을 처음읽을때의 progress(즉 기존의 progress가 0 이면)
   if($('#existing_progress').val()==0){
   
      //progress tag에 값넣기
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
 });


//chapter메뉴에서 chapter선택할때
$(document).ready(function () {
   $('.chapter_title').click(function(){

//1.chapter 메뉴에서의 content내용변경

     //a태그의 text값가져오기
     var chapter = $(this).text();
     //p태그 "chapter_title"값교체
	 $("#chapter_title").text(chapter);
     
    	
	 //a태그의 id값(content)가져오기
	 var content = $(this).attr('id');	
	 //p태그 content값교체 
	 $("#p_content").text(content);
	
	
	 //페이지의 chapter_title가져오기
     var chapter_title = $('#chapter_title').text();
   
     //p_content name값교체
     $("#p_content").attr("name",chapter_title);
   
	
	 //a태그의 name값(content_no)가져오기
	 var content_no = $(this).attr('name');
	
	 //p태그 class값교체 
	 $( '#p_content' ).removeAttr( 'class' );
	 $("#p_content").addClass(content_no);
	 
	 //번역버튼들 name교체
	 $('#korea').attr("name",content_no);
	 $('#english').attr("name",content_no);
		
//2.progress바꾸기
   
      //책의 전체페이지수 구하기
      var chapter_total = $(".page-item").length;

     //해당페이지번호 가져오기
     var this_pagenum = $(this).closest('p').attr('id');

     //중간 페이지를 건너뛰어도 중간페이지도 읽은걸로!
     var page_read = parseInt(this_pagenum/chapter_total*100);
     
     //이전 번호를 눌러도 큰 번호가 들어가도록
     if($('#progress').val()<page_read){
     
        //progress tag에 값넣기
        $('#progress').val(page_read);
        
     }   
	
     var book_no = $('#book_no').val();//book_no값가져오기
        
     var progress = $('#progress').val(); //progress값가져오기
                
     var allData = { "progress": progress, "book_no" : book_no};
         
     $.ajax({
	
	        url : "/blinkist/library/update_progress",
            type : "post",
            data : allData,
	        success : function(data) {

	 }});
	 
	      	 
//3. active변경하기
   
   //class값으로 active를 가지고있는 태그 active제거
   $('li[class$=active]').removeClass( 'active' );
      
   //해당 챕터페이지로 active넘겨주기 
   $('li#'+this_pagenum+'.page-item').addClass('active');


//4. 해당chapter의 hilight가져오기
   
    var hilight_chapter = $('input[id='+content_no+']').length;
   
		
    //배열 생성
    var hilightArr = new Array(hilight_chapter);
	//배열에 값 주입
	for(var i=0; i<hilight_chapter; i++){                          
			
		 hilightArr[i] = $('input[id='+content_no+']').eq(i).val();
	    
	     //hilight들을 노란색으로 표시
	     var keyword = hilightArr[i];
	     
	     var options = {
	     
	        "className" : "highlight"
	        
	     }
	     

         $('#p_content').markRanges([{
         
              start: $('#p_content').text().indexOf(keyword),
              length: keyword.length
         
         }],options);
           
    }    
});
}); 
 
 
//paging에서 chapter선택할때
 $(document).ready(function () {
   $('.page-link').click(function(){

//1. 내용변경

     //해당페이지의 name값(chapter_title)가져오기
     var chapter = $(this).attr('name');
     //p태그 "chapter_title"값교체
	 $("#chapter_title").text(chapter);

   
     //해당페이지의 id값(content)가져오기
     var content = $(this).attr('id');
	 //p태그 content값교체
	 $("#p_content").text(content);
	 
	 
	 //페이지의 chapter_title가져오기
     var chapter_title = $('#chapter_title').text();   
     //p_content name값교체
     $("#p_content").attr("name",chapter_title);
	 
	 
	 //해당페이지의 content_no구하기
	 var content_no = $(this).parents("li").attr('name');

	 //p태그 class값교체 
	 $( '#p_content' ).removeAttr( 'class' );
	 $("#p_content").addClass(content_no);
	 
	  //번역버튼들 name교체
	 $('#korea').attr("name",content_no);
	 $('#english').attr("name",content_no);
	 

//2.paging progress갱신    	 

	 //해당페이지번호 가져오기
     var this_pagenum = $(this).text();
     
     //전체페이지
     var chapter_total = $("li.page-item").length;
     
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

	}
	});
	}
	
//3. active변경하기
   
   //class값으로 active를 가지고있는 태그 active제거
   $('li[class$=active]').removeClass( 'active' );
      
   //해당 챕터페이지로 active넘겨주기 
   $('li#'+this_pagenum+'.page-item').addClass('active');	         
   
   
 //4. 해당chapter의 hilight가져오기
   
    var hilight_chapter = $('input[id='+content_no+']').length;
   
		
    //배열 생성
    var hilightArr = new Array(hilight_chapter);
	//배열에 값 주입
	for(var i=0; i<hilight_chapter; i++){                          
			
		 hilightArr[i] = $('input[id='+content_no+']').eq(i).val();
	    
	     //hilight들을 노란색으로 표시
	       var keyword = hilightArr[i];
	     
	     var options = {
	     
	        "className" : "highlight"
	        
	     }
	     
          $('#p_content').markRanges([{
         
              start: $('#p_content').text().indexOf(keyword),
              length: keyword.length
         
         }],options);     
    }	    
   });
 });
 
    
//첫페이지가 아닌읽은페이지에서 시작하도록 설정
$(document).ready(function () {

  //만약 progress가 0이 아닐때만
  if($('#existing_progress').val()>0){
  
  //책의 전체페이지수 구하기
  var chapter_total = $("li.page-item").length;
  
    
  //기존 progress값구하기
  var existing_progress = $('#existing_progress').val();
       
  //지금까지 읽은페이지수 구하기
  var existing_paging = Math.round(existing_progress/100*chapter_total);
  

  //지금까지 읽은페이지의 a태그 구하기
  var existing_paging_a = $('.page-link').get(existing_paging-1);
    
  //해당페이지의 chapter_title가져오기
  var chapter = $(existing_paging_a).attr('name');
  
  //해당페이지의 id값(content)가져오기
  var content = $(existing_paging_a).attr('id');
  
        
  //p태그 "chapter_title"값교체
  $("#chapter_title").text(chapter);
	 
  //p태그 content값교제 
  $("#p_content").text(content);
  
	 
   //해당페이지의 content_no구하기
   var content_no = $(existing_paging_a).parents("li").attr('name');

   //p태그 class값교체 
   $( '#p_content' ).removeAttr( 'class' );
   $("#p_content").addClass(content_no);
   
   //번역버튼들 name교체
   $('#korea').attr("name",content_no);
   $('#english').attr("name",content_no);
   
   //class값으로 active를 가지고있는 태그 active제거
   $('li[class$=active]').removeClass( 'active' );
      
   //해당 챕터페이지로 active넘겨주기 
   $('li#'+existing_paging+'.page-item').addClass('active');
   
   
  //4. 해당chapter의 hilight가져오기
   
    var hilight_chapter = $('input[id='+content_no+']').length;
  
		
    //배열 생성
    var hilightArr = new Array(hilight_chapter);
	//배열에 값 주입
	for(var i=0; i<hilight_chapter; i++){                          
			
		 hilightArr[i] = $('input[id='+content_no+']').eq(i).val();
	    
	     //hilight들을 노란색으로 표시
	       var keyword = hilightArr[i];
	     
	     var options = {
	     
	        "className" : "highlight"
	        
	     }
	     
          $('#p_content').markRanges([{
         
              start: $('#p_content').text().indexOf(keyword),
              length: keyword.length
         
         }],options);     
    }	    
 }
});
 
 
//텍스트 마우스로 긁기(Highlight)
function selectText(){
    
   var selectionText = "";
   
   if(document.getSelection){
     
     selectionText = document.getSelection();
     
   }else if(document.selection){
   
     selectionText = document.selection.createRange().text();
     }
     return selectionText;
     }
     
document.onmouseup = function(){

     document.getElementById("hilight").innerHTML = selectText();  
                  
}
    

//Hightlight메뉴 나오게하기
$(document).ready(function(){

  //Show contextmenu:
  $(document).contextmenu(function(e){
  
    //Get window size:
    var winWidth = $(document).width();
    var winHeight = $(document).height();
    
    //Get pointer position:
    var posX = e.pageX;
    var posY = e.pageY;
    
    //Get contextmenu size:
    var menuWidth = $(".contextmenu").width();
    var menuHeight = $(".contextmenu").height();
    
    //Security margin:
    var secMargin = 10;
    
    //Prevent page overflow:
    if(posX + menuWidth + secMargin >= winWidth && posY + menuHeight + secMargin >= winHeight){
    
      //Case 1: right-bottom overflow:
      posLeft = posX - menuWidth - secMargin + "px";
      posTop = posY - menuHeight - secMargin + "px";
      
    }
    else if(posX + menuWidth + secMargin >= winWidth){
    
      //Case 2: right overflow:
      posLeft = posX - menuWidth - secMargin + "px";
      posTop = posY + secMargin + "px";
      
    }
    else if(posY + menuHeight + secMargin >= winHeight){
    
      //Case 3: bottom overflow:
      posLeft = posX + secMargin + "px";
      posTop = posY - menuHeight - secMargin + "px";
      
    }
    else {
    
      //Case 4: default values:
      posLeft = posX + secMargin + "px";
      posTop = posY + secMargin + "px";
      
    };
    
    //Display contextmenu:
    
    $(".contextmenu").css({
    
      "left": posLeft,
      "top": posTop
      
    }).show();
    
    //Prevent browser default contextmenu.
    return false;
    
  });
  
  //Hide contextmenu:
  $(document).click(function(){
  
    $(".contextmenu").hide();
  });
});


//hilight저장
$(document).ready(function(){
     $('.addHilight').click(function(){
     
          var book_no = $('#book_no').val();//book_no값가져오기
          
          var content = $('#hilight').text();//hilight에 저장할 content가져오기
          
          var content_no = $('#p_content').attr('class');//content번호가져오기
          
          
       
      if(content.length==0){//hilight에 저장할 텍스트가 없으면
 
		    swal("Error", "저장할 텍스트를 선택해주세요.", "error");
		    return;
		
	   }
	   
	   //이미 저장된 문자열이라면
	   
	   //해당chapter의 hilight가져오기
       var hilight_chapter = $('input[id='+content_no+']').length;
   
       //배열 생성
       var hilightArr = new Array(hilight_chapter);
	  //배열에 값 주입
	  for(var i=0; i<hilight_chapter; i++){                          
			
		   hilightArr[i] = $('input[id='+content_no+']').eq(i).val();
		   
		   if(hilightArr[i]==content){//이미 하이라이트에 있는값이라면
	        
	       //경고창...
	       swal("error", "이미 저장된 문자열입니다.", "error"); 
	       return;
              
	   }
	 } 
                          
    var allData = { "book_no": book_no, "content": content, "content_no": content_no};
                    
$.ajax({
	
	      url : "/blinkist/hilight/addHilight",
          type : "post",
          data : allData,
	      success : function(data) {

                    swal("success", "Hilight에 추가하였습니다.", "success");
                    
                     $('.swal-button').click(function(){//팝업창의 ok버튼을 클릭할시
                               
                               document.location.reload();
                                              
                     });                                             
	}
	});
	      
});
});



$(function() {
	
	//영어로 번역
	$("#english").click(function(){
			
		var chapter = $("#chapter_title").text();//chapter가져오기
		
		var content = $("#p_content").text();//content가져오기
		
		$.ajax({
				url:"/blinkist/content/english",
				type:"get",
				dataType:"json",
				data:{"chapter":chapter, "content":content},
				
				success:function(v){
					
					var english_chapter = JSON.parse(v[0]); //JSON 문자열을 객체로 변환
					var english_content = JSON.parse(v[1]); //JSON 문자열을 객체로 변환
					 
					$("#chapter_title").text(english_chapter.message.result.translatedText);
					$("#p_content").text(english_content.message.result.translatedText);
					

				}
             });
             });

	//한글로 번역
	$("#korea").click(function(){
			
		var chapter = $("#chapter_title").text();//chapter가져오기
		
		var content = $("#p_content").text();//content가져오기
		
		$.ajax({
				url:"/blinkist/content/korea",
				type:"get",
				dataType:"json",
				data:{"chapter":chapter, "content":content},
				
				success:function(v){
					
					var korean_chapter = JSON.parse(v[0]); //JSON 문자열을 객체로 변환
					var korean_content = JSON.parse(v[1]); //JSON 문자열을 객체로 변환
					 
					$("#chapter_title").text(korean_chapter .message.result.translatedText);
					$("#p_content").text(korean_content.message.result.translatedText);
					

				}
             });
             }); 		
	});
	
	

	