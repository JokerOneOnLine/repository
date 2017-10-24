package org.lanqiao.utils;

public class BaseCreteria<T> {
	private int pageNo;//当前页
	private int pageSize;//每页现实的条数
	private int totalPage;//总页数

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

	public BaseCreteria(int pageNo, int pageSize, int totalPage) {
		super();
		this.pageNo = pageNo;
		this.pageSize = pageSize;
		this.totalPage = totalPage;
	}

}
