package org.lanqiao.handler.company;

import java.io.*;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.lanqiao.entity.company.CompanyRegist;
import org.lanqiao.entity.company.Post;
import org.lanqiao.entity.company.PostSearch;
import org.lanqiao.entity.company.Tag;
import org.lanqiao.entity.company.postDetail;
import org.lanqiao.entity.user.EducationalBackground;
import org.lanqiao.entity.user.HopeSalary2;
import org.lanqiao.entity.user.WorkExperience;
import org.lanqiao.service.company.BaseInfoService;
import org.lanqiao.service.company.CompanyService;
import org.lanqiao.service.company.PostService;
import org.lanqiao.service.user.EducationalBackgroundService;
import org.lanqiao.service.user.HopeSalary2Service;
import org.lanqiao.service.user.Position2Service;
import org.lanqiao.service.user.PositionService;
import org.lanqiao.service.user.WorkExperienceService;
import org.lanqiao.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 
 * @author 渭南师范二期-许园园 2017年8月26日 上午10:42:24
 */
@Controller
public class PostController {
	@Autowired
	PostService postService;
	@Autowired
	CompanyService companyService;
	@Autowired
	Position2Service p2;
	@Autowired
	PositionService ps;
	@Autowired
	WorkExperienceService ws;
	@Autowired
	EducationalBackgroundService ebs;
	@Autowired
	HopeSalary2Service hs2s;
	@Autowired
	BaseInfoService bis;
	
	
	/**
	 * 根据职位id获取职位
	 *渭南师范二期—杨璐@param id
	 *渭南师范二期—杨璐@param m
	 *渭南师范二期—杨璐@param requset
	 *渭南师范二期—杨璐@return
	 * 2017年9月22日下午2:56:46
	 * @param id
	 * @param m
	 * @param requset
	 * @return
	 */
	
	@RequestMapping("getPostById")
	public  String getPositionById(Integer id,Model m,HttpServletRequest requset) {
		Post post = postService.selectPost(id);
		String data;
		if(post.getJobInfo()!=null){
		data=post.getJobInfo();
		String totalpath=data.substring(data.indexOf(File.separator)+1);
		
		String realPath= requset.getServletContext().getRealPath("jobInfor");
		totalpath=realPath+File.separator+totalpath;
		String line;     
         try {
        	 FileInputStream is=new FileInputStream(totalpath);
        	 InputStreamReader isr=new InputStreamReader(is,"utf8");
        	 BufferedReader br=new BufferedReader(isr);     
			while((line=br.readLine()) != null){     
			     data=line;  
			     post.setJobInfo(data);
			 }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}     
		}
		requset.setAttribute("post", post);
		return "company/post";
	}
	
