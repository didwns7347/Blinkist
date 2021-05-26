package com.markany.blinkist.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.markany.blinkist.service.BookService;
import com.markany.blinkist.service.ContentService;
import com.markany.blinkist.service.LibraryService;
import com.markany.blinkist.service.UserService;
import com.markany.blinkist.vo.BookVo;
import com.markany.blinkist.vo.LibraryVo;
import com.markany.blinkist.vo.UserVo;

@Controller
@RequestMapping("/book")
public class BookController {
	
	@Autowired
	private BookService bookService;
	
	@Autowired
	private LibraryService libraryService;
	
	@Autowired
	private UserService userService;
		
	
	//책 검색기능 제목,작가
	@RequestMapping("/search")
	public String search(Model model, String keyword,HttpSession session) {
		//System.out.println(keyword);
		List<HashMap<String, Object>>  list = bookService.findByTitleAuthor(keyword);
		String email=(String) session.getAttribute("authUser");
		List<Long> libraryList = libraryService.findByAuthUser(email);
		List<HashMap<String, Object>> lastlist=bookService.libraryCheck(list,libraryList);
		//System.out.println("됨??");
		model.addAttribute("list", lastlist);
		model.addAttribute("keyword",keyword);
		return "board/searchresult";
	}
	
	
	//책 보여주기 기능
	@RequestMapping("/viewbook")
	public String viewBook(HttpSession session,Model model, long no) {
		
		Map<Object, Object> map = bookService.findByNo(no);
		
		return "board/viewbook";
		
	}
	
	//recentrlyadded 보여주기 기능
	@RequestMapping("/recentlyadded")
	public String viewRecentBook(Model model,HttpSession session) {
		List<HashMap<String, Object>>  list = bookService.findAllOrderByDate();
		String email=(String) session.getAttribute("authUser");
		List<Long> libraryList = libraryService.findByAuthUser(email);
		List<HashMap<String, Object>> lastlist=bookService.libraryCheck(list,libraryList);
		model.addAttribute("list", lastlist);
		return "board/recentlyadded";
	}
	
	//populartitles 보여주기 기능
	@RequestMapping("/popular")
	public String viewPopularBook(Model model, HttpSession session) {
		String email=(String) session.getAttribute("authUser");
		List<Long> libraryList = libraryService.findByAuthUser(email);
		//총 조회수 로 6개
		List<HashMap<String, Object>>  popularList = bookService.findAllOrderByCount();
		//한달동안 가장 많이 읽은순 
		List<HashMap<String, Object>>  spotlightList = bookService.findAllOrderBySpotlight();
		//최근 추가된 것 중 가장 많이 읽은순
		List<HashMap<String, Object>>  hotList = bookService.findAllOrderByHot();
		
		model.addAttribute( "spotlightList",bookService.libraryCheck(spotlightList,libraryList));
		model.addAttribute("popularList", bookService.libraryCheck(popularList,libraryList));
		model.addAttribute("hotList", bookService.libraryCheck(hotList,libraryList));
		return "board/populartitles";
	}
	
	
	//카테고리 별 책 보여주기 기능
	@RequestMapping("/category")
	public String viewPopularBook(Model model,String category) {
		model.addAttribute("category", category);
		return "board/categorybook";
	}
	
	
	
	
	
}
