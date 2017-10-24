package org.lanqiao.handler.admin;

import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JsonController {
	/**
	 *渭南师范二期-许园园
	 *2017年9月5日 下午9:05:54 
	 *@param request
	 *@param re
	 *@throws IOException
	 */
	@RequestMapping("/testJson")
	public void  testJson(HttpServletRequest request,HttpServletResponse re) throws IOException{
		re.setCharacterEncoding("utf-8");
		String realPath = request.getServletContext().getRealPath("addrJson");
		Reader is = new FileReader(realPath+"/"+"citys.txt");
		int len = 0;
		char[]  b = new char[512];
		StringBuffer sb = new StringBuffer();
		while((len=is.read(b))!=-1){
			sb.append(new String(b,0,len));
		}
		is.close();
		String menuJson = sb.toString();
		PrintWriter out = re.getWriter();
		out.print(menuJson);
		out.flush();
		out.close();
	}
}
