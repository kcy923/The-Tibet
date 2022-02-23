package com.myspring.tibet.product.dao;

import java.util.List;

import com.myspring.tibet.product.vo.ProductVO;


public interface ProductDAO {
	public ProductVO productDetail(String product_num) throws Exception;
	public List<ProductVO> productColor(String product_num);
	public List<ProductVO> productSize(String product_num);
	public List<ProductVO> OUTER(int value) throws Exception;
	public List<ProductVO> TOP(int value) throws Exception;
	public List<ProductVO> PANTS(int value) throws Exception;
	public List<ProductVO> BAG(int value) throws Exception;
	public List<ProductVO> ACC(int value) throws Exception;
	public List<ProductVO> SALE(int value) throws Exception;
	public List<ProductVO> OUTER1(int value) throws Exception;
	public List<ProductVO> OUTER2(int value) throws Exception;
	public List<ProductVO> TOP1(int value) throws Exception;
	public List<ProductVO> TOP2(int value) throws Exception;
	public List<ProductVO> TOP3(int value) throws Exception;
	public List<ProductVO> TOP4(int value) throws Exception;
	public List<ProductVO> TOP5(int value) throws Exception;
	public List<ProductVO> PANTS1(int value) throws Exception;
	public List<ProductVO> PANTS2(int value) throws Exception;
	public List<ProductVO> BAG1(int value) throws Exception;
	public List<ProductVO> BAG2(int value) throws Exception;
	public List<ProductVO> BAG3(int value) throws Exception;
	public List<ProductVO> BAG4(int value) throws Exception;
	public List<ProductVO> ACC1(int value) throws Exception;
	public List<ProductVO> ACC2(int value) throws Exception;
	public List<ProductVO> ACC3(int value) throws Exception;
	public List<ProductVO> ACC4(int value) throws Exception;
	public List<ProductVO> NEW(int value) throws Exception;
	public List<ProductVO> SEARCH(String KeyWord) throws Exception;
}
