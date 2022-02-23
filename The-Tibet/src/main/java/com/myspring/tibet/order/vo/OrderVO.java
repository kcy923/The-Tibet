package com.myspring.tibet.order.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("orderVO")
public class OrderVO {
	private String order_num;
	private Date order_date;
	private String order_name;
	private String order_tel;
	private String order_phone;
	private String order_email;
	private String receiver_name;
	private String receiver_zip;
	private String receiver_addr1;
	private String receiver_addr2;
	private String receiver_tel;
	private String receiver_phone;
	private String receiver_msg;
	private String order_state;
	private String order_pay;
	private String product_num;
	private String product_name;
	private String product_thumbnail;
	private int product_price;
	private int product_sale;
	private String product_color;
	private String product_size;
	private int product_count;
	private String user_id;
	
	public String getOrder_num() {
		return order_num;
	}
	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	public String getOrder_tel() {
		return order_tel;
	}
	public void setOrder_tel(String order_tel) {
		this.order_tel = order_tel;
	}
	public String getOrder_phone() {
		return order_phone;
	}
	public void setOrder_phone(String order_phone) {
		this.order_phone = order_phone;
	}
	public String getOrder_email() {
		return order_email;
	}
	public void setOrder_email(String order_email) {
		this.order_email = order_email;
	}
	public String getReceiver_name() {
		return receiver_name;
	}
	public void setReceiver_name(String receiver_name) {
		this.receiver_name = receiver_name;
	}
	public String getReceiver_zip() {
		return receiver_zip;
	}
	public void setReceiver_zip(String receiver_zip) {
		this.receiver_zip = receiver_zip;
	}
	public String getReceiver_addr1() {
		return receiver_addr1;
	}
	public void setReceiver_addr1(String receiver_addr1) {
		this.receiver_addr1 = receiver_addr1;
	}
	public String getReceiver_addr2() {
		return receiver_addr2;
	}
	public void setReceiver_addr2(String receiver_addr2) {
		this.receiver_addr2 = receiver_addr2;
	}
	public String getReceiver_tel() {
		return receiver_tel;
	}
	public void setReceiver_tel(String receiver_tel) {
		this.receiver_tel = receiver_tel;
	}
	public String getReceiver_phone() {
		return receiver_phone;
	}
	public void setReceiver_phone(String receiver_phone) {
		this.receiver_phone = receiver_phone;
	}
	public String getReceiver_msg() {
		return receiver_msg;
	}
	public void setReceiver_msg(String receiver_msg) {
		this.receiver_msg = receiver_msg;
	}
	public String getOrder_state() {
		return order_state;
	}
	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}
	public String getOrder_pay() {
		return order_pay;
	}
	public void setOrder_pay(String order_pay) {
		this.order_pay = order_pay;
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
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getProduct_sale() {
		return product_sale;
	}
	public void setProduct_sale(int product_sale) {
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
	public int getProduct_count() {
		return product_count;
	}
	public void setProduct_count(int product_count) {
		this.product_count = product_count;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	@Override
	public String toString() {
		return "OrderVO [order_num=" + order_num + ", order_date=" + order_date + ", order_name=" + order_name
				+ ", order_tel=" + order_tel + ", order_phone=" + order_phone + ", order_email=" + order_email
				+ ", receiver_name=" + receiver_name + ", receiver_zip=" + receiver_zip + ", receiver_addr1="
				+ receiver_addr1 + ", receiver_addr2=" + receiver_addr2 + ", receiver_tel=" + receiver_tel
				+ ", receiver_phone=" + receiver_phone + ", receiver_msg=" + receiver_msg + ", order_state="
				+ order_state + ", order_pay=" + order_pay + ", product_num=" + product_num + ", product_name="
				+ product_name + ", product_thumbnail=" + product_thumbnail + ", product_price=" + product_price
				+ ", product_sale=" + product_sale + ", product_color=" + product_color + ", product_size="
				+ product_size + ", product_count=" + product_count + ", user_id=" + user_id + "]";
	}
}
