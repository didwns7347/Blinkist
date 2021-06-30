package com.markany.blinkist.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.markany.blinkist.service.MailSendService;


@Controller
@RequestMapping("/email")
public class MailController {
	@Autowired
	private MailSendService mss;
	//이메일인증
	
	@RequestMapping(value="/mailcheck", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sendMail(String email) {
		//인증 이메일 전송
		System.out.println("이메일 인증 실행");
		Map<String, Object> map = new HashMap<>();
		String authKey=mss.sendAuthMail(email);
		System.out.println("메시지 전송 완료:"+authKey);
		map.put("key",authKey);
		return map;
		
	}
}
