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

	//책을 추가된 날짜순으로 정렬
	public List<HashMap<String, Object>> findAllOrderByDate() {
		return bookRepository.selectAllOrderByDate();
	}

	//라이브러리 추가시 카운트+1
	public boolean addCount(long book_no) {
		return bookRepository.addCountByBook_no(book_no);
	}

	//총 조회수로 책 골르기
	public List<HashMap<String, Object>> findAllOrderByCount() {
		return bookRepository.selectAllOrderByCount();
	}

}
