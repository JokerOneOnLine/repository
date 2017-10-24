package org.lanqiao.entity.admin;

/**
 * 企业管理员实体类 渭南师范二期-程建波 2017年8月26日上午8:51:44
 */
public class Admin {
	private Integer id;
	private String name;
	private String password;
	private String type;

	

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Admin(Integer id, String name, String password) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
	}

	public Admin(String name, String password) {
		super();
		this.name = name;
		this.password = password;
	}

	public Admin() {
		super();
	}

	@Override
	public String toString() {
		return "Admin [id=" + id + ", name=" + name + ", password=" + password + ", type=" + type + "]";
	}

}
