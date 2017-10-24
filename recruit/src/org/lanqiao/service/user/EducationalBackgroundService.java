package org.lanqiao.service.user;

import java.util.List;

import org.lanqiao.entity.user.EducationalBackground;
import org.lanqiao.mapper.user.EducationalBackgroundMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EducationalBackgroundService {
	
	@Autowired
	EducationalBackgroundMapper ebm;
	
	public List<EducationalBackground> selectAllEducationalBackground(){
		return ebm.selectAllEducationalBackground();
	}
	public Integer getId(String name){
		Integer id = ebm.getId(name);
		return id;
	}
	public String getName(Integer education) {
		// TODO Auto-generated method stub
	return	ebm.getName(education);
		
	}
}
