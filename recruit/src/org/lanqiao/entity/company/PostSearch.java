package org.lanqiao.entity.company;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.lanqiao.entity.user.EducationalBackground;
import org.lanqiao.entity.user.Position;
import org.lanqiao.entity.user.WorkExperience;
import org.lanqiao.util.UserUtil;

/**
 * "发布新职位"需要的类 渭南师范二期-李晨 2017年8月25日上午9:52:24
 *
 */
public class PostSearch implements Serializable {

	private static final long serialVersionUID = -3381197633456735702L;
	private static final String fullTime = "全职"; // 全职
	private static final String partTime = "兼职"; // 兼职
	private static final String internship = "实习"; // 实习

	private static final int isOnline = 1; // 职位有效
	private static final int notOnline = 0; // 职位无效

	private int companyID; // 公司的ID
	private int id;
	private int postType; // 职位类别 (在数据库里面postType绑定的是position2这张表)
	private int postName; // 职位名称 (在数据库里面postName绑定的是position3这张表)
	private String department = null; // (所属)部门
	private String jobCategory=partTime ; // 工作性质
	private double minSalary;
	private double maxSalary;
	private String workCity;
	private Integer workExperience; // 工作经验
	private Integer education; // 学历
	private String jobTempt; // 职位诱惑
	private String jobInfo; // 职位描述
	private String workSpeace; // 工作地点
	private String acceptEmail; // 接收邮箱
	private int online = isOnline;
	private Date Date=new Date();

	private String p2name; // CompanyRegist 公司登陆
	private String p3name;
	private String logo;
	private String ebName;
	private String weName;
	private String scale;
	private String domain;
	private String companyName;
	private List<String> tags;
	private String founderName;
	
	
	
	
	public String getFounderName() {
		return founderName;
	}
	public void setFounderName(String founderName) {
		this.founderName = founderName;
	}
	public String getScale() {
		return scale;
	}
	public void setScale(String scale) {
		this.scale = scale;
	}
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public List<String> getTags() {
		return tags;
	}
	public void setTags(List<String> tags) {
		this.tags = tags;
	}
	public int getCompanyID() {
		return companyID;
	}
	public void setCompanyID(int companyID) {
		this.companyID = companyID;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPostType() {
		return postType;
	}
	public void setPostType(int postType) {
		this.postType = postType;
	}
	public int getPostName() {
		return postName;
	}
	public void setPostName(int postName) {
		this.postName = postName;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getJobCategory() {
		return jobCategory;
	}
	public void setJobCategory(String jobCategory) {
		this.jobCategory = jobCategory;
	}
	public double getMinSalary() {
		return minSalary;
	}
	public void setMinSalary(double minSalary) {
		this.minSalary = minSalary;
	}
	public double getMaxSalary() {
		return maxSalary;
	}
	public void setMaxSalary(double maxSalary) {
		this.maxSalary = maxSalary;
	}
	public String getWorkCity() {
		return workCity;
	}
	public void setWorkCity(String workCity) {
		this.workCity = workCity;
	}
	public Integer getWorkExperience() {
		return workExperience;
	}
	public void setWorkExperience(Integer workExperience) {
		this.workExperience = workExperience;
	}
	public Integer getEducation() {
		return education;
	}
	public void setEducation(Integer education) {
		this.education = education;
	}
	public String getJobTempt() {
		return jobTempt;
	}
	public void setJobTempt(String jobTempt) {
		this.jobTempt = jobTempt;
	}
	public String getJobInfo() {
		return jobInfo;
	}
	public void setJobInfo(String jobInfo) {
		this.jobInfo = jobInfo;
	}
	public String getWorkSpeace() {
		return workSpeace;
	}
	public void setWorkSpeace(String workSpeace) {
		this.workSpeace = workSpeace;
	}
	public String getAcceptEmail() {
		return acceptEmail;
	}
	public void setAcceptEmail(String acceptEmail) {
		this.acceptEmail = acceptEmail;
	}
	public int getOnline() {
		return online;
	}
	public void setOnline(int online) {
		this.online = online;
	}
	
	public String getStrDate(){
		return UserUtil.DateToStr(Date);
	}
	
	public Date getDate() {
		return Date;
	}
	public void setDate(Date date) {
		Date = date;
	}
	public String getP2name() {
		return p2name;
	}
	public void setP2name(String p2name) {
		this.p2name = p2name;
	}
	public String getP3name() {
		return p3name;
	}
	public void setP3name(String p3name) {
		this.p3name = p3name;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public String getEbName() {
		return ebName;
	}
	public void setEbName(String ebName) {
		this.ebName = ebName;
	}
	public String getWeName() {
		return weName;
	}
	public void setWeName(String weName) {
		this.weName = weName;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public static String getFulltime() {
		return fullTime;
	}
	public static String getParttime() {
		return partTime;
	}
	public static String getInternship() {
		return internship;
	}
	public static int getIsonline() {
		return isOnline;
	}
	public static int getNotonline() {
		return notOnline;
	}

}
