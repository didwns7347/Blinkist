package com.example.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.Dao.GoodsDao;
import com.example.search.Search;
import com.example.vo.GoodsVo;

@Service("goodsService")
public class GoodsService implements GoodsDao {
	
	@Autowired
	private GoodsDao goodsDao;
	
	public void setGoodsDao(GoodsDao goodsDao) {
	
	this.goodsDao = goodsDao;

	}
	
	
	@Override//상품입고
	public void goodsImport(GoodsVo vo) {
		
		goodsDao.goodsImport(vo);
		
	}
	
	
	@Override//상품리스트
	public List<GoodsVo> goodsList(Search se){
		
		return goodsDao.goodsList(se);
		
	}
	
	
	@Override//총상품갯수
	public int listCount(Search se) {
		
		return goodsDao.listCount(se);
		
	}
	
	
	@Override//상품정보와 이미지가져오기
	public List<GoodsVo> goodsInfo(int number) {
		
		return goodsDao.goodsInfo(number);
		
	}
	
	
	@Override//상품수정
	public void goodsUpdate(GoodsVo vo) {
		
		goodsDao.goodsUpdate(vo);
		
	}
	
	
	@Override//상품삭제
	public void goodsDelete(int number) {
		
		goodsDao.goodsDelete(number);
		
	}
	
	
	@Override//상품전체삭제
	public void goodsAllDelete() {
		
		goodsDao.goodsAllDelete();
		
	}
}