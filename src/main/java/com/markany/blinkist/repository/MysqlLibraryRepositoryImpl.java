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
	
	
	//라이브러리 추가 코드
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
	
	
	//라이브러리 추가 코드
	@Override
	public boolean insert(LibraryVo libraryVo) {
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		int count = sqlSession.insert("libraryMapper.insertVo", libraryVo);
		sqlSession.commit();
		return count==1;
	}

	
	//유저객체로 라이브러리 가져오기
	@Override
	public List<HashMap<Object, Object>> selectByAuthUser(UserVo userVo) {
		sqlMapper = getInstance();
		System.out.println(userVo.toString());
		SqlSession sqlSession = sqlMapper.openSession();
		List<HashMap<Object,Object>> list=sqlSession.selectList("libraryMapper.selectByAuthUser", userVo);
		sqlSession.close();
		return list;
	}
	
	
	//email로 라이브러리 책no 가져오기
	@Override
	public List<Long> selectByAuthUser(String email) {
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		List<Long> list=sqlSession.selectList("libraryMapper.selectByEmail", email);
		sqlSession.close();
		return list;
	}
	//이메일로 라이브러리책 번호,프로그래스 읽어오기
	@Override
	public List<HashMap<String, Object>> selectProgressByAuthUser(String email) {
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		List<HashMap<String, Object>> list=sqlSession.selectList("libraryMapper.selectProgressByAuthUser", email);
		sqlSession.close();
		return list;
	}
	
	
	@Override//progress값확인
	public long check_progress(LibraryVo libraryVo) {
		
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		long progress =sqlSession.selectOne("libraryMapper.check_progress", libraryVo);
		sqlSession.close();
		return progress;
		
	}
	
	
	@Override//progress업데이트
	public boolean update_progress(LibraryVo libraryVo) {
		
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		int count = sqlSession.update("libraryMapper.update_progress", libraryVo);
		sqlSession.commit();
		return count==1;
	
	}
	
	
	@Override//fin_check업데이트
	public boolean update_fincheck(LibraryVo libraryVo) {
		
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		int count = sqlSession.update("libraryMapper.update_fincheck", libraryVo);
		sqlSession.commit();
		return count==1;
	
	}
	
	//라이브러리 삭제하기
	@Override
	public boolean deleteLibrary(LibraryVo libraryVo) {
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		int count=sqlSession.update("libraryMapper.deleteLibrary", libraryVo);
		sqlSession.commit();
		return count==1;
	}


	//회원의 모든 라이브러리지우기
	public void deleteAllLibrary(long user_no) {
		
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		sqlSession.update("libraryMapper.deleteAllLibrary", user_no);
		sqlSession.commit();
				
	}

}