package org.lanqiao.entity.user;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * @author 杨璐 简历只有一个
 * @author 代旭波 2017年8月23日 上午11:33:53
 */
public class User implements Serializable {

	private static final long serialVersionUID = 144568426943812195L;

	public static final int FEMALE = 0;
	public static final int MALE = 1;

	private Integer id;
	private String email;
	private String pwd;
	private String name = null;
	private Date birth = new Date();
	private int gender = MALE;
	private String addr = null;
	private String tel;
	private String profile;//头像
	private String declaration;//个人宣告
	private String position3Name;
	private Integer position3;
	private String educationName;
	private Integer education;
	private String workName;//工作经验
	private Integer workyear;
	private MyResume myResume;
	
	public String getStrBirth(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String format = sdf.format(this.birth);
		return format;
	}
	
	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

//	public String getWorkyear() {
//		return workyear;
//	}
//
//	public void setWorkyear(String workyear) {
//		this.workyear = workyear;
//	}
	

	public String getDeclaration() {
		return declaration;
	}

	public String getPosition3Name() {
		return position3Name;
	}

	public void setPosition3Name(String position3Name) {
		this.position3Name = position3Name;
	}

	public Integer getPosition3() {
		return position3;
	}

	public void setPosition3(Integer position3) {
		this.position3 = position3;
	}

	public String getEducationName() {
		return educationName;
	}

	public void setEducationName(String educationName) {
		this.educationName = educationName;
	}

	public Integer getEducation() {
		return education;
	}

	public void setEducation(Integer education) {
		this.education = education;
	}

	public String getWorkName() {
		return workName;
	}

	public void setWorkName(String workName) {
		this.workName = workName;
	}

	public Integer getWorkyear() {
		return workyear;
	}

	public void setWorkyear(Integer workyear) {
		this.workyear = workyear;
	}

	public void setDeclaration(String declaration) {
		this.declaration = declaration;
	}

	public MyResume getMyResume() {
		return myResume;
	}

	public void setMyResume(MyResume myResume) {
		this.myResume = myResume;
	}

	public static int getFemale() {
		return FEMALE;
	}

	public static int getMale() {
		return MALE;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getName() {
		return name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public User(Integer id, String email, String pwd, String name, Date birth, int gender, String addr,
			String profile) {
		super();
		this.id = id;
		this.email = email;
		this.pwd = pwd;
		this.name = name;
		this.birth = birth;
		this.gender = gender;
		this.addr = addr;
		this.profile = profile;
	}

	public User(String email, String pwd, String name, Date birth, int gender, String addr, String profile) {
		super();
		this.email = email;
		this.pwd = pwd;
		this.name = name;
		this.birth = birth;
		this.gender = gender;
		this.addr = addr;
		this.profile = profile;
	}
	public User(Integer id, String email, String pwd, String name, Date birth, int gender, String addr, String tel,
			String profile, String declaration, String position3Name, Integer position3, String educationName,
			Integer education, String workName, Integer workyear) {
		super();
		this.id = id;
		this.email = email;
		this.pwd = pwd;
		this.name = name;
		this.birth = birth;
		this.gender = gender;
		this.addr = addr;
		this.tel = tel;
		this.profile = profile;
		this.declaration = declaration;
		this.position3Name = position3Name;
		this.position3 = position3;
		this.educationName = educationName;
		this.education = education;
		this.workName = workName;
		this.workyear = workyear;
	}

//	@Override
//	public String toString() {
//		return "User [id=" + id + ", email=" + email + ", pwd=" + pwd + ", name=" + name + ", birth=" + birth
//				+ ", gender=" + gender + ", addr=" + addr + ", tel=" + tel + ", profile=" + profile + ", declaration="
//				+ declaration + ", workyear=" + workyear + ", myResume=" + myResume + "]";
//	}
	

	public User(String email, String pwd) {
		super();
		this.email = email;
		this.pwd = pwd;
	}


	@Override
	public String toString() {
		return "User [id=" + id + ", email=" + email + ", pwd=" + pwd + ", name=" + name + ", birth=" + birth
				+ ", gender=" + gender + ", addr=" + addr + ", tel=" + tel + ", declaration=" + declaration
				+ ", position3Name=" + position3Name + ", educationName=" + educationName + ", workName=" + workName
				+ ", myResume=" + myResume + "]";
	}

	public User(Integer id, String email, String pwd) {
		super();
		this.id = id;
		this.email = email;
		this.pwd = pwd;
	}

	public User() {
		super();
	}

}
