package org.lanqiao.entity.user;

import java.io.Serializable;
/**
 * 
 * 渭南师范蓝桥二期-艾辉
 * 2017年8月28日 下午12:52:15
 *@author Administrator
 */
public class HopeSalary2 implements Serializable{
	
	private static final long serialVersionUID = 2760583949308754898L;
	private int id;
	private String name;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public HopeSalary2(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public HopeSalary2() {
		super();
	}
	public HopeSalary2(String name) {
		super();
		this.name = name;
	}
	@Override
	public String toString() {
		return "HopeSalary [id=" + id + ", name=" + name + "]";
	}
}
