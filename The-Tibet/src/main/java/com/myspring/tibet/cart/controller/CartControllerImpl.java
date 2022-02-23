package com.myspring.tibet.cart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.tibet.cart.service.CartService;
import com.myspring.tibet.cart.vo.CartVO;

//@RequestMapping(value="/cart")
@Controller("cartController")
public class CartControllerImpl implements CartController {
	@Autowired
	private CartService cartService;

	@Override
	@RequestMapping(value="/cart{user_id}.do", method = RequestMethod.GET)
	public ModelAndView cartList(@PathVariable("user_id") String user_id, ModelAndView mav)
			throws Exception {
		mav.setViewName("/cart");
		mav.addObject("cartsList", cartService.cartList(user_id));
		return mav;
	}
	
	/* 장바구니 추가 */
	@Override
	@RequestMapping(value="/addCart.do", method = RequestMethod.POST)
	public ResponseEntity addCart(CartVO cartVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			int check = cartService.checkCart(cartVO);
			check = check == 0 ? 0 : check;
			
			if(check == 0) {
				cartService.addCart(cartVO);
				
				message  = "<script>";
			    message += " location.href='" +request.getContextPath() + "/cart" + cartVO.getUser_id() + ".do';";
			    message += " </script>";
			} else {
				message  = "<script>";
			    message +=" alert('이미 담긴 상품입니다.');";
			    message += " location.href='" +request.getContextPath() + "/productDetail" + cartVO.getProduct_num() + ".do';";
			    message += " </script>";
			}    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요.');";
		    message += " location.href='" +request.getContextPath() + "/productDetail" + cartVO.getProduct_num() + ".do';";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	/* 장바구니 수량 수정 */
	@Override
	@RequestMapping(value="/updateCart.do", method = RequestMethod.POST)
	public String updateCart(CartVO cartVO) throws Exception {
		cartService.modifyCount(cartVO);		
		return "redirect:/cart" + cartVO.getUser_id() + ".do";		
	}
	
	/* 장바구니 삭제 */
	@Override
	@RequestMapping(value="/deleteCart.do", method = RequestMethod.POST)
	public String deleteCart(CartVO cartVO) throws Exception {
		cartService.deleteCart(cartVO);		
		return "redirect:/cart" + cartVO.getUser_id() + ".do";	
	}
}
