package org.lanqiao.service;

import org.lanqiao.dao.ConsigneeDao;
import org.lanqiao.entity.Consignee;
import org.lanqiao.entity.User;

public class ConsigneeService {

	public int insert(User user, Consignee consignee) {
		int i =new ConsigneeDao().insert(user.getId(),consignee);
		return i;
	}

}
