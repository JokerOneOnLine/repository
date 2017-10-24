package org.lanqiao.handler.user;

import java.io.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.lanqiao.entity.company.BaseInfo;
import org.lanqiao.entity.company.CompanyRegist;
import org.lanqiao.entity.company.Post;
import org.lanqiao.entity.user.EducationalBackground;
import org.lanqiao.entity.user.Position;
import org.lanqiao.entity.user.Position1;
import org.lanqiao.entity.user.Position2;
import org.lanqiao.entity.user.WorkExperience;
import org.lanqiao.service.company.CompanyService;
import org.lanqiao.service.company.PostService;
import org.lanqiao.service.user.EducationalBackgroundService;
import org.lanqiao.service.user.Position1Service;
import org.lanqiao.service.user.Position2Service;
import org.lanqiao.service.user.PositionService;
import org.lanqiao.service.user.WorkExperienceService;
import org.lanqiao.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
/**
 * 
 * @author layla 
 * 渭南师范二期梁琼
 * 2017年8月25日 上午9:35:34
 */
@Controller
@RequestMapping("/position")
public class PositionsController {
	@Autowired
	Position1Service position1Service;
	@Autowired
	Position2Service p2S;
	@Autowired
	PositionService pS;
	@Autowired
	EducationalBackgroundService ebs;
	@Autowired
	WorkExperienceService wes;
	@Autowired
	PostService ps;
	@Autowired
	CompanyService cs;
	
	 /**
	  * 查询带有二级、三级信息的一级信息
	  * 跳转到index.jsp
	  * 展示出所有的职位信息
	  * 
	  * @author layla 
	  * 渭南师范二期梁琼
	  * 2017年8月25日 上午9:35:51
	  * @return
	  */
	@RequestMapping("/select1")
	public ModelAndView selectPositions1(){
		List<Position1> ps1 = position1Service.selectPositions1();
		ModelAndView mav = new ModelAndView("user/index1");
		mav.addObject("ps1",ps1);
		return mav;
	}
	/**
	 * 发布新职位页面职位类别
	 * @author layla 
	 * 渭南师范二期梁琼
	 * 2017年8月26日 上午9:40:56
	 * @return
	 */
	@RequestMapping("/select2")
	public ModelAndView selectPositions2(){
		List<Position1> ps1 = position1Service.selectPositions1();
		ModelAndView mav = new ModelAndView("company/post");
		mav.addObject("ps1",ps1);
		return mav;
	}
	
	@ResponseBody
	@RequestMapping("/getPositions")
	public List<Position1> getPositions(){
		System.out.println("aaa");
		List<Position1> ps1 = position1Service.selectPositions1();
		return ps1;
	}

	/**
	 * 职位管理
	 * 查询所有职位
	 * 查询所有工作经历
	 * 查询所有学历
	 *渭南师范二期-刘如艳
	 *2017年8月25日下午7:49:13
	 * @return
	 */
	@RequestMapping("/getAllPosition")
	public String  getAllPosition(Map<String,Object>map,HttpSession httpsession){
		CompanyRegist company = (CompanyRegist) httpsession.getAttribute("company");
		List<Position1> p = position1Service.selectPositions1();
		httpsession.setAttribute("position1", p);
		 List<EducationalBackground> eb= ebs.selectAllEducationalBackground();
	  List<WorkExperience>	ws=wes.selectAllWorkExperience();
		map.put("eb",eb);
		httpsession.setAttribute("eb", eb);
		httpsession.setAttribute("ws", ws);
		return "company/post";
	}
	
	
	/**
	 * 修改：获取post中的全职兼职实习信息；
	 * 渭南师范二期-杨萌
	 * 2017年9月11日
	 * 上午10:03:52
	 * @param request
	 * @param session
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/insertPosition")
	@ResponseBody
	public void insertPosition(Post post,HttpServletRequest request,HttpServletResponse response ,HttpSession session) throws IOException{
		int i = 0;
		int cId = (int) session.getAttribute("companyId");
		CompanyRegist selectCompany = cs.selectCompany(cId);
		post.setPostName(pS.getId(post.getP3Name()));
		post.setPostType(p2S.getIdByP3Id(post.getPostName()));
		post.setWorkExperience(wes.getId(post.getWorkName()));
		post.setEducation(ebs.getId(post.geteName()));
		PrintWriter out = response.getWriter();
		
		String jobInfo = post.getJobInfo();
		if (jobInfo!=null) {
			String path = UserUtil.getPath(request.getServletContext(),"jobInfor");
			path=path+".html";
			String realPath = request.getServletContext().getRealPath(File.separator);
			String total=realPath+File.separator+path;
			OutputStream os = new FileOutputStream(total);
			os.write(jobInfo.getBytes("utf-8"));
			os.flush();
			os.close();
			post.setJobInfo(path);
	
		}
		if(post.getId()==0) {
		    for(Post p:selectCompany.getPosts()){
				if(p.getPostName()==post.getPostName()){        
					out.print(0);
					return ;
					
				}
		}
		    post.setCompanyID(cId);
		    i = ps.insertPost(post);
		    
		}
		else {
			i = ps.updatePost(post);
		}
	
		out.print(i);
	
	
	}
/**
 * 进入公司首页显示刚发布的职位
 * 并分页显示
 *渭南师范二期-刘如艳
 *2017年9月5日下午5:23:56
 * @return
 */
	@RequestMapping("/obtainPositions")
	public String obtainPositions(HttpServletRequest request,HttpSession session,Map<String,PageInfo<Post>>map){
		int  companyId = (int) request.getSession().getAttribute("companyId");
		String pageNum = request.getParameter("pageNum");
		CompanyRegist company = cs.getCompanyById(companyId);
		PageHelper.startPage(Integer.parseInt(pageNum), 1);
	    PageInfo<Post> pageInfor=new PageInfo<Post>(company.getPosts());
	    map.put("pageinfor", pageInfor);
		session.setAttribute("company",company);
		return "company/companyInfo";
	}
	
	@RequestMapping("/getPasition2")
	@ResponseBody
	public Map<String, Object> getPasition2(){
		Map<String, Object> result = new HashMap<String, Object>();
		List<Position2> positions = p2S.getAllPositions();
		result.put("posi", positions);
		return result;
	}
	
}
	