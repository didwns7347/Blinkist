package com.markany.blinkist.vo;

import lombok.Data;

@Data
public class UserVo {
	private long user_no;
	private String email;
	private String password;
	private Grade grade=Grade.basic;
	private String reg_date;
	private String primium_date;
}
