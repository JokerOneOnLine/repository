package org.lanqiao.dao;

import java.util.List;

import org.lanqiao.entity.Consult;
import org.lanqiao.utils.MyUtils;

public class ConsultDao extends BaseDao<Consult>{

	public int insert(Consult con) {
		String sql ="insert into consults(id,content,userid,bookid,cdate) values(?,?,?,?,?)";
		int id = MyUtils.getId();
		if (id == 0) {
			return 0;
		}
		int i = update(sql, id,con.getContent(),con.getUserId(),con.getBookId(),new java.sql.Date(con.getcDate().getTime()));
		return i;
	}

	public List<Consult> getConsultsByBookId(int bookid) {
		String sql="select c.*,u.name userName from consults c  join users u on c.userid = u.id where c.bookid=?";
		List<Consult> list = getTs(sql, bookid);
		return list;
		
	}

	public List<Consult> getAll() {
		String sql ="select * from consults";
		return getTs(sql);
	}
}
