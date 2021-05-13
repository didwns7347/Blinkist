package com.markany.blinkist.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.markany.blinkist.vo.UserVo;
import com.markany.blinkist.dao.*;



@Service
public class UserService {

	@Autowired
	private UserDAO user;
	
	public UserVo findByEmail(String email) {//이메일 중복확인
		UserVo vo=new UserVo();
		vo.setEmail(email);
		// TODO Auto-generated method stub
		return user.find(email);
		
	}
	
	
	
	
	
}