package org.lanqiao.dao;

import org.lanqiao.entity.User;
import org.lanqiao.utils.MyUtils;

public class UserDao extends BaseDao<User> {

	public int insertUser(User u){
		int userId = MyUtils.getId();
		String sql="insert into users values(?,?,?,?,?,?,?,?)";
		int i = update(sql,userId, u.getName(),u.getGender(),u.getProfile(),u.getPwd(),u.getAge(),u.getBalance(),u.getEmail());
		int cartId =MyUtils.getId();
		String sql2 ="insert into carts values(?,?)";
		int j = update(sql2, cartId,userId);
		return j;
	}
	
	public int deleteUser(int id) {
		String sql = "delete from users where id =?";
		int update = update(sql, id);
		return update;
	}

	public int updateUser(User u) {
		String sql ="update users set name=?,gender=?,age=?,profile=?,pwd=?,email= ?,balance=?where id=?";
		int update = update(sql, u.getName(),u.getGender(),u.getAge(),u.getProfile(),u.getPwd(),u.getEmail(),u.getBalance(),u.getId());
		return update;
	}
	
	public User getUser(int id){
		String sql="select * from users where id=?";
		User user =getT(sql, id);
		return user;
	}

	public int checkName(String name) {
		String sql="select name from users where name =?";
		Object e = getE(sql, name);
		return e==null?0:1;
	}

	public User getUser(String name, String pwd) {
		String sql="select * from users where name=?and pwd=?";
		User user = getT(sql, name,pwd);
		return user;
	}

	public User getUserByEmail(String email) {
		String sql="select * from users where email=?";
		User user = getT(sql, email);
		return user;
	}

	public User getUserByEmailAndName(String name, String email) {
		String sql="select * from users where name=?and email=?";
		User user = getT(sql, name,email);
		return user;
	}
}
