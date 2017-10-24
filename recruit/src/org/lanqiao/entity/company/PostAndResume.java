package org.lanqiao.entity.company;

import java.io.Serializable;
import java.util.List;

import org.lanqiao.entity.user.MyResume;
/**
 * 职位简历对应表
 * @author 渭南师范二期-许园园
 *2017年9月9日 上午9:30:02
 */
public class PostAndResume implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private Integer postId;
	private int resumeId;
	List<MyResume> resumes;
	List<Post> posts;
	
	
	public List<Post> getPosts() {
		return posts;
	}
	public void setPosts(List<Post> posts) {
		this.posts = posts;
	}
	public List<MyResume> getResumes() {
		return resumes;
	}
	public void setResumes(List<MyResume> resumes) {
		this.resumes = resumes;
	}
	
	public Integer getPostId() {
		return postId;
	}
	public void setPostId(Integer postId) {
		this.postId = postId;
	}
	public int getResumeId() {
		return resumeId;
	}
	public void setResumeId(int resumeId) {
		this.resumeId = resumeId;
	}
	
	
	public PostAndResume(Integer postId, int resumeId) {
		super();
		this.postId = postId;
		this.resumeId = resumeId;
	}
	public PostAndResume() {
		super();
	}
	@Override
	public String toString() {
		return "PostAndResume [postId=" + postId + ", resumeId=" + resumeId + ", resumes=" + resumes + ", posts="
				+ posts + "]";
	}
	
	
	
	
}
