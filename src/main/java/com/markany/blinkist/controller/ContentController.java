package com.markany.blinkist.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.markany.blinkist.service.ContentService;
import com.markany.blinkist.service.LibraryService;
import com.markany.blinkist.service.UserService;
import com.markany.blinkist.vo.ContentVo;
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
	
	
	@RequestMapping(value="/readbook")
	public String view(HttpSession session,long book_no,Model model){
		
		//세션에 저장된 회원의 이메일정보가져오기
		String email = (String)session.getAttribute("authUser");
		//이메일을 토대로 회원정보가져오기
		UserVo userVo = userService.findByEmail(email);
		
		LibraryVo libraryVo = new LibraryVo();
		libraryVo.setUser_no(userVo.getUser_no());
		
		libraryVo.setBook_no(book_no);
		
		long progress = libraryService.check_progress(libraryVo);
		
		List<ContentVo> contentvo = contentService.selectContent(book_no);
		
        model.addAttribute("Content", contentvo);
		model.addAttribute("progress", progress);
		model.addAttribute("book_no",book_no);
		
		return "board/readbook";
		
	}
	
	


}
