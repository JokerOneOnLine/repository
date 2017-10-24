package org.lanqiao.mapper.user;

import java.util.List;

import org.lanqiao.entity.user.HopeSalary2;
/**
 * 
 * 渭南师范蓝桥二期-艾辉
 * 2017年8月28日 下午12:49:17
 *@author Administrator
 */
public interface HopeSalary2Mapper {
	
	int insertHopeSalary(HopeSalary2 hopeSalary);
	
	int deleteHopeSalaryById(int id);
	
	int updateHopeSalary(HopeSalary2 hopesalary);
	
	HopeSalary2 selectHopeSalaryById(int id);
	
	List<HopeSalary2> selectHopeSalarys();
	
	String selectHopeSalaryNameById(int id);
}

