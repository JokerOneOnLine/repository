package org.lanqiao.entity;

import java.util.Date;

public class Eval {

	private int id;
	private String content;
	private int bookId;
	private int star;
	private Date evalDate =new Date();
	private int userId;
	private String reply;
	private int adminId;
	private Date replyDate;
	private int orderId;
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
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public Date getEvalDate() {
		return evalDate;
	}
	public void setEvalDate(Date evalDate) {
		this.evalDate = evalDate;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public int getAdminId() {
		return adminId;
	}
	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}
	public Date getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	@Override
	public String toString() {
		return "Eval [id=" + id + ", content=" + content + ", bookId=" + bookId + ", star=" + star + ", evalDate="
				+ evalDate + ", userId=" + userId + ", reply=" + reply + ", adminId=" + adminId + ", replyDate="
				+ replyDate + ", orderId=" + orderId + "]";
	}
	public Eval() {
		super();
	}
	public Eval(String content, int bookId, int star, int userId, int orderId) {
		super();
		this.content = content;
		this.bookId = bookId;
		this.star = star;
		this.userId = userId;
		this.orderId = orderId;
	}
	
	
}
