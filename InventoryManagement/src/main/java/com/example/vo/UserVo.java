package com.example.vo;

/*
 * create table user(
 *       name varchar(50) not null,
 *       id varchar(50) not null primary key,
 *       password varchar(20) not null,
 *   );
 * 
 */

public class UserVo {

	private String name; //이름
	private String id; //아이디
	private String password; //패스워드


	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	@Override
	public String toString() {
		return "UserVo [name=" + name + ", id=" + id + ", password=" + password + "]";
	}
}