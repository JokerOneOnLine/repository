package org.lanqiao.entity.user;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.lanqiao.util.UserUtil;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * 渭南师范二期-王笑-杨璐 2017年8月27日 上午11:40:14
 * 
 * @author wld
 *
 */
public class Practice implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String company;// 工作公司
	private String position;// 工作职位
	@DateTimeFormat(pattern = "yyyyMMdd")
	private Date starttime;// 工作开始时间
	@DateTimeFormat(pattern = "yyyyMMdd")
	private Date endtime;// 工作结束时间
	private String workContent;// 工作工作内容
	private Integer myResuemeId;

	// 日期格式转换
	public String getStrStarttime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		String format = sdf.format(this.starttime);
		return format;
	}
	public String getStrEndtime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		String format = sdf.format(this.endtime);
		return format;
	}

	public String getEndDate() {
		return UserUtil.dateToString(this.endtime);
	}

	public Integer getMyResuemeId() {
		return myResuemeId;
	}

	public void setMyResuemeId(Integer myResuemeId) {
		this.myResuemeId = myResuemeId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public Date getstarttime() {
		return starttime;
	}

	public void setstarttime(Date starttime) {
		this.starttime = starttime;
	}

	public Date getEndtime() {
		return endtime;
	}

	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}

	public String getWorkContent() {
		return workContent;
	}

	public void setWorkContent(String workContent) {
		this.workContent = workContent;
	}

	public Practice(String company, String position, Date starttime, Date endtime, String workContent) {
		super();
		this.company = company;
		this.position = position;
		this.starttime = starttime;
		this.endtime = endtime;
		this.workContent = workContent;
	}

	public Practice(Integer id, String company, String position, Date starttime, Date endtime, String workContent) {
		super();
		this.id = id;
		this.company = company;
		this.position = position;
		this.starttime = starttime;
		this.endtime = endtime;
		this.workContent = workContent;
	}

	public Practice() {
		super();
	}

	@Override
	public String toString() {
		return "Practice [id=" + id + ", company=" + company + ", position=" + position + ", starttime=" + starttime
				+ ", endtime=" + endtime + ", workContent=" + workContent + "]";
	}

}
