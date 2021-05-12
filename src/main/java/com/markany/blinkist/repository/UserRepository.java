package com.markany.blinkist.repository;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.markany.blinkist.dao.UserDAO;
import com.markany.blinkist.vo.UserVo;


@Repository
public class UserRepository implements UserDAO {
	
	@Inject
	private SqlSession sql;
	

	@Override//이메일 중복확인
	public UserVo findByEmail(String email) {
		
		return sql.selectOne("userMapper.findByEmail", email);
		
	}

}
