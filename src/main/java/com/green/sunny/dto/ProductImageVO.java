package com.green.sunny.dto;

public class ProductImageVO {

	 private int fseq;
	 private int pseq;
	 private String product_image;
	 
	 
	public int getFseq() {
		return fseq;
	}
	public void setFseq(int fseq) {
		this.fseq = fseq;
	}
	public int getPseq() {
		return pseq;
	}
	public void setPseq(int pseq) {
		this.pseq = pseq;
	}
	public String getProduct_image() {
		return product_image;
	}
	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}
	@Override
	public String toString() {
		return "ProductImageVO [fseq=" + fseq + ", pseq=" + pseq + ", product_image=" + product_image + "]";
	}
	 
	 
}
