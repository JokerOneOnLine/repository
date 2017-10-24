package org.lanqiao.dao;

import java.util.List;

import org.lanqiao.entity.Order;
import org.lanqiao.utils.MyUtils;

public class OrderDao extends BaseDao<Order>{

	public void insert(Order order,int consigneeId) {
		int orderId = MyUtils.getId();
		String sql="insert into orders(id,odate,price,isevaluated,userid,consigneeid) values(?,?,?,?,?,?)";
		int i = update(sql, orderId,new java.sql.Date(order.getoDate().getTime()),order.getPrice(),order.getIsevaluated(),order.getUserId(),consigneeId);
		if(i!=0){
			order.setId(orderId);
		}
	}

	public List<Order> getOrdersByUserId(int id) {
		String sql="select * from orders where userid = ?";
		List<Order> list = getTs(sql, id);
		return list;
	}

	public List<Order> getAll() {
		String sql="select * from orders";
		List<Order> list = getTs(sql);
		return list;
	}

	public Order getById(int orderId) {
		String sql="select * from orders where id =?";
		return getT(sql, orderId);
	}

	public int update(Order order) {
		String sql="update orders set isevaluated =?,issend=? where id =?";
		return  update(sql, order.getIsevaluated(),order.getIsSend(),order.getId());
	}

}
