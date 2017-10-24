package org.lanqiao.service.user;

import java.util.List;

import org.lanqiao.entity.user.Project;
import org.lanqiao.mapper.user.ProjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
/**
 * 工作经历
 * 
 * 渭南师范蓝桥二期-艾辉
 * 2017年8月23日 下午4:47:20
 *@author Administrator
 */
@Service
public class ProjectService {
	@Autowired
	ProjectMapper pm;
	
	/**
	 * 下列方法依次：增，删，改，查单by id，查单by resumeid ，查询多
	 * 
	 * 渭南师范蓝桥二期-艾辉
	 * 2017年8月23日 下午4:48:28
	 * @param pj
	 * @return
	 */
	public int insertProject(Project pj){
		return pm.insertProject(pj);
	}

	public int deleteProject(int id){
		return pm.deleteProject(id);
	}

	public int updateProject(Project pj){
		return pm.updateProject(pj);
	}

	public Project selectProjectById(int id){
		return pm.selectProjectById(id);
	}
	//通过myResumeId查询Project
	public Project selectProjectByMyResumeId(int myResumeId){
		return pm.selectProjectByMyResumeId(myResumeId);
	}

	public List<Project> selectProjects(){
		return pm.selectProjects();
	}
	
	public Project getProjectByUserid(int userid){
		return pm.getProjectByUserid(userid);
	}
	
}
