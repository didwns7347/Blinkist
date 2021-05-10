package com.markany.blinkist.controller;



import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller//String이나 ModelAndView객체반환


public class HelloController {

//메인화면
@GetMapping(value = "/")
public String hello(Model model) {
   
   return "home";
}}
