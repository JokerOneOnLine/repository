package org.lanqiao.handler.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.lanqiao.entity.company.CompanyRegist;
import org.lanqiao.entity.company.Post;
import org.lanqiao.entity.company.PostAndResume;
import org.lanqiao.entity.user.Education;
import org.lanqiao.entity.user.HopeJob;
import org.lanqiao.entity.user.MyResume;
import org.lanqiao.entity.user.Position;
import org.lanqiao.entity.user.Practice;
import org.lanqiao.entity.user.Project;
import org.lanqiao.entity.user.User;
import org.lanqiao.service.company.CompanyService;
import org.lanqiao.service.company.PostAndResumeService;
import org.lanqiao.service.company.PostService;
import org.lanqiao.service.user.EducationService;
import org.lanqiao.service.user.HopeJobService;
import org.lanqiao.service.user.MyResumeService;
import org.lanqiao.service.user.PositionService;
import org.lanqiao.service.user.PracticeService;
import org.lanqiao.service.user.ProjectService;
import org.lanqiao.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@SessionAttributes("page")
@Controller
@RequestMapping("/myresume")
public class MyResumeController {

	@Autowired
	UserService userservice;
	@Autowired
	MyResumeService myResumeService;
	@Autowired
	PostAndResumeService pars;
	@Autowired
	PositionService ps;
	@Autowired
	PostService pse;
	@Autowired
	CompanyService cs;
	

	/**
	 * 渭南师范二期-王笑-杨璐 2017年8月27日 上午11:28:28
	 * 
	 * @param userId
	 * @param map
	 * @return 根据用户查询简历
	 */
/**
 * 渭南师范二期-樊璐璐 更改
 * @param userId
 * @param map
 * @return
 */
	@RequestMapping("/select")
	public String selectMyresume(Map map,HttpSession session) {
		Integer userId =(Integer) session.getAttribute("userId");
		if (userId == null) {
			return null;
		}
		User user = userservice.selectUser(userId);
		Education education = user.getMyResume().getEducation();
		HopeJob hopeJob = user.getMyResume().getHopeJob();
		Practice practice = user.getMyResume().getPractice();
		Project project = user.getMyResume().getProject();
		map.put("user", user);
		map.put("education", education);
		map.put("hopeJob", hopeJob);
		map.put("practice", practice);
		map.put("project", project);
		return "myresume/show";
	}
	
	/**
	 * 查询收到的简历并分页显示 渭南师范二期-刘如艳 2017年9月9日下午3:23:54
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/getPage")
	public String getPage(HttpServletRequest request, Map<String, Object> map) {
//		CompanyRegist any = (CompanyRegist) request.getSession().getAttribute("any");
		int companyId = (int) request.getSession().getAttribute("companyId");
//		request.getSession().setAttribute("any", any);
		CompanyRegist company = cs.getCompanyById(companyId);
		String pageNum = request.getParameter("pageNum");
		PageHelper.startPage(Integer.parseInt(pageNum), 2);
		PageInfo<Post> pageInfor = new PageInfo<Post>(company.getPosts(), 2);
		int[] navigatepageNums = pageInfor.getNavigatepageNums();
		System.out.println(navigatepageNums.toString());
		map.put("page", pageInfor);
		return "company/resumeManagement";
	}

	@RequestMapping("/getResumes")
	public void getResumes(HttpServletRequest request, HttpServletResponse r, Map<String, Object> map) {
		String name = request.getParameter("id");
		Position p3 = ps.selectByName(name);
//		CompanyRegist com = (CompanyRegist) request.getSession().getAttribute("company");
		int companyId = (int) request.getSession().getAttribute("companyId");
		CompanyRegist company = cs.getCompanyById(companyId);
		List<Post> posts = pse.selectostAndResumes(p3.getId(), company.getCompanyId());
		PageHelper.startPage(1, 2);
		PageInfo<Post> pageInfor = new PageInfo<Post>(posts, 2);
		int[] navigatepageNums = pageInfor.getNavigatepageNums();
		map.put("page", pageInfor);
		try {
			PrintWriter w = r.getWriter();
			w.print(1);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
