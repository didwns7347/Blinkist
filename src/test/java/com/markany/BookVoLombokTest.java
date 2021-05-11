package com.markany;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import com.markany.blinkist.vo.BookVo;

@SpringBootTest
public class BookVoLombokTest {
	@Test
	void lombokTest() {
		BookVo vo = new BookVo();
		vo.setTitle("hello");
		Assertions.assertThat(vo.getTitle()).isEqualTo("hello");
	}
	
	@Test
	void lombokTest01() {
		BookVo vo = new BookVo();
		vo.setTitle("hello");
		Assertions.assertThat(vo.getTitle()).isEqualTo("hello");
	}
}
