package com.green.sunny.dto;

import java.util.Date;

public class BoardVO {
	private int bseq;
	private String title;
	private String id;
	private String content;
	private String image;
	private Date regdate;
	private int count;
	
	public int getBseq() {
		return bseq;
	}
	public void setBseq(int bseq) {
		this.bseq = bseq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
		return "BoardVO [bseq=" + bseq + ", title=" + title + ", id=" + id + ", content=" + content + ", image=" + image
				+ ", regdate=" + regdate + ", count=" + count + "]";
	}
	

}
