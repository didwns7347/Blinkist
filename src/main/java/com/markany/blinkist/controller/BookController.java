package com.markany.blinkist.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.markany.blinkist.service.BookService;
import com.markany.blinkist.service.UserService;
import com.markany.blinkist.vo.BookVo;
import com.markany.blinkist.vo.UserVo;

@Controller
@RequestMapping("/book")
public class BookController {
	@Autowired
	private BookService bookService;
	@Autowired
	private UserService userService;
	
	//책 검색기능 제목,작가
	@RequestMapping("/search")
	public String search(Model model, String keyword) {
		//System.out.println(keyword);
		List<HashMap<String, Object>>  list = bookService.findByTitleAuthor(keyword);
		//System.out.println("됨??");
		model.addAttribute("list", list);
		model.addAttribute("keyword",keyword);
		return "board/searchresult";
	}
	
	//책 보여주기 기능
	@RequestMapping("/viewbook")
	public String viewBook(Model model, long no) {
		Map<Object, Object> map = bookService.findByNo(no);
		model.addAttribute("map", map);
		return "board/viewbook";
	}
	
	//recentrlyadded 보여주기 기능
	@RequestMapping("/recentlyadded")
	public String viewBook(Model model) {
		List<HashMap<String, Object>>  list = bookService.findAllOrderByDate();
		model.addAttribute("list", list);
		return "board/recentlyadded";
	}
	
	//populartitles 보여주기 기능
	
	
	
	
}
