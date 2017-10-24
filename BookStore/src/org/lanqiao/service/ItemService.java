package org.lanqiao.service;

import java.util.List;

import org.lanqiao.dao.BookDao;
import org.lanqiao.dao.ItemDao;
import org.lanqiao.entity.Book;
import org.lanqiao.entity.Item;

public class ItemService {

	public List<Item> getItemsByCartId(int cartid) {
		
		List<Item> items =new ItemDao().getItemsByCartId(cartid);
		setBook(items);
		return items;
	}

	public void setBook(List<Item> items) {
		for (Item i:items) {
			Book book = new BookDao().getBookByItemId(i.getId());
			i.setBook(book);
		}
	}

	public void remove(int itemid) {
		new ItemDao().remove(itemid);
	}
}
