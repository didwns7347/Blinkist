package com.markany.blinkist.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.markany.blinkist.vo.UserVo;
import com.markany.blinkist.dao.*;



@Service
public class UserService {

	@Autowired
	private UserRepository userDAO;
	
	public UserVo findByEmail(String email) {//이메일 중복확인
		UserVo vo=new UserVo();
		vo.setEmail(email);
		// TODO Auto-generated method stub
		return userDAO.findByEmail(email);
		
	}

	public boolean insert(UserVo uservo) {//회원가입
		return userDAO.insert(uservo);
		
	}
	
	
	public UserVo selectbyUser(String email) {//회원정보가져오기
		return userDAO.selectbyUser(email);
		
	}
	
	
	public boolean updatePw(String email,String oldpassword,String newpassoword) {//비밀번호변경
	
		return userDAO.updatePw(email, oldpassword, newpassoword);
		
	}
	
	
	public boolean updategrade(UserVo uservo) {//회원등급변경
		
		return userDAO.updategrade(uservo);
		
	}
	
	
	public boolean PassPrimium(UserVo uservo) {//primium날짜가 지났다면 회원의 등급과 premium_date날짜를 바꿔준다.
		
		return userDAO.PassPrimium(uservo);
		
	}
	
	
	public void deleteUser(String email) {//회원탈퇴
		
		userDAO.deleteUser(email);
		
	}
	
	
	
	
	
	
	
}