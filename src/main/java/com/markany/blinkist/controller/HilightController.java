package com.markany.blinkist.controller;


import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.markany.blinkist.service.HilightService;
import com.markany.blinkist.service.UserService;
import com.markany.blinkist.vo.HilightVo;
import com.markany.blinkist.vo.UserVo;

@Controller
@RequestMapping("/hilight")
public class HilightController {

	@Autowired
	private UserService userService;

	@Autowired
	private HilightService hilightService;


	//하이라이트메뉴
	@RequestMapping(value = "/hilight", method = RequestMethod.GET)
	public String hilightList(String authUser,Model model){

		//세션에 저장된 회원의 이메일정보가져오기
		String email = authUser;
		//이메일을 토대로 회원정보가져오기
		UserVo userVo = userService.findByEmail(email);
		
		//사용자의 하이라이트내용들을 제목정렬순으로가져오기
		List<HashMap<String, Object>>  Titlehilightlist = hilightService.selectHilightbyTitle(userVo.getUser_no());
		model.addAttribute("Titlehilight", Titlehilightlist);
		
		
		//사용자의 하이라이트내용들을가져오기
		HilightVo hilightvo = new HilightVo();
		hilightvo.setUser_no(userVo.getUser_no());
		
		List<HashMap<String, Object>> Datehilightlist = new ArrayList<HashMap<String, Object>>();
				
		for (HashMap<String, Object> map : Titlehilightlist) {
			
			hilightvo.setReg_date(map.get("reg_date").toString());
	
			List<HashMap<String, Object>> datalist = hilightService.selectHilightbyDate(hilightvo);
			
			Datehilightlist.addAll(datalist);
			
			
		}
		
		
		// 최신순으로 정렬
		Collections.sort(Datehilightlist, new Comparator<HashMap<String, Object>>() {
					
		@Override
		public int compare(HashMap<String, Object> o1, HashMap<String, Object> o2) {
						
			Integer reg_date1 =  Integer.parseInt(o1.get("reg_date").toString());
			Integer reg_date2 =  Integer.parseInt(o2.get("reg_date").toString());
						
			return reg_date1.compareTo(reg_date2);
		}
		});

						
		model.addAttribute("Datehilight", Datehilightlist);
		
		return "board/hilight";
		
	}


	// 하이라이트 추가하기
	@ResponseBody // Ajax사용을 위해 @ResponseBody 선언
	@RequestMapping(value = "/addHilight", method = RequestMethod.POST)
	public boolean addLibrary(@RequestParam(value="book_no") long book_no,@RequestParam(value="content") String content,
			@RequestParam(value="content_no") long content_no, @RequestParam(value="authUser") String authUser )
	{

		String email = authUser;
		//이메일을 토대로 회원정보가져오기
		UserVo userVo = userService.findByEmail(email);

		HilightVo hilightvo = new HilightVo();

		hilightvo.setBook_no(book_no);
		hilightvo.setContent(content);
		hilightvo.setUser_no(userVo.getUser_no());
		hilightvo.setContent_no(content_no);

		hilightService.insertHilight(hilightvo);  

		return true;
	}
	
	
	// 하이라이트 삭제하기
	@ResponseBody // Ajax사용을 위해 @ResponseBody 선언
	@RequestMapping(value = "/deleteHilight", method = RequestMethod.POST)
	public boolean DeleteHilight(@RequestParam(value="hilight_no") long hilight_no){

		hilightService.deleteHilight(hilight_no);  

		return true;
	}
}