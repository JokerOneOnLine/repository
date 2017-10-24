package org.lanqiao.entity.user;

import java.io.Serializable;

/**
 * @author 渭南师范二期-许园园 2017年9月9日 上午11:19:06 修改
 * @author渭南师范二期—杨璐 2017年8月23日下午12:05:30
 */

public class MyResume implements Serializable {
	private static final long serialVersionUID = 1L;
	private static final int notHandle=1;
	private static final int noticed=2;
	private static final int unsuitable=3;
	private static final int entry=4;
	
	private Integer id;
	// 教育经历
	private Education education;
	// 实习经历
	private Practice practice;
	private HopeJob hopeJob;
	private Project project;
	private Integer userId;
	private int status=notHandle;
	private User user;
	
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public HopeJob getHopeJob() {
		return hopeJob;
	}

	public void setHopeJob(HopeJob hopeJob) {
		this.hopeJob = hopeJob;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Education getEducation() {
		return education;
	}

	public void setEducation(Education education) {
		this.education = education;
	}

	public Practice getPractice() {
		return practice;
	}

	public MyResume() {
		super();
	}
	

//	@Override
//	public String toString() {
//		return "MyResume [id=" + id + ", education=" + education + ", practice=" + practice + ", hopeJob=" + hopeJob
//				+ ", project=" + project + ", userId=" + userId + "]";
//	}

	public MyResume(Education education, Practice practice) {
		super();
		this.education = education;
		this.practice = practice;
	}

	@Override
	public String toString() {
		return "MyResume [id=" + id + ", education=" + education + ", practice=" + practice + ", hopeJob=" + hopeJob
				+ ", project=" + project + ", user=" + user + "]";
	}

	public void setPractice(Practice practice) {
		this.practice = practice;
	}

}
