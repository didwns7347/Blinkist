package com.markany.blinkist.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	
	// 평점과 리뷰작성페이지
		@RequestMapping("/reviewwrite")
		public String reviewwrite(Model model, String keyword, Principal authUser) {
			
			
			return "board/reviewwrite";
		
		}
}
