<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- jquery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/payment.js"></script>
<!-- 팝업창  -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>   

<!-- Modal -->
<div class="modal fade" id="gradeUpdate" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-body" style="text-align:center;">
			            <p class="mb-5" style="color: blue;">원하시는 결제방식을 선택해주세요.</p>
			            <a href="#" id="kakaopay"><img src ="${pageContext.request.contextPath }/assets/images/kakaopay.png" style="margin-right:70px;"></a>
			</div>
			<div class="modal-footer" style="margin: 0 auto;">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			</div>
		</div>	
	</div>
</div>