package com.example.controller.api;

import java.io.File;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.example.dto.JsonResult;
import com.example.service.GoodsService;
import com.example.service.ManagementService;
import com.example.service.StatisticsService;
import com.example.service.UserService;
import com.example.vo.UserVo;


@Controller("userApiController")
@RequestMapping("/api/user")
public class UserController {
	
	GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath*:applicationContext.xml");
	
	@ResponseBody
	@RequestMapping("/existeid") 
	public JsonResult existId(String id){ //아이디중복체크
		
		boolean result=true;
		
		UserService userService= (UserService)ctx.getBean("userService");
		
		if(userService.findById(id)!=null) {
			
			result = true;
		}
		else {
			
			result=false;
		}
				
		return JsonResult.success(result);
				
	}
	

	 @ResponseBody // Ajax사용을 위해 @ResponseBody 선언
	 @RequestMapping(value = "/logout", method = RequestMethod.POST)
	  public boolean Logout(HttpServletRequest request) {	  // 로그아웃

		HttpSession session = request.getSession();
		
		session.removeAttribute("authUser");
		session.invalidate();
		
	    return true;
		
	  }
	 
	 
	 @ResponseBody // Ajax사용을 위해 @ResponseBody 선언
	 @RequestMapping(value = "/delete", method = RequestMethod.POST)
	  public boolean Delete(HttpServletRequest request) {	  // 회원탈퇴
		 
		HttpSession session = request.getSession();
		UserVo user = (UserVo)session.getAttribute("authUser");
		String id = user.getId(); //회원의 아이디뽑기
		
		
		//회원탈퇴
		UserService userService= (UserService)ctx.getBean("userService");
		userService.Delete(id);
		
		//goods제거
		GoodsService goodsservice = (GoodsService)ctx.getBean("goodsService");
		goodsservice.goodsAllDelete();
		
		//management제거
		ManagementService manageservice = (ManagementService)ctx.getBean("managementService");
		manageservice.goodsAllDelete();
		
		
		//statistics제거
		StatisticsService statisticsservice = (StatisticsService)ctx.getBean("statisticsService");		
		statisticsservice.goodsAllDelete();
		
		
		//물리적저장소데이터제거
		 String path = "C:\\Users\\Kim jisu\\Desktop\\개인프로젝트\\InventoryManagement\\src\\main\\webapp\\goods_Image\\";
		 File dir = new File(path);
		 File[] fileList = dir.listFiles();

		 for (File file : fileList) {
			if (file.isFile()) {

				if (file.getName().contains(id)) {

					file.delete();

				}}}
		
		//session에서 제거
		session.removeAttribute("authUser");
		session.invalidate();
		
	    return true;
		
	  }
}