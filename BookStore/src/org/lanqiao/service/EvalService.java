package org.lanqiao.service;

import java.util.List;

import org.lanqiao.dao.EvalDao;
import org.lanqiao.entity.Eval;

public class EvalService {

	public void insert(Eval e) {

		new EvalDao().insert(e);
	}

	public List<Eval> getAll() {

		return new  EvalDao().getAll();
	}

}
