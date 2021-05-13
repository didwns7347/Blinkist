package com.markany.blinkist.repository;



import java.io.Reader;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Repository;
import com.markany.blinkist.dao.UserDAO;
import com.markany.blinkist.vo.UserVo;


@Repository
public class UserRepository implements UserDAO {
	
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

	

	@Override//이메일 중복확인
	public UserVo findByEmail(String email) {
		
		sqlMapper = getInstance();
		SqlSession session = sqlMapper.openSession();
		
		UserVo user = session.selectOne("userMapper.findByEmail", email);
		session.close();
			
		return user;
			
		
		
	}



}
