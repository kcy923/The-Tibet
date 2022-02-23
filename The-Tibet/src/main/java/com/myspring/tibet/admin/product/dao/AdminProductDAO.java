package com.myspring.tibet.admin.product.dao;

import java.util.List;

import com.myspring.tibet.product.vo.ProductVO;

public interface AdminProductDAO {
	// 상품 상세
	public ProductVO productDetail(String product_num);
	// 상품 목록
	public List<ProductVO> productlistName(int main_category_num) throws Exception;
}
