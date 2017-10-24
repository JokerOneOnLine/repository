package org.lanqiao.entity.company;

import java.io.Serializable;

/**
 * 
 * 渭南师范二期-张金浩 2017年8月24日上午10:08:29
 */
public class Tag implements Serializable {

	private static final long serialVersionUID = -5481642079537112844L;
	private Integer id;
	private String content;
	private int companyId;

	public int getCompanyId() {
		return companyId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Tag(String content) {
		super();
		this.content = content;
	}

	public Tag(String content, int companyId) {
		super();
		this.content = content;
		this.companyId = companyId;
	}

	public Tag() {
		super();
	}

	@Override
	public String toString() {
		return "Tag [id=" + id + ", content=" + content + ", companyId=" + companyId + "]";
	}

}
