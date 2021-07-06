package com.markany.blinkist.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.markany.blinkist.dao.BookRepository;
import com.markany.blinkist.vo.BookVo;

@Service("bookService")
public class BookService {

	@Autowired
	private BookRepository bookRepository;

	// 검색기능 제목,작가
	public List<HashMap<String, Object>> findByTitleAuthor(String keyword) {

		return bookRepository.selectByTitleAuthor(keyword);

	}

	
	// 책 검색
	public Map<Object, Object> findByNo(long no) {
		
		return bookRepository.selectByBook_no(no);
	}

	
	// 책을 book table에 저장
	public void insertBook(BookVo vo) {
		
		bookRepository.insertBook(vo);
		
	}

	
	// 책을 추가된 날짜순으로 정렬
	public List<HashMap<String, Object>> findAllOrderByDate(long userNo) {
		
		return bookRepository.selectAllOrderByDate(userNo);
		
	}

	
	// 총 조회수로 책 골르기
	public List<HashMap<String, Object>> findAllOrderByCount(long userNo) {
		
		return bookRepository.selectAllOrderByCount(userNo);
		
	}

	

	
	// spotlight순으로 책가져오기
	public List<HashMap<String, Object>> findAllOrderBySpotlight(long userNo) {
		
		return bookRepository.selectOrderBySpotlight(userNo);
		
	}

	
	// 최근 한달안에 추가된 책중 인기많은 거 6개
	public List<HashMap<String, Object>> findAllOrderByHot(long userNo) {
		
		
		return bookRepository.selectOrderByHot(userNo);
		
	}

	
	// 카테고리에 포함된 모든 책 타티틀, 책번호 , 작가이름 가져오기 ajax 통신용
	public List<HashMap<String, String>> findAllCategory(String category) {
		
		List<HashMap<String, String>> list = bookRepository.selectAllCategory(category);
		
		return list;
		
	}

	
	// 카테고리 trend 가져오기
	public List<HashMap<String, Object>> findAllCategoryOrderByCount(String category) {
		
		return bookRepository.selectAllCategoryOrderByCount(category);
		
	}
	

