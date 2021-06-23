package com.markany.blinkist.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.markany.blinkist.vo.BookVo;

public interface BookRepository {

	public List<HashMap<String, Object>>  selectByTitleAuthor(String keyword);// 검색기능 제목,작가

	Map<Object, Object> selectByBook_no(long no);// 책을 누르면 나오는 페이지에 필요한데이터를 추출
	
	public void insertBook(BookVo vo); //책을 book table에 저장

	List<HashMap<String, Object>> selectAllOrderByDate(long userNo);//모든책을 추가된 날짜기준으로 정렬해서 가져오기

	List<HashMap<String, Object>> selectAllOrderByCount(long userNo);//전체 조회수로 정렬

	List<HashMap<String, Object>> selectOrderBySpotlight(long userNo);//한달간 가장 많이 읽은 책 6개 고르기

	List<HashMap<String, Object>> selectOrderByHot(long userNo);//최근 한달안에 추가된 책중 인기 많은 거 고르기

	List<HashMap<String, String>> selectAllCategory(String category);//해당 카테고리에 포함되는 모든책 가져오기

	List<HashMap<String, Object>> selectAllCategoryOrderByCount(String category);//트랜드 블링크 책 가져오기

	List<HashMap<String, Object>> selectAllCategoryOrderByDate(String category);//카테고리 최신 추가된 책 6권

	List<HashMap<String, Object>> selectAllCategoryIncludeAudio(String category);//오디오가 포함된 책 가져오기

	Map<Object, Object> selectByTitleAuthorCategory(String title, String authorName, String category);//작가이름 책제목 카테고리로 가져오기

	public List<HashMap<Object, Object>> selectLibraryLog(String email);

	public String maxCategory(long user_no);//회원이 가장 많이 구독한 카테고리 찾기
	
	public List<HashMap<Object, Object>> customtrandBook(String category,long user_no);//회원의 라이브러리에 없는 카테고리 트렌드 책 3개 가져오기

}
