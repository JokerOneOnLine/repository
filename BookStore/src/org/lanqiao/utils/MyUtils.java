package org.lanqiao.utils;

import java.io.File;
import java.math.BigDecimal;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class MyUtils {
	public static final DataSource ds = new ComboPooledDataSource("oracle");
	public static final QueryRunner qr = new QueryRunner(ds);
	public static final ThreadLocal<Connection> conns =new ThreadLocal<Connection>();
	public static final Properties config = new Properties();
	public static final List<String> intercept=new ArrayList<String>();
	public static final String TOKEN ="joker";
	
	
	public static boolean checkSignature(String signature,String timestamp,String nonce){
		String [] src =new String []{TOKEN,timestamp,nonce};
		Arrays.sort(src);
		StringBuffer sb =new StringBuffer();
		sb.append(src[0]).append(src[1]).append(src[2]);
		String digest = messageDigest(sb.toString(),"sha1");
		return digest.equalsIgnoreCase(signature);
	}
	public static Connection getConnection(){
		Connection conn =null;
		 try {
			conn = ds.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 return conn;
	}
	public static int getId(){
		String sql ="select book_seq.nextval from dual";
		BigDecimal b;
		try {
			b = MyUtils.qr.query(sql, new ScalarHandler<BigDecimal>());
			if (b!=null) {
				return b.intValue();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public static String messageDigest(String src,String algorithm){
		try {
			MessageDigest md5 = MessageDigest.getInstance(algorithm);
			byte[] digest = md5.digest(src.getBytes());
		    char[] c ={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
		    StringBuffer sb = new StringBuffer();
		    for (byte b : digest) {
				sb.append(c[(b>>4)&0x0f]);
				sb.append(c[b&0x0f]);
			}
		    return sb.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return null;
	}
	public static String md5(String src){
		
		return messageDigest(src, "md5");
	}
	public static  void  sendEmail(String to,String subject,String content) {
		try {//xafjpjqxhloibidi   smtp.qq.com  384322554@qq.com", "来自火星情报局的","utf-8");
			SimpleEmail simpleEmail = new SimpleEmail();
			simpleEmail.setAuthentication(config.getProperty("user"),config.getProperty("emailpwd"));//授权码
			simpleEmail.setSmtpPort(535);
			simpleEmail.setHostName(config.getProperty("smtp"));
			simpleEmail.setFrom(config.getProperty("email"),config.getProperty("title"),config.getProperty("charset"));
			simpleEmail.addTo(to);
			simpleEmail.setSSLOnConnect(true);
			simpleEmail.setSubject(subject);
			simpleEmail.setMsg(content);
			simpleEmail.send();
		} catch (EmailException e) {
			e.printStackTrace();
		}
	}
	public static String getPath(ServletContext sc,String imgDir){
		String realPath = sc.getRealPath("/");
		Date date = new Date();
		String dir = imgDir+"/"+MyUtils.getYear(date)+"/"+MyUtils.getMonth(date)+"/"+MyUtils.getDay(date);
		String total =realPath+dir;
		File dirFile=new File(total);
		if (!dirFile.exists()) {
			dirFile.mkdirs();
		}
		String fileName = getRandomMD5();
		return dir+'/'+fileName;
	}
	
	public static String getRandomMD5() {
		Date date =new Date();
		String src = new Long(date.getTime()).toString()+new Double(Math.random()).toString();
		return MyUtils.md5(src);
	}
	
	public static String getYear(Date d){
		SimpleDateFormat format = new SimpleDateFormat("yyyy");
		return format.format(d);
	}
	public static String getMonth(Date d){
		SimpleDateFormat format = new SimpleDateFormat("MM");
		return format.format(d);
	}		
	public static String getDay(Date d){
		SimpleDateFormat format = new SimpleDateFormat("dd");
		return format.format(d);
	}
}
