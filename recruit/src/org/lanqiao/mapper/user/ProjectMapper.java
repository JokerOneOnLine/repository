package org.lanqiao.mapper.user;

import java.util.List;

import org.lanqiao.entity.user.Project;
/**
 * 
 * 渭南师范蓝桥二期-艾辉
 * 2017年8月25日 下午3:50:14
 *@author Administrator
 */

public interface ProjectMapper {
	//增加
	int insertProject(Project pj);
	//修改
	int deleteProject(int id);
	//删除
	int updateProject(Project pj);
	//查询根据 projectId
	Project selectProjectById(int projectId);
	//查询根据 myResumeId
	Project selectProjectByMyResumeId(int myResumeId);
	//查询所有的Project记录
	List<Project> selectProjects();
	
	Project getProjectByUserid(int userid);
}
