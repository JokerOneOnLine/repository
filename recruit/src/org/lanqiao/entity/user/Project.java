package org.lanqiao.entity.user;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.lanqiao.util.UserUtil;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * 渭南师范二期-王笑-杨璐 2017年8月27日 上午11:41:51
 * 
 * @author wld
 *
 */

public class Project implements Serializable {
	private static final long serialVersionUID = -1296662399974198703L;
	private int id;
	private String projectName;
	private String duty;
	@DateTimeFormat(pattern = "yyyyMMdd")
	private Date startTime;
	@DateTimeFormat(pattern = "yyyyMMdd")
	private Date endTime;
	private String description; // 简要描述
	private Integer myResumeId; // 简历id

	public String getStrStartTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		String format = sdf.format(this.startTime);
		return format;
	}
	
	public String getStrEndTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		String format = sdf.format(this.endTime);
		return format;
	}
	
	public String getStrDate() {
		return UserUtil.dateToString(this.startTime);
	}
	public String getEndDate() {
		return UserUtil.dateToString(this.endTime);
	}

	public int getId() {
		return id;
	}

	public Integer getMyResumeId() {
		return myResumeId;
	}

	public void setMyResumeId(Integer myResumeId) {
		this.myResumeId = myResumeId;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getDuty() {
		return duty;
	}

	public void setDuty(String duty) {
		this.duty = duty;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Project(int id, String projectName, String duty, Date startTime, Date endTime, String description) {
		super();
		this.id = id;
		this.projectName = projectName;
		this.duty = duty;
		this.startTime = startTime;
		this.endTime = endTime;
		this.description = description;
	}

	public Project(String projectName, String duty, Date startTime, Date endTime, String description) {
		super();
		this.projectName = projectName;
		this.duty = duty;
		this.startTime = startTime;
		this.endTime = endTime;
		this.description = description;
	}

	public Project() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		return "Project [id=" + id + ", projectName=" + projectName + ", duty=" + duty + ", startTime=" + startTime
				+ ", endTime=" + endTime + ", description=" + description + ", myResumeId=" + myResumeId + "]";
	}

}
