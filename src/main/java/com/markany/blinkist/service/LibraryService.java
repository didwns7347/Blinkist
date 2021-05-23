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
	public boolean addLibrary(long book_no, long user_no) {
		return libraryRepository.insert(book_no,user_no);
		
	}
	public boolean addLibrary(LibraryVo libraryVo) {
		// TODO Auto-generated method stub
		return libraryRepository.insert(libraryVo);
	}
	public List<HashMap<Object, Object>> findByAuthUser(UserVo userVo) {
		return libraryRepository.selectByAuthUser(userVo);
	}

}
