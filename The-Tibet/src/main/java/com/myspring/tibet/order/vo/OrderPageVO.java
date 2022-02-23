package com.myspring.tibet.order.vo;

import java.util.List;

import org.springframework.stereotype.Component;

@Component("orderPageVO")
public class OrderPageVO {
	private List<OrderVO> orders;

	public List<OrderVO> getOrders() {
		return orders;
	}

	public void setOrders(List<OrderVO> orders) {
		this.orders = orders;
	}

	@Override
	public String toString() {
		return "OrderPageVO [orders=" + orders + "]";
	}
}
