package com.green.sunny.dto;

public class ReportVO {
	private String id;
	private String rp_kind;
	private String content;
	private String result;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRp_kind() {
		return rp_kind;
	}
	public void setRp_kind(String rp_kind) {
		this.rp_kind = rp_kind;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	
	@Override
	public String toString() {
		return "ReportVO [id=" + id + ", rp_kind=" + rp_kind + ", content=" + content + ", result=" + result + "]";
	}

}
