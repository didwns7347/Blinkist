package com.markany.blinkist.dao;


import com.markany.blinkist.vo.AuthorVo;

public interface AuthorRepository {
	
	public void insertAuthor(AuthorVo vo); //작가 table에 작가를 저장
	
	public String checkName(String name); //같은 작가이름확인을 위한 조회
	
	public long selectAuthor(String name);// 작가이름으로 작가번호 조회

}
