package com.markany.blinkist.jsoup;

import java.io.IOException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.context.support.GenericXmlApplicationContext;
import com.markany.blinkist.service.AuthorService;
import com.markany.blinkist.service.BookService;
import com.markany.blinkist.vo.AuthorVo;
import com.markany.blinkist.vo.BookVo;
import com.markany.blinkist.vo.ContentVo;

public class HumanitiesCrawling {

	private BookService bookService;

	public static void main(String args[]) {

		HumanitiesCrawling crawling = new HumanitiesCrawling();

		// GenericXmlApplicationContext ctx = new
		// GenericXmlApplicationContext("classpath*:applicationContext.xml");
		// crawling.bookService = (BookService)ctx.getBean("bookService");
		// crawling.contentService = (ContentService)ctx.getBean("contentService");

		System.out.println("START========================================================");
		crawling.Info();

	}

	public void Info() {

		try {

			// 1. 네이버도서 카테고리중 인문학에서 책의정보가 담긴 url을 가져온다.
			Document document1 = Jsoup
					.connect("https://book.naver.com/bestsell/bestseller_list.nhn?type=image&cp=yes24&cate=001001019")
					.get();
			Elements booklink = document1.select("ol>li");

			int count = 1;
			for (int i = 1; i < 25; i++) {

				if (i == 5 || i == 6 || i == 7 || i == 9 || i == 12 || i == 15 || i == 16 || i == 23 || i == 24)
					continue;

				System.out.println("카테고리: 인문학");

				System.out.println(count + "번");

				String title = booklink.get(i).select("a>img").attr("alt");// 책의 제목
				System.out.println("책의 제목: " + title);

				String name = booklink.get(i).select("dd").text();// 책의 작가
				System.out.println("책의 작가: " + name);

				String buy_link = booklink.get(i).select("a").attr("href"); // a태그안 책의 link추출
				System.out.println("책구매 링크: " + buy_link);

				String img_path = booklink.get(i).select("a>img").attr("src"); // 책의 이미지
				System.out.println("책의 이미지: " + img_path);

				Elements document2 = Jsoup.connect(buy_link).get().select(".book_info>h2");

				String subtitle = document2.select("span").text();// 책의 서브타이틀
				System.out.println("책의 서브타이틀: " + subtitle);

				Document document3 = Jsoup.connect(buy_link).get();

				Elements bookInfo = document3.select("#content");

				String introduce = bookInfo.select("#authorIntroContent>p").text();// 작가소개
				System.out.println("작가소개: " + introduce);

				String synopsis = bookInfo.select("#bookIntroContent>p").text();// 시놉시스
				System.out.println("시놉시스: " + synopsis);

				String content = null;
				if (i == 8 || i == 17 || i == 20) {

					content = bookInfo.select(".section").get(4).select("p").text();// 콘텐츠내용
					System.out.println("콘텐츠내용: " + content);

				} else {

					content = bookInfo.select(".section").get(5).select("p").text();// 콘텐츠내용
					System.out.println("콘텐츠내용: " + content);

				}

				// String chapter_title =
				// bookInfo.select("#tableOfContentsContent>p").text();//챕터
				Elements test = bookInfo.select("#tableOfContentsContent>p");

				String text = test.first().html();
				String[] textSplitResult = text.split("<br>");
				int cnt = 0;
				if (null != textSplitResult) {
					for (String j : textSplitResult) {
						if (j.length() < 2)
							continue;
						if (j.contains("<b>")) {
							//System.out.println("원본: "+j);
							if(j.contains("</b>"))
								System.out.println("<b>포함: " + j.substring(j.indexOf('>')+1, j.lastIndexOf('<')));
							else
								System.out.println("<b>포함: " + j.substring(j.indexOf('>')+1));
						}
						else
							System.out.println("줄" + cnt + ":" + j);

						cnt++;

					}
				}

				System.out.println("-----------------------------------------------------------");

				count++;

				// GenericXmlApplicationContext ctx = new
				// GenericXmlApplicationContext("classpath*:applicationContext.xml");
				// AuthorService authorservice = (AuthorService)ctx.getBean("authorService");

				/*
				 * 작가저장 AuthorVo authorvo = new AuthorVo();
				 * 
				 * if(authorservice.checkName(name)!=null) {//작가이름이 이미있다면
				 * 
				 * continue; }
				 * 
				 * authorvo.setName(name); //작가이름 authorvo.setIntroduce(introduce);//작가소개
				 * authorservice.insertAuthor(authorvo);
				 * 
				 * ctx.close();
				 */

				/*
				 * 책저장 BookVo bookvo = new BookVo(); bookvo.setTitle(title);
				 * bookvo.setBuyLink(buy_link); bookvo.setSynopsis(synopsis);
				 * bookvo.setCategory("인문학"); bookvo.setImg_path(img_path);
				 * 
				 * long author_no = authorservice.selectAuthor(name);
				 * bookvo.setAuthor_no(author_no);
				 * 
				 * bookvo.setSubtitle(subtitle);
				 * 
				 * bookService.insertBook(bookvo);
				 * 
				 */

				// 책의 콘텐츠저장
				// ContentVo contentvo = new ContentVo();

			}
		} catch (IOException e) {

			e.printStackTrace();

		}
	}

}