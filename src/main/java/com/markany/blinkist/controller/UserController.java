package com.markany.blinkist.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.markany.blinkist.service.KakaoService;
import com.markany.blinkist.service.NaverLoginService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private NaverLoginService naverLoginService;
	

//카카오톡 로그인 연동
	@RequestMapping("/kakaoLogin")
	public String home(@RequestParam(value = "code", required = false) String code) throws Exception {

		System.out.println("#########" + code);
		KakaoService service = new KakaoService();
		String access_Token = service.getAccessToken(code);
		HashMap<String, Object> userInfo = service.getUserInfo(access_Token);
		System.out.println("###access_Token#### : " + access_Token);
		System.out.println("###userInfo#### : " + userInfo.get("email"));

		return "redirect:/";

	}
	@RequestMapping("/login")
	public String login(HttpSession session, Model model) {
		String url=naverLoginService.getAuthorizationUrl(session);
		model.addAttribute("url", url);
		return "user/login";
	}
	
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException {
		System.out.println("여기는 callback");
		
		OAuth2AccessToken oauthToken = naverLoginService.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
	    String apiResult = naverLoginService.getUserProfile(oauthToken);
	    String email=naverLoginService.getUserEmail(apiResult);
		model.addAttribute("result", apiResult);
		model.addAttribute("email", email);
        /* 네이버 로그인 성공 페이지 View 호출 */
		System.out.println(apiResult);
		System.out.println("email= "+email);
		return "redirect:/";
	}



	
	
	

}
