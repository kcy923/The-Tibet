package com.myspring.tibet.admin.product.controller;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

public interface AdminProductController {
	public ModelAndView detail(@PathVariable("product_num") String product_num, ModelAndView mav) throws Exception;
	public ModelAndView productlistName(int main_category_num, ModelAndView mav) throws Exception;
}



