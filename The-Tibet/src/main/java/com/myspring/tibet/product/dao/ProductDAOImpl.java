package com.myspring.tibet.product.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.myspring.tibet.product.vo.ProductVO;

@Repository("productDAO")
public class ProductDAOImpl implements ProductDAO{
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "mappers.product";
	
	@Override
	public ProductVO productDetail(String product_num) {
		return sqlSession.selectOne(namespace + ".productDetail", product_num);
	}
	
	@Override
	public List<ProductVO> productColor(String product_num) {
		return sqlSession.selectList(namespace + ".productColor", product_num);
	}
	
	@Override
	public List<ProductVO> productSize(String product_num) {
		return sqlSession.selectList(namespace + ".productSize", product_num);
	}
	
	@Override
	public List<ProductVO> SEARCH(String KeyWord) throws Exception{
		return sqlSession.selectList(namespace + ".SEARCH", KeyWord);
	}
	
	@Override
	public List<ProductVO> NEW(int value) throws Exception {
		System.out.println("dao : " +  value);		
		return sqlSession.selectList(namespace + ".NEW",value);
	}
	
	@Override
	public List<ProductVO> OUTER(int value) throws Exception {
		return sqlSession.selectList(namespace + ".OUTER", value);
	}
	
	@Override
	public List<ProductVO> TOP(int value) throws Exception {
		return sqlSession.selectList(namespace + ".TOP", value);
	}
	
	@Override
	public List<ProductVO> PANTS(int value) throws Exception {
		return sqlSession.selectList(namespace + ".PANTS", value);
	}
	
	@Override
	public List<ProductVO> BAG(int value) throws Exception {
		return sqlSession.selectList(namespace + ".BAG", value);
	}
	
	@Override
	public List<ProductVO> ACC(int value) throws Exception {
		return sqlSession.selectList(namespace + ".ACC", value);
	}
	
	@Override
	public List<ProductVO> SALE(int value) throws Exception {
		return sqlSession.selectList(namespace + ".SALE", value);
	}
	
	@Override
	public List<ProductVO> OUTER1(int value) throws Exception {
		return sqlSession.selectList(namespace + ".OUTER1", value);
	}
	
	@Override
	public List<ProductVO> OUTER2(int value) throws Exception {
		return sqlSession.selectList(namespace + ".OUTER2", value);
	}
	
	@Override
	public List<ProductVO> TOP1(int value) throws Exception {
		return sqlSession.selectList(namespace + ".TOP1", value);
	}
	
	@Override
	public List<ProductVO> TOP2(int value) throws Exception {
		return sqlSession.selectList(namespace + ".TOP2", value);
	}
	
	@Override
	public List<ProductVO> TOP3(int value) throws Exception {
		return sqlSession.selectList(namespace + ".TOP3", value);
	}
	
	@Override
	public List<ProductVO> TOP4(int value) throws Exception {
		return sqlSession.selectList(namespace + ".TOP4", value);
	}
	
	@Override
	public List<ProductVO> TOP5(int value) throws Exception {
		return sqlSession.selectList(namespace + ".TOP5", value);
	}
	
	@Override
	public List<ProductVO> PANTS1(int value) throws Exception {
		return sqlSession.selectList(namespace + ".PANTS1", value);
	}
	
	@Override
	public List<ProductVO> PANTS2(int value) throws Exception {
		return sqlSession.selectList(namespace + ".PANTS2", value);
	}
	
	@Override
	public List<ProductVO> BAG1(int value) throws Exception {
		return sqlSession.selectList(namespace + ".BAG1", value);
	}
	
	@Override
	public List<ProductVO> BAG2(int value) throws Exception {
		return sqlSession.selectList(namespace + ".BAG2", value);
	}
	
	@Override
	public List<ProductVO> BAG3(int value) throws Exception {
		return sqlSession.selectList(namespace + ".BAG3", value);
	}
	
	@Override
	public List<ProductVO> BAG4(int value) throws Exception {
		return sqlSession.selectList(namespace + ".BAG4", value);
	}
	
	@Override
	public List<ProductVO> ACC1(int value) throws Exception {
		return sqlSession.selectList(namespace + ".ACC1", value);
	}
	
	@Override
	public List<ProductVO> ACC2(int value) throws Exception {
		return sqlSession.selectList(namespace + ".ACC2", value);
	}
	
	@Override
	public List<ProductVO> ACC3(int value) throws Exception {
		return sqlSession.selectList(namespace + ".ACC3", value);
	}
	
	@Override
	public List<ProductVO> ACC4(int value) throws Exception {
		return sqlSession.selectList(namespace + ".ACC4", value);
	}
}
