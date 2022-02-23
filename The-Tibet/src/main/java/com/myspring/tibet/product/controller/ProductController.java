package com.myspring.tibet.product.controller;


import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

public interface ProductController {
	public ModelAndView detail(@PathVariable("product_num") String product_num, ModelAndView mav) throws Exception;
	public ModelAndView outer(String page, HttpServletResponse response) throws Exception;
	public ModelAndView outer1(String page, HttpServletResponse response) throws Exception;
	public ModelAndView outer2(String page, HttpServletResponse response) throws Exception;
	public ModelAndView top(String page, HttpServletResponse response) throws Exception;
	public ModelAndView top1(String page, HttpServletResponse response) throws Exception;
	public ModelAndView top2(String page, HttpServletResponse response) throws Exception;
	public ModelAndView top3(String page, HttpServletResponse response) throws Exception;
	public ModelAndView top4(String page, HttpServletResponse response) throws Exception;
	public ModelAndView top5(String page, HttpServletResponse response) throws Exception;
	public ModelAndView pants(String page, HttpServletResponse response) throws Exception;
	public ModelAndView pants1(String page, HttpServletResponse response) throws Exception;
	public ModelAndView pants2(String page, HttpServletResponse response) throws Exception;
	public ModelAndView bag(String page, HttpServletResponse response) throws Exception;
	public ModelAndView bag1(String page, HttpServletResponse response) throws Exception;
	public ModelAndView bag2(String page, HttpServletResponse response) throws Exception;
	public ModelAndView bag3(String page, HttpServletResponse response) throws Exception;
	public ModelAndView bag4(String page, HttpServletResponse response) throws Exception;
	public ModelAndView acc(String page, HttpServletResponse response) throws Exception;
	public ModelAndView acc1(String page, HttpServletResponse response) throws Exception;
	public ModelAndView acc2(String page, HttpServletResponse response) throws Exception;
	public ModelAndView acc3(String page, HttpServletResponse response) throws Exception;
	public ModelAndView acc4(String page, HttpServletResponse response) throws Exception;
	public ModelAndView sale(String page, HttpServletResponse response) throws Exception;
	public ModelAndView NEW(String page, HttpServletResponse response) throws Exception;
	public ModelAndView search(String KeyWord, HttpServletResponse response) throws Exception;
}
