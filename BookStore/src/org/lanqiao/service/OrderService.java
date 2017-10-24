package org.lanqiao.service;

import java.util.List;

import org.lanqiao.dao.BookDao;
import org.lanqiao.dao.ConsigneeDao;
import org.lanqiao.dao.ItemDao;
import org.lanqiao.dao.OrderDao;
import org.lanqiao.dao.UserDao;
import org.lanqiao.entity.Book;
import org.lanqiao.entity.Consignee;
import org.lanqiao.entity.Item;
import org.lanqiao.entity.Order;
import org.lanqiao.entity.User;

public class OrderService {

	public int order(User user, int consigneeId) {
		//生成订单号 ，获取订单的id
		Order order= new Order(user.getCart().getTotalPrice(),user.getId());
		insert(order,consigneeId);
		ItemDao iDao = new ItemDao();
		BookDao bookDao = new BookDao();
		//更改交易项信息 
		//购物车  null -----订单
		for (Item i:user.getCart().getItems()) {
			iDao.order(i,order.getId());
			//减库存 ，加销量
			Book book = i.getBook();
			book.setStock(book.getStock()-i.getCount());
			book.setSalesamount(book.getSalesamount()+i.getCount());
			bookDao.update(book);
		}
		//扣钱
		user.setBalance(user.getBalance()-user.getCart().getTotalPrice());
		new UserDao().updateUser(user);
		
		return order.getId();
	}

	private void insert(Order order, int consigneeId) {

		 new OrderDao().insert(order,consigneeId);
	}

	public List<Order> getOrdersByUserId(int id) {
		 List<Order> orders = new OrderDao(). getOrdersByUserId(id);
		setInfo(orders);
		return orders;
	}

	public void setInfo(List<Order> orders) {
		 for(Order o:orders){
			 //查询订单的交易项
			setInfo(o);
		 }
	}
	public List<Order> getAll() {
		List<Order> orders =new OrderDao().getAll();
		setInfo(orders);
		return orders;
	}

	public int send(int orderId) {
		OrderDao oDao = new OrderDao();
		Order order = oDao.getById(orderId);
		order.setIsSend(Order.YES);
		return oDao.update(order);
	}
	
	public void setInfo(Order o){
		 ItemService itemService = new ItemService();
		 List<Item> items = new ItemDao().getItemsByOrderId(o.getId());
		 o.setItems(items);
		 //交易项的图书信息
		 itemService.setBook(items);
		 //訂單的收貨信息
		Consignee consignee = new ConsigneeDao().getConsigneesByOrderId(o.getId());
		o.setConsignee(consignee);
	}

	public Order getById(int orderid) {
		Order order = new OrderDao().getById(orderid);
		setInfo(order);
		return order;
	}

	public int eval(Order order) {
		order.setIsevaluated(Order.YES);
		OrderDao oDao= new OrderDao();
		int update = oDao.update(order);
		return update;
	}

	

}
