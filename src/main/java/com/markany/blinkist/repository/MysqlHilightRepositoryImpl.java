package com.markany.blinkist.repository;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Repository;
import com.markany.blinkist.dao.HilightRepository;
import com.markany.blinkist.vo.HilightVo;


@Repository
public class MysqlHilightRepositoryImpl implements HilightRepository{
	
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
	
	
	@Override//하이라이트저장
	public void insertHilight(HilightVo vo) {
		
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		sqlSession.insert("hilightMapper.insertHilight", vo);
		sqlSession.commit();
			
	}
	
	
	@Override//사용자의 하이라이트내용들을 제목정렬순으로가져오기
	public List<HashMap<String, Object>> selectHilightbyTitle(long user_no){
		
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		List<HashMap<String, Object>> list = sqlSession.selectList("hilightMapper.selectHilightbyTitle", user_no);
		sqlSession.close();
		
		return list;
	}
	
	
	@Override//사용자의 하이라이트내용들을 오래된날짜정렬순으로가져오기
	public List<HashMap<String, Object>> selectHilightbyDate(HilightVo vo){
		
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		List<HashMap<String, Object>> list = sqlSession.selectList("hilightMapper.selectHilightbyDate", vo);
		sqlSession.close();
		
		return list;
	}
	
	
	@Override//사용자가 구독한 책에서 저장한 hilight내용가져오기
	public List<HilightVo> selectHilightContent(HilightVo vo){
		
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		List<HilightVo> list = sqlSession.selectList("hilightMapper.selectHilightContent", vo);
		sqlSession.close();
		
		return list;
		
	}
	
	
	@Override// 하이라이트 삭제하기
	public void deleteHilight(long hilight_no) {
		
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		sqlSession.delete("hilightMapper.deleteHilight", hilight_no);
		sqlSession.commit();
		
	}
	
	
	@Override//회원의 하이라이트 모두삭제
	public void deleteAllHilight(long user_no) {
		
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		sqlSession.delete("hilightMapper.deleteAllHilight", user_no);
		sqlSession.commit();
		
	}

	
	@Override//라이브러리 삭제시 해당 책의 하이라이트도 삭제
	public void deleteLibraryHilight(HilightVo hilightVo) {
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		sqlSession.delete("hilightMapper.deleteLibraryHilight", hilightVo);
		sqlSession.commit();
		
	}
}