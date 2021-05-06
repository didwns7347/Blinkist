package com.example.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.example.search.PageMaker;
import com.example.search.Search;
import com.example.service.GoodsService;
import com.example.service.ManagementService;
import com.example.service.StatisticsService;
import com.example.vo.GoodsVo;
import com.example.vo.ManagementVo;
import com.example.vo.StatisticsVo;
import com.example.vo.UserVo;


@Controller
@RequestMapping("/goods")
public class GoodsController {

	
	GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath*:applicationContext.xml");
	
	
	@RequestMapping(value="/import", method=RequestMethod.GET)
	public String GetImport(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		UserVo  authUser = (UserVo)session.getAttribute("authUser");
		
		if (authUser == null) { // 로그인안한회원
			
			  return "redirect:/";
			  
		}else {
			
			return "goods/import";	
			
		}		
	}
	
	  @RequestMapping(value = "/import", method = RequestMethod.POST)
	  public String postimport(HttpServletRequest request,GoodsVo vo, MultipartHttpServletRequest mtfRequest,ManagementVo mvo,StatisticsVo svo) throws Exception {
		  
		  // 첨부파일 가져오기
		  MultipartFile image = mtfRequest.getFile("file");
		  	  
		  // save_file에서 사용할 회원의 id가져오기
		  HttpSession session = request.getSession(); 
		  UserVo authUser = (UserVo)session.getAttribute("authUser");
		  String id= authUser.getId();
		  
		  
		  // 이미지의이름구하기 
		  String originalFileName = image.getOriginalFilename(); 
		   
		  String save_file = id + "_"  + originalFileName; // 회원아이디+original파일이름
		  
          GoodsService goodsservice = (GoodsService)ctx.getBean("goodsService");
          ManagementService manageservice = (ManagementService)ctx.getBean("managementService");
		  StatisticsService statisticsservice = (StatisticsService)ctx.getBean("statisticsService");		
          
			try {

					  image.transferTo(new File(("C:\\Users\\Kim jisu\\Desktop\\개인프로젝트\\InventoryManagement\\src\\main\\webapp\\goods_Image\\" + save_file))); //물리적저장소에 저장
					  vo.setImg("C:\\Users\\Kim jisu\\Desktop\\개인프로젝트\\InventoryManagement\\src\\main\\webapp\\goods_Image\\" + save_file);
					  
		      }catch (IllegalStateException e) {
					  
				     e.printStackTrace();
				     
			     }catch (IOException e) {
				
				  e.printStackTrace();
			   }
		
	     	goodsservice.goodsImport(vo);
	     	manageservice.goodsImport(mvo);
	     	statisticsservice.input(svo);

		    return "redirect:/";
		   
	      }
	  
	  
		@RequestMapping(value="/export", method=RequestMethod.GET)
		public String GetExport(HttpServletRequest request,Model model) {
			
			HttpSession session = request.getSession();
			UserVo  authUser = (UserVo)session.getAttribute("authUser");
			
			if (authUser == null) { // 로그인안한회원
				
				  return "redirect:/";
				  
			}else {
				
				 ManagementService manageservice = (ManagementService)ctx.getBean("managementService");
				 
				 model.addAttribute("goods", manageservice.goodsInfo());
				
				return "goods/export";	
				
			}		
		}
		
		
		@RequestMapping(value="/export", method=RequestMethod.POST)
		public String PostExport(ManagementVo vo,StatisticsVo svo) {
						
		    ManagementService manageservice = (ManagementService)ctx.getBean("managementService");
		    StatisticsService statisticsservice = (StatisticsService)ctx.getBean("statisticsService");		
   
			manageservice.goodsExport(vo);
			statisticsservice.export(svo);
			
				
				return "redirect:/";	
				
			}		


@RequestMapping(value="/back", method=RequestMethod.GET)
public String GetBack(HttpServletRequest request,Model model) {
	
	HttpSession session = request.getSession();
	UserVo  authUser = (UserVo)session.getAttribute("authUser");
	
	if (authUser == null) { // 로그인안한회원
		
		  return "redirect:/";
		  
	}else {
		
		 ManagementService manageservice = (ManagementService)ctx.getBean("managementService");
		 
		 model.addAttribute("goods", manageservice.goodsInfo());
		
		return "goods/back";	
		
	}		
}


@RequestMapping(value="/back", method=RequestMethod.POST)
public String PostBack(ManagementVo vo,StatisticsVo svo) {
	
	  ManagementService manageservice = (ManagementService)ctx.getBean("managementService");
	  StatisticsService statisticsservice = (StatisticsService)ctx.getBean("statisticsService");		
	   
	  
		manageservice.goodsBack(vo);
		statisticsservice.back(svo);
		
			
			return "redirect:/";	
}


@RequestMapping(value="/List", method=RequestMethod.GET)
public String GetList(Search se,HttpServletRequest request,Model model) {
	
	HttpSession session = request.getSession();
	UserVo  authUser = (UserVo)session.getAttribute("authUser");
	
	if (authUser == null) { // 로그인안한회원
		
		  return "redirect:/";
		  
	}else {
		
		GoodsService goodsservice = (GoodsService)ctx.getBean("goodsService");
		model.addAttribute("List", goodsservice.goodsList(se));
		
		// 페이징+검색
		PageMaker pageMaker = new PageMaker();
		pageMaker.setlistPage(se);
		pageMaker.setTotalCount(goodsservice.listCount(se));
		model.addAttribute("pageMaker", pageMaker);
		
		return "goods/List";	
		
	}
}
	

