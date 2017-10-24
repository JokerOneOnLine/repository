package org.lanqiao.entity;

import java.util.List;

public class Cart {

	private int id;
	private List<Item> items;
	 
	public double getTotalPrice() {
		double total =0;
		for (Item i : items) {
			total +=i.getItemPrice();
		}
		return total;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public List<Item> getItems() {
		return items;
	}
	public void setItems(List<Item> items) {
		this.items = items;
	}
	public double getItemPrice() {
		return 0;
	}
	public Cart() {
		super();
	}
}
