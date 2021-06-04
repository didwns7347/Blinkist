<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript"  src="${pageContext.request.contextPath }/js/primiumDelete.js"></script>  

<!-- 팝업창  -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 

<!-- Modal -->
<div class="modal fade" id="primiumDeleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">

			<div class="modal-body" style="text-align:center;">
			        <p style="color:red">정말로 구독취소하시겠습니까?</p>      
			  <c:choose>
					<c:when test="${uservo.grade eq 'monthP'}">
					   <span><strong>구독을 취소하시면 ${uservo.payment_method}로 ${refund}원이 환불됩니다.</strong></span>
					</c:when>
					<c:otherwise>
					   <span><strong>구독을 취소하시면 ${uservo.payment_method}로 ${refund}원이 환불됩니다.</strong></span>
					</c:otherwise>	
			  </c:choose>		    			
			</div>
			<div class="modal-footer" style="margin: 0 auto;">
				<button type="submit" class="btn btn-primary" id="true">네</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">아니요</button>
			</div>
		</div>
	</div>
</div>