	// 해당 카테고리 최신 책 가져오기 6개
	public List<HashMap<String, Object>> findAllCategoryOrderByDate(String category) {
		
		return bookRepository.selectAllCategoryOrderByDate(category);
		
	}

	
	// 카테고리 책중 오디오가 포함된거 6개 고르기
	public List<HashMap<String, Object>> findAllCategoryIncludeAudio(String category) {
		
		return bookRepository.selectAllCategoryIncludeAudio(category);
		
	}

	
	// 제목순으로 정렬된 책을 ㄱ,ㄴ,ㄷ,0,1,2 등 시작 단어로 나눠주는 함수임
	public HashMap<String, List<String>> findAllCategoryToDictionary(String category) {
		
		String[] CHO = { "ㄱ", "ㄲ", "ㄴ", "ㄷ", "ㄸ", "ㄹ", "ㅁ", "ㅂ", "ㅃ", "ㅅ", "ㅆ", "ㅇ", "ㅈ", "ㅉ", "ㅊ", "ㅋ", "ㅌ", "ㅍ",
				"ㅎ" };

		List<HashMap<String, String>> list = this.findAllCategory(category);
		HashMap<String, List<String>> result = new HashMap<String, List<String>>();
		for (HashMap<String, String> map : list) {
			String title = map.get("title");
			String name = map.get("name");
			// 제목의 첫글자만 져옴
			String first = title.substring(0, 1);
			// System.out.println("FIRST= "+first);
			// 첫글자가 숫자이다
			if (first.matches("^[0-9]*$")) {
				// 맵의 키 값에 현재 키가 있으면
				if (result.containsKey("first")) {
					result.get("first").add(title + " by " + name);
				}

				// 맵의 키 값에 현재 키가 없으면
				else {
					List<String> tmplist = new ArrayList<String>();
					tmplist.add(title + " by " + name);
					result.put(first, tmplist);
				}

			}

			// 첫글자가 알파벳이다
			else if (first.matches("^[a-zA-Z]*$")) {
				first = first.toUpperCase();
				if (result.containsKey("first")) {
					result.get("first").add(title + " by " + name);
				} else {
					List<String> tmplist = new ArrayList<String>();
					tmplist.add(title + " by " + name);
					result.put(first, tmplist);
				}
			}

			// 첫 글자가 한글이다
			else if (first.matches("^[가-힣]*$")) {
				// 유니코드를 분석해 첫 글자의 초성을 가져온다
				char c = first.charAt(0);
				c = (char) (c - 0xAC00);
				char cho = (char) (c / 28 / 21);
				// System.out.println("KEY="+CHO[cho]);
				if (result.containsKey(CHO[cho])) {
					result.get(CHO[cho]).add(title + " by " + name);
				} else {
					List<String> tmplist = new ArrayList<String>();
					tmplist.add(title + " by " + name);
					result.put(CHO[cho], tmplist);
				}

			} else {
				System.out.println(first + "는 숫자/영어/한글이 아닌 문자임");
			}

		}
		return result;
	}

	
	// 작가이름, 책제목, 카테고리로 책 정보 가져오기
	public Map<Object, Object> findByTitleAuthorCategory(String info, String category) {
		
		String[] information = info.split(" by ");
		String title = information[0];
		String authorName = information[1];
		
		return bookRepository.selectByTitleAuthorCategory(title, authorName, category);
		
	}

	
	public List<HashMap<String, Object>> libraryCheckSearch(List<HashMap<String, Object>> list,List<HashMap<String, Object>> libraryList) {
		
		for (HashMap<String, Object> map : list) {
			
			long book_no = (long) map.get("book_no");

			boolean check = false;
			long progress = 0;
			for (HashMap<String, Object> libBook_no : libraryList) {
				if (book_no == (Long) libBook_no.get("book_no")) {
					progress = (Long) libBook_no.get("progress");
					check = true;
					break;
				}
			}
			if (check) {
				map.put("libCheck", true);
				map.put("progress", progress);
			} else {
				map.put("libCheck", false);
			}
		}
		return list;
	}

	
	// 라이브러리를 분석해 사용자가 다음으로 읽을책 3권 추천해주기
	public List<HashMap<Object, Object>> recommendBooks(long book_no, long userNo) {
		//System.out.println("로그 시작 :"+userNo);
		Long idx = 0l;
		Long checkIdx = 0l;
		Long user_no = null;
		HashMap<Long, Long> count = new HashMap<Long, Long>();
		List<HashMap<Object, Object>> logList = bookRepository.selectLibraryLog(book_no,userNo);
		for (HashMap<Object, Object> log : logList) {

			if (checkIdx == idx && user_no == (Long) log.get("user_no")) {
				if (count.containsKey((Long) log.get("book_no"))) {
					count.put((Long) log.get("book_no"), count.get((Long) log.get("book_no")) + 1);
					user_no=null;
				}
				else {
					count.put((Long) log.get("book_no"), 1l);
					user_no=null;
				}
			}

			if ((Long) log.get("book_no") == book_no) {
				user_no = (Long) log.get("user_no");
				checkIdx = idx+1;
			}
			idx += 1l;
		}
		List<Long> keySetList = new ArrayList<>(count.keySet());
		Collections.sort(keySetList, (o1, o2) -> (count.get(o2).compareTo(count.get(o1))));
		List<HashMap<Object, Object>> res = new ArrayList<HashMap<Object, Object>>();
		
		int cnt = 0;
		for (Long key : keySetList) {
			
			if (cnt == 3) {
				break;
			}
			for (HashMap<Object, Object> log : logList) {
				if ((Long) log.get("book_no") == key) {
					res.add(log);
					break;
				}
			}
			cnt++;
		}
		return res;
	}

	
	// 회원이 가장 많이 구독한 카테고리 찾기
	public String maxCategory(long user_no) {

		return bookRepository.maxCategory(user_no);

	}

	
	// 회원의 라이브러리에 없는 카테고리 트렌드 책 3개 가져오기
	public List<HashMap<Object, Object>> customtrandBook(String category, long user_no) {

		return bookRepository.customtrandBook(category, user_no);

	}
}
