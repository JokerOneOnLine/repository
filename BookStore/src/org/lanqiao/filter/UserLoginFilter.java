package org.lanqiao.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;


import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.lanqiao.utils.MyUtils;

public class UserLoginFilter implements Filter{

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest  req =(HttpServletRequest) request;
		HttpServletResponse resp =(HttpServletResponse) response;
	    //登陆之后才能做的
		String requestURI = req.getRequestURI();
		if (!MyUtils.intercept.contains(requestURI)) {
			chain.doFilter(request, response);
		}else {
			Object user = req.getSession().getAttribute("user");
			if (user==null) {
				request.setAttribute("msg", "你还没登录....");
				request.getRequestDispatcher("/WEB-INF/info.jsp").forward(request, response);
			}else {
				chain.doFilter(request, response);
			}
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

}
