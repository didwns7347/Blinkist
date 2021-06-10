package com.markany.blinkist.controller;

import java.security.Principal;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.markany.blinkist.repository.TranslationImpl;
import com.markany.blinkist.service.ContentService;
import com.markany.blinkist.service.HilightService;
import com.markany.blinkist.service.LibraryService;
import com.markany.blinkist.service.UserService;
import com.markany.blinkist.vo.ContentVo;
import com.markany.blinkist.vo.HilightVo;
import com.markany.blinkist.vo.LibraryVo;
import com.markany.blinkist.vo.TranslationVo;
import com.markany.blinkist.vo.UserVo;

@Controller
@RequestMapping("/content")
public class ContentController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ContentService contentService;
	
	@Autowired
	private LibraryService libraryService;
	
	@Autowired
	private HilightService hilightService;
	
	
	@RequestMapping(value="/readbook")
	public String view(long book_no, Principal authUser, Model model){
		
		//세션에 저장된 회원의 이메일정보가져오기
		String email = authUser.getName();
		//이메일을 토대로 회원정보가져오기
		UserVo userVo = userService.findByEmail(email);
		
		LibraryVo libraryVo = new LibraryVo();
		libraryVo.setUser_no(userVo.getUser_no());
		
		libraryVo.setBook_no(book_no);
		
		long progress = libraryService.check_progress(libraryVo);
		
		List<ContentVo> contentvo = contentService.selectContent(book_no);
		
		for(ContentVo vo : contentvo) {
			//System.out.println(vo.getContent().replaceAll("\n","<br/>"));
			vo.setContent(vo.getContent().replaceAll("\\\"","&ldquo;"));
			//System.out.println(vo.toString());
		}

		for(ContentVo vo:contentvo) {
			vo.setContent(vo.getContent().replaceAll("\\\"",""));
		}
		

		HilightVo hilightvo = new HilightVo();
		hilightvo.setBook_no(book_no);
		hilightvo.setUser_no(userVo.getUser_no());
		List<HilightVo> hilightContent = hilightService.selectHilightContent(hilightvo);
		
        model.addAttribute("Content", contentvo);
		model.addAttribute("progress", progress);
		model.addAttribute("book_no",book_no);
		model.addAttribute("hilightContent", hilightContent);
		
		return "board/readbook";
		
	}
	
	
	//영어로번역
	@ResponseBody
	@RequestMapping("/english")
	public ArrayList<String> english(@RequestParam(value = "chapter")String chapter,@RequestParam(value = "content")String content) throws ParseException{

		TranslationImpl translation = new TranslationImpl();
		
		TranslationVo translationvo = new TranslationVo();
		
		translationvo.setKorean(chapter);
	
	    String english_chapter = translation.getEnglish(chapter);
	    

		translationvo.setKorean(content);
		String english_content = translation.getEnglish(content);
	
		ArrayList<String> book = new ArrayList<String>();
		
		book.add(english_chapter);
		book.add(english_content);
		
		return book;
		
	}
	
	
	//한국어로번역
	@ResponseBody
	@RequestMapping("/korea")
	public ArrayList<String> korea(@RequestParam(value = "chapter")String chapter,@RequestParam(value = "content")String content) throws ParseException{

		TranslationImpl translation = new TranslationImpl();
		
		TranslationVo translationvo = new TranslationVo();
		
		translationvo.setEnglish(chapter);
	    String korea_chapter = translation.getKorean(chapter);
	    
		translationvo.setEnglish(content);
		String korea_content = translation.getKorean(content);
		
		ArrayList<String> book = new ArrayList<String>();
		
		book.add(korea_chapter);
		book.add(korea_content);
		
		return book;
		
	}
}