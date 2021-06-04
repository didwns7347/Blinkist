package com.markany.blinkist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/error")
public class ErrorController {
	@RequestMapping("/fail")
	public String accessFail() {
		return "error/fail";
	}
}
