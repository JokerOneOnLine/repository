package org.lanqiao.filter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.lanqiao.utils.MyUtils;

public class TransactionFilter implements Filter{

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		Connection conn= null;
		try {
			//获取链接
			conn=MyUtils.ds.getConnection();
			//不自动提交
			conn.setAutoCommit(false);
			//绑定线程
			MyUtils.conns.set(conn);
			chain.doFilter(request, response);
			//提交
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
			try {
				//出错回滚
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}finally {
			if (conn!=null) {
				try {
					//关闭连接
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

}
