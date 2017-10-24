package org.lanqiao.entity.user;

import java.io.Serializable;

/**
 * 三级职位实体类
 * 渭南师范二期-杨璐
 * @author 渭南师范二期-许园园
 *2017年8月24日 下午2:46:34
 */
public class Position implements Serializable {
	
	private static final long serialVersionUID = 7833837331325353516L;
	private int id;
	private String name;
	private Integer p2Id;
	
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
	public Integer getP2Id() {
		return p2Id;
	}
	public void setP2Id(Integer p2Id) {
		this.p2Id = p2Id;
	}
	public Position(int id, String name, Integer p2Id) {
		super();
		this.id = id;
		this.name = name;
		this.p2Id = p2Id;
	}
	public Position(String name, Integer p2Id) {
		super();
		this.name = name;
		this.p2Id = p2Id;
	}
	
	
	public Position() {
		
	}
	@Override
	public String toString() {
		return "Position [id=" + id + ", name=" + name + ", p2Id=" + p2Id + "]";
	}
}
