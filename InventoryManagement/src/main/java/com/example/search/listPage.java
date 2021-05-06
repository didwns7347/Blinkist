package com.example.search;

public class listPage {//시작값과 끝값을 다루는 클래스

	private int page; //현재페이지
	private int perPageNum; //페이지당 게시물갯수
	private int rowStart;//시작값
	private int rowEnd;//끝값
	
	public listPage() {
		this.page = 1;
		this.perPageNum = 10;
	}
	
	
	public int getPage() {
		return page;
	}
	
	
	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	
	
	public int getPerPageNum() {
		return this.perPageNum;
	}
	
	
	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	
	
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}
	
	
	
	public int getRowStart() {
		rowStart = ((page - 1) * perPageNum) + 1;
		return rowStart;
	}
	
	public int getRowEnd() {
		rowEnd = rowStart + perPageNum - 1;
		return rowEnd;
	}

	@Override
	public String toString() {
		return "listPage [page=" + page + ", perPageNum=" + perPageNum + ", rowStart=" + rowStart + ", rowEnd=" + rowEnd
				+ "]";
	}
	
	
}