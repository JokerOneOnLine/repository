package org.lanqiao.entity;

import java.util.Date;
import java.util.List;

public class Order {

	public static final int NO = 0;
	public static final int YES = 1;
	private  int id;
	private Date oDate=new Date();
	private double price;
	private int isevaluated = NO;//未评价
	private int userId;
	private Consignee consignee;
	private int isSend = NO;//未发货
	
	private List<Item> items;
	public List<Item> getItems() {
		return items;
	}
	public void setItems(List<Item> items) {
		this.items = items;
	}
	public int  getCount() {
		return items.size();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getIsevaluated() {
		return isevaluated;
	}
	public void setIsevaluated(int isevaluated) {
		this.isevaluated = isevaluated;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Consignee getConsignee() {
		return consignee;
	}
	public void setConsignee(Consignee consignee) {
		this.consignee = consignee;
	}
	public int getIsSend() {
		return isSend;
	}
	public void setIsSend(int isSend) {
		this.isSend = isSend;
	}

	public Order(double price, int userId) {
		super();
		this.price = price;
		this.userId = userId;
	}
	public Date getoDate() {
		return oDate;
	}
	public void setoDate(Date oDate) {
		this.oDate = oDate;
	}
	@Override
	public String toString() {
		return "Order [id=" + id + ", oDate=" + oDate + ", price=" + price + ", isevlucated=" + isevaluated
				+ ", userId=" + userId + ", consignee=" + consignee + ", isSend=" + isSend + "]";
	}
	public Order() {
		super();
	}
	
}
