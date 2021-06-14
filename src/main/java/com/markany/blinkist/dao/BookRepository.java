package com.markany.blinkist.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.markany.blinkist.vo.BookVo;

public interface BookRepository {

	public List<HashMap<String, Object>>  selectByTitleAuthor(String keyword);

	Map<Object, Object> selectByBook_no(long no);
	
	public void insertBook(BookVo vo); //책을 book table에 저장

	List<HashMap<String, Object>> selectAllOrderByDate();

	List<HashMap<String, Object>> selectAllOrderByCount();

	List<HashMap<String, Object>> selectOrderBySpotlight();

	List<HashMap<String, Object>> selectOrderByHot();

	List<HashMap<String, String>> selectAllCategory(String category);

	List<HashMap<String, Object>> selectAllCategoryOrderByCount(String category);

	List<HashMap<String, Object>> selectAllCategoryOrderByDate(String category);

	List<HashMap<String, Object>> selectAllCategoryIncludeAudio(String category);

	Map<Object, Object> selectByTitleAuthorCategory(String title, String authorName, String category);

	public List<HashMap<Object, Object>> selectLibraryLog(String email);

	public String maxCategory(long user_no);//회원이 가장 많이 구독한 카테고리 찾기
	
	public List<HashMap<Object, Object>> customtrandBook(String category,long user_no);//회원의 라이브러리에 없는 카테고리 트렌드 책 3개 가져오기

}
