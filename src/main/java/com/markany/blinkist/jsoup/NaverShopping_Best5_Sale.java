package com.markany.blinkist.jsoup;

/*
 *  네이버쇼핑 패션의류 중 여성의류 판매 BEST5
        업데이트 주기: 하루마다 업데이트  최근 2일/7일 기준 네이버쇼핑을 통한 판매실적과 상품클릭수를 반영하여 업데이트
 */

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import java.io.IOException;
import java.util.ArrayList;

public class NaverShopping_Best5_Sale {
	 public ArrayList<String> parsing() {
		 
		 ArrayList<String> parsinglist=null;

	  try {

		         parsinglist=new ArrayList<String>();
	 	         Document doc = Jsoup.connect("https://search.shopping.naver.com/best100v2/detail.nhn?catId=50000167").get();//웹에서 내용을 가져온다.
		         Elements sale= doc.select("p.cont");

		        for(int i=0; i<5; i++) {
		      
			       String title = sale.get(i).select("a").attr("title");    	  
			        parsinglist.add(title);

		}
	  }catch (IOException e) {
		  
		e.printStackTrace();  
		
		}
		return parsinglist;
	}
}