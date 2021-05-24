package com.markany.blinkist.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.markany.blinkist.service.ContentService;
import com.markany.blinkist.vo.ContentVo;

@Controller
@RequestMapping("/content")
public class ContentController {
	
	@Autowired
	private ContentService contentService;
	
	
	@RequestMapping(value="/readbook")
	public String view(long book_no,Model model){
		
		
		List<ContentVo> contentvo = contentService.selectContent(book_no);
		
        model.addAttribute("Content", contentvo);
		
		
		return "board/readbook";
		
	}
	
	


}
