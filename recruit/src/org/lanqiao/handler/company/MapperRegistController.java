package org.lanqiao.handler.company;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.lanqiao.entity.company.CompanyRegist;
import org.lanqiao.entity.company.Post;
import org.lanqiao.service.company.CompanyService;
import org.lanqiao.service.user.EducationalBackgroundService;
import org.lanqiao.service.user.Position2Service;
import org.lanqiao.service.user.WorkExperienceService;
import org.lanqiao.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@RequestMapping("company")
@Controller
public class MapperRegistController {

	@Autowired
	CompanyService cs;
	@Autowired
	Position2Service p2;
	@Autowired
	WorkExperienceService wes;
	@Autowired
	EducationalBackgroundService ebs;

	/**
	 * 公司注册 渭南师范二期-吴鹏飞、 2017年8月24日 下午6:10:40
	 * 
	 * @author
	 * @param email
	 * @param pwd
	 * @return
	 */
	@RequestMapping("companyRegistInfo")
	public String getCompanyInfo(String email, String pwd, String vCode, HttpServletRequest rqs,
			Map<String, Object> map, HttpSession httpSession) {
		// 邮箱验证
		CompanyRegist regist = cs.selectCompanyByEmail(email);
		System.out.println(regist);
		if (regist != null) {
			map.put("msg", "邮箱已被注册！");
			return "register";
		}
		// 验证码验证
		Integer code = (Integer) rqs.getSession().getAttribute("code");
		int vcode = Integer.parseInt(vCode);
		if (code == vcode) {
			String digest = UserUtil.MessageDigest(pwd);
			CompanyRegist company = new CompanyRegist(email, digest);
			int i = cs.insertCompany(company);
			httpSession.setAttribute("Id", company.getCompanyId());
			if (i == 0) {
				return "register";
			} else {
				return "company/registCompanyBaseInfo";
			}
		} else {
			map.put("msg", "验证码不正确！");
			return "register";
		}
	}

	// 我的公司
	@RequestMapping("toCompany")
	public ModelAndView toCompany(Integer id) {
		CompanyRegist company = cs.selectCompany(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("company", company);
		mv.setViewName("company/companyInfo");
		return mv;
	}

	// 公司登陆
	/**
	 * 在登陆的时候带上职位并分页显示 渭南师范二期-刘如艳 2017年9月5日上午11:18:21
	 * 
	 * @param email
	 * @param pwd
	 * @param httpSession
	 * @return
	 */

	@RequestMapping(value = "loging", method = RequestMethod.POST)
	public ModelAndView companyLogin(String url, String email, String pwd, HttpSession httpSession,
			HttpServletRequest request, HttpServletResponse response) {
		String pwd1 = UserUtil.MessageDigest(pwd);
		CompanyRegist com = new CompanyRegist(email, pwd1);
		String pageNum = request.getParameter("pageNum");
		PageHelper.startPage(Integer.parseInt(pageNum), UserUtil.pageSize);
		CompanyRegist company = cs.getCompany(com);
		ModelAndView mv = new ModelAndView();
		httpSession.setAttribute("companyId", company.getCompanyId());
		httpSession.setAttribute("email", company.getCompanyEmail());
		PageInfo<Post> pageInfor = new PageInfo<Post>(company.getPosts());
		mv.addObject("company", company);
		httpSession.setAttribute("any", company);
		mv.addObject("pageinfor", pageInfor);
		mv.setViewName("company/companyInfo");
		return mv;
	}

	@RequestMapping(value = "/getCompanyById")
	public ModelAndView company(HttpSession httpSession, HttpServletRequest request, HttpServletResponse response) {

		String pageNum = request.getParameter("pageNum");
		PageHelper.startPage(Integer.parseInt(pageNum), UserUtil.pageSize);
		int companyId = (int) httpSession.getAttribute("companyId");
		CompanyRegist company = cs.getCompanyById(companyId);
		// CompanyRegist company = cs.getCompany(com);
		ModelAndView mv = new ModelAndView();
		if (company == null) {
			mv.setViewName("loginFailed");
		} else {
			httpSession.setAttribute("companyId", company.getCompanyId());
			httpSession.setAttribute("email", company.getCompanyEmail());
			PageInfo<Post> pageInfor = new PageInfo<Post>(company.getPosts());
			mv.addObject("company", company);
			httpSession.setAttribute("any", company);
			mv.addObject("pageinfor", pageInfor);
			mv.setViewName("company/companyInfo");
		}
		return mv;
	}

	/**
	 * 用户退出
	 * 
	 * @author 渭南师范学院二期 李晨晨 2017年9月5日
	 */
	@RequestMapping("/companyExit")
	public String exit(HttpServletRequest request) {
		// System.out.println("123....");
		// request.getSession().removeAttribute("companyId");
		request.getSession().invalidate();
		return "redirect:/";

	}

}
