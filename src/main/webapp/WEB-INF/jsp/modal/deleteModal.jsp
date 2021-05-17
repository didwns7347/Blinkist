<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
	<form method="post" action="${pageContext.request.contextPath }/user/delete">
		<div class="modal-content">

			<div class="modal-body" style="text-align:center;">정말로 탈퇴하시겠습니까?</div>
			<div class="modal-footer" style="margin: 0 auto;">
				<button type="submit" class="btn btn-primary" id="delete">회원탈퇴</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			</div>
		</div>
	 </form>	
	</div>
</div>