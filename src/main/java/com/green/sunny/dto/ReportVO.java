package com.green.sunny.dto;

import java.util.Date;

public class ReportVO {
	private int rseq;
	private String id;
	private String report_id;
	private String rp_kind;
	private String content;
	private String result;
	private Date report_date;
	
	public Date getReport_date() {
		return report_date;
	}
	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}
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
	public int getRseq() {
		return rseq;
	}
	public void setRseq(int rseq) {
		this.rseq = rseq;
	}
	public String getReport_id() {
		return report_id;
	}
	public void setReport_id(String report_id) {
		this.report_id = report_id;
	}
	
	@Override
	public String toString() {
		return "ReportVO [rseq=" + rseq + ", id=" + id + ", report_id=" + report_id + ", rp_kind=" + rp_kind
				+ ", content=" + content + ", result=" + result + "]";
	}
}
