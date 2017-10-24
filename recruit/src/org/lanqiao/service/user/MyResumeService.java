package org.lanqiao.service.user;

import org.lanqiao.entity.user.Education;
import org.lanqiao.entity.user.HopeJob;
import org.lanqiao.entity.user.MyResume;
import org.lanqiao.entity.user.Practice;
import org.lanqiao.entity.user.Project;
import org.lanqiao.entity.user.User;
import org.lanqiao.mapper.user.MyResumeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyResumeService {
	@Autowired
	EducationService educationService;
	@Autowired
	HopeJobService hopeJobService;
	@Autowired
	PracticeService practiceService;
	@Autowired
	ProjectService projectService;
	@Autowired
	MyResumeMapper myResumeMapper;
	@Autowired
	UserService userService;
	@Autowired
	PositionService positionService;
	

	/**
	 * 渭南师范二期—杨璐@return 2017年8月25日下午12:09:23
	 * 
	 * @param userId
	 * @return 查询用户简历
	 */
	public MyResume selectMyResumeByUserId(Integer userId) {
		MyResume  myResume = myResumeMapper.selectResumeByUserId(userId);
		return myResume;
	}
	/**
	 * 根据用户id查询用户简历(不带教育经历，工作经验...)
	 *渭南师范二期-许园园
	 *2017年9月9日 下午2:56:01 
	 *@param userId
	 *@return
	 */
	public MyResume getMyResumeByUserId(Integer userId) {
		MyResume  myResume = myResumeMapper.getResumeByUserId(userId);
		return myResume;
	}
	
	/**
	 * 
	 * 渭南师范二期—杨璐 2017年8月25日上午11:47:11
	 */
	public int deleteMyResumeId(int userId, int myResumeId) {
		User user = userService.selectUser(userId);
		MyResume myResume=this.selectMyResumeByUserId(user.getId());
		int i=1;

   if(myResume!=null){
	   Education education = myResume.getEducation();
		HopeJob hopeJob = myResume.getHopeJob();
		Practice practice = myResume.getPractice();
		Project project = myResume.getProject();
		if(education!=null) {
			
			i = educationService.deleteEducatione(education.getId());
			if (i == 0) {
				return 0;
			}
		}
		// 期望工资
		if(hopeJob!=null) {
			
			i = hopeJobService.deleteHopeJob(myResume.getId());
			if (i == 0) {
				return 0;
			}
		}
		// 实习经验
		if(practice!=null) {
			
			i = practiceService.deletePractice(practice.getId());
			if (i == 0) {
				return 0;
			}
		}
		// 项目
		if(project!=null) {
			
			i = projectService.deleteProject(project.getId());
			if (i == 0) {
				return 0;
			}
		}
		i = myResumeMapper.deleteMyresumeByUserId(userId);
		return i;
	}
return i;
	
	   
	   
   }

	/**
	 * 渭南师范二期—杨璐@return 2017年8月25日上午10:40:06
	 * 
	 * @return 用户增加一份简历
	 */
	public int inserMyResumeByUserId(MyResume myResume) {
		int i = myResumeMapper.insertMyresume( myResume);
		return i;
	}

}
