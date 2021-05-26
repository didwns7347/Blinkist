package com.markany.blinkist.dao;


import java.util.HashMap;
import java.util.List;


import com.markany.blinkist.vo.LibraryVo;
import com.markany.blinkist.vo.UserVo;

public interface LibraryRepository {

	boolean insert(long book_no, long user_no);

	boolean insert(LibraryVo libraryVo);

	List<HashMap<Object, Object>> selectByAuthUser(UserVo userVo);

	List<Long> selectByAuthUser(String email);
	
	public long check_progress(LibraryVo libraryVo); //progress값확인
	
	public boolean update_progress(LibraryVo libraryVo);//progress업데이트
	
	public boolean update_fincheck(LibraryVo libraryVo);//fin_check업데이트
}
