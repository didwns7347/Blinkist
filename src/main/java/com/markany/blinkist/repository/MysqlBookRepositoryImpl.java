package com.markany.blinkist.repository;

import java.io.Reader;
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
		sqlSession.close();
		
		return list;
		
	}

	
	@Override // 책을 누르면 나오는 페이지에 필요한데이터를 추출
	public Map<Object, Object> selectByBook_no(long no) {
		
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		Map<Object, Object> map =sqlSession.selectOne("bookMapper.selectByBook_no", no);
		sqlSession.close();
		
		return map;
	}

	
	@Override//책을 book table에 저장
	public void insertBook(BookVo vo) {
		
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		sqlSession.insert("bookMapper.insertBook", vo);
		sqlSession.commit();
		
	}
	
	
	@Override//모든책을 추가된 날짜기준으로 정렬해서 가져오기
	public List<HashMap<String, Object>> selectAllOrderByDate(long userNo) {
		
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		List<HashMap<String, Object>> list = sqlSession.selectList("bookMapper.selectAllOrderByDate",userNo);
		sqlSession.close();
		
		return list;
		
	}

	
	@Override//전체 조회수로 정렬
	public List<HashMap<String, Object>> selectAllOrderByCount(long userNo) {
		
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		List<HashMap<String, Object>> list = sqlSession.selectList("bookMapper.selectAllOrderByCount",userNo);
		sqlSession.close();
		
		return list;
		
	}
	
	
	@Override//한달간 가장 많이 읽은 책 6개 고르기
	public List<HashMap<String, Object>> selectOrderBySpotlight(long userNo) {
		
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		List<HashMap<String, Object>> list = sqlSession.selectList("bookMapper.selectOrderBySpotlight",userNo);
		sqlSession.close();
		
		return list;
		
	}
	
	
	@Override//최근 한달안에 추가된 책중 인기 많은 거 고르기
	public List<HashMap<String, Object>> selectOrderByHot(long userNo) {
		
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		List<HashMap<String, Object>> list = sqlSession.selectList("bookMapper.selectOrderByRecentlryAddedHot",userNo);
		sqlSession.close();
		
		return list;
		
	}
	
	
	@Override//해당 카테고리에 포함되는 모든책 가져오기
	public List<HashMap<String,String>> selectAllCategory(String category) {
		
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		List<HashMap<String,String>> list = sqlSession.selectList("bookMapper.selectAllCategory", category);
		sqlSession.close();
		
		return list;
		
	}
	
	
	@Override//트랜드 블링크 책 가져오기
	public List<HashMap<String, Object>> selectAllCategoryOrderByCount(String category) {
		
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		List<HashMap<String, Object>> list = sqlSession.selectList("bookMapper.selectAllCategoryOrderByCount",category);
		sqlSession.close();
		
		return list;
		
	}
	
	
	@Override//카테고리 최신 추가된 책 6권
	public List<HashMap<String, Object>> selectAllCategoryOrderByDate(String category) {
		
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		List<HashMap<String, Object>> list = sqlSession.selectList("bookMapper.selectAllCategoryOrderByDate",category);
		sqlSession.close();
		
		return list;
		
	}
	

	@Override//오디오가 포함된 책 가져오기
	public List<HashMap<String, Object>> selectAllCategoryIncludeAudio(String category) {
		
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		List<HashMap<String, Object>> list = sqlSession.selectList("bookMapper.selectAllCategoryIncludeAudio",category);
		sqlSession.close();
		
		return list;
		
	}

	
	@Override//작가이름 책제목 카테고리로 가져오기
	public Map<Object, Object> selectByTitleAuthorCategory(String title, String authorName, String category) {
		
		HashMap<String,String> map=new HashMap<String,String>();
		map.put("authorName", authorName);
		map.put("title", title);
		map.put("category", category);
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		Map<Object, Object> res=sqlSession.selectOne("bookMapper.selectByTitleAuthorCategory", map);
		sqlSession.close();
		
		return res;
		
	}

	
	@Override
	public List<HashMap<Object, Object>> selectLibraryLog(String email) {
		
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		List<HashMap<Object, Object>> log=sqlSession.selectList("bookMapper.selectLibraryLog",email);
		sqlSession.close();
		
		return log;
		
	}
	
	
	@Override	//회원이 가장 많이 구독한 카테고리 찾기
	public String maxCategory(long user_no) {
		
		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		String category = sqlSession.selectOne("bookMapper.maxCategory",user_no);
		sqlSession.close();
		
		return category;
		
	}
	
	
	@Override//회원의 라이브러리에 없는 카테고리 트렌드 책 3개 가져오기
	public List<HashMap<Object, Object>> customtrandBook(String category,long user_no){
		
		HashMap<Object,Object> map=new HashMap<Object,Object>();
		map.put("category", category);
		map.put("user_no", user_no);

		sqlMapper = getInstance();
		SqlSession sqlSession = sqlMapper.openSession();
		List<HashMap<Object, Object>> res=sqlSession.selectList("bookMapper.customtrandBook", map);
		sqlSession.close();
		
		return res;
		
	}
}