package org.lanqiao.utils;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.lanqiao.wx.entity.TextMessage;

import com.thoughtworks.xstream.XStream;

public class MessageUtil {
	
	
	public static String parseRequest(HttpServletRequest request){
		Map<String,String> requesttMap =getRequestParams(request);
		String msgType = requesttMap.get("MsgType");
		switch (msgType) {
		case "text":
			String content=requesttMap.get("Content");
			String createTime=getTimeForWX();
			String respContext="你对我说："+content;
			TextMessage textMessage = new TextMessage( requesttMap.get("FromUserName"),  requesttMap.get("ToUserName"), createTime, msgType, respContext);
			return objToXml(textMessage);
			default:
				break;
		}
		return null;
	}
	
	public static String getTimeForWX(){
		
		
		Date date = new Date();
		long time =date.getTime();
		return new Long((time/1000)).toString();
		
	}

	public static String objToXml(Object obj ){
		
		XStream xstream = new XStream();
		
		xstream.processAnnotations(obj.getClass());
		return xstream.toXML(obj);
		
	}
	private static Map<String , String> getRequestParams(HttpServletRequest request){
		
		Map<String,String> parama =new HashMap<String, String>();
		SAXReader reader =new SAXReader();
		try {
			Document document = reader.read(request.getInputStream());
			Element rootElement = document.getRootElement();
			List<Element> elements = rootElement.elements();
			for (Element e:elements) {
				String name = e.getName();
				String text = e.getText();
				//String textTrim = e.getTextTrim();
				//子节点及其内容
				parama.put(name, text);
			}
		} catch (DocumentException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return parama;
	}
}
