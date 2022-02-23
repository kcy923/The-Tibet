package com.myspring.tibet.admin.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.tibet.admin.product.dao.AdminProductDAO;
import com.myspring.tibet.product.vo.ProductVO;

@Service("adminProductService")
public class AdminProductServiceImpl implements AdminProductService{
	@Autowired
	private AdminProductDAO adminProductDAO;
	
	// 상품 목록
	@Override
	public List<ProductVO> productListName(int main_category_num) throws Exception {
		return adminProductDAO.productlistName(main_category_num);
	}
	
	// 상품 상세
	@Override
	public ProductVO productDetail(String product_num) throws Exception {
		return adminProductDAO.productDetail(product_num);
	}
}
