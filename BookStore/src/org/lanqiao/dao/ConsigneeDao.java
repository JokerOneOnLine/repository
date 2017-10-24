package org.lanqiao.dao;

import java.util.List;

import org.lanqiao.entity.Consignee;
import org.lanqiao.utils.MyUtils;

public class ConsigneeDao extends BaseDao<Consignee>{

	public List<Consignee> getConsigneesByUserId(int id) {
		String sql = "select * from consignees where  userid =?";
		List<Consignee> list = getTs(sql, id);
		return list;
	}

	public int insert(int id, Consignee c) {
		String sql ="insert into consignees values (?,?,?,?,?,?)";
		int cId = MyUtils.getId();
		int i = update(sql,cId,c.getName(),c.getTel(),c.getAddr(),id);
		return i;
	}

	public Consignee getConsigneesByOrderId(int id) {
		String  sql ="select * from consignees where id =( select consigneeid from orders where id =?)";
		Consignee c = getT(sql, id);
		return c;
	}
}
