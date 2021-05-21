package com.markany.blinkist.jsoup;

import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.context.support.GenericXmlApplicationContext;
import com.markany.blinkist.service.AuthorService;
import com.markany.blinkist.service.BookService;
import com.markany.blinkist.service.ContentService;
import com.markany.blinkist.vo.AuthorVo;
import com.markany.blinkist.vo.BookVo;
import com.markany.blinkist.vo.ContentVo;

public class TeenagerCrawling {
	
	private BookService bookService;
	private ContentService contentService;
	
	public static void main(String args[]) {
		
		TeenagerCrawling crawling = new TeenagerCrawling();
		
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath*:applicationContext.xml");
		crawling.bookService = (BookService)ctx.getBean("bookService");
		crawling.contentService = (ContentService)ctx.getBean("contentService");
		
		System.out.println("START========================================================");
		crawling.Info();
		
	}
		
	public void Info() {
		

		try {

			//1. 네이버도서 카테고리중 자기계빨에서 책의정보가 담긴 url을 가져온다.
			Document document1 = Jsoup.connect("https://book.naver.com/bestsell/bestseller_list.nhn?type=image&cp=yes24&cate=001001005").get();
			Elements booklink = document1.select("ol>li");

			int count = 1;
			for(int i=1; i<23; i++) {

				if(i==4 || i==6 || i==7 || i==9 || i==12 || i==14 || i==15 || i==16||i==21)
				  continue;

				System.out.println("카테고리: 청소년");

				System.out.println(count+"번");

				String title = booklink.get(i).select("a>img").attr("alt");//책의 제목
				System.out.println("책의 제목: "+title);

				String name = booklink.get(i).select("dd").text();//책의 작가
				System.out.println("책의 작가: "+name);

				String buy_link = booklink.get(i).select("a").attr("href"); //a태그안 책의 link추출
				System.out.println("책구매 링크: "+buy_link);

				String img_path = booklink.get(i).select("a>img").attr("src"); //책의 이미지
				System.out.println("책의 이미지: "+img_path);

				Elements document2 = Jsoup.connect(buy_link).get().select(".book_info>h2");

				String subtitle = document2.select("span").text();//책의 서브타이틀
				System.out.println("책의 서브타이틀: "+subtitle);

				Document document3 = Jsoup.connect(buy_link).get();

				Elements bookInfo = document3.select("#content");

				String introduce = bookInfo.select("#authorIntroContent>p").text();//작가소개
				System.out.println("작가소개: "+introduce);

				String synopsis = bookInfo.select("#bookIntroContent>p").text();//시놉시스
				System.out.println("시놉시스: "+synopsis);

				 //콘텐츠내용
				 ArrayList<String> content = new ArrayList<String>();
				if(i==10) {

					 String[] content_List = bookInfo.select(".section").get(5).select("p").first().html().split("<br>");

						int cnt=0;
						if (null != content_List) {
							for (String j : content_List) { 	 
								if(j.length()<2) //줄바꿈이 들어가면 xxxx
									continue;
								if (j.contains("<b>")) //<b>태그가 들어가면 xxxx
									if(j.contains("</b>"))
										content.add(j.substring(j.indexOf('>')+1, j.lastIndexOf('<')));
									else
										content.add(j.substring(j.indexOf('>')+1));
								else
									content.add(j);

								System.out.println("콘텐츠: "+content.get(cnt));
								cnt++;

							}
						}
					}
					else {

						String content_List = bookInfo.select(".section").get(4).select("p").first().html();

						String[] test = content_List.split("<br>");

						int cnt=0;
						if (null != test) {
							for (String j : test) {

								if(j.length()<2) //줄바꿈이 들어가면 xxxx
									continue;
								if (j.contains("<b>")) //<b>태그가 들어가면 xxxx
									if(j.contains("</b>"))
										content.add(j.substring(j.indexOf('>')+1, j.lastIndexOf('<')));
									else
										content.add(j.substring(j.indexOf('>')+1));
								else
									content.add(j);

								System.out.println("콘텐츠: "+content.get(cnt));
								cnt++;

							}
						}
					}

					//챕터
					ArrayList<String> chapter_title = new ArrayList<String>();

					String[] chapter_titleList = bookInfo.select("#tableOfContentsContent>p").first().html().split("<br>");

					if (null != chapter_titleList) {
						for (String j : chapter_titleList) {

							if(j.length()<2) //줄바꿈이 들어가면 xxxx
								continue;
							if (j.contains("<b>")) //<b>태그가 들어가면 xxxx
								if(j.contains("</b>"))
									chapter_title.add(j.substring(j.indexOf('>')+1, j.lastIndexOf('<')));
								else
									chapter_title.add(j.substring(j.indexOf('>')+1));
							else
								chapter_title.add(j);


						}
					}

					int lim=Math.min(chapter_title.size(), content.size());
					for(int k=0; k<lim; k++) {

						System.out.println("챕터: "+chapter_title.get(k));
					}

				System.out.println("-----------------------------------------------------------");

				count++;
				
				GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath*:applicationContext.xml");
				AuthorService authorservice = (AuthorService)ctx.getBean("authorService");

				/*작가저장
				AuthorVo vo = new AuthorVo();
				if(authorservice.checkName(name)!=null) {//작가이름이 이미있다면

						 continue;
				}

				 vo.setName(name); //작가이름
				 vo.setIntroduce(introduce);//작가소개
				 authorservice.insertAuthor(vo);

				 ctx.close();*/
				 
				
				//책저장
				BookVo bookvo = new BookVo();
				bookvo.setTitle(title);
				bookvo.setBuyLink(buy_link);
				bookvo.setSynopsis(synopsis);
				bookvo.setCategory("청소년");
				bookvo.setImg_path(img_path);
				
				long author_no = authorservice.selectAuthor(name);
				bookvo.setAuthor_no(author_no);
			
				bookvo.setSubtitle(subtitle);
				
				bookService.insertBook(bookvo);
				
				ContentVo contentvo = new ContentVo();

				for(int k=0; k<lim; k++) {

					contentvo.setChapter_title(chapter_title.get(k));
					contentvo.setContent(content.get(k));

					int maxNumber = contentService.selectMaxChapter_no();
					contentvo.setChapter_no(maxNumber+1);

					contentvo.setBook_no(count);

					contentService.insertContent(contentvo);
					
				}	
			}		  
		}catch(IOException e) {

			e.printStackTrace();

		}
	}

}
