package com.markany.blinkist.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.markany.blinkist.dao.LibraryCountRepository;


@Service
public class LibraryCountService {
	@Autowired
	private LibraryCountRepository libraryCountRepository;
	
	
	
		//라이브러리 추가시 카운트+1
	public boolean addCount(long book_no) {
		return libraryCountRepository.addCountByBook_no(book_no);
	}

}
