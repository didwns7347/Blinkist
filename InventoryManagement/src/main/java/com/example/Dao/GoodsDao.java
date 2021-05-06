package com.example.Dao;


import java.util.List;
import org.springframework.stereotype.Repository;
import com.example.search.Search;
import com.example.vo.GoodsVo;


@Repository
public interface GoodsDao {
	
	public void goodsImport(GoodsVo vo); //상품입고
	
	public List<GoodsVo> goodsList(Search se); //게시물목록
	
	public int listCount(Search se); //총상품갯수
	
	public List<GoodsVo> goodsInfo(int number); //상품정보와 이미지가져오기
	
	public void goodsUpdate(GoodsVo vo); // 상품수정
	
	public void goodsDelete(int number);//상품삭제
	
	public void goodsAllDelete();//상품전체삭제
	
}