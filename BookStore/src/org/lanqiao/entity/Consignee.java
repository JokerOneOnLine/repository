package org.lanqiao.entity;

public class Consignee {

	private int id;
	private String name;
	private String addr;
	private String tel;
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
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Consignee(String name, String addr, String tel) {
		super();
		this.name = name;
		this.addr = addr;
		this.tel = tel;
	}
	public Consignee(int id, String name, String addr, String tel) {
		super();
		this.id = id;
		this.name = name;
		this.addr = addr;
		this.tel = tel;
	}
	public Consignee() {
		super();
	}
	@Override
	public String toString() {
		return "Consignee [id=" + id + ", name=" + name + ", addr=" + addr + ", tel=" + tel + "]";
	}
	
	
}
