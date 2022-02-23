package com.myspring.tibet.product.controller;


import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.tibet.board.service.BoardService;
import com.myspring.tibet.product.service.ProductService;

@Controller("productController")
public class ProductControllerImpl implements ProductController{	
	@Autowired
	private ProductService productService;	
	@Autowired
	private BoardService boardService;
	
	@Override
	@RequestMapping("/productDetail{product_num}.do")
	public ModelAndView detail(@PathVariable("product_num") String product_num, ModelAndView mav) throws Exception{
		mav.setViewName("/productDetail");
		mav.addObject("vo", productService.productDetail(product_num));
		mav.addObject("color", productService.productColor(product_num));
		mav.addObject("size", productService.productSize(product_num));
		mav.addObject("prodQnasList", boardService.listProdQnas(product_num));
		mav.addObject("prodReviewsList", boardService.listProdReviews(product_num));
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/searchForm.do") 
	public ModelAndView search(@RequestParam(name="KeyWord") String KeyWord, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/search");
		mav.addObject("list", productService.SEARCH(KeyWord));
		return mav; 
	}
	
	@Override
	@RequestMapping(value = "/new.do")
	public ModelAndView NEW(@RequestParam(name="p",defaultValue="1") String page, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/new");
	    int value = Integer.parseInt(page);
		mav.addObject("list", productService.NEW(value));
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/outer.do")
	public ModelAndView outer(@RequestParam(name="p",defaultValue="1") String page, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/outer");
		int value = Integer.parseInt(page);
		mav.addObject("list", productService.OUTER(value));
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/outer-1.do")
	public ModelAndView outer1(@RequestParam(name="p",defaultValue="1") String page, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/outer-1");
		int value = Integer.parseInt(page);
		mav.addObject("list", productService.OUTER1(value));
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/outer-2.do")
	public ModelAndView outer2(@RequestParam(name="p",defaultValue="1") String page, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/outer-2");
		int value = Integer.parseInt(page);
		mav.addObject("list", productService.OUTER2(value));
		return mav;
	}

	@Override
	@RequestMapping(value = "/top.do")
	public ModelAndView top(@RequestParam(name="p",defaultValue="1") String page, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/top");
		int value = Integer.parseInt(page);
		mav.addObject("list", productService.TOP(value));
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/top-1.do")
	public ModelAndView top1(@RequestParam(name="p",defaultValue="1") String page, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/top-1");
		int value = Integer.parseInt(page);
		mav.addObject("list", productService.TOP1(value));
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/top-2.do")
	public ModelAndView top2(@RequestParam(name="p",defaultValue="1") String page, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/top-2");
		int value = Integer.parseInt(page);
		mav.addObject("list", productService.TOP2(value));
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/top-3.do")
	public ModelAndView top3(@RequestParam(name="p",defaultValue="1") String page, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/top-3");
		int value = Integer.parseInt(page);
		mav.addObject("list", productService.TOP3(value));
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/top-4.do")
	public ModelAndView top4(@RequestParam(name="p",defaultValue="1") String page, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/top-4");
		int value = Integer.parseInt(page);
		mav.addObject("list", productService.TOP4(value));
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/top-5.do")
	public ModelAndView top5(@RequestParam(name="p",defaultValue="1") String page, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/top-5");
		int value = Integer.parseInt(page);
		mav.addObject("list", productService.TOP5(value));
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/pants.do")
	public ModelAndView pants(@RequestParam(name="p",defaultValue="1") String page, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/pants");
		int value = Integer.parseInt(page);
		mav.addObject("list", productService.PANTS(value));
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/pants-1.do")
	public ModelAndView pants1(@RequestParam(name="p",defaultValue="1") String page, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/pants-1");
		int value = Integer.parseInt(page);
		mav.addObject("list", productService.PANTS1(value));
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/pants-2.do")
	public ModelAndView pants2(@RequestParam(name="p",defaultValue="1") String page, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/pants-2");
		int value = Integer.parseInt(page);
		mav.addObject("list", productService.PANTS2(value));
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/bag.do")
	public ModelAndView bag(@RequestParam(name="p",defaultValue="1") String page, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/bag");
		int value = Integer.parseInt(page);
		mav.addObject("list", productService.BAG(value));
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/bag-1.do")
	public ModelAndView bag1(@RequestParam(name="p",defaultValue="1") String page, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/bag-1");
		int value = Integer.parseInt(page);
		mav.addObject("list", productService.BAG1(value));
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/bag-2.do")
	public ModelAndView bag2(@RequestParam(name="p",defaultValue="1") String page, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/bag-2");
		int value = Integer.parseInt(page);
		mav.addObject("list", productService.BAG2(value));
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/bag-3.do")
	public ModelAndView bag3(@RequestParam(name="p",defaultValue="1") String page, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/bag-3");
		int value = Integer.parseInt(page);
		mav.addObject("list", productService.BAG3(value));
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/bag-4.do")
	public ModelAndView bag4(@RequestParam(name="p",defaultValue="1") String page, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/bag-4");
		int value = Integer.parseInt(page);
		mav.addObject("list", productService.BAG4(value));
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/acc.do")
	public ModelAndView acc(@RequestParam(name="p",defaultValue="1") String page, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/acc");
		int value = Integer.parseInt(page);
		mav.addObject("list", productService.ACC(value));
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/acc-1.do")
	public ModelAndView acc1(@RequestParam(name="p",defaultValue="1") String page, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/acc-1");
		int value = Integer.parseInt(page);
		mav.addObject("list", productService.ACC1(value));
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/acc-2.do")
	public ModelAndView acc2(@RequestParam(name="p",defaultValue="1") String page, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/acc-2");
		int value = Integer.parseInt(page);
		mav.addObject("list", productService.ACC2(value));
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/acc-3.do")
	public ModelAndView acc3(@RequestParam(name="p",defaultValue="1") String page, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/acc-3");
		int value = Integer.parseInt(page);
		mav.addObject("list", productService.ACC3(value));
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/acc-4.do")
	public ModelAndView acc4(@RequestParam(name="p",defaultValue="1") String page, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/acc-4");
		int value = Integer.parseInt(page);
		mav.addObject("list", productService.ACC4(value));
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/sale.do")
	public ModelAndView sale(@RequestParam(name="p",defaultValue="1") String page, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/sale");
		int value = Integer.parseInt(page);
		mav.addObject("list", productService.SALE(value));
		return mav;
	}

}