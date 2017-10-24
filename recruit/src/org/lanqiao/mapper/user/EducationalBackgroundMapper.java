package org.lanqiao.mapper.user;

import java.util.List;

import org.lanqiao.entity.user.EducationalBackground;
import org.springframework.stereotype.Repository;
@Repository
public interface EducationalBackgroundMapper {
	//查询所有的学历
	List<EducationalBackground> selectAllEducationalBackground();
	/**
	 * 获取学历
	 *渭南师范二期-刘如艳
	 *2017年8月27日下午4:31:38
	 * @param education
	 * @return
	 */
	String getEducation(int education);
	Integer getId(String name);
	String getName(Integer education);
}
