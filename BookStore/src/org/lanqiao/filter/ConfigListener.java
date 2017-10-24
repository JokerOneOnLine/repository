package org.lanqiao.filter;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.lanqiao.utils.MyUtils;

public class ConfigListener implements ServletContextListener{

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		
		String path =sce.getServletContext().getRealPath("/WEB-INF/classes/config.properties");
		try {
			FileInputStream is = new FileInputStream(path);
			MyUtils.config.load(is);
			is.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		path = sce.getServletContext().getRealPath("/WEB-INF/classes/paths.txt");
		try {
			FileReader fr = new FileReader(path);
			BufferedReader br = new BufferedReader(fr);
			String str =null;
			while ((str=br.readLine())!=null) {
				MyUtils.intercept.add(sce.getServletContext().getContextPath()+str);
			}
			br.close();
			fr.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
