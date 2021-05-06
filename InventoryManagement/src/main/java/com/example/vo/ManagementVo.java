package com.example.vo;

import java.util.Date;

/*create table management(
 * 
		category varchar(20) not null,
		number int not null primary key auto_increment,
		name varchar(20) not null,
		input int default 0,
		input_date date  DEFAULT CURRENT_TIMESTAMP,
		export int default 0,
		export_date date ,
		supplier varchar(20),
		back int default 0,
		back_date date ,
		back_info text
		
		);
*/


/******* 입고 출고 반품을 관리하는 테이블 *******/
public class ManagementVo {
	
	private int number; //번호
	private String category;//카테고리
	private String name; //상품이름
	private int input ;//입고갯수
	private Date input_date;//입고날짜
	private int export; //출고갯수
	private Date export_date;//출고날짜
	private String supplier; //납품업체
	private int back; //반품
	private Date back_date;//반품날짜
	private String back_info; //반품사유
	
	
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
	public int getInput() {
		return input;
	}
	public void setInput(int input) {
		this.input = input;
	}
	public Date getInput_date() {
		return input_date;
	}
	public void setInput_date(Date input_date) {
		this.input_date = input_date;
	}
	public int getExport() {
		return export;
	}
	public void setExport(int export) {
		this.export = export;
	}
	public Date getExport_date() {
		return export_date;
	}
	public void setExport_date(Date export_date) {
		this.export_date = export_date;
	}
	public String getSupplier() {
		return supplier;
	}
	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}
	public int getBack() {
		return back;
	}
	public void setBack(int back) {
		this.back = back;
	}
	public Date getBack_date() {
		return back_date;
	}
	public void setBack_date(Date back_date) {
		this.back_date = back_date;
	}
	public String getBack_info() {
		return back_info;
	}
	public void setBack_info(String back_info) {
		this.back_info = back_info;
	}
	
	
	@Override
	public String toString() {
		return "ManagementVo [number=" + number + ", category=" + category + ", name=" + name + ", input=" + input
				+ ", input_date=" + input_date + ", export=" + export + ", export_date=" + export_date + ", supplier="
				+ supplier + ", back=" + back + ", back_date=" + back_date + ", back_info=" + back_info + "]";
	}
}