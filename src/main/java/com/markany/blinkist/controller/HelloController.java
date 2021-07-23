package com.markany.blinkist.controller;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.markany.blinkist.service.BookService;
import com.markany.blinkist.service.NaverLoginService;
import com.markany.blinkist.vo.KorVo;
import com.markany.blinkist.vo.UserVo;


@Controller // String이나 ModelAndView객체반환
public class HelloController {
	
	@Autowired
	private NaverLoginService naverLoginService;
	
	@Autowired
	private BookService bookService;

	
	//메인화면
	@GetMapping(value = "/")
	public String hello(Model model, HttpSession session,HttpServletRequest request) throws UnsupportedEncodingException {
		
		String NaverauthURL=naverLoginService.getAuthorizationUrl(session);
		if(session.getAttribute("langDict")==null) {
			session.setAttribute("langDict", new KorVo());
		}
		model.addAttribute("humanlist",bookService.findAllCategoryOrderByCount("인문학"));
		model.addAttribute("lifelist",bookService.findAllCategoryOrderByCount("건강/생활/요리"));
		model.addAttribute("novellist",bookService.findAllCategoryOrderByCount("소설"));
		model.addAttribute("selfdevlist",bookService.findAllCategoryOrderByCount("자기개발"));
		model.addAttribute("sociallist",bookService.findAllCategoryOrderByCount("사회"));
		model.addAttribute("teenagelist",bookService.findAllCategoryOrderByCount("청소년"));
		
			
		model.addAttribute("url", NaverauthURL);
		
		return "main/main";
	}
}