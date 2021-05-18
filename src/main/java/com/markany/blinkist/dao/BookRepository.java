package com.markany.blinkist.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.markany.blinkist.vo.BookVo;

public interface BookRepository {

	List<HashMap<String, Object>>  selectByTitleAuthor(String keyword);

	Map<Object, Object> selectByBook_no(long no);

}
