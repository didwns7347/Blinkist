package com.markany.blinkist.repository;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Repository;

import com.markany.blinkist.dao.LibraryCountRepository;

@Repository
public class MysqlLibraryCountRepository implements LibraryCountRepository {
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
	
	//사용자 라이브러리 추가시 기록을 남기기
	@Override
	public boolean addCountByBook_no(long book_no) {
		// TODO Auto-generated method stub
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		int count=sqlSession.insert("libraryCountMapper.insertCount", book_no);
		sqlSession.commit();
		return count==1;
	}

}
