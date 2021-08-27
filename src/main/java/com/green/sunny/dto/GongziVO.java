package com.green.sunny.dto;

import java.util.Date;

public class GongziVO {
	private int gseq;
	private String title;
	private String content;
	private String image;
	private Date regdate;
	private int count;
	
	public int getGseq() {
		return gseq;
	}
	public void setGseq(int gseq) {
		this.gseq = gseq;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	@Override
	public String toString() {
		return "GongziVO [gseq=" + gseq + ", title=" + title + ", content=" + content + ", image=" + image
				+ ", regdate=" + regdate + ", count=" + count + "]";
	}

}
