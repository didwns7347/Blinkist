package com.markany.blinkist.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.markany.blinkist.service.ContentService;
import com.markany.blinkist.service.HilightService;
import com.markany.blinkist.service.LibraryService;
import com.markany.blinkist.service.UserService;
import com.markany.blinkist.vo.ContentVo;
import com.markany.blinkist.vo.HilightVo;
import com.markany.blinkist.vo.LibraryVo;
import com.markany.blinkist.vo.UserVo;

@Controller
@RequestMapping("/content")
public class ContentController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ContentService contentService;
	
	@Autowired
	private LibraryService libraryService;
	
	@Autowired
	private HilightService hilightService;
	
	
	@RequestMapping(value="/readbook")
	public String view(long book_no, Principal authUser, Model model){
		
		//세션에 저장된 회원의 이메일정보가져오기
		String email = authUser.getName();
		//이메일을 토대로 회원정보가져오기
		UserVo userVo = userService.findByEmail(email);
		
		LibraryVo libraryVo = new LibraryVo();
		libraryVo.setUser_no(userVo.getUser_no());
		
		libraryVo.setBook_no(book_no);
		
		long progress = libraryService.check_progress(libraryVo);
		
		List<ContentVo> contentvo = contentService.selectContent(book_no);
		
		
		HilightVo hilightvo = new HilightVo();
		hilightvo.setBook_no(book_no);
		hilightvo.setUser_no(userVo.getUser_no());
		List<HilightVo> hilightContent = hilightService.selectHilightContent(hilightvo);
		
        model.addAttribute("Content", contentvo);
		model.addAttribute("progress", progress);
		model.addAttribute("book_no",book_no);
		model.addAttribute("hilightContent", hilightContent);
		
		return "board/readbook";
		
	}
	
	


}
