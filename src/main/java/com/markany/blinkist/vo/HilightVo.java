package com.markany.blinkist.vo;

import java.util.Date;

import lombok.Data;

@Data
public class HilightVo {
	
	private long hilight_no;
	private long book_no;
	private String content;
	private long user_no;
	private String reg_date;
	private long content_no;
	
}
