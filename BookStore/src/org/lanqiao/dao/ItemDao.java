package org.lanqiao.dao;

import java.util.List;

import org.lanqiao.entity.Item;
import org.lanqiao.utils.MyUtils;

public class ItemDao extends BaseDao<Item>{

	public int update(Item item) {

		String sql="update items set bookid=?,count=?,itemprice=?,cartid=?,orderid=?where id=?";
		return update(sql, item.getBook().getId(),item.getCount(),item.getItemPrice(),item.getCartId(),item.getOrderId(),item.getId());
	}

	public int insert(Item item) {
		int id = MyUtils.getId();
		String sql ="insert into items(id,bookid,count,itemprice,cartid) values (?,?,?,?,?)";
		int i = update(sql, id,item.getBook().getId(),item.getCount(),item.getItemPrice(),item.getCartId());
		return i;
	}

	public List<Item> getItemsByCartId(int id) {
		String sql="select * from items where cartid=?";
		List<Item> ts = getTs(sql, id);
		return ts;
	}

	public void remove(int itemid) {
		String sql="delete from items where id=?";
		int update = update(sql, itemid);
	}

	public int order(Item i, int orderId) {

		String sql="update items set cartid =null,orderid=? where id =?";
		return update(sql, orderId,i.getId());
	}


	public List<Item> getItemsByOrderId(int orderId) {
		String sql="select * from items where orderid=?";
		List<Item> ts = getTs(sql, orderId);
		return ts;
	}

	


}
