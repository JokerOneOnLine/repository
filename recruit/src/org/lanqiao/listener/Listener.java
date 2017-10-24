package org.lanqiao.listener;

import java.io.BufferedReader;
import java.io.FileReader;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.lanqiao.util.UserUtil;
/**
 * 
 * @author
 * 渭南师范学院二期 许园园
 * 2017年9月21日 下午2:51:32
 */
public class Listener implements ServletContextListener{

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		try{
			String path = sce.getServletContext().getRealPath("/WEB-INF/classes/userFilter.txt");
			FileReader fr = new FileReader(path);
			BufferedReader br = new BufferedReader(fr);
			String str;
			while((str=br.readLine())!=null){
				UserUtil.intercept.add(sce.getServletContext().getContextPath()+str);
			}
			br.close();
			fr.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		try{
			String path = sce.getServletContext().getRealPath("/WEB-INF/classes/companyFilter.txt");
			FileReader fr = new FileReader(path);
			BufferedReader br = new BufferedReader(fr);
			String str;
			while((str=br.readLine())!=null){
				UserUtil.intercept1.add(sce.getServletContext().getContextPath()+str);
			}
			br.close();
			fr.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
