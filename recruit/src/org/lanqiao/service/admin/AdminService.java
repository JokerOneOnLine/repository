package org.lanqiao.service.admin;

import org.lanqiao.entity.admin.Admin;
import org.lanqiao.mapper.admin.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
 * 渭南师范二期-程建波
 * 2017年8月26日上午11:00:13
 */
@Service
public class AdminService {
	@Autowired
	AdminMapper am;

	public Admin adminLogin(String name) {

		return am.adminLogin(name);
	}
}
