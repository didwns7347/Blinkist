package com.markany.blinkist.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.markany.blinkist.dao.HilightRepository;
import com.markany.blinkist.vo.HilightVo;

@Service("HilightService")
public class HilightService {
	
	@Autowired
	private HilightRepository hilightRepository;
	
	
	//하이라이트저장
	public void insertHilight(HilightVo vo) {
		
		hilightRepository.insertHilight(vo);

	}
	
		
	//사용자의 하이라이트내용들을 제목정렬순으로가져오기
	public List<HashMap<String, Object>> selectHilightbyTitle(long user_no){	
		
		return hilightRepository.selectHilightbyTitle(user_no);
	
	}
	
	
	//사용자의 하이라이트내용들을 오래된날짜정렬순으로가져오기
	public List<HashMap<String, Object>> selectHilightbyDate(HilightVo vo){
		
		return hilightRepository.selectHilightbyDate(vo);
		
	}
	
	
	//사용자가 구독한 책에서 저장한 hilight내용가져오기
	public List<HilightVo> selectHilightContent(HilightVo vo){
		
		return hilightRepository.selectHilightContent(vo);
		
	}
	
	
	// 하이라이트 삭제하기
	public void deleteHilight(long hilight_no) {
		
		hilightRepository.deleteHilight(hilight_no);
		
	}
	
	
	//회원의 하이라이트 모두삭제
	public void deleteAllHilight(long user_no) {
		
		hilightRepository.deleteAllHilight(user_no);
		
	}

	//라이브러리 삭제시 해당 도서 하이라이트 삭제
	public void deleteLibraryHilihgt(HilightVo hilightVo) {
		
		hilightRepository.deleteLibraryHilight(hilightVo);
		
	}
}