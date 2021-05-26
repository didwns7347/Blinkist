package com.markany.blinkist.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.markany.blinkist.vo.BookVo;

public interface BookRepository {

	List<HashMap<String, Object>>  selectByTitleAuthor(String keyword);

	Map<Object, Object> selectByBook_no(long no);
	
	public void insertBook(BookVo vo); //책을 book table에 저장

	List<HashMap<String, Object>> selectAllOrderByDate();

	List<HashMap<String, Object>> selectAllOrderByCount();

	List<HashMap<String, Object>> selectOrderBySpotlight();

	List<HashMap<String, Object>> selectOrderByHot();



}
