package com.example.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.Dao.ManagementDao;
import com.example.vo.ManagementVo;

@Service("managementService")
public class ManagementService implements ManagementDao{

	@Autowired
	private ManagementDao managementDao;
	
	public void setManagementDao(ManagementDao managementDao) {
		
		this.managementDao = managementDao;
		
	}
	
	@Override//상품입고
	public void goodsImport(ManagementVo vo) {
		
		managementDao.goodsImport(vo);
		
	}
	
	@Override//상품정보
	public List<ManagementVo> goodsInfo() {
		
		return managementDao.goodsInfo();
		
	}
	
	
	@Override//상품출고
	public void goodsExport(ManagementVo vo) {
		
		managementDao.goodsExport(vo);
		
	}
	
	
	@Override//상품반품
	public void goodsBack(ManagementVo vo) {
		
		managementDao.goodsBack(vo);
		
	}
	
	
	@Override//상품정보수정
	public void goodsUpdate(ManagementVo vo) {
		
		managementDao.goodsUpdate(vo);
		
	}
	
	
	@Override//상품삭제
	public void goodsDelete(int number) {
		
		managementDao.goodsDelete(number);
		
	}	
	
	
	@Override//상품전체삭제
	public void goodsAllDelete() {
		
		managementDao.goodsAllDelete();
		
	}
}
