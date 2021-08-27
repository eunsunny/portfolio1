package com.green.sunny.dto;

import java.util.Date;

public class MemberVO {
	private String id;
	private String pwd;
	private String name;
	private String nick_name;
	private String grade;
	private String email;
	private String phone;
	private String zip_num;
	private String address;
	private Date regdate;
	private String inter_kind;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNick_name() {
		return nick_name;
	}
	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getZip_num() {
		return zip_num;
	}
	public void setZip_num(String zip_num) {
		this.zip_num = zip_num;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getInter_kind() {
		return inter_kind;
	}
	public void setInter_kind(String inter_kind) {
		this.inter_kind = inter_kind;
	}
	
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pwd=" + pwd + ", name=" + name + ", nick_name=" + nick_name + ", grade="
				+ grade + ", email=" + email + ", phone=" + phone + ", zip_num=" + zip_num + ", address=" + address
				+ ", regdate=" + regdate + ", inter_kind=" + inter_kind + "]";
	}
	
	
}
