package org.lanqiao.service;

import java.util.List;

import org.lanqiao.dao.CartDao;
import org.lanqiao.entity.Cart;
import org.lanqiao.entity.Item;

public class CartService {

	public Cart getCartByUserId(int id) {
		//购物车
		Cart cart = new CartDao().getCartByUserId(id);
		//交易项
		List<Item> items=new ItemService().getItemsByCartId(cart.getId());
		//List<Item> items =new ItemDao().getItemsByCartId(cart.getId());
		cart.setItems(items);
		return cart;
	}

}
