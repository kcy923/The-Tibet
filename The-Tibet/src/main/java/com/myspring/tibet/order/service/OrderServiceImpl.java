package com.myspring.tibet.order.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.myspring.tibet.board.vo.ReviewVO;
import com.myspring.tibet.order.dao.OrderDAO;
import com.myspring.tibet.order.vo.OrderVO;

@Service("orderService")
public class OrderServiceImpl implements OrderService {
	@Inject
	private OrderDAO orderDAO;

	@Override
	public int addOrderList(List<OrderVO> orders) throws Exception {
		for(OrderVO orderVO : orders) {
			System.out.println("service(orderVO) : " + orderVO);
			orderDAO.addOrderList(orderVO);
		}
		return 0;
	}

	@Override
	public List<OrderVO> selectOrderNum() throws Exception {
		return orderDAO.selectOrderNum();
	}
	
	@Override
	public OrderVO selectLastOrder(String user_id) throws Exception {
		return orderDAO.selectLastOrder(user_id);
	}
	
	@Override
	public List<OrderVO> selectLastOrderList(OrderVO orderVO) throws Exception {
		return orderDAO.selectLastOrderList(orderVO);
	}
	
	@Override
	public List<OrderVO> selectOrderList(String user_id) throws Exception {
		return orderDAO.selectOrderList(user_id);
	}
	
	@Override
	public List<OrderVO> selectCancelList(String user_id) throws Exception {
		return orderDAO.selectCancelList(user_id);
	}
	
	@Override
	public List<OrderVO> selectDateOrderList(HashMap<String, String> dateMap) throws DataAccessException {
		return orderDAO.selectDateOrderList(dateMap);
	}
	
	@Override
	public List<OrderVO> selectDateCancelList(HashMap<String, String> dateMap) throws DataAccessException {
		return orderDAO.selectDateCancelList(dateMap);
	}
	
	@Override
	public void insertReviewWrite(ReviewVO reviewVO) throws Exception{
		orderDAO.reviewWrite(reviewVO);
	}
}
