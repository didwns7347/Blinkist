package com.markany.blinkist.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.markany.blinkist.service.BookService;
import com.markany.blinkist.vo.BookVo;

@Controller
@RequestMapping("/book")
public class BookController {
	@Autowired
	private BookService bookService;
	
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
}
