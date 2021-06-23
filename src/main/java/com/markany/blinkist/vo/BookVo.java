package com.markany.blinkist.vo;

import lombok.Data;


@Data
public class BookVo {
	
	private long book_no;
	private String category;
	private String title;
	private boolean audio_check;
	private String running_time;
	private String buyLink;
	private String synopsis;
	private String target;
	private String img_path;
	private long view;
	private String reg_date;
	private long author_no;
	private String subtitle;
	
}
