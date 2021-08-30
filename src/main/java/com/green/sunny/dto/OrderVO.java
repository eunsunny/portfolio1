package com.green.sunny.dto;

import java.util.Date;

public class OrderVO {
	private int oseq;
	private String id;
	private Date orders_date;
	private int pseq;
	private String pay_result;
	private String rev_result;
	private String name;
	private String title;
	private String cod;
	private String cod_grp_id;
	private String cod_nm;
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCod() {
		return cod;
	}
	public void setCod(String cod) {
		this.cod = cod;
	}
	public String getCod_grp_id() {
		return cod_grp_id;
	}
	public void setCod_grp_id(String cod_grp_id) {
		this.cod_grp_id = cod_grp_id;
	}
	public String getCod_nm() {
		return cod_nm;
	}
	public void setCod_nm(String cod_nm) {
		this.cod_nm = cod_nm;
	}
	
	@Override
	public String toString() {
		return "OrderVO [oseq=" + oseq + ", id=" + id + ", orders_date=" + orders_date + ", pseq=" + pseq
				+ ", pay_result=" + pay_result + ", rev_result=" + rev_result + ", name=" + name + ", title=" + title
				+ ", cod=" + cod + ", cod_grp_id=" + cod_grp_id + ", cod_nm=" + cod_nm + "]";
	}
	
}
