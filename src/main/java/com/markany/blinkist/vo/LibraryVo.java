package com.markany.blinkist.vo;

import lombok.Data;

@Data
public class LibraryVo {
	
	private long user_no;
	private long book_no;
	private boolean fin_check;
	private String reg_date;
	private long progress;
	
}
