package com.markany.blinkist.jsoup;

/*
 *  네이버뉴스 패션검색시 나오는뉴스  4개
         조건: 관련도순 
        업데이트: 하루에 결과가 몇번씩 바뀜
 */

import java.util.ArrayList;
import org.jsoup.nodes.Document;
import org.jsoup.Jsoup;
import org.jsoup.select.Elements;
import java.io.IOException;

 public class NaverNewsSearch{
	 public ArrayList<String> parsing() {
		 
		       ArrayList<String> parsinglist=null;

     try {
    	 
	           parsinglist=new ArrayList<String>();

		       Document doc = Jsoup.connect("https://search.naver.com/search.naver?where=news&sm=tab_jum&query=패션&sm=tab_srt&sort=0&photo=0&field=0&reporter_article=&pd=0&ds=&de=&docid=&nso=so%3Ar%2Cp%3Aall%2Ca%3Aall&mynews=0&refresh_start=0&related=0").get();//웹에서 내용을 가져온다.
		       Elements news = doc.select("ul.list_news>li.bx");

		       for (int i = 0; i < 4; i++) {

			      String title = news.get(i).select("li.bx>.news_wrap>.news_area>a").attr("title"); //a태그안 뉴스의 제목추출
			      parsinglist.add(title);
			
			      String link = news.get(i).select("a").attr("href"); //a태그안 뉴스의 link추출
			      parsinglist.add(link);

		      }   
	   }catch (IOException e) {
		
		    e.printStackTrace();
		    
	}
	return parsinglist;
    }
}