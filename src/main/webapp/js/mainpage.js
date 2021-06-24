/**
 * 메인페이지에 나오는 자바스크립트 페이지이다.
 */

var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");

  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  
  slides[slideIndex-1].style.display = "block";  
  
}

function dayFunction() {

	var nowday = new Date();
	var free = new Date();
	free.setDate(nowday.getDate() + 7);

	document.getElementById("now").innerHTML = nowday.getMonth() + 1 + "월 " + nowday.getDate() + "일";
	document.getElementById("freeday").innerHTML = free.getMonth() + 1 + "월 " + free.getDate() + "일";
		
  }
  
  
  //프리미엄구독버튼
$(document).ready(function () {

    var premium = $('#premiumCheck').val();//premium값확인
    
    if(premium!='[basic]'){//이미 프리미엄을 구독했으면 
    
          $('#primiumsignup').hide();//태그숨기기
          $('#premiumInfo').hide();
          $('#footerPremium').hide();
       
    };
});