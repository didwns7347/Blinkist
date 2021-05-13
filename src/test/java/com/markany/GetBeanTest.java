package com.markany;
import org.apache.ibatis.session.SqlSession;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.markany.blinkist.vo.UserVo;
public class GetBeanTest {
	ApplicationContext ac= new GenericXmlApplicationContext("applicationContext.xml");
	@Test
	@DisplayName("모든 빈 출력하기")
	void xmlAppContext() {
		
		String[] beanDefinitionNames = ac.getBeanDefinitionNames();
		SqlSession sqlSession=ac.getBean(SqlSession.class);
		UserVo vo =sqlSession.selectOne("user.findByEmail", "hello");
		Assertions.assertThat(vo).isEqualTo(null);
        for(String beanDefinitionName:beanDefinitionNames){
            Object bean = ac.getBean(beanDefinitionName);
            System.out.println("name="+beanDefinitionName+" object="+bean);
        }
		
	}

}
