package org.lanqiao.handler.user;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.lanqiao.entity.user.Education;
import org.lanqiao.entity.user.HopeJob;
import org.lanqiao.entity.user.MyResume;
import org.lanqiao.entity.user.User;
import org.lanqiao.service.user.EducationService;
import org.lanqiao.service.user.MyResumeService;
import org.lanqiao.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 教育经历
 * 
 * 渭南师范蓝桥二期-艾辉 2017年8月23日 下午5:22:27
 * 
 * @author Administrator
 */
/*
 * 渭南师范二期-杨璐 修改了增加的方法 修改 渭南师范二期-杨萌 2017年8月27日 上午11:03:06
 * 
 * @author lenovo
 *
 */
@RequestMapping("/education")
@Controller
public class EducationController {

	@Autowired
	EducationService es;
	@Autowired
	UserService userService;
	@Autowired
	MyResumeService myResumeService;

	/**
	 * 
	 *渭南师范二期-程建波
	 *2017年9月5日下午11:40:45
	 *修改增加方法
	 * @throws Exception 
	 */
	/**
	 * 
	 *渭南师范二期-程建波
	 *2017年9月7日上午11:19:58
	 *增加与更新
	 */
	@RequestMapping("/insertOrUpdate")
	public void insertEducation(HttpServletResponse response, Education e,HttpSession session) throws Exception {
		Integer userid = (Integer)session.getAttribute("userId");
		User u = userService.selectUser(userid);
		e.setMyResuemeId(u.getMyResume().getId());
		PrintWriter out = response.getWriter();
		if (u.getMyResume().getEducation() != null) {
			e.setId(u.getMyResume().getEducation().getId());
			int i = es.updateEducation(e);
			if (i != 0) {
				u.getMyResume().setEducation(e);
				out.print(i);
			}
		} else {
			int i = es.insertEducation(e);
			if (i != 0) {
				out.print(i);
			}
		}
	}
	
	//根据userid查询education
	@RequestMapping("/getEdu")
	@ResponseBody
	public Map<String, Object> getHopeJobByUserId(HttpSession session,Integer userId){
		Map<String, Object> result = new HashMap<String, Object>();
		Education education= es.getEducationByUserid(userId);
		result.put("education", education);
		return result;
	}

	// 删
	@RequestMapping("/deleteEdu")
	public String deleteEdu(Integer id) {
		es.deleteEducatione(id);
		return "redirect:select";
	}

	// 查询
	@RequestMapping("select")
	public String selectHopeJob(Integer userId, Map map) {
		User user = userService.selectUser(userId);
		MyResume myResume = user.getMyResume();
		if (myResume != null) {

			Education education = es.selectEducation(myResume.getEducation().getId());
			map.put("education", education);
			map.put("user", user);

		}
		return "myresuem/myresume.jsp";
	}
}
