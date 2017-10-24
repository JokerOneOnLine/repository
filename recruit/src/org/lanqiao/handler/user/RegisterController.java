package org.lanqiao.handler.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 根据注册“找工作”和“招人”选择跳转
 * 渭南师范二期-吴鹏飞、
 * 2017年8月25日 上午9:43:10
 * @author
 */
@Controller
public class RegisterController {
	
	@RequestMapping("/getRegisterInfo")
	public void getRegisterInfo(Integer type,HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException{
		if (type!=null) {
			if (type==1) {
				req.getRequestDispatcher("company/companyRegistInfo").forward(req, resp);
			} else {
				req.getRequestDispatcher("userController/register").forward(req, resp);
			}
		} else {
			req.getSession().setAttribute("msg", "请选择注册账号类型！");
			req.getRequestDispatcher("register.jsp").forward(req, resp);
		}
	}
	
}
