package com.markany.blinkist.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.markany.blinkist.dao.ContentRepository;
import com.markany.blinkist.vo.ContentVo;

@Service("contentService")
public class ContentService {
	
	@Autowired
	private ContentRepository contentRepository;
	
	//책 콘텐츠내용 저장
	public void insertContent(ContentVo vo) {
		
		contentRepository.insertContent(vo);
		
	}
	
	
	//가장 큰 CHAPTER번호가져오기 
	public int selectMaxChapter_no() {
		
		return contentRepository.selectMaxChapter_no();
		
	}
}
