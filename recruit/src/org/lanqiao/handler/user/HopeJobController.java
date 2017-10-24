package org.lanqiao.handler.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.lanqiao.entity.user.HopeJob;
import org.lanqiao.entity.user.MyResume;
import org.lanqiao.entity.user.User;
import org.lanqiao.service.user.HopeJobService;
import org.lanqiao.service.user.MyResumeService;
import org.lanqiao.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("hopeJob")
public class HopeJobController {
	@Autowired
	MyResumeService myResumeService;
	@Autowired
	UserService userService;
	@Autowired
	HopeJobService hopeJobService;

	// 删除一份期望工作
	public String deleteHopeJob(Integer id) {
		hopeJobService.deleteHopeJob(id);
		return "rediret:select";

	}

	// 增加或更改一份期望工作
	@RequestMapping("/insertOrUpdate")
	@ResponseBody
	public Map<String, Object> insert(HopeJob hopeJob,HttpSession session) {
		Integer userid = (Integer)session.getAttribute("userId");
		User user = userService.selectUser(userid);
		MyResume myResume = user.getMyResume();
		Map<String, Object> result = new HashMap<String, Object>();
		int i = 0;
		if (myResume == null) {
			myResume = new MyResume();
			myResume.setUserId(userid);
			myResumeService.inserMyResumeByUserId(myResume);
			hopeJob.setMyResumeId(myResume.getId());
			if (hopeJob.getId() == 0) {
				i = hopeJobService.insertHopejob(hopeJob);
			}
		} else if (myResume.getHopeJob() == null) {
			hopeJob.setMyResumeId(myResume.getId());
			i = hopeJobService.insertHopejob(hopeJob);
		} else {
			hopeJob.setId(myResume.getHopeJob().getId());
			i = hopeJobService.updateHopejob(hopeJob);
		}
		if (i == 1) {
			result.put("msg", "提交成功！");
			return result;
		}
		return result;
	}
	
	//根据userid查询hopeJob
	@RequestMapping("/getHopejob")
	@ResponseBody
	public Map<String, Object> getHopeJobByUserId(HttpSession session,Integer userId){
		Map<String, Object> result = new HashMap<String, Object>();
		HopeJob hopeJob= hopeJobService.getHopejobByUserId(userId);
		result.put("hopeJob", hopeJob);
		return result;
	}

	// 查询期望职位
	public String selectHopeJob(Integer userId, Map map) {
		User user = userService.selectUser(userId);
		MyResume myResume = user.getMyResume();
		if (myResume != null) {
			HopeJob job = hopeJobService.selectHopeJob(myResume.getId());
			map.put("hopeJob", job);
			map.put("user", user);
		}
		return "myresuem/myresume";
	}

}
