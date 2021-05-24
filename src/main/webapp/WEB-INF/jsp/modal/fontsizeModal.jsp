<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 글자크기에 대한 Modal -->
<div class="container modal" id="fontsize">
	<div class="row">
		<div class="col-12" role="document" style= "top:250px; left:20px;">
			<div class="btn-group">
			<button class="w3-bar-item w3-button w3-small" id="small"><i class="fa fa-font"></i></button>
			<button class="w3-bar-item w3-button w3-large" id="large"><i class="fa fa-font"></i></button>
			<button class="w3-bar-item w3-button w3-xlarge" id="xlarge"><i class="fa fa-font"></i></button>
			<button class="w3-bar-item w3-button w3-xxlarge" id="xxlarge"><i class="fa fa-font"></i></button>
			</div>
		</div>
	</div>
</div>

<script>
//폰트사이즈바꾸기
$(document).ready(function() {

	$("#small").click(function() {//작은사이즈로 변경
		
		$("div.container").css("font-size", "12px");
		
	});
	
	
    $("#large").click(function() {//large size로 변경
		
		$("div.container").css("font-size", "35px");
	});
    
    
    $("#xlarge").click(function() {//large size로 변경
		
		$("div.container").css("font-size", "40px");
	});
    
    
    $("#xxlarge").click(function() {//large size로 변경
		
		$("div.container").css("font-size", "50px");
	});
});
</script>