package com.example.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.example.service.UserService;
import com.example.vo.UserVo;



@Controller
@RequestMapping("/user")
public class UserController {

	GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath*:applicationContext.xml");
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join() {
		
		return "user/join";	
		
	}
	
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(UserVo vo) {
		
		UserService userservice= (UserService)ctx.getBean("userService");
		userservice.join(vo);
		return "redirect:/";	
		
	}
	
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "user/login";	
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public ModelAndView login(UserVo vo,HttpServletRequest request,ModelAndView  mav,HttpServletResponse response) {
		
		UserService userservice= (UserService)ctx.getBean("userService");
		
		if(userservice.login(vo)!=null) { //로그인정보일치
			
			HttpSession session = request.getSession(); // session생성
	
			session.setAttribute("authUser", vo);
			mav.setViewName("redirect:/");

		}else {//로그인정보 불일치
			
			mav.addObject("fail", "fail");
			mav.setViewName("redirect:/user/login");

			
		}

		return mav;
	}
	

	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String update( HttpServletRequest request,Model model) {
		
		HttpSession session = request.getSession(); // session생성
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		
       if(authUser==null) {
    	   
    	   return "redirect:/";
    	      	       	   
       }else {
    	   UserService userService= (UserService)ctx.getBean("userService");

    	   UserVo userVo = userService.getUser(authUser.getId());
    	   model.addAttribute("userVo", userVo);

    	   return "user/update";

       }
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String update( HttpServletRequest request,UserVo vo) {
		
		HttpSession session = request.getSession(); // session생성
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		String id= authUser.getId();
				
		vo.setId(id);
		
		UserService userService= (UserService)ctx.getBean("userService");
		
		userService.update(vo);
		
		session.removeAttribute("authUser");
		session.invalidate();
		
		return "redirect:/user/login";
	}
	
	
	
	
	
}
	
	
	



