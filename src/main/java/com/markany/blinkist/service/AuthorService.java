package com.markany.blinkist.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.markany.blinkist.dao.AuthorRepository;
import com.markany.blinkist.vo.AuthorVo;


@Service("authorService")
public class AuthorService implements AuthorRepository{
	
    @Autowired
	private AuthorRepository authorRepository;
	
	public void setAuthorRepository(AuthorRepository authorRepository){
		
		this.authorRepository = authorRepository;
		
	}
	
	
	@Override//작가 table에 작가를 저장
	public void insertAuthor(AuthorVo vo) {
		
		authorRepository.insertAuthor(vo);
		
	}


	@Override// 같은 작가이름확인을 위한 조회
	public String checkName(String name) {
		
		return authorRepository.checkName(name);
		
	}
	
	
	@Override// 작가이름으로 작가번호 조회
	public long selectAuthor(String name) {
		return authorRepository.selectAuthor(name);
		
	}
}