package com.green.sunny.dto;

import java.util.Date;

public class JjimVO {
	private int jjseq;
	private String id;
	private int pseq;
	private String result;
	private String image;
	private String pname;
	private String mname;
	private String title;
	private String kind;
	private int price;
	private Date jjim_date;
	private String cod;
	private String cod_grp_id;
	private String cod_nm;
	private String soldyn;
	
	public String getSoldyn() {
		return soldyn;
	}
	public void setSoldyn(String soldyn) {
		this.soldyn = soldyn;
	}
	public int getJjseq() {
		return jjseq;
	}
	public void setJjseq(int jjseq) {
		this.jjseq = jjseq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPseq() {
		return pseq;
	}
	public void setPseq(int pseq) {
		this.pseq = pseq;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Date getJjim_date() {
		return jjim_date;
	}
	public void setJjim_date(Date jjim_date) {
		this.jjim_date = jjim_date;
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

	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	
	@Override
	public String toString() {
		return "JjimVO [jjseq=" + jjseq + ", id=" + id + ", pseq=" + pseq + ", result=" + result + ", image=" + image
				+ ", pname=" + pname + ", mname=" + mname + ", title=" + title + ", kind=" + kind + ", price=" + price
				+ ", jjim_date=" + jjim_date + ", cod=" + cod + ", cod_grp_id=" + cod_grp_id + ", cod_nm=" + cod_nm
				+ ", soldyn=" + soldyn + "]";
	}
	
	
}
