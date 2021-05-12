package com.markany.blinkist.service;


import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.markany.blinkist.vo.UserVo;
import com.markany.blinkist.dao.UserDAO;



@Service
public class UserService {

	@Inject
	private UserDAO user;
	
	public UserVo findByEmail(String email) {//이메일 중복확인
		
		// TODO Auto-generated method stub
		return user.findByEmail(email);
		
	}
	
	
	
	
	
}
