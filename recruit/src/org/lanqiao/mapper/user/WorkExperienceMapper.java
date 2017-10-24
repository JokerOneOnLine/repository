package org.lanqiao.mapper.user;

import java.util.List;

import org.lanqiao.entity.user.WorkExperience;

public interface WorkExperienceMapper {
	List<WorkExperience> selectAllWorkExperience();
String	getExperience(int workExperience);
Integer getId(String name);
String getName(Integer workExperience);

}
