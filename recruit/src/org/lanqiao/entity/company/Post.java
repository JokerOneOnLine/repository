package org.lanqiao.entity.company;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.lanqiao.entity.user.EducationalBackground;
import org.lanqiao.entity.user.Position;
import org.lanqiao.entity.user.WorkExperience;
import org.lanqiao.util.UserUtil;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * "发布新职位"需要的类 渭南师范二期-李晨 2017年8月25日上午9:52:24
 *
 */
public class Post implements Serializable {

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
	@DateTimeFormat(pattern="yyyyMMddhhmmss")
	private Date Date=new Date();
	private String eName;
	private String workName;
	private String p2Name;
	private String p3Name;
	
	private BaseInfo companyBaseInfo;
	
	

	public BaseInfo getCompanyBaseInfo() {
		return companyBaseInfo;
	}

	public void setCompanyBaseInfo(BaseInfo companyBaseInfo) {
		this.companyBaseInfo = companyBaseInfo;
	}


	private List<PostAndResume> postAndResumes;
	
	public List<PostAndResume> getPostAndResumes() {
		return postAndResumes;
	}

	public void setPostAndResumes(List<PostAndResume> postAndResumes) {
		this.postAndResumes = postAndResumes;
	}

	public String getP2Name() {
		return p2Name;
	}

	public void setP2Name(String p2Name) {
		this.p2Name = p2Name;
	}

	public String getP3Name() {
		return p3Name;
	}

	public void setP3Name(String p3Name) {
		this.p3Name = p3Name;
	}

	public String getWorkName() {
		return workName;
	}

	public void setWorkName(String workName) {
		this.workName = workName;
	}

	public String geteName() {
		return eName;
	}

	public void seteName(String eName) {
		this.eName = eName;
	}


	private CompanyRegist companyRegist; // CompanyRegist 公司登陆
	
	private WorkExperience workExperiences;
	private EducationalBackground educationalBackgrounds;
	private Position position;

	public Position getPosition() {
		return position;
	}

	public void setPosition(Position position) {
		this.position = position;
	}

	public WorkExperience getWorkExperiences() {
		return workExperiences;
	}

	public void setWorkExperiences(WorkExperience workExperiences) {
		this.workExperiences = workExperiences;
	}

	public EducationalBackground getEducationalBackgrounds() {
		return educationalBackgrounds;
	}

	public void setEducationalBackgrounds(EducationalBackground educationalBackgrounds) {
		this.educationalBackgrounds = educationalBackgrounds;
	}

	public void setCompanyRegist(CompanyRegist companyRegist) {
		this.companyRegist = companyRegist;
	}

	public CompanyRegist getCompanyRegist() {
		return companyRegist;
	}

	public int getCompanyID() {
		return companyID;
	}

	public void setCompanyID(int companyID) {
		this.companyID = companyID;
	}

	

	

	public int  getId() {
		return id;
	}

	public void setId(int  id) {
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

	
	public String getStrDate(){
		return UserUtil.DateToStr(Date);
	}

	

	public Date getDate() {
		return Date;
	}

	public void setDate(Date date) {
		this.Date = date;
	}

	public Post() {
		super();
	}

	
	

	

	public int getOnline() {
		return online;
	}
	
	public void setOnline(int online) {
		this.online = online;
	}
	// 没有部门的构造器
	
	public Post(int companyID, Integer id, int postType, int postName, String jobCategory, double minSalary,
			double maxSalary, String workCity, Integer workExperience, Integer education, String jobTempt,
			String jobInfo, String workSpeace, String acceptEmail, int online, java.util.Date date, String eName,
			String workName, String p2Name, String p3Name, CompanyRegist companyRegist, WorkExperience workExperiences,
			EducationalBackground educationalBackgrounds, Position position) {
		super();
		this.companyID = companyID;
		this.id = id;
		this.postType = postType;
		this.postName = postName;
		this.jobCategory = jobCategory;
		this.minSalary = minSalary;
		this.maxSalary = maxSalary;
		this.workCity = workCity;
		this.workExperience = workExperience;
		this.education = education;
		this.jobTempt = jobTempt;
		this.jobInfo = jobInfo;
		this.workSpeace = workSpeace;
		this.acceptEmail = acceptEmail;
		this.online = online;
		Date = date;
		this.eName = eName;
		this.workName = workName;
		this.p2Name = p2Name;
		this.p3Name = p3Name;
		this.companyRegist = companyRegist;
		this.workExperiences = workExperiences;
		this.educationalBackgrounds = educationalBackgrounds;
		this.position = position;
	}

	// 有部门的构造器
	
	

	public Post(int companyID, int id, int postType, int postName, String department, String jobCategory,
			double minSalary, double maxSalary, String workCity, Integer workExperience, Integer education,
			String jobTempt, String jobInfo, String workSpeace, String acceptEmail, int online, java.util.Date date,
			String eName, String workName, String p2Name, String p3Name, CompanyRegist companyRegist,
			WorkExperience workExperiences, EducationalBackground educationalBackgrounds, Position position) {
		super();
		this.companyID = companyID;
		this.id = id;
		this.postType = postType;
		this.postName = postName;
		this.department = department;
		this.jobCategory = jobCategory;
		this.minSalary = minSalary;
		this.maxSalary = maxSalary;
		this.workCity = workCity;
		this.workExperience = workExperience;
		this.education = education;
		this.jobTempt = jobTempt;
		this.jobInfo = jobInfo;
		this.workSpeace = workSpeace;
		this.acceptEmail = acceptEmail;
		this.online = online;
		Date = date;
		this.eName = eName;
		this.workName = workName;
		this.p2Name = p2Name;
		this.p3Name = p3Name;
		this.companyRegist = companyRegist;
		this.workExperiences = workExperiences;
		this.educationalBackgrounds = educationalBackgrounds;
		this.position = position;
	}

	@Override
	public String toString() {
		return "Post [companyID=" + companyID + ", id=" + id + ", postType=" + postType + ", postName=" + postName
				+ ", department=" + department + ", jobCategory=" + jobCategory + ", minSalary=" + minSalary
				+ ", maxSalary=" + maxSalary + ", workCity=" + workCity + ", workExperience=" + workExperience
				+ ", education=" + education + ", jobTempt=" + jobTempt + ", jobInfo=" + jobInfo + ", workSpeace="
				+ workSpeace + ", acceptEmail=" + acceptEmail + ", online=" + online + ", Date=" + Date + ", eName="
				+ eName + ", workName=" + workName + ", p2Name=" + p2Name + ", p3Name=" + p3Name + ", companyBaseInfo="
				+ companyBaseInfo + ", postAndResumes=" + postAndResumes + ", companyRegist=" + companyRegist
				+ ", workExperiences=" + workExperiences + ", educationalBackgrounds=" + educationalBackgrounds
				+ ", position=" + position + "]";
	}

	

//	@Override
//	public String toString() {
//		return "Post [companyID=" + companyID + ", Id=" + Id + ", postType=" + postType + ", postName=" + postName
//				+ ", department=" + department + ", jobCategory=" + jobCategory + ", minSalary=" + minSalary
//				+ ", maxSalary=" + maxSalary + ", workCity=" + workCity + ", workExperience=" + workExperience
//				+ ", education=" + education + ", jobTempt=" + jobTempt + ", jobInfo=" + jobInfo + ", workSpeace="
//				+ workSpeace + ", acceptEmail=" + acceptEmail + ", online=" + online + ", Date=" + Date
//				+ ", companyRegist=" + companyRegist + "]";
//	}

	

}
