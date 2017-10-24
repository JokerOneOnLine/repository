package org.lanqiao.entity;

import java.util.Date;

public class Consult {
	
	private int id;
	private String  content;
	private Date cDate;
	private String reply=null;
	private Date rDate;
	private int  userId;
	private String userName;
	private int bookId;
	private int adminId;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getcDate() {
		return cDate;
	}
	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public Date getrDate() {
		return rDate;
	}
	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public int getAdminId() {
		return adminId;
	}
	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}
	public Consult(String content, Date cDate, int userId, int bookId) {
		super();
		this.content = content;
		this.cDate = cDate;
		this.userId = userId;
		this.bookId = bookId;
	}
	public Consult() {
		super();
	}
	@Override
	public String toString() {
		return "Consult [id=" + id + ", content=" + content + ", cDate=" + cDate + ", reply=" + reply + ", rDate="
				+ rDate + ", userId=" + userId + ", userName=" + userName + ", bookId=" + bookId + ", adminId="
				+ adminId + "]";
	}
	
	
}
