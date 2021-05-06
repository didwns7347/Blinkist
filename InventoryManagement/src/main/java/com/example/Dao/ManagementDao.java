package com.example.Dao;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.example.vo.ManagementVo;


@Repository
public interface ManagementDao {

	public void goodsImport(ManagementVo vo); //상품입고
	
	public List<ManagementVo> goodsInfo(); //상품의 정보
	
	public void goodsExport(ManagementVo vo);//상품출고
	
	public void goodsBack(ManagementVo vo);//상품반품
	
	public void goodsUpdate(ManagementVo vo);//상품정보수정
	
	public void goodsDelete(int number);//상품삭제
	
	public void goodsAllDelete();//상품전체삭제
	

}
