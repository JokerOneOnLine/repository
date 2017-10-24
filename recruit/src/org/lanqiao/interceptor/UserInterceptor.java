package org.lanqiao.interceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.lanqiao.entity.company.CompanyRegist;
import org.lanqiao.entity.user.User;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
@Component
/**
 * 
 * 拦截器类
 * @author Administrator
 *渭南师范二期-刘如艳
 *2017年8月25日下午4:29:00
 */

public class UserInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Integer userId = (Integer) request.getSession().getAttribute("userId");
		//CompanyRegist company = (CompanyRegist) request.getSession().getAttribute("company");
		if(userId==null){
		StringBuffer URL = request.getRequestURL();
		String queryString = request.getQueryString();
		response.sendRedirect(request.getContextPath()+"/unlogin.jsp?url="+URL+"?"+queryString);
		return false;
		}else {
			return true;
		}
		
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}

}
