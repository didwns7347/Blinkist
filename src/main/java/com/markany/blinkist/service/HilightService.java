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
}