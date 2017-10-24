package org.lanqiao.entity;

import java.util.List;

public class Book {
	public static int NOTONSALE=0;
	public static int ONSALE=1;
	public static int ALL=2;
	private int id;
	private String name;
	private int stock;// 库存
	private double price;
	private int salesamount;// 销量
	private String publishedby;// 出版社
	private String surface;
	private int onsale=Book.ALL;// 上架
	private String detail;// 简介
	private String author;
	
	private List<Consult> consults;
	
	public List<Consult> getConsults() {
		return consults;
	}
	public void setConsults(List<Consult> consults) {
		this.consults = consults;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getSalesamount() {
		return salesamount;
	}
	public void setSalesamount(int salesamount) {
		this.salesamount = salesamount;
	}
	public String getPublishedby() {
		return publishedby;
	}
	public void setPublishedby(String publishedby) {
		this.publishedby = publishedby;
	}
	public String getSurface() {
		return surface;
	}
	public void setSurface(String surface) {
		this.surface = surface;
	}
	public int getOnsale() {
		return onsale;
	}
	public void setOnsale(int onsale) {
		this.onsale = onsale;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Book(String name, int stock, double price, int salesamount, String publishedby, String surface, int onsale,
			String detail, String author) {
		super();
		this.name = name;
		this.stock = stock;
		this.price = price;
		this.salesamount = salesamount;
		this.publishedby = publishedby;
		this.surface = surface;
		this.onsale = onsale;
		this.detail = detail;
		this.author = author;
	}
	
	public Book(String name, int stock, double price, String publishedby, String surface, String detail,
			String author) {
		super();
		this.name = name;
		this.stock = stock;
		this.price = price;
		this.publishedby = publishedby;
		this.surface = surface;
		this.detail = detail;
		this.author = author;
	}
	public Book() {
		super();
	}
	
	public Book(int id, String name, int stock, double price, int salesamount, String publishedby, String surface,
			int onsale, String detail, String author) {
		super();
		this.id = id;
		this.name = name;
		this.stock = stock;
		this.price = price;
		this.salesamount = salesamount;
		this.publishedby = publishedby;
		this.surface = surface;
		this.onsale = onsale;
		this.detail = detail;
		this.author = author;
	}
	@Override
	public String toString() {
		return "Book [id=" + id + ", name=" + name + ", stock=" + stock + ", price=" + price + ", salesamount="
				+ salesamount + ", publishedby=" + publishedby + ", surface=" + surface + ", onsale=" + onsale
				+ ", detail=" + detail + ", author=" + author + "]";
	}
	
}
