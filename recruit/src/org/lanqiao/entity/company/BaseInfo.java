package org.lanqiao.entity.company;

import java.io.Serializable;

/**
 * 
 * 渭南师范二期-程建波
 * 2017年8月23日下午2:49:41
 * 基本信息(BaseInfo)
 */
public class BaseInfo implements Serializable {

	private static final long serialVersionUID = 7800116705854717203L;
	private Integer baseId;
	private Integer companyId;
	private String companyName;
	private String companyAbb;// 简称
	private String companyLogo;//
	private String companyUrl;// 公司网址
	private String companyCity;//
	private String companyDomain;// 领域
	private String scale;// 规模
	private String introduction;// 简单介绍
	private String companyInfo;// 公司介绍

	public Integer getBaseId() {
		return baseId;
	}

	public void setBaseId(Integer baseId) {
		this.baseId = baseId;
	}

	public Integer getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyAbb() {
		return companyAbb;
	}

	public void setCompanyAbb(String companyAbb) {
		this.companyAbb = companyAbb;
	}

	public String getCompanyLogo() {
		return companyLogo;
	}

	public void setCompanyLogo(String companyLogo) {
		this.companyLogo = companyLogo;
	}

	public String getCompanyUrl() {
		return companyUrl;
	}

	public void setCompanyUrl(String companyUrl) {
		this.companyUrl = companyUrl;
	}

	public String getCompanyCity() {
		return companyCity;
	}

	public void setCompanyCity(String companyCity) {
		this.companyCity = companyCity;
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

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getCompanyInfo() {
		return companyInfo;
	}

	public void setCompanyInfo(String companyInfo) {
		this.companyInfo = companyInfo;
	}

	public BaseInfo(Integer baseId, Integer companyId, String companyName, String companyAbb, String companyLogo,
			String companyUrl, String companyCity, String companyDomain, String scale, String introduction,
			String companyInfo) {
		super();
		this.baseId = baseId;
		this.companyId = companyId;
		this.companyName = companyName;
		this.companyAbb = companyAbb;
		this.companyLogo = companyLogo;
		this.companyUrl = companyUrl;
		this.companyCity = companyCity;
		this.companyDomain = companyDomain;
		this.scale = scale;
		this.introduction = introduction;
		this.companyInfo = companyInfo;
	}

	public BaseInfo() {
		super();
	}

	@Override
	public String toString() {
		return "BaseInfo [baseId=" + baseId + ", companyId=" + companyId + ", companyName=" + companyName
				+ ", companyAbb=" + companyAbb + ", companyLogo=" + companyLogo + ", companyUrl=" + companyUrl
				+ ", companyCity=" + companyCity + ", companyDomain=" + companyDomain + ", scale=" + scale
				+ ", introduction=" + introduction + ", companyInfo=" + companyInfo + "]";
	}

}
