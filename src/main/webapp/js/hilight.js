

$(function() {
  
  //제목 hilight삭제
  $('#Delete_Chapter').click(function(){
	
    var hilight_no =  $(this).attr('name');//hilight_no가져오기
        
    var allData = { "hilight_no": hilight_no};
	    
	$.ajax({
	
		   url : "/blinkist/hilight/deleteHilight",
		   type : "post",
		   data : allData,
		   success : function(data) {

               swal("success", "hilight에서 삭제했습니다.", "success");
                     
               $('.swal-button').click(function(){//팝업창 ok눌렀을때
                     
                           location.reload();
               });               
           }
	}); 
  });

  //날짜 hilight삭제
  $('#Delete_Date').click(function(){

   var hilight_no =  $(this).attr('name');//hilight_no가져오기
        
   var allData = { "hilight_no": hilight_no};
   
   $.ajax({
	
		   url : "/blinkist/hilight/deleteHilight",
		   type : "post",
		   data : allData,
		   success : function(data) {

               swal("success", "hilight에서 삭제했습니다.", "success");
                     
               $('.swal-button').click(function(){//팝업창 ok눌렀을때
                     
                           location.reload();
               });               
             }
		}); 
     });

Kakao.init('89a83ec72bccc0a3c8e42d080fae996c');

//하이라이트공유
$('button.btn.btn-outline-secondary').click(function(){     
  
     var book_title = $(this).attr('name');//책제목
     var hilight = $(this).attr('id');//하이라이트내용
     var book_img =  $(this).children('input').attr('id');//책의 이미지
     var no = $(this).children('input').attr('name');//책의 번호
     

    //카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
    Kakao.Link.sendDefault({
      objectType: 'feed',
      content: {
        title: book_title,
        description: hilight,
        imageUrl: book_img,
        link: {
          mobileWebUrl: '/blinkist/book/sharebook?no='+no,
          webUrl: '/blinkist/book/sharebook?no='+no
        }
      },
      buttons: [
        {
          title: '웹으로 보기',
          link: {
            mobileWebUrl: '/blinkist/book/sharebook?no='+no,
            webUrl: '/blinkist/book/sharebook?no='+no
          }
        },
        {
          title: '앱으로 보기',
          link: {
            mobileWebUrl: '/blinkist/book/sharebook?no='+no,
            webUrl: '/blinkist/book/sharebook?no='+no
          }
        }
      ]
    }); 
});            
});             