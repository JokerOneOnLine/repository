package org.lanqiao.dao;

import java.lang.reflect.ParameterizedType;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.lanqiao.utils.MyUtils;

public class BaseDao<T> {
	
	public int  insert(String sql,Object...args) {
		Connection conn=null;
		
		conn = MyUtils.conns.get();
		int update=0;
		try {
			update = MyUtils.qr.update(conn, sql);
			return update;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
	}
	/**
	 * 查询一个
	 * @param sql
	 * @param args
	 * @return
	 */
	public T getT(String sql,Object... args){
		T t= null;
		Connection conn = null;
		try {
			conn = MyUtils.conns.get();
			Class<T> c = (Class) ((ParameterizedType) (this.getClass().getGenericSuperclass())).getActualTypeArguments()[0];
			BeanHandler<T> rsh = new BeanHandler<T>(c);
			t = MyUtils.qr.query(conn, sql, rsh,args);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
		return t;
	}
	/**
	 * 通用的增加、删除、更新方法
	 * 
	 */
	public int update(String sql, Object... args) {
		Connection conn = null;
		try {
			conn = MyUtils.conns.get();
			int i = MyUtils.qr.update(conn, sql, args);
			return i;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
	}
	/**
	 * 
	 * 查询多个
	 */
	public List<T> getTs(String sql,Object ...args){
		List<T> ts =null;
		Connection conn=null;
		try {
			conn = MyUtils.conns.get();
			Class<T> c =(Class)((ParameterizedType)(this.getClass().getGenericSuperclass())).getActualTypeArguments()[0];
			BeanListHandler<T> rsh=new BeanListHandler<T>(c);
			ts = MyUtils.qr.query(conn, sql, rsh,args);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
		return ts;
	}
	/**
	 * 查询一条
	 * @param sql
	 * @param args
	 * @return
	 */
	public <E> E getE(String sql,Object ...args){
		ScalarHandler<E> rsh=new ScalarHandler<E>();
		E ee = null;
		Connection conn = null;
		try {
			conn = MyUtils.conns.get();
			ee=MyUtils.qr.query(conn,sql, rsh,args);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
		return ee;
	}
}

