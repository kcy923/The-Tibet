package com.myspring.tibet.admin.product.service;

import java.util.List;

import com.myspring.tibet.product.vo.ProductVO;

public interface AdminProductService {
	// 상품 상세
	public ProductVO productDetail(String product_num) throws Exception ;
	// 상품 목록
	public List<ProductVO> productListName(int main_category_num) throws Exception;
}
