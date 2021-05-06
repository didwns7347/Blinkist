package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
class MainController{

//메인화면
@RequestMapping(value = "/")
public String hello(Model model) {
	
	return "main/index";
}}

