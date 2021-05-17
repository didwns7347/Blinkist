package com.markany.blinkist.dao;

import com.markany.blinkist.vo.UserVo;


public interface UserDAO {
	
	public UserVo findByEmail(String email); //이메일 중복확인

	public boolean insert(UserVo uservo); // 회원가입
	
	public UserVo selectbyUser(String email); //회원정보가져오기
	
	public boolean updatePw(String email,String oldpassword,String newpassword);//비밀번호변경
	
	public void deleteUser(String email);//회원탈퇴

}