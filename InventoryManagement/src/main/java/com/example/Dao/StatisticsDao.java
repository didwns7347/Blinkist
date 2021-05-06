package com.example.Dao;

import java.util.List;


import com.example.vo.StatisticsVo;

public interface StatisticsDao {

	public void input(StatisticsVo vo); //카테고리별 입고량 넣기
	
	public void export(StatisticsVo vo); //카테고리별 출고량 넣기
	
	public void back(StatisticsVo vo); //카테고리별 반품량 넣기
	
	public List<StatisticsVo> inputNum();// 카테고리별 입고량(매입)통계
	
	public List<StatisticsVo> exportNum(); //가테고리별 출고량(판매)통계
	
	public List<StatisticsVo> backNum(); //가테고리별 반품량통계
	
	public void goodsAllDelete();//상품전체삭제
	
	
}
