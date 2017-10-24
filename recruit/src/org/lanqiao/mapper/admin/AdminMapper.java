package org.lanqiao.mapper.admin;

import org.lanqiao.entity.admin.Admin;

/**
 * 
 * 渭南师范二期-程建波
 * 2017年8月26日上午9:16:47
 */
public interface AdminMapper {
	Admin adminLogin(String name);

	int insertAdmin(Admin a);

	int updataAdmin(Admin a);

	int deleteAdmin(int id);

	Admin getAdmin(int id);
	
}
