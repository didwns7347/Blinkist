package com.markany.blinkist.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.markany.blinkist.service.HilightService;
import com.markany.blinkist.service.LibraryService;
import com.markany.blinkist.service.UserService;
import com.markany.blinkist.vo.HilightVo;
import com.markany.blinkist.vo.LibraryVo;
import com.markany.blinkist.vo.UserVo;


@Controller
@RequestMapping("/library")
public class LibraryController {
	
	@Autowired
	private LibraryService libraryService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private HilightService hilightService;
	
	
	@ResponseBody // Ajax사용을 위해 @ResponseBody 선언
	@RequestMapping(value = "/button_addlibrary", method = RequestMethod.POST)//라이브러리에 추가 viewbook.jsp에 있는 button_addlibrary버튼
	public boolean button_addlibarary(@RequestParam(value="book_no") long book_no,  Principal authUser) {
		
		//세션에 저장된 회원의 이메일정보가져오기
		String email = authUser.getName();
		
		//이메일을 토대로 회원정보가져오기
		UserVo userVo = userService.findByEmail(email);
		
		LibraryVo libraryVo = new LibraryVo();
		libraryVo.setUser_no(userVo.getUser_no());
		libraryVo.setBook_no(book_no);
		
		libraryService.addLibrary(libraryVo);
		
		return true;
		
	}
	
	
	// 라이브러리 추가하기 category의 Addlibrary버튼
	@RequestMapping("/addlibrary")
	public String addLibrary(HttpServletRequest request, long book_no, String authUser) {
		
		// 이전페이지로 복귀하기 위해 이전페이지 url정보를 가죠오는 코드
		String ref = request.getHeader("Referer");
		
		UserVo userVo = userService.findByEmail(authUser);	
		
		LibraryVo libraryVo = new LibraryVo();
		libraryVo.setBook_no(book_no);
		libraryVo.setUser_no(userVo.getUser_no());
	
		libraryService.addLibrary(libraryVo);
		
		return "redirect:" + ref;
		
	}
	
	
	// 라이브러리 보여주기
	@RequestMapping("/view")
	public String viewLibrary(Model model, String authUser) {
		
		UserVo userVo=userService.findByEmail(authUser);
		List<HashMap<Object,Object>> booklist =libraryService.findByAuthUser(userVo);
		
		model.addAttribute("list", booklist);
		
		return "board/library";
		
	}
	
	
	@ResponseBody // Ajax사용을 위해 @ResponseBody 선언
	@RequestMapping(value = "/update_progress", method = RequestMethod.POST)
	public boolean update_progress(@RequestParam(value="progress") long progress, @RequestParam(value="book_no") long book_no, Principal authUser) {
		
		//세션에 저장된 회원의 이메일정보가져오기
		String email = authUser.getName();
		
		//이메일을 토대로 회원정보가져오기
		UserVo userVo = userService.findByEmail(email);
		
		LibraryVo libraryVo = new LibraryVo();
		
		libraryVo.setUser_no(userVo.getUser_no());
		libraryVo.setBook_no(book_no);
		libraryVo.setProgress(progress);
		
		//progress업데이트
		libraryService.update_progress(libraryVo);
		
		//progress가 100이면 fin_check 1로 업데이트
		if(progress==100) {
			
			libraryService.update_fincheck(libraryVo);

		}

		return true;
		
	}
	

	//라이브러리 삭제 하기
	@RequestMapping("/removelibrary")
	public String removeLibrary(HttpServletRequest request, long book_no, String authUser) {
		
		String ref = request.getHeader("Referer");
		
		UserVo userVo = userService.findByEmail(authUser);	
		
		LibraryVo libraryVo = new LibraryVo();
		libraryVo.setBook_no(book_no);
		libraryVo.setUser_no(userVo.getUser_no());
		
		HilightVo hilightVo = new HilightVo();
		hilightVo.setBook_no(book_no);
		hilightVo.setUser_no(userVo.getUser_no());
		
		hilightService.deleteLibraryHilihgt(hilightVo);
		libraryService.removeLibrary(libraryVo);
		
		return "redirect:" + ref;
		
	}	
}