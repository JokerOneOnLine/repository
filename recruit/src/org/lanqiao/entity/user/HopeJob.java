package org.lanqiao.entity.user;

import java.io.Serializable;
import java.util.List;

/**
 * 渭南师范二期-杨璐 简历表中
 *  期望工作 
 * 渭南师范二期-易孝凡
 * 
 * @author Administrator 2017年8月23日 下午2:23:57
 */

public class HopeJob implements Serializable {


	private static final long serialVersionUID = 1L;

	private Integer myResumeId; // 简历
	private String city; // 期望城市
	private String jobType; // 期望工作
	private String hopeSalary;// 期望薪资
	private String description; // 补充说明
	private String hopejob;

	private List<Position> positions; // 职位
	private Integer id;
	private Integer positionId;
	
	public String getHopejob() {
		return hopejob;
	}

	public void setHopejob(String hopejob) {
		this.hopejob = hopejob;
	}

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getPositionId() {
		return positionId;
	}

	public void setPositionId(Integer positionId) {
		this.positionId = positionId;
	}

	public List<Position> getPositions() {
		return positions;
	}

	public void setPositions(List<Position> positions) {
		this.positions = positions;
	}

	public Integer getMyResumeId() {
		return myResumeId;
	}

	public void setMyResumeId(Integer myResumeId) {
		this.myResumeId = myResumeId;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getHopeSalary() {
		return hopeSalary;
	}

	public void setHopeSalary(String hopeSalary) {
		this.hopeSalary = hopeSalary;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public HopeJob() {
		super();
	}

	@Override
	public String toString() {
		return "HopeJob [myResumeId=" + myResumeId + ", city=" + city + ", jobType=" + jobType + ", hopeSalary="
				+ hopeSalary + ", description=" + description + ", hopejob=" + hopejob + ", positions=" + positions
				+ ", id=" + id + ", positionId=" + positionId + "]";
	}

}
