package org.lanqiao.util;

import java.io.File;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

public class UserUtil {
	public static final List<String> intercept = new ArrayList<String>();
	public static final List<String> intercept1 = new ArrayList<String>();
	/**
	 * 分页查询上下线职位的分页大小，默认为4，可在这里修改比较方便
	 */
	public static  final int pageSize=2;
	/**
	 * 渭南师范二期-杨璐
	 *2017年8月27日 上午11:46:03
	 * @param date
	 * @return
	 */
	public  static String dateToString(Date date){
		SimpleDateFormat sf=new SimpleDateFormat("yyyyMMdd  hh:mm:ss");
		String format = sf.format(date);
		return format;
		
	}
	/**
	 * 用户注册密码加密 
	 * 渭南师范二期-刘如艳 2017年8月23日上午11:30:48
	 * 
	 * @param src
	 * @return
	 */
	public static String MessageDigest(String src) {
		try {
			MessageDigest md = MessageDigest.getInstance("md5");
			byte[] digest = md.digest(src.getBytes());
			StringBuffer sb = new StringBuffer();
			char[] c = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };
			for (byte b : digest) {
				sb.append(c[(b >> 4) & 0x0f]);
				sb.append(c[b & 0x0f]);
			}
			return sb.toString();
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 
	 * 邮箱验证获取验证码 
	 * 渭南师范二期-刘如艳 2017年8月23日上午11:35:55
	 */
	public static void getVcode(String to, String object, String message) {

		SimpleEmail se = new SimpleEmail();
		se.setAuthentication("2623481865@qq.com", "bnswwtlhhgpweajg");
		se.setHostName("smtp.qq.com");
		se.setSmtpPort(465);
		se.setSSLOnConnect(true);
		try {
			se.addTo(to);
			se.setFrom("2623481865@qq.com", "简单点点");
			se.setMsg(message);
			se.setSubject(object);
			se.send();
		} catch (EmailException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * 
	 * 获取头像的路径
	 * 渭南师范二期-刘如艳 2017年8月24日下午11:14:55
	 * 
	 * @param s
	 * @param imgdir
	 * @return
	 */
	public static String getPath(ServletContext s, String imgdir) {
		String realPath = s.getRealPath(File.separator);
		Date d = new Date();
		String dir = imgdir + File.separator + getYear(d) + File.separator + getMonth(d) + File.separator + getDay(d);
		String totalPath = realPath + dir ;
		File f = new File(totalPath);
		if (!f.exists()) {
			f.mkdirs();
		}
		String src = (new Long(d.getTime()).toString() + new Double(Math.random()).toString());
		String md5 = MessageDigest(src);
		return dir + File.separator + md5;
	}

	/**
	 *生成图片存储路经
	 *渭南师范二期-刘如艳 2017年8月24日下午11:16:31
	 * @param date
	 * @return
	 */
	public static String getYear(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		String format = sdf.format(date);
		return format;
	}

	public static String getMonth(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("MM");
		String format = sdf.format(date);
		return format;
	}

	public static String getDay(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("dd");
		String format = sdf.format(date);
		return format;
	}
	
	/**
	 * 将日期的格式转换成String类型的
	 * @author 
	 *渭南师范学院二期    李晨晨
	 *2017年8月27日
	 */
	public static String DateToStr(Date date) {
		   SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		   String str = format.format(date);
		   return str;
		} 

}
