package org.lanqiao.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.lanqiao.entity.company.CompanyRegist;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
/**
 * 
 * @author
 * 渭南师范学院二期
 * 2017年9月21日 上午8:55:51
 */
public class CompanyInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Integer companyId = (Integer) request.getSession().getAttribute("userId");
		if(companyId==null){
			StringBuffer URL = request.getRequestURL();
			String queryString = request.getQueryString();
			response.sendRedirect(request.getContextPath()+"/nologin.jsp?url="+URL+"?"+queryString);
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
		// TODO Auto-generated method stub
	}
}
