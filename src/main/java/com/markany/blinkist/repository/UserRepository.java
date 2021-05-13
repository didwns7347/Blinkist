package com.markany.blinkist.repository;


import java.util.List;

import org.apache.ibatis.executor.BatchResult;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Repository;
import com.markany.blinkist.dao.UserDAO;
import com.markany.blinkist.vo.UserVo;


@Repository
public class UserRepository implements UserDAO {
	ApplicationContext ac= new GenericXmlApplicationContext("applicationContext.xml");
	
	@Autowired
	private SqlSession sqlSession;

	@Override // 이메일 중복확인
	public UserVo find(String email) {
		SqlSession sqlSession1=ac.getBean(SqlSession.class);
		System.out.println("SQLSESSION:"+sqlSession.toString());
		System.out.println("SQLSESSION1:"+sqlSession1.toString());
		if(sqlSession.equals(sqlSession1))
			System.out.println("TRUE");
		else
			System.out.println("FALSE");
		return sqlSession1.selectOne("user.findByEmail", email);

	}

	
}