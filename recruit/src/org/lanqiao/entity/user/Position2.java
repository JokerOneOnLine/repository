package org.lanqiao.entity.user;

import java.io.Serializable;
import java.util.List;
/**
 * 
 * @author layla 
 * 渭南师范二期梁琼
 * 2017年8月24日 下午1:49:24
 */
public class Position2 implements Serializable{
	
	private static final long serialVersionUID = 5258701463634245480L;
	private Integer id;
	private String name;
	private Integer p1Id;
	
	private List<Position> positions;
	public List<Position> getPositions() {
		return positions;
	}
	public void setPositions(List<Position> positions) {
		this.positions = positions;
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
	public Integer getP1Id() {
		return p1Id;
	}
	public void setP1Id(Integer p1Id) {
		this.p1Id = p1Id;
	}
	public Position2() {
		super();
	}
	public Position2(Integer id, String name, Integer p1Id, List<Position> positions) {
		super();
		this.id = id;
		this.name = name;
		this.p1Id = p1Id;
		this.positions = positions;
	}
	public Position2(String name, Integer p1Id, List<Position> positions) {
		super();
		this.name = name;
		this.p1Id = p1Id;
		this.positions = positions;
	}
	@Override
	public String toString() {
		return "Position2 [id=" + id + ", name=" + name + ", p1Id=" + p1Id + ", positions=" + positions + "]";
	}
	
	

}
