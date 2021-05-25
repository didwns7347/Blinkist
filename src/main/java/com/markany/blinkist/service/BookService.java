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


	//총 조회수로 책 골르기
	public List<HashMap<String, Object>> findAllOrderByCount() {
		return bookRepository.selectAllOrderByCount();
	}

	//라이브러리 목록 과 비교하여 라이브러리에있는 책이면 true 아니면 false값을 해쉬맵에 추가한다.
	public List<HashMap<String, Object>> libraryCheck(List<HashMap<String, Object>> list, List<Long> libraryList) {
		for(HashMap<String, Object> map:list) {
			long book_no=(long) map.get("book_no");
			boolean check=false;
			for(Long libBook_no : libraryList) {
				if(book_no==libBook_no) {
					check=true;
					break;
				}
			}
			if(check) {
				map.put("libCheck", true);
			}
			else {
				map.put("libCheck", false);
			}
		}
		return list;
	}

}
