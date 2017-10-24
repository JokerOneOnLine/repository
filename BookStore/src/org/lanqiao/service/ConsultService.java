package org.lanqiao.service;

import java.util.List;

import org.lanqiao.dao.ConsultDao;
import org.lanqiao.entity.Consult;

public class ConsultService {

	public int insert(Consult con) {
		return new ConsultDao().insert(con);
	}

	//查询咨询
	public List<Consult> getAll() {
		return new ConsultDao().getAll();
	}



}
