package com.myspring.tibet.admin.product.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.myspring.tibet.product.vo.ProductVO;

@Repository("adminProductDAO")
public class AdminProductDAOImpl implements AdminProductDAO{
	@Inject
	private SqlSession sqlSession;
	
	// 상품 상세
	@Override
	public ProductVO productDetail(String product_num) {
		return sqlSession.selectOne("mappers.admin.product.productDetail", product_num);
	}
	
	// 상품 목록
	@Override
	public List<ProductVO> productlistName(int main_category_num) throws Exception {
		return sqlSession.selectList("mappers.admin.product.productlistName", main_category_num);
	}
}