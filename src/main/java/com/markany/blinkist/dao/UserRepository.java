package com.markany.blinkist.dao;

import com.markany.blinkist.vo.UserVo;


public interface UserRepository {
	
	public UserVo findByEmail(String email); //이메일 중복확인

	public boolean insert(UserVo uservo); // 회원가입
	
	public UserVo selectbyUser(String email); //회원정보가져오기
	
	public boolean updatePw(Long user_no,String newpassword);//비밀번호변경
	
	public boolean updategrade(UserVo uservo);//회원등급변경
	
	public boolean PassPrimium(UserVo uservo);//primium날짜가 지났다면 회원의 등급과 premium_date날짜를 바꿔준다.
	
	public boolean deleteUser(String email);//회원탈퇴

	public boolean updatePwForget(UserVo userVo);

}