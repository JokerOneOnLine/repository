 package org.lanqiao.service;

import java.util.List;

import org.lanqiao.dao.BookDao;
import org.lanqiao.dao.ConsigneeDao;
import org.lanqiao.dao.ItemDao;
import org.lanqiao.dao.UserDao;
import org.lanqiao.entity.Book;
import org.lanqiao.entity.Cart;
import org.lanqiao.entity.Consignee;
import org.lanqiao.entity.Item;
import org.lanqiao.entity.User;

public class UserService {
	public int  checkName(String name) {
		return new UserDao().checkName(name);
	}

	public int insert(User u) {
		return new UserDao().insertUser(u);
	}

	public User getUser(String name, String pwd) {
		User user = new UserDao().getUser(name, pwd);
		CartService sc =new CartService();
		Cart c =sc.getCartByUserId(user.getId());
		user.setCart(c);
		return user;
	}

	public int update(User u) {
		return new UserDao().updateUser(u);
	}

	public User getUserByEmail(String email) {
		return new UserDao().getUserByEmail(email);
	}

	public int addToCart(User u, int bookid,int count, boolean isAdd) {
	    List<Item> items = u.getCart().getItems();
	    ItemDao iDao= new ItemDao();
	    Item item=null;
	    //便利交易项
	    for (Item i : items) {
			if (i.getBook().getId()==bookid) {
				item = i;
				break;
			}
		}
	    //有的话就增加
	    if (item!=null) {
	    	if (isAdd) {
	    		int stock =item.getBook().getStock();
	    		int c =item.getCount();
	    		if (c==stock) {
					return -1;
				}
	    		item.add(count);
			}else {
				item.setItemCount(count);
			}
			 //更新数据库
			int i =iDao.update(item);
			return i;
		}else {
			//没有就创建
			Book book =new  BookDao().get(bookid);
			item = new Item(book,count,u.getCart().getId());
			 //插入数据库
			int i =iDao.insert(item);
			if (i!=0) {
				u.getCart().getItems().add(item);
				return i;
			}
			return i;
		}
	}

	public User getUserByEmailAndName(String name, String email) {
		return new UserDao().getUserByEmailAndName(name,email);
	}

	/**
	 * 用户收货信息
	 * @param id
	 * @return
	 */
	public List<Consignee> getConsigneesByUserId(int id) {
		return  new ConsigneeDao().getConsigneesByUserId(id);
	}
	
}
