package org.lanqiao.entity.user;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 
 * @author 艾尧
 *渭南师范二期-艾尧
 *2017年8月24日 上午9:48:37
 */
/**
 * 
 * 渭南师范二期-程建波
 * 2017年9月7日上午11:02:02
 * 增加@DateTimeFormat，重写了toString方法
 */
public class Education implements Serializable {

	private static final long serialVersionUID = -3754888613709566321L;
	private Integer id;
	private String schoolName;
	private String major; // 专业
	private String educational; // 学历
	@DateTimeFormat(pattern = "yyyyMMdd")
	private Date graduate;
	private Integer myResuemeId;
	
	public String getStrGraduate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String format = sdf.format(this.graduate);
		return format;
	}

	public Integer getMyResuemeId() {
		return myResuemeId;
	}

	public void setMyResuemeId(Integer myResuemeId) {
		this.myResuemeId = myResuemeId;
	}

	public String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getEducational() {
		return educational;
	}

	public void setEducational(String educational) {
		this.educational = educational;
	}

	public Date getGraduate() {
		return graduate;
	}

	public void setGraduate(Date graduate) {
		this.graduate = graduate;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Education [id=" + id + ", schoolName=" + schoolName + ", major=" + major + ", educational="
				+ educational + ", graduate=" + graduate + ", myResuemeId=" + myResuemeId + "]";
	}

	public Education(Integer id, String schoolName, String major, String educational, Date graduate) {
		super();
		this.id = id;
		this.schoolName = schoolName;
		this.major = major;
		this.educational = educational;
		this.graduate = graduate;
	}

	public Education(String schoolName, String major, String educational, Date graduate) {
		super();
		this.schoolName = schoolName;
		this.major = major;
		this.educational = educational;
		this.graduate = graduate;
	}

	public Education() {
		super();
	}

}
