package com.markany.blinkist.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.tomcat.jni.Library;

import com.markany.blinkist.vo.LibraryVo;
import com.markany.blinkist.vo.UserVo;

public interface LibraryRepository {

	boolean insert(long book_no, long user_no);

	boolean insert(LibraryVo libraryVo);

	List<HashMap<Object, Object>> selectByAuthUser(UserVo userVo);

	List<Long> selectByAuthUser(String email);

}