	@RequestMapping(value="/view/{number}", method = RequestMethod.GET)
	public String view(@PathVariable("number") int number,Model model) throws Exception{
			
		GoodsService goodsservice = (GoodsService)ctx.getBean("goodsService");
		List<GoodsVo> goodsInfo =  goodsservice.goodsInfo(number);
							
		model.addAttribute("Info",goodsInfo.get(0).getInfo()); //상품정보

		String originalFileName = goodsInfo.get(0).getImg(); //이미지
						
		model.addAttribute("img", originalFileName.substring(originalFileName.lastIndexOf("\\") + 1,originalFileName.length()));
	    
		model.addAttribute("number", number);
		return "goods/view";
		
	}
	
	
	@RequestMapping(value="/update/{number}", method = RequestMethod.GET)
	public String Getupdate(@PathVariable("number") int number,Model model) throws Exception{
			
		GoodsService goodsservice = (GoodsService)ctx.getBean("goodsService");
		
		List<GoodsVo> goodsInfo =  goodsservice.goodsInfo(number);
		model.addAttribute("List", goodsInfo);
		
		String originalFileName = goodsInfo.get(0).getImg(); //이미지
		model.addAttribute("img", originalFileName.substring(originalFileName.lastIndexOf("\\") + 1,originalFileName.length()));
		
		model.addAttribute("number", number);
		
		return "goods/update";
		
	}
	
	
	@RequestMapping(value = "/update/{number}", method = RequestMethod.POST)
	  public String Postupdate(@PathVariable("number") int number,HttpServletRequest request,GoodsVo vo, MultipartHttpServletRequest mtfRequest,ManagementVo mvo) throws Exception {
		  
		  GoodsService goodsservice = (GoodsService)ctx.getBean("goodsService");
		  ManagementService manageservice = (ManagementService)ctx.getBean("managementService");
		  
		  // 첨부파일 가져오기
		  MultipartFile image = mtfRequest.getFile("file");
		  
		  if(image.isEmpty()) { //기존의 파일이라면
			  
			  String img = request.getParameter("img");
			  vo.setImg("C:\\Users\\Kim jisu\\Desktop\\개인프로젝트\\InventoryManagement\\src\\main\\webapp\\goods_Image\\"+img);
			  
			  goodsservice.goodsUpdate(vo);
			  manageservice.goodsUpdate(mvo);
			  
			  return "redirect:/";
			  
		  }else { //새로운파일이라면
			  
			  // save_file에서 사용할 회원의 id가져오기
			  HttpSession session = request.getSession(); 
			  UserVo authUser = (UserVo)session.getAttribute("authUser");
			  String id= authUser.getId();
			  
			  
			  // 이미지의이름구하기 
			  String originalFileName = image.getOriginalFilename(); 
			   
			  String save_file = id + "_"  + originalFileName; // 회원아이디+original파일이름
			  
			  
				try {
					
					 //기존파일지우기
					String img = request.getParameter("img");
					 File file = new File("C:\\Users\\Kim jisu\\Desktop\\개인프로젝트\\InventoryManagement\\src\\main\\webapp\\goods_Image\\"+img); 
					 
					 if( file.exists() ){
						    file.delete();
					}

						  image.transferTo(new File(("C:\\Users\\Kim jisu\\Desktop\\개인프로젝트\\InventoryManagement\\src\\main\\webapp\\goods_Image\\" + save_file))); //물리적저장소에 저장
						  vo.setImg("C:\\Users\\Kim jisu\\Desktop\\개인프로젝트\\InventoryManagement\\src\\main\\webapp\\goods_Image\\" + save_file);
						  
			      }catch (IllegalStateException e) {
						  
					     e.printStackTrace();
					     
				     }catch (IOException e) {
					
					  e.printStackTrace();
				   }
			
		     	goodsservice.goodsUpdate(vo);
		     	manageservice.goodsUpdate(mvo);

			    return "redirect:/";
			  
		  }
	      }
	
	
     //상품삭제
	@RequestMapping("/Delete")
	public String PostDelete(@RequestParam("number") int number) {

		
		     GoodsService goodsservice = (GoodsService)ctx.getBean("goodsService");
			 ManagementService manageservice = (ManagementService)ctx.getBean("managementService");
			 
			 //기존파일지우기 -> 물리적저장소
			List<GoodsVo> vo = goodsservice.goodsInfo(number);
				 File file = new File(vo.get(0).getImg()); 
				 
				 if( file.exists() ){
					 
					    file.delete();
				}

			 goodsservice.goodsDelete(number);
			 manageservice.goodsDelete(number);
			 
			 
			 return "redirect:/goods/List";

		 }


@RequestMapping(value="/statistics", method=RequestMethod.GET)
public String Getstatistics(HttpServletRequest request,Model model) {
	
	HttpSession session = request.getSession();
	UserVo  authUser = (UserVo)session.getAttribute("authUser");
	
	if (authUser == null) { // 로그인안한회원
		
		  return "redirect:/";
		  
	}else {
		
		StatisticsService statisticsservice = (StatisticsService)ctx.getBean("statisticsService");		
		
		
		model.addAttribute("inputNum", statisticsservice.inputNum());// 카테고리별 입고량(매입)통계
		model.addAttribute("exportNum", statisticsservice.exportNum());// 카테고리별 출고량(판매)통계
		model.addAttribute("backNum", statisticsservice.backNum());// 카테고리별 반품량통계
		
				
		return "goods/statistics";	
		
	}		
}
}