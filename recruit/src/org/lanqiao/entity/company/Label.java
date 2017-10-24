package org.lanqiao.entity.company;

import java.io.Serializable;

/**
 * 
 * 渭南师范二期-张金浩 2017年8月24日上午11:46:54
 * 
 * 公司和标签的联系
 */
public class Label implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3306221418850685213L;
	private Integer id;
	private int companyId;
	private int tagId;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getCompanyId() {
		return companyId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public int getTagId() {
		return tagId;
	}

	public void setTagId(int tagId) {
		this.tagId = tagId;
	}

	public Label(Integer id, int companyId, int tagId) {
		super();
		this.id = id;
		this.companyId = companyId;
		this.tagId = tagId;
	}

	public Label(int companyId, int tagId) {
		super();
		this.companyId = companyId;
		this.tagId = tagId;
	}

	public Label() {
		super();
	}

	@Override
	public String toString() {
		return "Label [id=" + id + ", companyId=" + companyId + ", tagId=" + tagId + "]";
	}

}
