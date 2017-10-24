package org.lanqiao.utils;

import org.lanqiao.entity.Book;

public class BookCreteria extends BaseCreteria<Book> {
	private String key;
	private double minPrice;
	private double maxPrice;
	public static final int PAGESIZE=8;
	public static final double MAXPRICE=9999999;
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public double getMinPrice() {
		return minPrice;
	}
	public void setMinPrice(double minPrice) {
		this.minPrice = minPrice;
	}
	public double getMaxPrice() {
		return maxPrice;
	}
	public void setMaxPrice(double maxPrice) {
		this.maxPrice = maxPrice;
	}
	public BookCreteria(int pageNo, int pageSize, int totalPage, String key, double minPrice, double maxPrice) {
		super(pageNo, pageSize, totalPage);
		this.key = key;
		this.minPrice = minPrice;
		this.maxPrice = maxPrice;
	}
}
