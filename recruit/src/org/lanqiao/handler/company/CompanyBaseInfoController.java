package org.lanqiao.handler.company;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.lanqiao.entity.company.BaseInfo;
import org.lanqiao.entity.company.CompanyEnterTeam;
import org.lanqiao.entity.company.CompanyRegist;
import org.lanqiao.service.company.BaseInfoService;
import org.lanqiao.service.company.CompanyEnterTeamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 * 
 * 渭南师范二期-程建波
 * 2017年8月25日上午11:50:02
 */
@RequestMapping(value = "/baseInfo")
@Controller
public class CompanyBaseInfoController {
	@Autowired
	BaseInfoService bis;
	

	/**
	 * 	添加企业信息，上传企业logo方法
	 *	渭南师范二期-程建波
	 *	2017年8月25日上午11:50:30
	 */
	@RequestMapping("/insert")
	public String insertBaseInfo(BaseInfo b, MultipartFile companyLogo2, HttpServletRequest request,HttpSession httpSession) {
		int companyId = (int) httpSession.getAttribute("Id");
		b.setCompanyId(companyId);
		httpSession.setAttribute("basecompany", b);
		String fileName = companyLogo2.getOriginalFilename();
		// 文件上传获得文件名称获得文件的内容
		int i = fileName.indexOf(".");
		// 获取文件前缀名
		String string = fileName.substring(0, i);
		// 生成新的文件名
		String u = UUID.randomUUID().toString().replaceAll("-", "");
		// 替换文件名
		String replaceName = fileName.replace(string, u);
		// 获取上传路径
		String path = request.getServletContext().getRealPath("upload");
		try {
			InputStream in = companyLogo2.getInputStream();
			OutputStream out = new FileOutputStream(path + "/" + replaceName);
			IOUtils.copy(in, out);
			b.setCompanyLogo("upload" + "/"+replaceName);
			int j = bis.insertBaseInfo(b);
			
			in.close();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "company/companyTag";
	}
	
	@RequestMapping("getComapanyName")
	@ResponseBody
	public Map<String, Object> getComapanyName(HttpSession session,HttpServletResponse response) throws IOException{
		int id = (int) session.getAttribute("companyId");
		BaseInfo company = bis.getBaseInfoByCompanyId(id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("companyName", company.getCompanyName());
		return map;
	}
}
