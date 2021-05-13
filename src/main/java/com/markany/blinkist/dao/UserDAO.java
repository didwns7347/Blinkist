package com.markany.blinkist.dao;

import com.markany.blinkist.vo.UserVo;


public interface UserDAO {
	
	public UserVo find(String email); //이메일 중복확인

}