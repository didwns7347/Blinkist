package com.example.Dao;

import org.springframework.stereotype.Repository;
import com.example.vo.UserVo;


@Repository
public interface UserDao {

	public String findById(String id); //아이디중복체크
	
     public void join(UserVo vo); //회원가입
     
     public UserVo login(UserVo vo);//로그인
     
     public UserVo getUser(String id);//회원정보가져오기
     
     public void update(UserVo vo);//회원정보수정 
     
     public void Delete(String id);//회원탈퇴
     
     
  }
