package org.lanqiao.dao;

import java.util.List;

import org.lanqiao.entity.Eval;
import org.lanqiao.utils.MyUtils;

public class EvalDao extends BaseDao<Eval>{

	public void insert(Eval e) {
		int evalId = MyUtils.getId();
		String sql ="insert into evals values(?,?,?,?,?,?,null,null,null,?)";
		update(sql, evalId,e.getBookId(),new java.sql.Date(e.getEvalDate().getTime()),e.getContent(),e.getStar(),e.getUserId(),e.getOrderId());
	}

	public List<Eval> getAll() {
		String sql ="select * from evals ";
		return getTs(sql);
	}

	
}
