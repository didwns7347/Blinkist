package com.markany;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
public class GetBeanTest {
	ApplicationContext ac= new GenericXmlApplicationContext("applicationContext.xml");
	@Test
	@DisplayName("모든 빈 출력하기")
	void xmlAppContext() {
		/*
		String[] beanDefinitionNames = ac.getBeanDefinitionNames();
		SqlSession sqlSession=ac.getBean(SqlSession.class);
		UserVo vo =sqlSession.selectOne("user.findByEmail", "hello");
		Assertions.assertThat(vo).isEqualTo(null);
        for(String beanDefinitionName:beanDefinitionNames){
            Object bean = ac.getBean(beanDefinitionName);
            System.out.println("name="+beanDefinitionName+" object="+bean);
        }
        */
		
	}
	
	@Test
	@DisplayName("자바 한글 포함 검사 테스트")
	void koreanJavaTest() {
		String str1 ="개나리";
		String str2 = "날나리";
		String sample= str1.substring(0,1);
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
		System.out.println("DADFDAF="+now);
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		int hour = cal.get(Calendar.HOUR_OF_DAY);
		int min = cal.get(Calendar.MINUTE);
		int sec = cal.get(Calendar.SECOND);
		System.out.println("현재 시각은 " + year + "년도 " + month + "월 " + day + "일 " + hour + "시 " + min + "분 " + sec + "초입니다.");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String datestr = sdf.format(cal.getTime());
	
		Date date=sdf.parse(datestr);
		System.out.println(datestr);
		System.out.println(date);
	}

}
