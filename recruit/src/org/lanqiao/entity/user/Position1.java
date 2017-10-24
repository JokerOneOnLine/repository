package org.lanqiao.entity.user;

import java.io.Serializable;
import java.util.List;

/**
 * 一级职位实体类
 * @author 渭南师范二期-许园园
 *2017年8月24日 下午4:40:30
 */
public class Position1 implements Serializable {
	
	private static final long serialVersionUID = 6117523426336320614L;

	private Integer id;
	private String name;
	List<Position2> positions2;

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

	public List<Position2> getPositions() {
		return positions2;
	}

	public void setPositions2(List<Position2> positions2) {
		this.positions2 = positions2;
	}

	public Position1() {
		super();
	}

	@Override
	public String toString() {
		return "Position1 [id=" + id + ", name=" + name + ", positions2=" + positions2 + "]";
	}

	public Position1(Integer id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

}
