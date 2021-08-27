package com.green.sunny.dto;

public class QuestionVO {
	private int qseq;
	private String title;
	private String content;
	private String image;
	
	public int getQseq() {
		return qseq;
	}
	public void setQseq(int qseq) {
		this.qseq = qseq;
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
	
	@Override
	public String toString() {
		return "QuestionVO [qseq=" + qseq + ", title=" + title + ", content=" + content + ", image=" + image + "]";
	}

}
