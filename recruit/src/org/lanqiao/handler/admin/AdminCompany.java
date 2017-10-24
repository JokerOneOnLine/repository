package org.lanqiao.handler.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.lanqiao.entity.company.CompanyRegist;
import org.lanqiao.mapper.company.CompanyMapper;
import org.lanqiao.service.company.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("admin")
public class AdminCompany {
	
	@Autowired
	CompanyService cs;
	
	/**
	 * 获取所有公司
	 * 渭南师范二期-吴鹏飞、
	 * 2017年8月26日 上午11:54:37
	 * @author
	 * @param req
	 * @return
	 */
	@RequestMapping("getAllCompany")
	public ModelAndView getAllCompany(){
		List<CompanyRegist> list = cs.getAllCompany();
		ModelAndView mv = new ModelAndView();
		mv.addObject("companies", list);
		mv.setViewName("admin/testAdmin");
		return mv;
	}
	
	//审核
	@RequestMapping("toAuthentication")
	public String toAuthentication(Integer companyId){
		int i = cs.toAuthentication(companyId);
		return "redirect:getAllCompany";
	}
	
	//查看公司详情
	@RequestMapping("seeCompanyById")
	public ModelAndView seeCompanyById(int companyId){
		CompanyRegist company = cs.selectCompany(companyId);
		ModelAndView mv = new ModelAndView();
		mv.addObject("seeCompany", company);
		mv.setViewName("test");
		return mv;
	}
}
