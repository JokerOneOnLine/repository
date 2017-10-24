package org.lanqiao.handler.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.lanqiao.entity.admin.Admin;
import org.lanqiao.entity.company.CompanyRegist;
import org.lanqiao.service.admin.AdminService;
import org.lanqiao.service.company.CompanyService;
import org.lanqiao.util.Msg;
import org.lanqiao.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 
 * 渭南师范二期-程建波 2017年8月26日上午11:08:14
 */
@RequestMapping("/admin")
@Controller
public class AdminController {
	@Autowired
	AdminService as;
	@Autowired
	CompanyService cs;

	@RequestMapping("/login")
	public String adminLogin(Admin a, HttpSession session) {

		String pwd = UserUtil.MessageDigest(a.getPassword());
		a.setPassword(pwd);
		Admin ad = as.adminLogin(a.getName());
		if (ad != null) {
			if (ad.getPassword().equals(a.getPassword())) {
				if (ad.getType().equals("管理员")) {
					session.setAttribute("adminName", ad.getName());
					return "admin/adminWelcome";
				} else {
					return "admin/superAdminWelcome";
				}
			}
		}
		return "";
	}

	@RequestMapping("/getAllNoCompany")
	public String getAllNoCompany(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
		int authentication = 0;
		PageHelper.startPage(pn, 8);
		List<CompanyRegist> allNoCompany = cs.getAllNoCompany(authentication);
		PageInfo<CompanyRegist> page = new PageInfo<CompanyRegist>(allNoCompany, 5);
		model.addAttribute("pageInfo", page);
		return "admin/adminCompany";
	}

	@RequestMapping("/updateCompany")
	public void upDateCompany(@RequestParam(value = "companyId") Integer companyId, HttpServletResponse response) {
		CompanyRegist company = cs.getCompanyByCompanyId(companyId);
		company.setAuthentication(1);
		int i = cs.updateCompany(company);
		try {
			PrintWriter out = response.getWriter();
			if (i > 0) {
				out.print(1);
			} else {
				out.print(0);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	//退出
	@RequestMapping("/adminLoginOut")
	public String adminLoginOut(HttpSession session) {
		session.removeAttribute("adminName");
		return "admin/adminLogin";
	}
}
