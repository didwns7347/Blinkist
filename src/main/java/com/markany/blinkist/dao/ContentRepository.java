package com.markany.blinkist.dao;

import java.util.List;
import com.markany.blinkist.vo.ContentVo;


public interface ContentRepository {
	
	public void insertContent(ContentVo vo); //책 콘텐츠내용 저장
	
	public int selectMaxChapter_no(); //가장 큰 CHAPTER번호가져오기 
	
	public List<ContentVo> selectContent(long book_no); //해당 책번호의 콘텐츠가져오기  

}
