package org.lanqiao.entity.user;

import java.io.Serializable;

/**
 * 
 * @author 代旭波
 * 2017年8月26日 上午11:33:03
 */
public class WorkExperience implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4343510131952772365L;
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
	public WorkExperience(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public WorkExperience() {
		super();
	}
	@Override
	public String toString() {
		return "WorkExperience [id=" + id + ", name=" + name + "]";
	}
	
	
}
