package com.myspring.tibet.cart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.tibet.cart.vo.CartVO;

public interface CartController {
	public ModelAndView cartList(@PathVariable("user_id") String user_id, ModelAndView mav) throws Exception;
	public ResponseEntity addCart(CartVO cartVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String updateCart(CartVO cartVO) throws Exception;
	public String deleteCart(CartVO cartVO) throws Exception;
}
