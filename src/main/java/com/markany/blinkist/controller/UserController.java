package com.markany.blinkist.controller;



import java.util.HashMap;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import com.markany.blinkist.service.KakaoService;


@Controller//String이나 ModelAndView객체반환

@RequestMapping("/user")
public class UserController {



//카카오톡 로그인 연동
@RequestMapping("/kakaoLogin")
public String home(@RequestParam(value = "code", required = false) String code) throws Exception{
	
	 System.out.println("#########" + code);
	 KakaoService service = new KakaoService();
     String access_Token = service.getAccessToken(code);
     HashMap<String, Object> userInfo = service.getUserInfo(access_Token);
     System.out.println("###access_Token#### : " + access_Token);
     System.out.println("###userInfo#### : " + userInfo.get("email"));

     
     return "redirect:/";
    
}

}
