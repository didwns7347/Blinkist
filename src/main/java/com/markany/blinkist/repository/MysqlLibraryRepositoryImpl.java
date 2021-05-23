package com.markany.blinkist.repository;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.tomcat.jni.Library;
import org.springframework.stereotype.Repository;

import com.markany.blinkist.dao.LibraryRepository;
import com.markany.blinkist.vo.LibraryVo;
import com.markany.blinkist.vo.UserVo;
@Repository
public class MysqlLibraryRepositoryImpl implements LibraryRepository {
	
	// mybatis와 연결
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

	@Override
	public boolean insert(long book_no, long user_no) {
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		HashMap<String, Long> map=new HashMap<String,Long>();
		map.put("book_no", book_no);
		map.put("user_no", user_no);
		int count = sqlSession.insert("libraryMapper.insertMap", map);
		sqlSession.commit();

		return count==1;
	}

	@Override
	public boolean insert(LibraryVo libraryVo) {
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		int count = sqlSession.insert("libraryMapper.insertVo", libraryVo);
		sqlSession.commit();
		return count==1;
	}

	@Override
	public List<HashMap<Object, Object>> selectByAuthUser(UserVo userVo) {
		sqlMapper = getInstance();
		System.out.println(userVo.toString());
		SqlSession sqlSession = sqlMapper.openSession();
		List<HashMap<Object,Object>> list=sqlSession.selectList("libraryMapper.selectByAuthUser", userVo);
		return list;
	}

}
