package com.markany.blinkist.dao;

import com.markany.blinkist.vo.ContentVo;

public interface ContentRepository {
	
	public void insertContent(ContentVo vo); //책 콘텐츠내용 저장
	
	public int selectMaxChapter_no(); //가장 큰 CHAPTER번호가져오기 

}
