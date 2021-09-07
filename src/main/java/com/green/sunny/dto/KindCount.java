package com.green.sunny.dto;

public class KindCount {
	private String kind;
	private int kind_count;
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public int getKind_count() {
		return kind_count;
	}
	public void setKind_count(int kind_count) {
		this.kind_count = kind_count;
	}
	
	@Override
	public String toString() {
		return "KindCount [kind=" + kind + ", kind_count=" + kind_count + "]";
	}
}
