package org.lanqiao.json;
/**
 *头像上传
 * @author Administrator
 *渭南师范二期-刘如艳
 *2017年8月25日下午12:10:10
 */
public class ProfileJson {

	private Boolean success;
	private String content;
	public Boolean getSuccess() {
		return success;
	}
	public void setSuccess(Boolean success) {
		this.success = success;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public ProfileJson(Boolean success, String content) {
		super();
		this.success = success;
		this.content = content;
	}
	@Override
	public String toString() {
		return "ProfileJson [success=" + success + ", content=" + content + "]";
	}
	public ProfileJson() {
		super();
	}
	public ProfileJson(Boolean success) {
		super();
		this.success = success;
	}
	
}
