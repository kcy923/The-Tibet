package com.myspring.tibet.product.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myspring.tibet.product.dao.ProductDAO;
import com.myspring.tibet.product.vo.ProductVO;

@Service("productService")
public class ProductServiceImpl implements ProductService{
	@Inject
	private ProductDAO productDao;
	
	@Override
	public ProductVO productDetail(String product_num) throws Exception {
		return productDao.productDetail(product_num);
	}
	
	@Override
	public List<ProductVO> productColor(String product_num) throws Exception {
		return productDao.productColor(product_num);
	}	
	
	@Override
	public List<ProductVO> productSize(String product_num) throws Exception {
		return productDao.productSize(product_num);
	}
	
	@Override
	public List<ProductVO> SEARCH(String KeyWord) throws Exception {
		return productDao.SEARCH(KeyWord);
	}
	
	@Override
	public List<ProductVO> NEW(int value) throws Exception {
		System.out.println("Service : " +  value);	
		return productDao.NEW(value);
	}
	
	@Override
	public List<ProductVO> OUTER(int value) throws Exception {
		return productDao.OUTER(value);
	}
	
	@Override
	public List<ProductVO> TOP(int value) throws Exception {
		return productDao.TOP(value);
	}
	
	@Override
	public List<ProductVO> PANTS(int value) throws Exception {
		return productDao.PANTS(value);
	}
	
	@Override
	public List<ProductVO> BAG(int value) throws Exception {
		return productDao.BAG(value);
	}
	
	@Override
	public List<ProductVO> ACC(int value) throws Exception {
		return productDao.ACC(value);
	}
	
	@Override
	public List<ProductVO> SALE(int value) throws Exception {
		return productDao.SALE(value);
	}
	
	@Override
	public List<ProductVO> OUTER1(int value) throws Exception {
		return productDao.OUTER1(value);
	}

	@Override
	public List<ProductVO> OUTER2(int value) throws Exception {
		return productDao.OUTER2(value);
	}
	
	@Override
	public List<ProductVO> TOP1(int value) throws Exception {
		return productDao.TOP1(value);
	}
	
	@Override
	public List<ProductVO> TOP2(int value) throws Exception {
		return productDao.TOP2(value);
	}
	
	@Override
	public List<ProductVO> TOP3(int value) throws Exception {
		return productDao.TOP3(value);
	}
	
	@Override
	public List<ProductVO> TOP4(int value) throws Exception {
		return productDao.TOP4(value);
	}
	
	@Override
	public List<ProductVO> TOP5(int value) throws Exception {
		return productDao.TOP5(value);
	}
	
	@Override
	public List<ProductVO> PANTS1(int value) throws Exception {
		return productDao.PANTS1(value);
	}
	
	@Override
	public List<ProductVO> PANTS2(int value) throws Exception {
		return productDao.PANTS2(value);
	}
	
	@Override
	public List<ProductVO> BAG1(int value) throws Exception {
		return productDao.BAG1(value);
	}
	
	@Override
	public List<ProductVO> BAG2(int value) throws Exception {
		return productDao.BAG2(value);
	}
	
	@Override
	public List<ProductVO> BAG3(int value) throws Exception {
		return productDao.BAG3(value);
	}
	
	@Override
	public List<ProductVO> BAG4(int value) throws Exception {
		return productDao.BAG4(value);
	}

	@Override
	public List<ProductVO> ACC1(int value) throws Exception {
		return productDao.ACC1(value);
	}
	
	@Override
	public List<ProductVO> ACC2(int value) throws Exception {
		return productDao.ACC2(value);
	}
	
	@Override
	public List<ProductVO> ACC3(int value) throws Exception {
		return productDao.ACC3(value);
	}
	
	@Override
	public List<ProductVO> ACC4(int value) throws Exception {
		return productDao.ACC4(value);
	}
	
	
}
