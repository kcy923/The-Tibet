package com.myspring.tibet.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.tibet.board.vo.ReviewVO;
import com.myspring.tibet.cart.vo.CartVO;
import com.myspring.tibet.order.vo.OrderPageVO;
import com.myspring.tibet.order.vo.OrderVO;

public interface OrderController {
	// 채윤
	public ModelAndView nowBuyList(@PathVariable("user_id") String user_id, ModelAndView mav) throws Exception;
	public ResponseEntity nowBuy(CartVO cartVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView order(@PathVariable("user_id") String user_id, @RequestParam(value="hiddenValue") Integer[] cart_num, HttpServletRequest request, ModelAndView mav) throws Exception;
	public ResponseEntity addOrderList(OrderVO orderVO, OrderPageVO orderPage, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView resultOrder(@PathVariable("user_id") String user_id, ModelAndView mav) throws Exception;
	
	// 동욱
	public ModelAndView selectCancelList(@PathVariable("user_id") String user_id, HttpServletRequest request, ModelAndView mav) throws Exception;
	public ModelAndView selectOrderLists(@PathVariable("user_id") String user_id, HttpServletRequest request, ModelAndView mav) throws Exception;
	public ResponseEntity insertReviewWrite(ReviewVO reviewVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
