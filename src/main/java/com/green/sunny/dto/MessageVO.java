package com.green.sunny.dto;

import java.util.Date;

public class MessageVO {
	
	private int no;
	private int room;
	private String send_id;
	private String recv_id;
	private Date send_time;
	private Date recv_time;
	private String content;
	private int read_chk;
	
	private String other_id;
	private String profile;
	private String id;
	private int unread;
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getRoom() {
		return room;
	}
	public void setRoom(int room) {
		this.room = room;
	}
	public String getSend_id() {
		return send_id;
	}
	public void setSend_id(String send_id) {
		this.send_id = send_id;
	}
	public String getRecv_id() {
		return recv_id;
	}
	public void setRecv_id(String recv_id) {
		this.recv_id = recv_id;
	}
	public Date getSend_time() {
		return send_time;
	}
	public void setSend_time(Date send_time) {
		this.send_time = send_time;
	}
	public Date getRecv_time() {
		return recv_time;
	}
	public void setRecv_time(Date recv_time) {
		this.recv_time = recv_time;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRead_chk() {
		return read_chk;
	}
	public void setRead_chk(int read_chk) {
		this.read_chk = read_chk;
	}
	public String getOther_id() {
		return other_id;
	}
	public void setOther_id(String other_id) {
		this.other_id = other_id;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getUnread() {
		return unread;
	}
	public void setUnread(int unread) {
		this.unread = unread;
	}
	
	@Override
	public String toString() {
		return "MessageVO [no=" + no + ", room=" + room + ", send_id=" + send_id + ", recv_id=" + recv_id
				+ ", send_time=" + send_time + ", recv_time=" + recv_time + ", content=" + content + ", read_chk="
				+ read_chk + ", other_id=" + other_id + ", profile=" + profile + ", id=" + id + ", unread=" + unread
				+ "]";
	}
	
}
