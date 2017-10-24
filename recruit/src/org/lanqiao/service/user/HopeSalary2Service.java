package org.lanqiao.service.user;

import java.util.List;

import org.lanqiao.entity.user.HopeSalary2;
import org.lanqiao.mapper.user.HopeSalary2Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
/**
 * 
 * 渭南师范蓝桥二期-艾辉
 * 2017年8月28日 下午12:48:20
 *@author Administrator
 */
@Service
public class HopeSalary2Service {
	@Autowired
	HopeSalary2Mapper hopeSalary2Mapper;
	
	public int insertHopeSalary(HopeSalary2 hopeSalary){
		return	hopeSalary2Mapper.insertHopeSalary(hopeSalary);
	}
	
	public int deleteHopeSalaryById(int id){
		return hopeSalary2Mapper.deleteHopeSalaryById(id);
	}
	
	public int updateHopeSalary(HopeSalary2 hopesalary){
		return hopeSalary2Mapper.updateHopeSalary(hopesalary);
	}
	
	public HopeSalary2 selectHopeSalaryById(int id){
		return hopeSalary2Mapper.selectHopeSalaryById(id);
	}
	
	public String selectHopeSalaryNameById(int id){
		return hopeSalary2Mapper.selectHopeSalaryNameById(id);
	}
	
	public List<HopeSalary2> selectHopeSalarys(){
		return hopeSalary2Mapper.selectHopeSalarys();
	}
}
