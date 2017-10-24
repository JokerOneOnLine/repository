package org.lanqiao.handler.company;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.io.IOUtils;
import org.lanqiao.entity.company.CompanyEnterTeam;
import org.lanqiao.entity.company.CompanyRegist;
import org.lanqiao.service.company.CompanyEnterTeamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

/**
 * 渭南师范二期-樊璐璐 2017年8月24日上午9:17:42
 * 
 * @author lenovo
 */
@Controller
@RequestMapping(value = "CompanyEnterTeamController")
public class CompanyEnterTeamController {
	@Autowired
	CompanyEnterTeamService companyEnterTeamService;

	// 查看创始团队记录
	@RequestMapping(value = "getEnterTeamByComponyId", method = RequestMethod.GET)
	public String get(@PathVariable Integer id) {
		System.out.println("get");
		return "test";
	}

	// 更新创始团队记录@PathVariable Integer id
	@RequestMapping(value = "updateEnterTeamByComponyId/CompanyId", method = RequestMethod.PUT)
	public String update() {
		System.out.println("update");
		return "test";
	}

	// 插入创始团队记录
	@RequestMapping(value = "/insertEnterTeamToCompany")
	public String insert(CompanyEnterTeam cet, MultipartFile founderSurface1, HttpSession session) {
		String fileName = founderSurface1.getOriginalFilename();
		// 文件上传获得文件名称获得文件的内容
		int i = fileName.indexOf(".");
		// 获取文件前缀名
		String string = fileName.substring(0, i);
		// 生成新的文件名
		String u = UUID.randomUUID().toString().replaceAll("-", "");
		// 替换文件名
		String replaceName = fileName.replace(string, u);
		// 获取上传路径
		String realPath = session.getServletContext().getRealPath("upload");
		int companyId = (int) session.getAttribute("Id");
		try {
			InputStream in = founderSurface1.getInputStream();
			OutputStream out = new FileOutputStream(realPath + "/" + replaceName);
			IOUtils.copy(in, out);
			cet.setFounderSurface("upload" + "/" + replaceName);
			cet.setCompanyId(companyId);
			int j = companyEnterTeamService.insertEnterTeamToCompany(cet);
			in.close();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "company/companyProduct";
	}

}
