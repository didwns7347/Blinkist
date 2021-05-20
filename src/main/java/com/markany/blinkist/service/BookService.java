package com.markany.blinkist.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.markany.blinkist.dao.BookRepository;
import com.markany.blinkist.vo.BookVo;

@Service("bookService")
public class BookService {
	
	@Autowired
	private BookRepository bookRepository;
	
	//검색기능 제목,작가
	public List<HashMap<String, Object>>  findByTitleAuthor(String keyword) {
		return bookRepository.selectByTitleAuthor(keyword);
	}
	
	
	//책 검색
	public Map<Object, Object> findByNo(long no) {
		// TODO Auto-generated method stub
		return bookRepository.selectByBook_no(no);
	}
	
	
	//책을 book table에 저장
	public void insertBook(BookVo vo) {
		
		bookRepository.insertBook(vo);
	}
}
