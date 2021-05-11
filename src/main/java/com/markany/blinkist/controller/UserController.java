package com.markany.blinkist.controller;



import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;


@Controller//String이나 ModelAndView객체반환

@RequestMapping("/user")
public class UserController {



@RequestMapping("/kakaoLogin")
public String home(@RequestParam(value = "code", required = false) String code) throws Exception{
    System.out.println("#########" + code);
    return "testPage";
}

}
