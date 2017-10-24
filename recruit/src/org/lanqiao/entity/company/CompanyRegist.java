package org.lanqiao.entity.company;

import java.io.Serializable;
import java.util.List;

/**
 * 
 * 渭南师范二期-吴鹏飞、 2017年8月23日 下午2:55:18
 * 
 * @author
 */
public class CompanyRegist implements Serializable {
	private static final long serialVersionUID = -4788719007493801706L;
	private static final int AC_YES = 1;
	private static final int AC_NO = 0;

	private int companyId;
	private String companyEmail;
	private String loginPwd;
	private BaseInfo baseInfo;
	private List<Tag> tags;
	private List<CompanyEnterTeam> teams;
	private List<CompanyProduct> product;
	private int authentication = AC_NO;// 是否认证
	private List<Post> posts;

	public List<Post> getPosts() {
		return posts;
	} 

	public void setPosts(List<Post> posts) {
		this.posts = posts;
	}

	public int getAuthentication() {
		return authentication;
	}

	public void setAuthentication(int authentication) {
		this.authentication = authentication;
	}

	public List<Tag> getTags() {
		return tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}

	public List<CompanyEnterTeam> getTeams() {
		return teams;
	}

	public void setTeams(List<CompanyEnterTeam> teams) {
		this.teams = teams;
	}

	public List<CompanyProduct> getProduct() {
		return product;
	}

	public void setProduct(List<CompanyProduct> product) {
		this.product = product;
	}

	public BaseInfo getBaseInfo() {
		return baseInfo;
	}

	public void setBaseInfo(BaseInfo baseInfo) {
		this.baseInfo = baseInfo;
	}

	public int getCompanyId() {
		return companyId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public String getCompanyEmail() {
		return companyEmail;
	}

	public void setCompanyEmail(String companyEmail) {
		this.companyEmail = companyEmail;
	}

	public String getLoginPwd() {
		return loginPwd;
	}

	public void setLoginPwd(String loginPwd) {
		this.loginPwd = loginPwd;
	}

	public CompanyRegist(String companyEmail, String loginPwd) {
		super();
		this.companyEmail = companyEmail;
		this.loginPwd = loginPwd;
	}

	public CompanyRegist(int companyId, String companyEmail, String loginPwd) {
		super();
		this.companyId = companyId;
		this.companyEmail = companyEmail;
		this.loginPwd = loginPwd;
	}
	

	@Override
	public String toString() {
		return "CompanyRegist [companyId=" + companyId + ", companyEmail=" + companyEmail + ", baseInfo=" + baseInfo
				+ ", tags=" + tags + ", teams=" + teams + ", product=" + product + ", posts=" + posts + "]";
	}

	public CompanyRegist() {
		super();
	}

}
