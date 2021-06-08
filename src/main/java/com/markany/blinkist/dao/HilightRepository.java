package com.markany.blinkist.dao;

import java.util.HashMap;
import java.util.List;
import com.markany.blinkist.vo.HilightVo;

public interface HilightRepository {
	
	public void insertHilight(HilightVo vo); //하이라이트저장
		
	public List<HashMap<String, Object>> selectHilightbyTitle(long user_no);//사용자의 하이라이트내용들을 제목정렬순으로가져오기
	
	public List<HashMap<String, Object>> selectHilightbyDate(HilightVo vo);//사용자의 하이라이트내용들을 오래된날짜정렬순으로가져오기
	
	public List<HilightVo> selectHilightContent(HilightVo vo);//사용자가 구독한 책에서 저장한 hilight내용가져오기
	
	public void deleteHilight(long hilight_no);// 하이라이트 삭제하기
	
	public void deleteAllHilight(long user_no); //회원의 하이라이트 모두삭제

	public void deleteLibraryHilight(HilightVo hilightVo);

}
