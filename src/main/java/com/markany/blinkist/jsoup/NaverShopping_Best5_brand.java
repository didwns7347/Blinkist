package com.markany.blinkist.jsoup;

/*
 * 네이버쇼핑 패션의류 중 여성의류 인기브랜드 BEST5
       업데이트 주기: 하루마다 업데이트  검색어의 클릭량을 반영한 순위
 */

import java.util.ArrayList;
import org.jsoup.nodes.Document;
import org.jsoup.Jsoup;
import org.jsoup.select.Elements;
import java.io.IOException;

public class NaverShopping_Best5_brand {
	 public ArrayList<String> parsing() {
		 
		    ArrayList<String> parsinglist=null;

      try {

	       parsinglist = new ArrayList<String>();
	 
	       Document doc = Jsoup.connect("https://search.shopping.naver.com/best100v2/detail/kwd.nhn?catId=50000167&kwdType=BRD").get();//웹에서 내용을 가져온다.
	       Elements brand = doc.select("span.txt"); //<span class="txt"></span>

	   for (int i = 0; i < 5; i++) {

		     String title = brand.get(i).select("a").attr("title"); //브랜드 이름을 a태그의 title에서 추출
		     parsinglist.add(title);

  }
    }catch (IOException e) {
    	
	e.printStackTrace();
	
    }
      return parsinglist;
    }
}