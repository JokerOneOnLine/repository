package org.lanqiao.mapper.user;

import org.lanqiao.entity.user.MyResume;
/**
 * 
 * @author 渭南师范二期-许园园
 *2017年9月9日 上午11:54:57
 */
public interface MyResumeMapper {
	// 根据用户id查询简历
	MyResume selectResumeByUserId(int id);
	
	// 根据用户id查询简历(不包含教育经历，工作经验...的简历)
	MyResume getResumeByUserId(Integer userid);
	
	// 根据简历id查询简历
	MyResume selectResumeById(int id);
	
	// 根据用户id加入简历
	int insertMyresume(MyResume myresume);

	// 根据用户id删除简历
	int deleteMyresumeByUserId(int id);

}
