package com.markany.blinkist.service;

import java.util.HashMap;
import java.util.List;

import org.apache.tomcat.jni.Library;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.markany.blinkist.dao.LibraryRepository;
import com.markany.blinkist.vo.LibraryVo;
import com.markany.blinkist.vo.UserVo;

@Service
public class LibraryService {
	@Autowired
	private LibraryRepository libraryRepository;
	
	//라이브러리 추가 기능
	public boolean addLibrary(long book_no, long user_no) {
		return libraryRepository.insert(book_no,user_no);
		
	}
	
	
	//라이브러리 객체로 추가하기
	public boolean addLibrary(LibraryVo libraryVo) {
		// TODO Auto-generated method stub
		return libraryRepository.insert(libraryVo);
	}
	
	//해당 유저의 라이브러리에 있는 책 가져오기 
	public List<HashMap<Object, Object>> findByAuthUser(UserVo userVo) {
		return libraryRepository.selectByAuthUser(userVo);
	}

	//이메일로 라이브러리 읽어오기
	public List<Long> findByAuthUser(String email) {
		return libraryRepository.selectByAuthUser(email);
		
	}
	
	
	//progress값확인
	public long check_progress(LibraryVo libraryVo) {
		
		return libraryRepository.check_progress(libraryVo);
		
	}
	
	
	//progress업데이트
	public boolean update_progress(LibraryVo libraryVo) {
		
		return libraryRepository.update_progress(libraryVo);
		
	}
	
	
	//fin_check업데이트
	public boolean update_fincheck(LibraryVo libraryVo) {
		
		return libraryRepository.update_fincheck(libraryVo);
		
	}


	public boolean removeLibrary(LibraryVo libraryVo) {
		return libraryRepository.deleteLibrary(libraryVo);
		
	}
}