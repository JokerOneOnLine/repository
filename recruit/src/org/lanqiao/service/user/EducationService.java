package org.lanqiao.service.user;

import org.lanqiao.entity.user.Education;
import org.lanqiao.mapper.user.EducationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *    教育经历  
 * 渭南师范蓝桥二期-艾辉
 * 2017年8月23日 下午5:19:54
 *@author Administrator
 */
@Service
public class EducationService {

	@Autowired
	EducationMapper em;
	/**
	 *  以下方法       增 删 该 查
	 *  
	 * 渭南师范蓝桥二期-艾辉
	 * 2017年8月23日 下午5:21:05
	 * @param e
	 * @return
	 */
	public int insertEducation(Education e){
		return em.insertEducation(e);
	}
	
	public int deleteEducatione(int id){
		return em.deleteEducation(id);
	}
	
	public int updateEducation(Education e){
		return em.updateEducation(e);
	}
	
	public Education selectEducation(int id){
		return em.selectEducation(id);
	}
	
	public Education getEducationByUserid(int userid){
		return em.getEducationByUserid(userid);
	}
	
	/**
	 * 
	 *渭南师范二期-艾尧
	 *2017年8月25日 下午4:17:14
	 * @param myResumid
	 * @return
	 */
	public Education selectEducationByMyResumeId(int myResumeid){
		return em.selectEducationByMyResumeId(myResumeid);
	}
}
