package org.lanqiao.utils;

import java.util.List;

public class Page<T> {
	
	List<T> objs;
	BaseCreteria<T> creteria;
	
	
	public List<T> getObjs() {
		return objs;
	}
	public void setObjs(List<T> objs) {
		this.objs = objs;
	}
	public BaseCreteria<T> getCreteria() {
		return creteria;
	}
	public void setCreteria(BaseCreteria<T> creteria) {
		this.creteria = creteria;
	}
	
	public Page() {
		super();
	}
	public Page(List<T> objs, BaseCreteria<T> creteria) {
		super();
		this.objs = objs;
		this.creteria = creteria;
	}
	@Override
	public String toString() {
		return "Page [objs=" + objs + ", creteria=" + creteria + ", getObjs()=" + getObjs() + ", getCreteria()="
				+ getCreteria() + "]";
	}
	
	
}
