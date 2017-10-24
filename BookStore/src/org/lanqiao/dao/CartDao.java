package org.lanqiao.dao;

import org.lanqiao.entity.Cart;

public class CartDao extends BaseDao<Cart>{

	public Cart getCartByUserId(int userId) {
		String sql="select * from carts where userid=?";
		Cart t = getT(sql, userId);
		return t;
	}
	
}
