package com.myspring.tibet.cart.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("cartVO")
public class CartVO {
	private Integer cart_num;
	private String product_num;
	private String product_name;
	private String product_thumbnail;
	private Integer product_price;
	private Integer product_sale;
	private String product_color;
	private String product_size;
	private Integer product_count;
	private String user_id;
	private Date cart_date;
	
	public Integer getCart_num() {
		return cart_num;
	}
	public void setCart_num(Integer cart_num) {
		this.cart_num = cart_num;
	}
	public String getProduct_num() {
		return product_num;
	}
	public void setProduct_num(String product_num) {
		this.product_num = product_num;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_thumbnail() {
		return product_thumbnail;
	}
	public void setProduct_thumbnail(String product_thumbnail) {
		this.product_thumbnail = product_thumbnail;
	}
	public Integer getProduct_price() {
		return product_price;
	}
	public void setProduct_price(Integer product_price) {
		this.product_price = product_price;
	}
	public Integer getProduct_sale() {
		return product_sale;
	}
	public void setProduct_sale(Integer product_sale) {
		this.product_sale = product_sale;
	}
	public String getProduct_color() {
		return product_color;
	}
	public void setProduct_color(String product_color) {
		this.product_color = product_color;
	}
	public String getProduct_size() {
		return product_size;
	}
	public void setProduct_size(String product_size) {
		this.product_size = product_size;
	}
	public Integer getProduct_count() {
		return product_count;
	}
	public void setProduct_count(Integer product_count) {
		this.product_count = product_count;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Date getCart_date() {
		return cart_date;
	}
	public void setCart_date(Date cart_date) {
		this.cart_date = cart_date;
	}
}
