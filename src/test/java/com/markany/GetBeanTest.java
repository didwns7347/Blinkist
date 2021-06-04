package com.markany;
import org.apache.ibatis.session.SqlSession;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.markany.blinkist.vo.Grade;
import com.markany.blinkist.vo.UserVo;
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
	@DisplayName("ENUM STRING TEST")
	void enumToString() {
		System.out.println(Grade.basic.toString());
	}

}
