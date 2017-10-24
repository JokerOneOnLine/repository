package org.lanqiao.entity.user;

import java.io.Serializable;
/**
 * 
 * @author layla 
 * 渭南师范二期梁琼
 * 2017年8月24日 上午10:47:20
 */
public class UserHopeJob implements Serializable{

	private static final long serialVersionUID = -3922616904917984071L;
	private Integer id;
	private String name;
	private Integer hopeJobId;   
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
	public Integer getHopeJobId() {
		return hopeJobId;
	}
	public void setHopeJobId(Integer hopeJobId) {
		this.hopeJobId = hopeJobId;
	}
	public UserHopeJob(String name, Integer hopeJobId) {
		super();
		this.name = name;
		this.hopeJobId = hopeJobId;
	}
	public UserHopeJob() {
		super();
	}
	public UserHopeJob(Integer id, String name, Integer hopeJobId) {
		super();
		this.id = id;
		this.name = name;
		this.hopeJobId = hopeJobId;
	}
	@Override
	public String toString() {
		return "UserHopeJob [id=" + id + ", name=" + name + ", hopeJobId=" + hopeJobId + "]";
	}
	
}
