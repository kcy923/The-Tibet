package com.myspring.tibet.cart.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.myspring.tibet.cart.vo.CartVO;
import com.myspring.tibet.order.vo.OrderVO;

@Repository("cartDAO")
public class CartDAOImpl implements CartDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "mappers.cart";
	
	@Override
	public List<CartVO> cartList(String user_id) throws Exception {
		return sqlSession.selectList(namespace + ".cartList", user_id);
	}
	
	@Override
	public List<CartVO> cartNowBuyList(String user_id) throws Exception {
		return sqlSession.selectList(namespace + ".cartNowBuyList", user_id);
	}
	
	@Override
	public List<CartVO> cartOrderList(Integer[] cart_num) throws Exception {
		System.out.println("dao = " + cart_num);
		return sqlSession.selectList(namespace + ".cartOrderList", cart_num);
	}
	
	@Override
	public int addCart(CartVO cartVO) {
		return sqlSession.insert(namespace + ".addCart", cartVO);
	}
	
	@Override
	public int modifyCount(CartVO cartVO) {
		return sqlSession.update(namespace + ".modifyCnt", cartVO);
	}

	@Override
	public int deleteCart(CartVO cartVO) {
		return sqlSession.delete(namespace + ".deleteCart", cartVO);
	}

	@Override
	public int checkCart(CartVO cartVO) {		
		System.out.println("num: " + cartVO.getProduct_num());
		System.out.println("color: " + cartVO.getProduct_color());
		System.out.println("size: " + cartVO.getProduct_size());
		System.out.println("id: " + cartVO.getUser_id());
		
		return sqlSession.selectOne(namespace + ".checkCart", cartVO);
	}

	@Override
	public int deleteCartList(OrderVO orders) {
		return sqlSession.delete(namespace + ".deleteCartList", orders);
	}
}
