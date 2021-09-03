package com.green.sunny.dto;

public class MostOrderMember {
	private String id;
	private int order_count;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getOrder_count() {
		return order_count;
	}
	public void setOrder_count(int order_count) {
		this.order_count = order_count;
	}
	
	@Override
	public String toString() {
		return "MostOrderMember [id=" + id + ", order_count=" + order_count + "]";
	}
}
