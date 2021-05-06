package com.example.search;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {

	 private int totalCount;//게시글의 총갯수
	 private int startPage; //페이지의 시작번호 본인은 페이지당 15개의 게시물로 했으므로 ex)1 16 31... 
	 private int endPage; //페이지의 끝번호 본인은 페이지당 15개의 게시물로 했으므로 ex)15,30,45...
	 private boolean prev;//이전페이지로 이동
	 private boolean next;//다음페이지로 이동
	 private int displayPageNum = 10; //페이지당 게시물 갯수
	 private listPage lp;
	 
	 
	 public int getTotalCount() {
		  return totalCount;
		 }
	 
	 
	 public void setTotalCount(int totalCount) {
		  this.totalCount = totalCount;
		  calcData();
		 }
	 
	 
	 public int getStartPage() {
		  return startPage;
		 }
	 
	 
	 public int getEndPage() {
		  return endPage;
		 }
	 
	 
	 public boolean isPrev() {
		  return prev;
		 }

	 
		 public boolean isNext() {
		  return next;
		 }
	 
		 
		 public int getDisplayPageNum() {
			  return displayPageNum;
			 }
		 
		 
	 public listPage getlistPage() {
		  return lp;
		 }
	 
	 
	 public void setlistPage(listPage lp) {
		  this.lp=lp;
		 }
		 
		

			
		 
	private void calcData() {
		
	  // 표시되는 페이지 번호중 마지막 번호	
      //페이지의 끝번호 본인은 페이지당 15개의 게시물로 했으므로 ex)15,30,45...
	  endPage = (int) (Math.ceil(lp.getPage() / (double)displayPageNum) * displayPageNum);
	  
	  //표시되는 페이지 번호 중 첫번째 번호
	//페이지의 시작번호 본인은 페이지당 15개의 게시물로 했으므로 ex)1 16 31... 
	  startPage = (endPage - displayPageNum) + 1;
	  
	  // 마지막 번호 재계산
	  int tempEndPage = (int) (Math.ceil(totalCount / (double)lp.getPerPageNum()));
	  if (endPage > tempEndPage)
	  {
	   endPage = tempEndPage;
	  }
	  
	  // 이전 
	  prev = startPage == 1 ? false : true;
	  // 다음
	  next = endPage * lp.getPerPageNum() >= totalCount ? false : true;
	 }
	 
	
	 public String makeQuery(int page)
	 {
	  UriComponents uriComponents =
	    UriComponentsBuilder.newInstance()
	    .queryParam("page", page)
	    .queryParam("perPageNum", lp.getPerPageNum())
	    .build();
	    
	  return uriComponents.toUriString();
	 }
	 
	 public String makeSearch(int page)//검색을 위한 코드
	 {
	   
	  UriComponents uriComponents =
	             UriComponentsBuilder.newInstance()
	             .queryParam("page", page)
	             .queryParam("perPageNum", lp.getPerPageNum())
	             .queryParam("searchType", ((Search)lp).getSearchType())
	             .queryParam("keyword", encoding(((Search)lp).getKeyword()))
	             .build(); 
	  return uriComponents.toUriString();  
	 }

	 private String encoding(String keyword) {
	  if(keyword == null || keyword.trim().length() == 0)
	  { return ""; }
	  
	  try {
	   return URLEncoder.encode(keyword, "UTF-8");//인코딩은 필수
	  } catch(UnsupportedEncodingException e)
	  { return ""; }
	 }
}