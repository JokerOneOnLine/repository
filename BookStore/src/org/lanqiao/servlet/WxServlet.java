package org.lanqiao.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.lanqiao.utils.MessageUtil;
import org.lanqiao.utils.MyUtils;

public class WxServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	//	1）将token、timestamp、nonce三个参数进行字典序排序
	//	2）将三个参数字符串拼接成一个字符串进行sha1加密
	//3）开发者获得加密后的字符串可与signature对比，标识该请求来源于微信
		String signature = request.getParameter("signature");
		String timestamp = request.getParameter("timestamp");
		String nonce = request.getParameter("nonce");
		String echostr = request.getParameter("echostr");
		boolean flag = MyUtils.checkSignature(signature, timestamp, nonce);
		System.out.println(flag);
		if (flag) {
			PrintWriter out = response.getWriter();
			out.print(echostr);
			out.flush();
			out.close();
		}
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String parseRequest = MessageUtil.parseRequest(request);
		System.out.println(parseRequest);
		PrintWriter out = response.getWriter();
		out.print(parseRequest);
		out.flush();
		out.close();
		
	}

}
