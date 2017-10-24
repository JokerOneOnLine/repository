package org.lanqiao.entity.company;

import java.io.Serializable;

/**
 *    公司产品
 *渭南师范二期-高瑞
 *2017年8月23日下午2:49:49
 */

public class CompanyProduct implements Serializable{
	
	private static final long serialVersionUID = 8620479106225699884L;
	private int productId;
	private String productName;
	private String poster;//产品海报
	private String productUrl;//产品地址
	private String productInfo;//产品简介
	private int companyId;
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId; 
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getProductUrl() {
		return productUrl;
	}
	public void setProductUrl(String productUrl) {
		this.productUrl = productUrl;
	}
	public String getProductInfo() {
		return productInfo;
	}
	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}
	
	public int getCompanyId() {
		return companyId;
	}
	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}
	
	@Override
	public String toString() {
		return "CompanyProduct [productId=" + productId + ", productName=" + productName + ", poster=" + poster
				+ ", productUrl=" + productUrl + ", productInfo=" + productInfo + ", companyId=" + companyId + "]";
	}
	public CompanyProduct(String productName, String poster, String productUrl, String productInfo,int companyId) {
		super();
		this.productName = productName;
		this.poster = poster;
		this.productUrl = productUrl;
		this.productInfo = productInfo;
		this.companyId = companyId;
	}
	public CompanyProduct() {
		super();
	}
	
}
