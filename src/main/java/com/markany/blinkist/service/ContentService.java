package com.markany.blinkist.service;

import java.util.List;
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
	
	
	//해당 책번호의 콘텐츠가져오기
	public List<ContentVo> selectContent(long book_no){
		
		return contentRepository.selectContent(book_no);
		
	}
}