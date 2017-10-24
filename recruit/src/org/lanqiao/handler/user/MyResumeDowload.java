package org.lanqiao.handler.user;

import java.io.File;
import javax.servlet.http.HttpServletRequest;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mchange.io.FileUtils;


/**
 * 
 * @author渭南师范二期—杨璐
 *2017年8月27日下午3:46:48
 */
@Controller
public class MyResumeDowload {

	
	@RequestMapping(value="/downloadOnlineResume")
	   public ResponseEntity<byte[]> download(HttpServletRequest request, @RequestParam("filename") String filename, Model model)throws Exception {
	    //下载文件路径
	    String path = request.getServletContext().getRealPath("/images/");
	    File file = new File(path + File.separator + filename);
	    HttpHeaders headers = new HttpHeaders(); 
	    //下载显示的文件名，解决中文名称乱码问题 
	    String downloadFielName = new String(filename.getBytes("UTF-8"),"utf-8");
	    //通知浏览器以attachment（下载方式）打开图片
	    headers.setContentDispositionFormData("attachment", downloadFielName); 
	    
	    //application/msword  word文件
	    //设置成pdf格式
	    headers.setContentType(MediaType.APPLICATION_PDF);
	    //设置成xml形式
	    headers.setContentType(MediaType.APPLICATION_ATOM_XML);
	    //上传表单数据模式
	    headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
	  //application/octet-stream ： 二进制流数据（最常见的文件下载
	    headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	   // CREATED(201, "Created"),OK(200, "OK"),
	    return new ResponseEntity<byte[]>(FileUtils.getBytes(file) , headers, HttpStatus.OK);
	   }
	

}
