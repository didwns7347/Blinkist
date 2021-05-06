package com.example.vo;

import java.util.Date;
//이미지추가
/*
 * create table goods(

 *    number int not null primary key auto_increment,
 *    category varchar(20) not null,
 *    name varchar(20) not null,
 *    info varchar(20) not null,
 *    regtime date not null default now(),
 *    img varchar(100)
 *    );
 * 
 * 
 */


public class GoodsVo {
	
	private int number; //상품번호
	private String category;//카테고리
	private String name; //상품이름
	private String info; //상품설명
	private Date regtime; //등록시간
	private String img;//이미지
	
	
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public Date getRegtime() {
		return regtime;
	}
	public void setRegtime(Date regtime) {
		this.regtime = regtime;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	
	@Override
	public String toString() {
		return "GoodsVo [number=" + number + ", category=" + category + ", name=" + name + ", info=" + info
				+ ", regtime=" + regtime + ", img=" + img + "]";
	}
}