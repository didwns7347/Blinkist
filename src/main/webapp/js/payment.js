//카카오페이
$(document).ready(function() {
 $('#kakaopay').click(function () {
 
      var email = $('input:radio[name="subscribe"]:checked').attr('class');//회원의 이메일
 
      var grade = $('input:radio[name="subscribe"]:checked').val();	//회원의 등급
      
      var money = $('input:radio[name="subscribe"]:checked').attr('id');//구독료
      
             
      // getter
      var IMP = window.IMP;
      IMP.init('imp47018177');

      IMP.request_pay({

            pg : 'kakaopay',
            merchant_uid: new Date().getTime(), //가맹점에서 생성+관리하는 고유 주문번호
            name: 'Blinkist구독', //주문명
            amount: money,
            buyer_email: email,


      }, function (rsp) {
       
            if (rsp.success) { //결제성공
             
              var message = '결제가 완료되었습니다.';
  
              $.ajax({
              
                 type: "post", 
                 url: "http://localhost:8080/blinkist/user/updateGrade", 
                 data: {
                 
                        "email": email, "grade": grade, "payment_method": "카카오페이"
                        
                    },
                });
                
                 swal("success", message, "success");
                     
                     $('.swal-button').click(function(){//팝업창 ok눌렀을때
                     
                            window.location.href="/blinkist/logout";
                 });
            } else {//결제실패
	
                var message = '결제에 실패하였습니다.';
                
                swal("error", message+rsp.error_msg, "error");
            
              $('.swal-button').click(function(){//팝업창 ok눌렀을때
            
                    location.reload();
            
            });  
            }
        });
    });
    });