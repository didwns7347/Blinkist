package com.markany.blinkist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/error")
public class ErrorController {
	
	@RequestMapping("/basicerror")
	public String basicError() {
		
		return "error/basicError";
		
	}
	
	
	@RequestMapping("/primiumerror")
	public String primiumError() {
		
		return "error/primiumError";
		
	}
	
	
	@RequestMapping("/fail")
	public String fail() {
		
		return "error/fail";
		
	}
}