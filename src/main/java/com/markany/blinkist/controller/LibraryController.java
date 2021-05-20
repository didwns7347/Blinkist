package com.markany.blinkist.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.markany.blinkist.service.BookService;
import com.markany.blinkist.service.LibraryService;
import com.markany.blinkist.service.UserService;
import com.markany.blinkist.vo.LibraryVo;
import com.markany.blinkist.vo.UserVo;
@Controller
@RequestMapping("/library")
public class LibraryController {
	@Autowired
	private LibraryService libraryService;
	@Autowired
	private UserService userService;

	// 라이브러리 보여주기
	@RequestMapping("/view")
	public String viewLibrary(Model model, String authUser) {
		return "board/library";
	}

	// 라이브러리 추가하기
	@RequestMapping("/addlibrary")
	public String addLibrary(HttpServletRequest request, long book_no, String authUser) {
		// 이전페이지로 복귀하기 위해 이전페이지 url정보를 가죠오는 코드
		String ref = request.getHeader("Referer");
		System.out.println(book_no + authUser);
		// bookService.addLibrary(no);
		UserVo userVo = userService.findByEmail(authUser);
		LibraryVo libraryVo = new LibraryVo();
		libraryVo.setBook_no(book_no);
		libraryVo.setUser_no(userVo.getUser_no());
		libraryService.addLibrary(libraryVo);
		return "redirect:" + ref;
	}
}