	/**
	 * 刷新一个职位
	 *渭南师范二期—杨璐@param request
	 *渭南师范二期—杨璐@param response
	 * 2017年9月22日下午2:57:06
	 * @param request
	 * @param response
	 */
	@RequestMapping("refreshPositioin")
	public void refresh(HttpServletRequest request, HttpServletResponse response) {
		String strId = request.getParameter("id");
		String strOnline = request.getParameter("online");
		int online = Integer.parseInt(strOnline);
		Post post = postService.selectPost(Integer.parseInt(strId));
		Date date = new Date();
		PrintWriter out=null;
		long time=date.getTime()-post.getDate().getTime();
		try {
			 out = response.getWriter();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		if((time/(24*60*60*1000))<1) {
			out.println(0);
			
		}else {
			post.setDate(date);
			postService.updatePost(post);
			try {
				response.sendRedirect("getAll?pageNo=1&online="+online);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}

	}

	/**
	 * 更改职位上下线 渭南师范二期—杨璐@return 2017年9月7日上午11:05:08 
	 * post插入数据库时以最后一次更新的时间为准
	 * 
	 * @return
	 */
	@RequestMapping("updateOnline")
	public void updateOnline(HttpServletRequest request, HttpServletResponse response) {
		String strOnline = request.getParameter("online");
		int online = Integer.parseInt(strOnline);
		String strId = request.getParameter("id");
		Post post = postService.selectPost(Integer.parseInt(strId));
		post.setDate(new Date());
		post.setOnline(Integer.parseInt(strOnline));
		postService.updatePost(post);
		try {
			response.sendRedirect("getAll?pageNo=1&online=" + online);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	/**
	 * 删除上下线职位 渭南师范二期—杨璐@return 2017年9月6日下午8:48:53
	 * 
	 * @return
	 */
	@RequestMapping("delete")
	public void deleteOutLine(HttpServletRequest request, HttpServletResponse response) {
		String strId = request.getParameter("id");
		String strOnlie = request.getParameter("online");
		int online = Integer.parseInt(strOnlie);
		postService.deletePost(Integer.parseInt(strId));
		try {
			response.sendRedirect("getAll?pageNo=1&online=" + online);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	/**
	 * ----梁琼
	 * 显示所有职业信息 渭南师范二期-许园园 2017年8月26日 上午11:44:23
	 * 
	 * @param key
	 * @return
	 */
	@RequestMapping("positionInfo")
	public String positionInfo1(HttpSession session ,String key,int pageNo,@RequestParam(required=false) int args0,@RequestParam(required=false) int args1,@RequestParam(required=false) int args2,@RequestParam(required=false) String city,Map<String,Object> map){
		int min = 0;
		int max = 0;
		String hopeSaName = hs2s.selectHopeSalaryNameById(args2);
		String split[] = hopeSaName.split("元");
		String h = split[0];
		if(h.equals("不限")){
			min = 0;
			max = 999999999;
		}else if(h.equals("2000")){
			min = 0;
			max = 2000;
		}else if(h.equals("50000")){
			min = 50000;
			max = 9999999;
		}else{
			String split2[] = h.split("-");
			min = Integer.parseInt(split2[0]);
			max = Integer.parseInt(split2[1]);
		}
		PageHelper.startPage(pageNo, 5);
		List<PostSearch> posts = postService.selectPostLike(key,args0,args1,min,max,city);
		PageInfo<PostSearch> pageInfo = new PageInfo<PostSearch>(posts, 8);
		map.put("pageinfo", pageInfo);
		session.setAttribute("a0", args0);
		session.setAttribute("a1", args1);
		session.setAttribute("a2", args2);
		session.setAttribute("key", key);
		session.setAttribute("a3", city);
		return "user/position";
	}
	/**
	 * @author layla 
	 * 渭南师范二期梁琼
	 * 2017年9月23日 下午9:29:28
	 * @return
	 */
	@RequestMapping("positionInfo1")
	@ResponseBody
	public Map<String,Object> positionInfo1(){
		Map<String,Object> map = new HashMap<String,Object>();
		List<WorkExperience> experiences = ws.selectAllWorkExperience();
		map.put("experiences",experiences);
		return map;
	}
	/**
	 * @author layla 
	 * 渭南师范二期梁琼
	 * 2017年9月23日 下午9:29:33
	 * @return
	 */
	@RequestMapping("positionInfo2")
	@ResponseBody
	public Map<String,Object> positionInfo2(){
		Map<String,Object> map = new HashMap<String,Object>();
		List<EducationalBackground> eduBackground = ebs.selectAllEducationalBackground();
		map.put("eduBackground", eduBackground);
		return map;
	}
	/**
	 * 
	 * @author layla 
	 * 渭南师范二期梁琼
	 * 2017年9月23日 下午9:29:39
	 * @return
	 */
	@RequestMapping("positionInfo3")
	@ResponseBody
	public Map<String,Object> positionInfo3(){
		Map<String,Object> map = new HashMap<String,Object>();
		List<HopeSalary2> hopeSalarys = hs2s.selectHopeSalarys();
		map.put("hopeSalarys", hopeSalarys);
		return map;
	}
	/**
	 * 
	 * @author layla 
	 * 渭南师范二期梁琼
	 * 2017年9月27日 下午8:00:54
	 * @return
	 */
	@RequestMapping("postDetail")
	public String postDetail(Map<String,Object> map,int id){
		postDetail details = postService.selectDetails(id);
		List<Tag> tags = postService.selectCompanyTags(id);
		map.put("detail", details);
		map.put("tags", tags);
		return "user/jobDetail";
	}
	
	/**
	 * 分页查询上下线职位 渭南师范二期—杨璐@param session 
	 * 渭南师范二期—杨璐@param request
	 *  渭南师范二期—杨璐@param map
	 * 渭南师范二期—杨璐@return 2017年9月6日上午11:40:44
	 * 
	 * @param session
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping("getAll")
	public String getAll(HttpSession session, HttpServletRequest request, Model m) {
		int cId = (int) session.getAttribute("companyId");
		String strPageNo = request.getParameter("pageNo");
		int pageNo = Integer.parseInt(strPageNo);
		String strOnline = request.getParameter("online");
		int online = Integer.parseInt(strOnline);
		PageHelper.startPage(pageNo, UserUtil.pageSize);
		List<Post> all = postService.getAll(online, cId);
		PageInfo<Post> pageInfo = new PageInfo<>(all, 3);
		m.addAttribute("pageinfo", pageInfo);
		if (online == 0) {
			return "company/OutLine";
		} else {

			return "company/EffectivePosition";
		}

	}

}
