package org.lanqiao.handler.company;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.lanqiao.entity.company.BaseInfo;
import org.lanqiao.entity.company.CompanyRegist;
import org.lanqiao.entity.company.Post;
import org.lanqiao.service.company.BaseInfoService;
import org.lanqiao.service.company.CompanyService;
import org.lanqiao.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@RequestMapping("/CompanyListController")
@Controller
public class CompanyListController {

	@Autowired
	BaseInfoService bis;
	@Autowired
	CompanyService cs;

	/**
	 * 通過城市查询公司 渭南师范二期-易孝凡 2017年9月8日 修改查询所有城市的职位 渭南师范二期-杨萌 2017年8月28日 下午3:49:48
	 * 
	 * @param companyCity
	 * @return
	 */
	@RequestMapping("/getBaseInfoByCompanyCity")
	public String getBaseInfoByCompanyCity(HttpServletRequest request, Map map) {
		String companyCity = request.getParameter("companyCity");
		String pageNum = request.getParameter("pageNum");
		PageHelper.startPage(Integer.parseInt(pageNum), 6);
		List<BaseInfo> allCompany = null;
		if (companyCity.equals("all")) {
			allCompany = bis.getAllCompany();
		} else {
			allCompany = bis.getBaseInfoByCompanyCity(companyCity);
		}
		PageInfo<BaseInfo> pageInfo = new PageInfo<BaseInfo>(allCompany, 6);
		
		map.put("companyCity", companyCity);
		map.put("pageInfo", pageInfo);
		return "company/companylist";
	}

	/**
	 * 查询公司详情 易孝凡
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("toCompany")
	public ModelAndView toCompany(Integer id, HttpServletRequest request) {
		CompanyRegist com = cs.selectCompanyById(id);
		String pageNum = request.getParameter("pageNum");
		PageHelper.startPage(Integer.parseInt(pageNum), UserUtil.pageSize);
		CompanyRegist company = cs.getCompany(com);
		ModelAndView mv = new ModelAndView();
		/*if (company == null) {
			mv.setViewName("loginFailed");
		} */
			PageInfo<Post> pageInfor = new PageInfo<Post>(company.getPosts());
			mv.addObject("company", company);
			mv.addObject("page", pageInfor);
			mv.setViewName("company/companyPage");
		
		return mv;

	}

	/*
	 * @RequestMapping("/showDetail") public String getAllCompany(Map
	 * map,HttpServletRequest request){ String id = request.getParameter("id");
	 * BaseInfo company = bis.getBaseInfoByCompanyId(Integer.parseInt(id));
	 * System.out.println("company"+company); map.put("company", company);
	 * return "company/companyPages"; }
	 */

	/*
	 * @RequestMapping("/getCompany") public String getAllCompany(Map
	 * map,HttpServletRequest request){ String pageNum =
	 * request.getParameter("pageNum"); List<BaseInfo> allCompany =
	 * bis.getAllCompany(); PageHelper.startPage(Integer.parseInt(pageNum),6);
	 * PageInfo<BaseInfo> pageInfo = new PageInfo<BaseInfo>(allCompany,6);
	 * if(allCompany==null){ return ""; }
	 * System.out.println(pageInfo+"---"+allCompany); map.put("pageInfo",
	 * pageInfo); return "company/companyLis"; }
	 */
	/**
	 * 检验密码
	 * 
	 * @author 渭南师范学院二期 李晨晨 2017年9月19日
	 */
	@RequestMapping("/checkPwd")
	public void checkPwd(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String oldpassword = request.getParameter("oldpassword");
		// System.out.println(oldpassword);
		String oldpwd = UserUtil.MessageDigest(oldpassword);
//		CompanyRegist cr = (CompanyRegist) request.getSession().getAttribute("companyId");
//		String oldPwd2 = cr.getLoginPwd();
//		PrintWriter out = response.getWriter();
		int companyId = (int) request.getSession().getAttribute("companyId");
		 CompanyRegist cr = cs.selectCompanyById(companyId);
		PrintWriter out = response.getWriter();
		if (oldpwd.equals(cr.getLoginPwd())) {
			out.print(true);
		} else {
			out.print(false);
		}
	}

	/**
	 * 更新公司密码
	 * 
	 * @author 渭南师范学院二期 李晨晨 2017年9月19日
	 */
	@RequestMapping("/updatePwd")
	public String updatePwd(HttpServletRequest request, HttpServletResponse response) {
		 int companyId = (int) request.getSession().getAttribute("companyId");
		 CompanyRegist cr = cs.selectCompanyById(companyId);
//		String email = cr.getCompanyEmail();
//		CompanyRegist companyRegist = cs.selectCompanyByEmail(email);
//		System.out.println(companyRegist);
		String newpassword = request.getParameter("newpassword");
		String pwd1 = UserUtil.MessageDigest(newpassword);
		cr.setLoginPwd(pwd1);
		int i = cs.dateCompany(cr);
		if (i != 0) {
			return "success";
		} else {
			return "updatePwdFail";
		}
	}

}
