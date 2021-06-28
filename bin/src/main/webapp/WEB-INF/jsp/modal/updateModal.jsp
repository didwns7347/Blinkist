 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <!-- Modal -->
  <div class="modal fade" id="password" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body" style="padding:40px 50px;">
          <form role="form" method="post" autocomplete="off">
            <div class="form-group">
              <label for="oldpassword"><span class="glyphicon glyphicon-user"></span>기존비밀번호</label>
              <input type="password" class="form-control" id="oldpassword" name="oldpassword" placeholder="Enter email" required>
            </div>
            <div class="form-group">
              <label for="newpassword"><span class="glyphicon glyphicon-eye-open"></span>새로운비밀번호</label>
              <input type="password" class="form-control" id="newpassword" name="newpassword" placeholder="Enter password" required>
            </div>
            <div class="form-group">
              <label for="confirmpassword"><span class="glyphicon glyphicon-eye-open"></span>새로운비밀번호</label>
              <input type="password" class="form-control" id="confirmpassword" name="confirmpassword" placeholder="Enter password" required>
              
                                                    <br/>
               <div id="same" style="color:blue; font-weight:bold; text-align:center;">등록하실 비밀번호를 동일하게 입력하셨습니다.</div>
			   <div id="notsame" style="color:red; font-weight:bold; text-align:center;">등록하실 비밀번호가 동일하지 않습니다.</div>
            </div>
              <div class="text-center" style="text-align:center;">
                <button type="submit" class="btn btn-success"  id="submit"><span class="glyphicon glyphicon-off"></span>회원정보수정</button>
                <button type="submit" class="btn btn-danger" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
              </div>
          </form>
        </div>
      </div>
    </div>
  </div> 