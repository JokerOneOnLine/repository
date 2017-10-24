package org.lanqiao.entity.company;

import java.io.Serializable;
import java.util.Date;

import org.lanqiao.util.UserUtil;

/**
 * 职位的详细信息展示内容
 * @author layla 
 * 渭南师范二期梁琼
 * 2017年9月27日 下午8:19:19
 */
public class postDetail implements Serializable{
	
	@Override
	public String toString() {
		return "postDetail [companyID=" + companyID + ", id=" + id + ", postType=" + postType + ", postName=" + postName
				+ ", department=" + department + ", jobCategory=" + jobCategory + ", minSalary=" + minSalary
				+ ", maxSalary=" + maxSalary + ", workCity=" + workCity + ", workExperience=" + workExperience
				+ ", education=" + education + ", jobTempt=" + jobTempt + ", jobInfo=" + jobInfo + ", workSpeace="
				+ workSpeace + ", acceptEmail=" + acceptEmail + ", online=" + online + ", Date=" + Date + ", ebName="
				+ ebName + ", weName=" + weName + ", p2name=" + p2name + ", p3name=" + p3name + ", companyName="
				+ companyName + ", companyLogo=" + companyLogo + ", companyDomain=" + companyDomain + ", scale=" + scale
				+ ", companyInfo=" + companyInfo + ", companyUrl=" + companyUrl + "]";
	}
	private static final long serialVersionUID = 2522649765740124071L;
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
	private String acceptEmail; // 接收邮箱
	private int online = isOnline;
	private Date Date=new Date();

	private String ebName;
	private String weName;
	private String p2name; // CompanyRegist 公司登陆
	private String p3name;
	
	private String companyName;
	private String companyLogo; 	//logo
	private String companyDomain;   //领域
	private String scale;			//规模
	private String companyInfo;
	private String companyUrl;		//网址
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
	public Date getDate() {
		return Date;
	}
	public String getStrDate(){
		return UserUtil.DateToStr(Date);
	}
	
	public void setDate(Date date) {
		Date = date;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanyLogo() {
		return companyLogo;
	}
	public void setCompanyLogo(String companyLogo) {
		this.companyLogo = companyLogo;
	}
	public String getCompanyDomain() {
		return companyDomain;
	}
	public void setCompanyDomain(String companyDomain) {
		this.companyDomain = companyDomain;
	}
	public String getScale() {
		return scale;
	}
	public void setScale(String scale) {
		this.scale = scale;
	}
	public String getCompanyInfo() {
		return companyInfo;
	}
	public void setCompanyInfo(String companyInfo) {
		this.companyInfo = companyInfo;
	}
	public String getCompanyUrl() {
		return companyUrl;
	}
	public void setCompanyUrl(String companyUrl) {
		this.companyUrl = companyUrl;
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
