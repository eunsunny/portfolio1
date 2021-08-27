package com.green.sunny.dto;

import java.util.Date;

public class BoardCommentVO {
	private int bcseq;
	private int bseq;
	private String content;
	private String id;
	private Date regdate;
	
	public int getBcseq() {
		return bcseq;
	}
	public void setBcseq(int bcseq) {
		this.bcseq = bcseq;
	}
	public int getBseq() {
		return bseq;
	}
	public void setBseq(int bseq) {
		this.bseq = bseq;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "BoardCommentVO [bcseq=" + bcseq + ", bseq=" + bseq + ", content=" + content + ", id=" + id
				+ ", regdate=" + regdate + "]";
	}

}
