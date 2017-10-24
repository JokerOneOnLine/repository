package org.lanqiao.entity.user;

import java.io.Serializable;

/**
 * 
 * @author 代旭波
 * 2017年8月26日 上午11:33:26
 */
public class EducationalBackground implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 6563368345073408067L;
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
	public EducationalBackground(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public EducationalBackground() {
		super();
	}
	@Override
	public String toString() {
		return "EducationalBackground [id=" + id + ", name=" + name + "]";
	}
	
	
}
