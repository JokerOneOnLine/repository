package org.lanqiao.mapper.user;

import org.lanqiao.entity.user.Education;

/**
 * 教育经历
 * 
 * @author 艾尧 渭南师范二期-艾尧 2017年8月23日 下午3:40:11
 */
public interface HopeSalaryMapper {
	
	int deleteEducation(int id);

	int insertEducation(Education e);

	int updateEducation(Education e);

	Education selectEducation(int id);
	
	Education selectEducationByMyResumeId(int myresumeid);
}
