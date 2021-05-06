package com.example.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.Dao.StatisticsDao;
import com.example.vo.StatisticsVo;

@Service("statisticsService")
public class StatisticsService implements StatisticsDao{
	
	@Autowired
	private StatisticsDao statisticsDao;
	
	public void setStatisticsDao(StatisticsDao statisticsDao) {
		
		this.statisticsDao = statisticsDao;
		
	}
	
	
	@Override//카테고리별 입고량 넣기
	public void input(StatisticsVo vo) {
		
		statisticsDao.input(vo);
		
	}
	
	
	@Override//카테고리별 출고량 넣기
	public void export(StatisticsVo vo) {
		
		statisticsDao.export(vo);
		
	}; 
	
	
	@Override//카테고리별 반품량 넣기
	public void back(StatisticsVo vo) {
		
		statisticsDao.back(vo);
		
	}
	
	
	@Override//카테고리별 입고량(매입)통계
	public List<StatisticsVo> inputNum() {
		
		return statisticsDao.inputNum();
		
	}
	
	
	@Override//가테고리별 출고량(판매)통계
	public List<StatisticsVo> exportNum(){
		
		return statisticsDao.exportNum();
		
	}

	
	@Override //가테고리별 반품량통계
	public List<StatisticsVo> backNum(){
		
		return statisticsDao.backNum();
		
	}	
	
	
	@Override//상품전체삭제
	public void goodsAllDelete() {
		
		statisticsDao.goodsAllDelete();
		
	}
}
