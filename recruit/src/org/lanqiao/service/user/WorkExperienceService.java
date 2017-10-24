package org.lanqiao.service.user;

import java.util.List;

import org.lanqiao.entity.user.WorkExperience;
import org.lanqiao.mapper.user.WorkExperienceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WorkExperienceService {
	@Autowired
	WorkExperienceMapper wem;
	public List<WorkExperience> selectAllWorkExperience(){
		 return wem.selectAllWorkExperience();
	 }

	public Integer getId(String name){
		Integer id = wem.getId(name);
		return id;
	}

	public String getName(Integer workExperience) {
		// TODO Auto-generated method stub
	return	wem.getName(workExperience);
		
	}
}
