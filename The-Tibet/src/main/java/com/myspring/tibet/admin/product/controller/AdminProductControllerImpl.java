package com.myspring.tibet.admin.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.tibet.board.service.BoardService;
import com.myspring.tibet.product.service.ProductService;

@Controller("adminProductController")
public class AdminProductControllerImpl implements AdminProductController {
	@Autowired
	private ProductService productService;
	@Autowired
	private BoardService boardService;
	
	// 상품 등록
	@RequestMapping(value = "/admin-register.do", method = RequestMethod.GET)
	public void productregiser() throws Exception {
		
	}
	
	// 상품 페이지
	@RequestMapping(value = "/admin-product.do", method = RequestMethod.GET) 
	public void adminproduct() throws Exception {
		
	}
	
	// 상품 목록
	@Override
	@RequestMapping(value="/admin-productlistName{main_category_num}.do" ,method = RequestMethod.GET)
	public ModelAndView productlistName(@PathVariable("main_category_num") int main_category_num,ModelAndView mav) throws Exception {
		mav.setViewName("/productListName");
		//mav.addObject("main_cate", productService.productListName(main_category_num));
		return mav;
	}
	
	// 상품 상세
	@Override
	@RequestMapping("/admin-productdetail{product_num}.do")
	public ModelAndView detail(@PathVariable("product_num") String product_num, ModelAndView mav) throws Exception{
		mav.setViewName("/productDetail");
		mav.addObject("vo", productService.productDetail(product_num));
		mav.addObject("prodQnasList", boardService.listProdQnas(product_num));
		mav.addObject("prodReviewsList", boardService.listProdReviews(product_num));
		return mav;
	}
}
	
	
