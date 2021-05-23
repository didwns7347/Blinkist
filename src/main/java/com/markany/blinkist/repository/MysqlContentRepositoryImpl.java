package com.markany.blinkist.repository;

import java.io.Reader;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Repository;
import com.markany.blinkist.dao.ContentRepository;
import com.markany.blinkist.vo.ContentVo;

@Repository
public class MysqlContentRepositoryImpl implements ContentRepository{
	
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

	@Override//책 콘텐츠내용 저장
	public void insertContent(ContentVo vo) {
		
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		sqlSession.insert("contentMapper.insertContent", vo);
		sqlSession.commit();
		
	}
	
	
	@Override//가장 큰 CHAPTER번호가져오기 
	public int selectMaxChapter_no() {
		
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		int maxNumber = sqlSession.selectOne("contentMapper.selectMaxChapter_no");
		
		return maxNumber;
		
	}
}
