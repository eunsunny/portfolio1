package com.green.sunny.dto;

import java.util.Date;

public class OneoneVO {
	private int onseq;
	private String title;
	private String content;
	private String reply;
	private String id;
	private String rep;
	private Date regdate;
	
	public int getOnseq() {
		return onseq;
	}
	public void setOnseq(int onseq) {
		this.onseq = onseq;
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
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRep() {
		return rep;
	}
	public void setRep(String rep) {
		this.rep = rep;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "OneoneVO [onseq=" + onseq + ", title=" + title + ", content=" + content + ", reply=" + reply + ", id="
				+ id + ", rep=" + rep + ", regdate=" + regdate + "]";
	}
	
}
