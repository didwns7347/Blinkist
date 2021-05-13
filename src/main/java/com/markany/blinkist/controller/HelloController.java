package com.markany.blinkist.controller;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.SecureRandom;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.markany.blinkist.service.NaverLoginService;

@Controller // String이나 ModelAndView객체반환

public class HelloController {
	private String CLIENT_ID = "msHB7T_VVvI39HWX76ou"; // 애플리케이션 클라이언트 아이디값";
	private String CLI_SECRET = "KKC3oOlKNN"; // 애플리케이션 클라이언트 시크릿값";
	
	@Autowired
	private NaverLoginService naverLoginService;

	//메인화면
	@GetMapping(value = "/")
	public String hello(Model model, HttpSession session,HttpServletRequest request) throws UnsupportedEncodingException {
		
		
		String NaverauthURL=naverLoginService.getAuthorizationUrl(session);
		System.out.println(NaverauthURL);
		model.addAttribute("url", NaverauthURL);
		return "main/test";
	}

}
