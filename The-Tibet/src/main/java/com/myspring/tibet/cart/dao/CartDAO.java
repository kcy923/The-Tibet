package com.myspring.tibet.cart.dao;

import java.util.ArrayList;
import java.util.List;

import com.myspring.tibet.cart.vo.CartVO;
import com.myspring.tibet.order.vo.OrderVO;

public interface CartDAO {
	public List<CartVO> cartList(String user_id) throws Exception;	
	public List<CartVO> cartNowBuyList(String user_id) throws Exception;	
	public List<CartVO> cartOrderList(Integer[] cart_num) throws Exception;	
	public int addCart(CartVO cartVO);
	public int modifyCount(CartVO cartVO);
	public int deleteCart(CartVO cartVO);
	public int checkCart(CartVO cartVO);
	public int deleteCartList(OrderVO orders);
}
