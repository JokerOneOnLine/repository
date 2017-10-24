package org.lanqiao.handler.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.lanqiao.entity.user.Education;
import org.lanqiao.entity.user.HopeJob;
import org.lanqiao.entity.user.MyResume;
import org.lanqiao.entity.user.Practice;
import org.lanqiao.entity.user.User;
import org.lanqiao.service.user.MyResumeService;
import org.lanqiao.service.user.PracticeService;
import org.lanqiao.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 * @author渭南师范二期—杨璐 2017年8月27日下午3:48:29
 */
@Controller
@RequestMapping(value = "PracticeController")
public class PracticeController {
	@Autowired
	MyResumeService myResumeService;
	@Autowired
	PracticeService practiceService;
	@Autowired
	UserService userService;

	/**
	 * 渭南师范二期—杨璐@param id 渭南师范二期—杨璐@return 2017年8月27日下午3:56:42
	 * 
	 * @param id
	 * @return 删除一份实习
	 */
	public String deletePractice(Integer id) {
		practiceService.deletePractice(id);
		return "redirect:select";

	}

	/**
	 * 
	 * 渭南师范二期—杨璐@param practice 渭南师范二期—杨璐@param userId 渭南师范二期—杨璐@return
	 * 2017年8月27日下午3:52:43
	 * 
	 * @param practice
	 * @param userId
	 * @return 增加修改一份实习
	 */
	@RequestMapping("/insertOrUpdate")
	public String insert(Practice practice, Integer userId, Map map) {
		User user = userService.selectUser(userId);
		MyResume myResume = user.getMyResume();
		if (myResume == null) {
			myResume.setUserId(userId);
			if (practice.getId() == 0) {
				myResumeService.inserMyResumeByUserId(myResume);

				practiceService.insertPractice(practice);

			}

		}
		practiceService.updatePractice(practice);
		map.put("user", "practice");
		map.put("user", user);
		return "redirect:select";
	}

	/**
	 * 
	 * 渭南师范二期-樊璐璐 2017年9月5日下午10:32:33
	 * 
	 * @param practice
	 * @param userId
	 * @param map
	 * @return
	 */
	// 插入
	@RequestMapping(value = "/insert")
	@ResponseBody
	public Map<String, Object> insert1(Practice practice,HttpSession session) {
		Map<String, Object> result = new HashMap<String, Object>();
		Integer userid = (Integer)session.getAttribute("userId");
		User user = userService.selectUser(userid);
		MyResume myResume = user.getMyResume();
		int i = 0;
		if (myResume==null) {
			myResume = new MyResume();
			myResume.setUserId(userid);
			myResumeService.inserMyResumeByUserId(myResume);
			if (practice.getId()==0) {
				i = practiceService.insertPractice(practice);
			}
		} else if(myResume.getPractice()==null){
			practice.setMyResuemeId(myResume.getId());
			i = practiceService.insertPractice(practice);
		} else{
			practice.setId(myResume.getPractice().getId());
			i = practiceService.updatePractice(practice);
		}
		if (i == 1) {
			result.put("msg", "提交成功！");
			return result;
		}
		return result;
	}
	
	//根据userid查询practice
	@RequestMapping(value = "/getPractice")
	@ResponseBody
	public Map<String, Object> getPracticeByUserid(HttpSession session,Integer userId){
		Map<String, Object> result = new HashMap<String, Object>();
		Practice practice = practiceService.getPracticeByUserid(userId);
		result.put("practice", practice);
		return result;
	}
	

	// 查詢
	public String selectHopeJob(Integer userId, Map map) {
		User user = userService.selectUser(userId);
		MyResume myResume = user.getMyResume();
		if (myResume != null) {
			Practice practice = practiceService.selectPracticeByMyResumeId(myResume.getId());
			map.put("practice", practice);
			map.put("user", user);
		}
		return "myresuem/myresume";
	}

}
