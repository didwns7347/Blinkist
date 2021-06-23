package com.markany.blinkist.dao;


import java.util.HashMap;
import java.util.List;
import com.markany.blinkist.vo.LibraryVo;
import com.markany.blinkist.vo.UserVo;

public interface LibraryRepository {

	boolean insert(long book_no, long user_no);//라이브러리 추가 코드

	boolean insert(LibraryVo libraryVo);//라이브러리 추가 코드

	List<HashMap<Object, Object>> selectByAuthUser(UserVo userVo);//해당 유저가 라이브러리에 소유한 책 정보 읽어오기 

	List<Long> selectByAuthUser(String email);//회원의 이메일로 책번호 가져오기
	
	public long check_progress(LibraryVo libraryVo); //progress값확인
	
	public boolean update_progress(LibraryVo libraryVo);//progress업데이트
	
	public boolean update_fincheck(LibraryVo libraryVo);//fin_check업데이트

	boolean deleteLibrary(LibraryVo libraryVo);//라이브러리삭제

	List<HashMap<String, Object>> selectProgressByAuthUser(String email);//회원의 이메일로 progress, 책번호 가져오기
	
	public void deleteAllLibrary(long user_no);//회원의 모든 라이브러리지우기
	
}
