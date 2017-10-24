package org.lanqiao.handler.company;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.io.IOUtils;
import org.lanqiao.entity.company.CompanyProduct;
import org.lanqiao.entity.company.CompanyRegist;
import org.lanqiao.service.company.CompanyProductService;
import org.lanqiao.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 * 公司产品
 *渭南师范二期-高瑞
 *2017年8月24日上午9:02:29
 */

@RequestMapping("companyProductController")
@Controller
public class CompanyProductController {
	/**
	 * 增加公司产品
	 */
	@Autowired
	CompanyProductService companyProductService;
	@RequestMapping(value="insertCompanyProduct")
	public String insertCompanyProduct(@Valid CompanyProduct companyProduct,@RequestParam("poster2") MultipartFile myfile,HttpServletRequest request, HttpSession httpsession){
		try {
			String filename = myfile.getOriginalFilename();
			InputStream in = myfile.getInputStream();
			// 截取url字段，让图片信息加密
			String ext = filename.substring(filename.lastIndexOf("."));
			// 给文件一个存放路径
			String path = UserUtil.getPath(request.getServletContext(), "company/poster") + ext;
			// 让文件可以放入服务器
			String total = request.getServletContext().getRealPath("/") + path;
			// 输出流来写出图片信息
			OutputStream os = new FileOutputStream(total);
			IOUtils.copy(in, os);
			// 将最后Poster路径放入companyProduct
			companyProduct.setPoster(path);
			// 从Session域中找到CompanyRegist的id
			int companyId = (int) httpsession.getAttribute("Id");
			// 将CompanyRegist的id放入companyProduct对象中
			companyProduct.setCompanyId(companyId);
			// 加入数据库
			companyProductService.insertCompanyProduct(companyProduct);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "company/CompanyWating";
	}
}

