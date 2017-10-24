package org.lanqiao.entity;

public class Item {

	public Item(int id) {
		super();
		this.id = id;
	}
	private int id;
	private Book book;
	private int count;
	private double itemPrice;
	private int cartId;
	private int userId;
	private Integer orderId;
	public Item(Book book, int count, int cartId) {
		super();
		this.book = book;
		this.count = count;
		this.cartId = cartId;
		this.itemPrice=book.getPrice()*count;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
		//this.itemPrice=book.getPrice()*count;
	}
	public double getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(double itemPrice) {
		this.itemPrice = itemPrice;
	}
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public Item(int id, Book book, int count, double itemPrice, int cartId, Integer orderId) {
		super();
		this.id = id;
		this.book = book;
		this.count = count;
		this.itemPrice = itemPrice;
		this.cartId = cartId;
		this.orderId = orderId;
	}
	public Item(Book book, int count, double itemPrice, int cartId, Integer orderId) {
		super();
		this.book = book;
		this.count = count;
		this.itemPrice = itemPrice;
		this.cartId = cartId;
		this.orderId = orderId;
	}
	public Item() {
		super();
	}
	
	@Override
	public String toString() {
		return "Item [id=" + id + ", book=" + book + ", count=" + count + ", itemPrice=" + itemPrice + ", cartId="
				+ cartId + ", orderId=" + orderId + "]";
	}
	/**
	 * 增加购物项 数量
	 * @param count
	 */
	public void add(int count) {
		this.count+=count;
		this.itemPrice+=count*book.getPrice();
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Item other = (Item) obj;
		if (id != other.id)
			return false;
		return true;
	}
	public void setItemCount(int count) {
		this.count=count;
		this.itemPrice=book.getPrice()*count;
	}
	
	
}
