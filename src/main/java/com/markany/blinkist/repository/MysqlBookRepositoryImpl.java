package com.markany.blinkist.repository;

import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Repository;
import com.markany.blinkist.dao.BookRepository;
import com.markany.blinkist.vo.BookVo;

@Repository
public class MysqlBookRepositoryImpl implements BookRepository {

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

	@Override // 검색기능 제목,작가
	public List<HashMap<String, Object>> selectByTitleAuthor(String keyword) {
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		List<HashMap<String, Object>> list = sqlSession.selectList("bookMapper.selectByTitleAuthor", keyword);
		// 출력 코드
		/*
		for (HashMap<String, Object> map : list) {
			for (String key : map.keySet()) {
				System.out.println("키:" + key + " 값:" + map.get(key));

			}
		}
		*/
		sqlSession.close();
		return list;
	}

	// 책을 누르면 나오는 페이지에 필요한데이터를 추출
	@Override
	public Map<Object, Object> selectByBook_no(long no) {
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		Map<Object, Object> map =sqlSession.selectOne("bookMapper.selectByBook_no", no);
		sqlSession.close();
		System.out.println("---------------------------------------------------------");
		for (Object key : map.keySet()) {
			System.out.println("키:" + key + " 값:" + map.get(key));

		}

		return map;
	}

}
