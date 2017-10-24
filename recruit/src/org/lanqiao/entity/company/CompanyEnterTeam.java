package org.lanqiao.entity.company;

import java.io.Serializable;

/**
 * 渭南师范二期-樊璐璐 
 * 创始团队（EntryTeam）
 * 2017年8月23日下午2:49:43
 * @author 
 */
public class CompanyEnterTeam implements Serializable{
	private static final long serialVersionUID = -5138414055381017277L;
	private int teamId;
	private int companyId;
	private String founder;// 创始人
	private String position;// 职位
	private String founderSurface;// 创始人图像
	private String microBlog;// 微博
	private String founderInfo;// 创始人简介

	public int getTeamId() {
		return teamId;
	}

	public void setTeamId(int teamId) {
		this.teamId = teamId;
	}

	public int getCompanyId() {
		return companyId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public String getFounder() {
		return founder;
	}

	public void setFounder(String founder) {
		this.founder = founder;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getFounderSurface() {
		return founderSurface;
	}

	public void setFounderSurface(String founderSurface) {
		this.founderSurface = founderSurface;
	}

	public String getMicroBlog() {
		return microBlog;
	}

	public void setMicroBlog(String microBlog) {
		this.microBlog = microBlog;
	}

	public String getFounderInfo() {
		return founderInfo;
	}

	public void setFounderInfo(String founderInfo) {
		this.founderInfo = founderInfo;
	}

	public CompanyEnterTeam(int companyId, String founder, String position, String founderSurface,
			String microBlog, String founderInfo) {
		super();
		this.companyId = companyId;
		this.founder = founder;
		this.position = position;
		this.founderSurface = founderSurface;
		this.microBlog = microBlog;
		this.founderInfo = founderInfo;
	}

	public CompanyEnterTeam() {
		super();
	}

	@Override
	public String toString() {
		return "EntryTeam [teamId=" + teamId + ", companyId=" + companyId + ", founder=" + founder + ", position="
				+ position + ", founderSurface=" + founderSurface + ", microBlog=" + microBlog + ", founderInfo="
				+ founderInfo + "]";
	}

}
