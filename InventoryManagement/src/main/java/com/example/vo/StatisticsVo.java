package com.example.vo;

/*
 * create table statistics(
 *    
 *    number int not null primary key auto_increment,
 *    category varchar(20) not null,
 *    input int(11) default 0,
 *    export int(11) default 0,
 *    back int(11) default 0
 *    
 *    );
 * 
 */

public class StatisticsVo {
	
	private int number;//번호
	private String category;//카테고리
	private int input;//입고량
	private int export; //매출량
	private int back; //반품량
	
	
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
	public int getInput() {
		return input;
	}
	public void setInput(int input) {
		this.input = input;
	}
	public int getExport() {
		return export;
	}
	public void setExport(int export) {
		this.export = export;
	}
	public int getBack() {
		return back;
	}
	public void setBack(int back) {
		this.back = back;
	}
}