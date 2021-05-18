package com.markany.blinkist.repository;

import java.io.Reader;
import java.util.HashMap;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Repository;

import com.markany.blinkist.dao.UserRepository;
import com.markany.blinkist.vo.UserVo;

@Repository
public class MysqlUserRepositoryImpl implements UserRepository{
	//mybatis와 연결
	private static SqlSessionFactory sqlMapper = null;

	
	public static SqlSessionFactory getInstance() {
		if (sqlMapper == null) {
			try {
				String resource = "configuration.xml";
				Reader reader = Resources.getResourceAsReader(resource);
				sqlMapper = new SqlSessionFactoryBuilder().build(reader);
				reader.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return sqlMapper;
		
	}
	

	@Override // 이메일 중복확인
	public UserVo findByEmail(String email) {

		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();

		UserVo user = session.selectOne("userMapper.findByEmail", email);
		session.close();

		return user;

	}


	// 회원가입
	@Override
	public boolean insert(UserVo uservo) {
		
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		int count = sqlSession.insert("userMapper.insert", uservo);
		sqlSession.commit();

		return count==1;
		
	}
	
	
	@Override//회원정보가져오기
	public UserVo selectbyUser(String email) {
		
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		
		UserVo uservo = sqlSession.selectOne("userMapper.selectbyUser",email);
		sqlSession.close();
		
		return uservo;
		
	}

	
	@Override//비밀번호변경
	public boolean updatePw(String email,String oldpassword,String newpassoword) {
		
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("email",email);
		map.put("oldpassword", oldpassword);
		map.put("newpassword", newpassoword);
		
		int count=sqlSession.update("userMapper.updatePw", map);
		sqlSession.commit();
		
		return count==1;
		
	}
	
	
	@Override//회원탈퇴
	public void deleteUser(String email) {
		
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		
		sqlSession.delete("userMapper.deleteUser", email);
		sqlSession.commit();
	}
}