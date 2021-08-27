package com.green.sunny.dto;

import java.util.Date;

public class OrderVO {
	private int oseq;
	private String id;
	private Date orders_date;
	private int pseq;
	private String pay_result;
	private String rev_result;
	
	public int getOseq() {
		return oseq;
	}
	public void setOseq(int oseq) {
		this.oseq = oseq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getOrders_date() {
		return orders_date;
	}
	public void setOrders_date(Date orders_date) {
		this.orders_date = orders_date;
	}
	public int getPseq() {
		return pseq;
	}
	public void setPseq(int pseq) {
		this.pseq = pseq;
	}
	public String getPay_result() {
		return pay_result;
	}
	public void setPay_result(String pay_result) {
		this.pay_result = pay_result;
	}
	public String getRev_result() {
		return rev_result;
	}
	public void setRev_result(String rev_result) {
		this.rev_result = rev_result;
	}
	
	@Override
	public String toString() {
		return "OrderVO [oseq=" + oseq + ", id=" + id + ", orders_date=" + orders_date + ", pseq=" + pseq
				+ ", pay_result=" + pay_result + ", rev_result=" + rev_result + "]";
	}

	
}
