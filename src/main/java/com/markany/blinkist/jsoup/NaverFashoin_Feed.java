package com.markany.blinkist.jsoup;

/*
 * 네이버 오늘읽을만한글 패션뷰티 카테고리
    업데이트: 하루
    Feed는 네개 
 */

import java.util.ArrayList;
import org.jsoup.nodes.Document;
import org.jsoup.Jsoup;
import org.jsoup.select.Elements;
import java.io.IOException;


public class NaverFashoin_Feed{
       public ArrayList<String> parsing() {
		 
	            ArrayList<String> parsinglist=null;

       try {

    	        parsinglist = new ArrayList<String>();
    	 
			    Document doc = Jsoup.connect("https://www.naver.com/nvhaproxy/v1/panels/BEAUTY/html").get();//웹에서 내용을 가져온다.
			    Elements feeds = doc.select(".theme_item"); // 네개태그 <li class="theme_item"></li>
		
		        for (int i = 0; i < 4; i++) {

				       String title = feeds.get(i).select("a>.title").text(); // 피드의 제목은 a태그안 <strong></strong>에 있음
				       parsinglist.add(title);
				
				       String link = feeds.get(i).select("a").attr("href"); // 피드의 링크 추출하기
				       parsinglist.add(link);

			     }
		  }catch (IOException e) {
			
			    e.printStackTrace();
		  }

		      return parsinglist;
	}
}