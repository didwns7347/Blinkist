package com.markany;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.markany.blinkist.service.BookService;
import com.markany.blinkist.service.ContentService;
import com.markany.blinkist.service.UserService;
import com.markany.blinkist.vo.ContentVo;
import com.markany.blinkist.vo.Grade;
import com.markany.blinkist.vo.UserVo;

public class GetBeanTest {
	ApplicationContext ac = new GenericXmlApplicationContext("applicationContext.xml");

	@Test
	@DisplayName("모든 빈 출력하기")
	void xmlAppContext() {
		/*
		 * String[] beanDefinitionNames = ac.getBeanDefinitionNames(); SqlSession
		 * sqlSession=ac.getBean(SqlSession.class); UserVo vo
		 * =sqlSession.selectOne("user.findByEmail", "hello");
		 * Assertions.assertThat(vo).isEqualTo(null); for(String
		 * beanDefinitionName:beanDefinitionNames){ Object bean =
		 * ac.getBean(beanDefinitionName);
		 * System.out.println("name="+beanDefinitionName+" object="+bean); }
		 */

	}

	@Test
	@DisplayName("자바 한글 포함 검사 테스트")
	void koreanJavaTest() {
		String str1 = "개나리";
		String str2 = "날나리";
		String sample = str1.substring(0, 1);
		System.out.println(sample);
		System.out.println(sample.matches("[가-깋]"));
		System.out.println(str2.matches("[가-깋]"));
		System.out.println(str2.matches("[나-닣]"));
		System.out.println(str1.matches("[나-닣]"));
		char c = "개".charAt(0);
		System.out.println(c);
	}

	@Test
	@DisplayName("자바 날짜 테스트")
	void dateTest() throws ParseException {
		Calendar cal = Calendar.getInstance();
		System.out.println(cal);
		Date now = new Date();
		System.out.println("DADFDAF=" + now);
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		int hour = cal.get(Calendar.HOUR_OF_DAY);
		int min = cal.get(Calendar.MINUTE);
		int sec = cal.get(Calendar.SECOND);
		System.out.println(
				"현재 시각은 " + year + "년도 " + month + "월 " + day + "일 " + hour + "시 " + min + "분 " + sec + "초입니다.");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String datestr = sdf.format(cal.getTime());

		Date date = sdf.parse(datestr);
		System.out.println(datestr);
		System.out.println(date);
	}

	@Test
	@DisplayName("비밀번호 비교하기")
	void pwTest() {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		UserService us = ac.getBean(UserService.class);
		UserVo vo = us.findByEmail("15gg@test.com");
		org.junit.Assert.assertTrue(passwordEncoder.matches("1234", vo.getPassword()));
	}

	@Test
	@DisplayName("content DB Test")
	void contentDBTest() {
		ContentService cs = ac.getBean(ContentService.class);
		cs.selectContent(83);
		List<ContentVo> list = cs.selectContent(83);
		for (ContentVo vo : list) {
			// System.out.println(vo.getContent().replaceAll("\n","<br/>"));
			vo.setContent(vo.getContent().replaceAll("\n", "<br/>"));
			System.out.println(vo.toString());
		}
	}

	@Test
	@DisplayName("primium date test")
	void primiumDateCheckTest() throws ParseException {
		UserService userService = ac.getBean(UserService.class);
		UserVo user = userService.findByEmail("0604test@test.com");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date Primium_date = sdf.parse(user.getPrimium_date());
		Date finish_date = sdf.parse(user.getFinish_date());
		Date now = new Date();
		System.out.println("now:" + now);
		System.out.println("fin:" + finish_date);
		System.out.println(now.before(finish_date));
		if (now.before(finish_date)) {
			System.out.println("버그버그");
		} else {

		}
	}

	@Test
	@DisplayName("recentlyAddedTest")
	void viewRecentBookMapTest() {
		BookService bookService = ac.getBean(BookService.class);
		List<HashMap<String, Object>> myList = bookService.findAllOrderByDate(14);
		//HashMap<String, Object> tmp = myList.get(0);
		
		for (HashMap<String, Object> tmp : myList) {
			Iterator<String> iter = tmp.keySet().iterator();
			System.out.println("---------------------------------------------------------");
			while (iter.hasNext()) {
				String key = (String) iter.next();
				System.out.println("키값:" + key);
				System.out.println("value:" + tmp.get(key));
			}
		}

	}
	
	@Test
	@DisplayName("popularListAllTest")
	void popularListTest() {
		BookService bookService = ac.getBean(BookService.class);
		List<HashMap<String, Object>> myList = bookService.findAllOrderByCount(17);
		//HashMap<String, Object> tmp = myList.get(0);
		
		for (HashMap<String, Object> tmp : myList) {
			Iterator<String> iter = tmp.keySet().iterator();
			System.out.println("---------------------------------------------------------");
			while (iter.hasNext()) {
				String key = (String) iter.next();
				System.out.println("키값:" + key);
				System.out.println("value:" + tmp.get(key));
			}
		}

	}
	
	@Test
	@DisplayName("popularListAllTest")
	void popularHotListTest() {
		BookService bookService = ac.getBean(BookService.class);
		List<HashMap<String, Object>> myList = bookService.findAllOrderByHot(17);
		//HashMap<String, Object> tmp = myList.get(0);
		
		for (HashMap<String, Object> tmp : myList) {
			Iterator<String> iter = tmp.keySet().iterator();
			System.out.println("---------------------------------------------------------");
			while (iter.hasNext()) {
				String key = (String) iter.next();
				System.out.println("키값:" + key);
				System.out.println("value:" + tmp.get(key));
			}
		}

	}

}
