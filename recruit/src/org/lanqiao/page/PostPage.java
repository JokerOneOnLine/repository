package org.lanqiao.page;

import java.util.List;

import org.lanqiao.entity.company.Post;

/**
 * 查询上下线职位用到分页
 * @author Administrator
 *渭南师范二期-刘如艳
 *2017年8月27日上午9:24:16
 */
public class PostPage {
	private int pageNo;
	private int pageSize;
	private int totalPage;
	private int startIndex;
	private int count;
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	private List<Post> posts;
	
	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public List<Post> getPosts() {
		return posts;
	}

	public void setPosts(List<Post> posts) {
		this.posts = posts;
	}

	@Override
	public String toString() {
		return "PostPage [pageNo=" + pageNo + ", pageSize=" + pageSize + ", totalPage=" + totalPage + ", posts=" + posts
				+ "]";
	}

	public PostPage(int pageNo, int pageSize, int totalPage, List<Post> posts) {
		super();
		this.pageNo = pageNo;
		this.pageSize = pageSize;
		this.totalPage = totalPage;
		this.posts = posts;
	}

	public PostPage() {
		super();
	}
	
	
}
