package com.example.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.Dao.UserDao;
import com.example.vo.UserVo;

@Service("userService")
public class UserService implements UserDao{
	
	@Autowired
	private UserDao userDao;
	
	public void setUserDao(UserDao userDao) {
		
		this.userDao= userDao;
	}

	
	@Override//아이디중복확인
	public String findById(String id) {
		
		return userDao.findById(id);
		
	}	
	
	
	@Override //회원가입
	 public void join(UserVo vo) {

		userDao.join(vo);
		
	 }
	
	
	@Override//로그인
	public UserVo login(UserVo vo) {
		
		return userDao.login(vo);
		
	}
	
	
	@Override//회원정보가져오기
	public UserVo getUser(String id) {
		
		return userDao.getUser(id);
		
	}
	
	@Override//회원정보수정
	public void update(UserVo vo) {
		
		userDao.update(vo);
		
	}
	
	
	@Override//회원탈퇴
	public void Delete(String id) {
		
		userDao.Delete(id);
		
	}
}
