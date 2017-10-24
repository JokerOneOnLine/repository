package org.lanqiao.entity.user;

public class HopeSalary {
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
	public HopeSalary(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public HopeSalary() {
		super();
	}
	public HopeSalary(String name) {
		super();
		this.name = name;
	}
	@Override
	public String toString() {
		return "HopeSalary [id=" + id + ", name=" + name + "]";
	}
}
