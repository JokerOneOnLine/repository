package org.lanqiao.filter;

import java.io.IOException;


import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.lanqiao.entity.company.CompanyRegist;
import org.lanqiao.entity.user.User;
import org.lanqiao.util.UserUtil;
import org.springframework.web.filter.OncePerRequestFilter;

import com.mchange.v2.sql.filter.SynchronizedFilterDataSource;
/**
 * 公司过滤器
 * @author
 * 渭南师范学院二期
 * 2017年9月21日 上午8:55:33
 */
public class CompanyFilter extends OncePerRequestFilter {

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		if (!UserUtil.intercept1.contains(requestURI)){
			chain.doFilter(request, response);
		} else {
			Integer companyId = (Integer)request.getSession().getAttribute("companyId");
			if (companyId == null) {
				StringBuffer URL = request.getRequestURL();
				String queryString = request.getQueryString();
				response.sendRedirect(request.getContextPath() + "/unlogin2.jsp?url=" + URL + "?" + queryString);
			} else {
				chain.doFilter(request, response);
			}
		}
	}
}