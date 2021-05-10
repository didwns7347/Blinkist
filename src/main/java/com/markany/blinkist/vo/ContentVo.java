package com.markany.blinkist.vo;

import lombok.Data;

@Data
public class ContentVo {
	private long content_no;
	private String chapter_title;
	private String content;
	private int chapter_no;
	private String voice_path;
	private long book_no;
}
