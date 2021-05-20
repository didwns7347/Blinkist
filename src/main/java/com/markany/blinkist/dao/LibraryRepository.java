package com.markany.blinkist.dao;

import com.markany.blinkist.vo.LibraryVo;

public interface LibraryRepository {

	boolean insert(long book_no, long user_no);

	boolean insert(LibraryVo libraryVo);

}
