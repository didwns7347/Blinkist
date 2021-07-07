package com.markany.blinkist.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import com.markany.blinkist.service.BookService;
import com.markany.blinkist.service.LibraryService;
import com.markany.blinkist.service.UserService;
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

	
	// 책 검색기능 제목,작가
	@RequestMapping("/search")
	public String search(Model model, String keyword, Principal authUser) {
		
		List<HashMap<String, Object>> list = bookService.findByTitleAuthor(keyword);
		
		String email = authUser.getName();
		
		List<HashMap<String,Object>> libraryList = libraryService.findNoProgressByAuthUser(email);
		List<HashMap<String, Object>> lastlist = bookService.libraryCheckSearch(list, libraryList);

		model.addAttribute("list", lastlist);
		model.addAttribute("keyword", keyword);
		
		return "board/searchresult";
		
	}
	
	
	// recentrlyadded 보여주기 기능
	@RequestMapping("/recentlyadded")
	public String viewRecentBook(Model model, Principal authUser) {
		String email = authUser.getName();
		UserVo userVo = userService.findByEmail(email);
		System.out.println(userVo.toString());
		List<HashMap<String, Object>> list = bookService.findAllOrderByDate(userVo.getUser_no());
		
		model.addAttribute("list", list);
		model.addAttribute("userNo",userVo.getUser_no());
		return "board/recentlyadded";
		
	}

	// populartitles 보여주기 기능
	@RequestMapping("/popular")
	public String viewPopularBook(Model model, Principal authUser) {
		
		String email = authUser.getName();
		UserVo uservo = userService.findByEmail(email);
		
		// 총 조회수 로 6개
		List<HashMap<String, Object>> popularList = bookService.findAllOrderByCount(uservo.getUser_no());
		
		// 한달동안 가장 많이 읽은순
		List<HashMap<String, Object>> spotlightList = bookService.findAllOrderBySpotlight(uservo.getUser_no());
		
		// 최근 추가된 것 중 가장 많이 읽은순
		List<HashMap<String, Object>> hotList = bookService.findAllOrderByHot(uservo.getUser_no());

		model.addAttribute("spotlightList",spotlightList);
		model.addAttribute("popularList",popularList);
		model.addAttribute("hotList",hotList);
		model.addAttribute("userNo",uservo.getUser_no());
		
		return "board/populartitles";
		
	}

	
	// 카테고리 별 책 보여주기 기능
	@RequestMapping("/category")
	public String viewPopularBook(Model model, String category, Principal authUser) {
		
		String email = authUser.getName();
		
		List<HashMap<String, Object>> libraryList = libraryService.findNoProgressByAuthUser(email);
		
		//트랜드 
		List<HashMap<String, Object>> trendList = bookService.findAllCategoryOrderByCount(category);
		
		//최신
		List<HashMap<String, Object>> recentList = bookService.findAllCategoryOrderByDate(category);
		
		//오디오 포함된 
		List<HashMap<String, Object>> audioList = bookService.findAllCategoryIncludeAudio(category);
		
		
		model.addAttribute("trendList",bookService.libraryCheckSearch(trendList, libraryList));
		model.addAttribute("recentList",bookService.libraryCheckSearch(recentList, libraryList));
		model.addAttribute("audioList",bookService.libraryCheckSearch(audioList, libraryList));
		model.addAttribute("category", category);
		
		return "board/categorybook";
		
	}
	
	
	//해당 카테고리 모든 책 보여주는 페이지로 이동하는 ...
	@RequestMapping("/allcategorybook")
	public String viewAllCategoryBook(Model model, String category) {
		
		HashMap<String,List<String>> map=bookService.findAllCategoryToDictionary(category);
		
		model.addAttribute("map", map);
		model.addAttribute("category", category);
		
		return "board/viewcategoryallbook";
		
	}
	
	
	//책 보여주기기능 -> Lead More
	@RequestMapping("/viewbookinfo")
	public String viewBook(Model model, String info, String category,Principal authUser) {
		
		// 회원의 이메일정보가져오기
		String email = authUser.getName();

		// 이메일을 토대로 회원정보가져오기
		UserVo userVo = userService.findByEmail(email);
		
		Map<Object,Object> map=bookService.findByTitleAuthorCategory(info,category);
		List<HashMap<Object,Object>> recommendBooksByLog=bookService.recommendBooks((Long)map.get("book_no"),userVo.getUser_no());
		List<HashMap<Object, Object>> trandBook = bookService.customtrandBook(category, userVo.getUser_no());
		boolean libCheck=libraryService.libCheck((Long)map.get("book_no"),userVo.getUser_no());
		System.out.println("lib===="+libCheck);
		model.addAttribute("map",map );
		model.addAttribute("libCheck",libCheck );
		model.addAttribute("recommendBooksByLog",recommendBooksByLog);
		model.addAttribute("trandBook", trandBook);
		return "board/viewbook";
		
	}
	

	// 책 보여주기 기능(상세페이지)
	@RequestMapping("/viewbook")
	public String viewBook( Model model, long no,Principal authUser) {
		
		// 회원의 이메일정보가져오기
		String email = authUser.getName();

		// 이메일을 토대로 회원정보가져오기
		UserVo userVo = userService.findByEmail(email);
		
		// 카테고리 가져오기
		String category = bookService.maxCategory(userVo.getUser_no());

		Map<Object, Object> map = bookService.findByNo(no);
		
		List<HashMap<Object,Object>> recommendBooksByLog=bookService.recommendBooks(no,userVo.getUser_no());
		List<HashMap<Object, Object>> trandBook = bookService.customtrandBook(category, userVo.getUser_no());
		boolean libCheck=libraryService.libCheck((Long)map.get("book_no"),userVo.getUser_no());
		
		
		System.out.println("lib===="+libCheck);
		model.addAttribute("map",map );
		model.addAttribute("libCheck",libCheck );
		model.addAttribute("recommendBooksByLog",recommendBooksByLog);
		model.addAttribute("trandBook", trandBook);
		
		return "board/viewbook";

	}
	
	
	//카테고리 페이지 검색 기능 ajax 디비에 접근
	@RequestMapping(value = "/json", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String json(Locale locale, Model model, String category) {
		List<HashMap<String,String>> array=bookService.findAllCategory(category);
		Gson gson = new Gson();
		return gson.toJson(array); 

	}
}