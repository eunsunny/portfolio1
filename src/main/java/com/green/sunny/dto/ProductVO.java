package com.green.sunny.dto;

import java.sql.Date;

public class ProductVO {
	public int pseq;
	private String name;
	private String kind;
	private String kind2;
	private int price;
	private String title;
	private String content;
	private String soldyn;
	private Date regdate;
	private String id;
	private String kind_nm;
	private String delivery_nm;
	private int cnt;
	private String image;
	private String oid;
	private int oseq;
	
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public int getOseq() {
		return oseq;
	}
	public void setOseq(int oseq) {
		this.oseq = oseq;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getPseq() {
		return pseq;
	}
	public void setPseq(int pseq) {
		this.pseq = pseq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getKind2() {
		return kind2;
	}
	public void setKind2(String kind2) {
		this.kind2 = kind2;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSoldyn() {
		return soldyn;
	}
	public void setSoldyn(String soldyn) {
		this.soldyn = soldyn;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getKind_nm() {
		return kind_nm;
	}
	public void setKind_nm(String kind_nm) {
		this.kind_nm = kind_nm;
	}
	public String getDelivery_nm() {
		return delivery_nm;
	}
	public void setDelivery_nm(String delivery_nm) {
		this.delivery_nm = delivery_nm;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	@Override
	public String toString() {
		return "ProductVO [pseq=" + pseq + ", name=" + name + ", kind=" + kind + ", kind2=" + kind2 + ", price=" + price
				+ ", title=" + title + ", content=" + content + ", soldyn=" + soldyn + ", regdate=" + regdate + ", id="
				+ id + ", kind_nm=" + kind_nm + ", delivery_nm=" + delivery_nm + ", cnt=" + cnt + ", image=" + image
				+ ", oid=" + oid + ", oseq=" + oseq + "]";
	}
	
}
