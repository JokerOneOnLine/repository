package org.lanqiao.handler.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.lanqiao.entity.user.MyResume;
import org.lanqiao.entity.user.Practice;
import org.lanqiao.entity.user.Project;
import org.lanqiao.entity.user.User;
import org.lanqiao.service.user.MyResumeService;
import org.lanqiao.service.user.ProjectService;
import org.lanqiao.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author渭南师范二期—杨璐 2017年8月27日下午3:47:06
 */
@RequestMapping("/project")
@Controller
public class ProjectController {
	@Autowired
	ProjectService projectService;
	@Autowired
	MyResumeService myResumeService;
	@Autowired
	UserService userService;

	@RequestMapping("/delete")
	public String deleteProject(Integer id) {
		projectService.deleteProject(id);
		return "redirect:select";

	}

	/**
	 * 
	 * 渭南师范二期—杨璐@param project 渭南师范二期—杨璐@return 2017年8月27日下午3:20:05
	 * 
	 * @param project
	 * @return 增加一个项目
	 */
	@RequestMapping("/insertOrUpdate")
	@ResponseBody
	public Map<String, Object> insert(Project project,HttpSession session) {
		Integer userid = (Integer)session.getAttribute("userId");
		User user = userService.selectUser(userid);
		MyResume myResume = user.getMyResume();
		Map<String, Object> result = new HashMap<String, Object>();
		int i = 0;
		if (myResume == null) {
			myResume = new MyResume();
			myResume.setUserId(userid);
			myResumeService.inserMyResumeByUserId(myResume);
			project.setMyResumeId(myResume.getId());
			if (project.getId() == 0) {
				i = projectService.insertProject(project);
			}
		} else if (myResume.getProject() == null) {
			project.setMyResumeId(myResume.getId());
			i = projectService.insertProject(project);
		} else {
			project.setId(myResume.getProject().getId());
			i = projectService.updateProject(project);
		}
		if (i == 1) {
			result.put("msg", "提交成功！");
			return result;
		}
		return result;
	}
	
	//根据userid查询project
	@RequestMapping(value = "/getProject")
	@ResponseBody
	public Map<String, Object> getPracticeByUserid(HttpSession session,Integer userId){
		Map<String, Object> result = new HashMap<String, Object>();
		Project project = projectService.getProjectByUserid(userId);
		result.put("project", project);
		return result;
	}

	// 查詢
	@RequestMapping("select")
	public String selectHopeJob(Integer userId, Map map) {
		User user = userService.selectUser(userId);
		MyResume myResume = user.getMyResume();
		if (myResume != null) {
			Project project = projectService.selectProjectById(myResume.getPractice().getMyResuemeId());
			map.put("project", project);
			map.put("user", user);
		}

		return "myresuem/myresume";
	}

}