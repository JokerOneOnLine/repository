package org.lanqiao.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.lanqiao.entity.Book;
import org.lanqiao.entity.Consult;
import org.lanqiao.entity.Eval;
import org.lanqiao.entity.Order;
import org.lanqiao.entity.User;
import org.lanqiao.service.BookService;
import org.lanqiao.service.ConsultService;
import org.lanqiao.service.EvalService;
import org.lanqiao.service.OrderService;
import org.lanqiao.utils.BookCreteria;
import org.lanqiao.utils.MyUtils;
import org.lanqiao.utils.Page;

public class BookServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String methodName = requestURI.substring(requestURI.lastIndexOf("/")+1);
		Class c = BookServlet.class;
		try {
			Method m = c.getDeclaredMethod(methodName, HttpServletRequest.class,HttpServletResponse.class);
			m.invoke(this, request,response);
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
	}
	public void consult(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
	
		String id = request.getParameter("id");
		
		String content = request.getParameter("content");
		User user =(User) request.getSession().getAttribute("user");
		Consult con =new Consult(content, new Date(), user.getId(), Integer.parseInt(id));
		int i = new ConsultService().insert(con);
		String msg="";
		if (i==0) {
			msg="操作失败";
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("/WEB-INF/info.jsp").forward(request, response);
		}else {
			response.sendRedirect(request.getContextPath()+"/BookServlet/showDetail?id="+Integer.parseInt(id));
		}
	}/**
	 * 查询一页图书
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void queryPage(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		String pageNo = request.getParameter("pageNo");
		String key = request.getParameter("key");
		String minprice = request.getParameter("minprice");
		String maxprice = request.getParameter("maxprice");
		String getOnsale = request.getParameter("getOnsale");
		key=key==null?"":key;
		pageNo=pageNo==null?"1":(pageNo.equals("")?"1":pageNo);
		getOnsale=getOnsale==null?"2":(getOnsale.equals("")?"2":getOnsale);
		double minPrice=minprice==null?0:(minprice.equals("")?0:Double.parseDouble(minprice));
		double maxPrice=maxprice==null?BookCreteria.MAXPRICE:(maxprice.equals("")?BookCreteria.MAXPRICE:Double.parseDouble(maxprice));
		BookCreteria bc = new BookCreteria(Integer.parseInt(pageNo),BookCreteria.PAGESIZE, 0, key, minPrice, maxPrice);
		Page<Book> page=new BookService().queryPage(bc,Integer.parseInt(getOnsale));
		request.setAttribute("page", page);
		//System.out.println(page.getObjs());
		request.getRequestDispatcher("/allBooks.jsp").forward(request, response);
	}
	
	
	/**
	 * 图书详情
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void showDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		int bookId=0;
		try {
			bookId = Integer.parseInt(id);		
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "请按流程操作");
			request.getRequestDispatcher("/WEB-INF/info.jsp");
		}
		Book book=new BookService().get(bookId);
		request.setAttribute("book", book);
		request.getRequestDispatcher("/bookDetail.jsp").forward(request, response);
	}
	
	
	public void toUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		int bookId=0;
		try {
			bookId = Integer.parseInt(id);		
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "请按流程操作");
			request.getRequestDispatcher("/WEB-INF/info.jsp");
		}
		Book book = new BookService().get(bookId);
		request.getSession().setAttribute("book", book);
		request.getRequestDispatcher("/admin/toUpdate.jsp").forward(request, response);
	}
	
	/**
	 * 增加图书
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FileItemFactory factory = new DiskFileItemFactory();

		ServletFileUpload upload = new ServletFileUpload(factory);

		try {
			List  <FileItem> items = upload.parseRequest(request);
			String name=null;
			int stock=0;
			double price=0;
			String publishedby=null;
			String surface=null;
			String detail=null;
			String author=null;
			for (FileItem item : items) {
				if ( item.isFormField()) {
				String fieldName = item.getFieldName();
				String value = item.getString("utf-8");
				if (fieldName.equals("name")) {
					name=value;
					continue;
				}
				if (fieldName.equals("stock")) {
					stock=Integer.parseInt(value);
					continue;
				}
				if (fieldName.equals("price")) {
					price=Double.parseDouble(value);
					continue;
				}
				if (fieldName.equals("publishedby")) {
					publishedby=value;
					continue;
				}
				if (fieldName.equals("detail")) {
					String path = MyUtils.getPath(request.getServletContext(),"details");
					path=path+".html";
					String realPath = request.getServletContext().getRealPath("/");
					OutputStream os = new FileOutputStream(realPath+path);
					os.write(value.getBytes());
					os.close();
					detail=path;
					continue;
				}
				if (fieldName.equals("author")) {
					author=value;
					continue;
				}
				}else{
					String fileName = item.getName();
					String extName = fileName.substring(fileName.lastIndexOf("."));
					String file = MyUtils.getPath(request.getServletContext(),"imgs")+extName;
					InputStream is = item.getInputStream();
					String total = request.getServletContext().getRealPath("/")+file;
					OutputStream os = new FileOutputStream(total);
					byte[] b = new byte[512];
					int len;
					while ((len=is.read(b))!=-1) {
						os.write(b, 0, len);
						os.flush();
					}
					os.close();
					is.close();
					surface=file;
				}
			}	
		Book book = new Book(name, stock, price, publishedby, surface, detail, author);
		System.out.println(book);
		int insert = new BookService().insert(book);
		String msg;
		if (insert==0) {
			msg="添加失败";
		}else{
			msg="添加成功";
		}
		request.setAttribute("msg",msg);
		request.getRequestDispatcher("/WEB-INF/info.jsp").forward(request, response);
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 更新图书
	 */
	public void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FileItemFactory factory = new DiskFileItemFactory();

		ServletFileUpload upload = new ServletFileUpload(factory);

		try {
			List  <FileItem> items = upload.parseRequest(request);
			int id = 0;
			String name=null;
			int stock=0;
			double price=0;
			String publishedby=null;
			String surface=null;
			String detail=null;
			String author=null;
			for (FileItem item : items) {
				if ( item.isFormField()) {
				String fieldName = item.getFieldName();
				String value = item.getString("utf-8");
				if (fieldName.equals("id")) {
					id=Integer.parseInt(value);
					continue;
				}
				if (fieldName.equals("name")) {
					name=value;
					continue;
				}
				if (fieldName.equals("stock")) {
					stock=Integer.parseInt(value);
					continue;
				}
				if (fieldName.equals("price")) {
					price=Double.parseDouble(value);
					continue;
				}
				if (fieldName.equals("publishedby")) {
					publishedby=value;
					continue;
				}
				if (fieldName.equals("detail")) {
					String path = MyUtils.getPath(request.getServletContext(),"details");
					path=path+".html";
					String realPath = request.getServletContext().getRealPath("/");
					OutputStream os = new FileOutputStream(realPath+path);
					os.write(value.getBytes());
					os.close();
					detail=path;
					continue;
				}
				if (fieldName.equals("author")) {
					author=value;
					continue;
				}
				}else{
					String fileName = item.getName();
					String extName = fileName.substring(fileName.lastIndexOf("."));
					String file = MyUtils.getPath(request.getServletContext(),"imgs")+extName;
					InputStream is = item.getInputStream();
					String total = request.getServletContext().getRealPath("/")+file;
					OutputStream os = new FileOutputStream(total);
					byte[] b = new byte[512];
					int len;
					while ((len=is.read(b))!=-1) {
						os.write(b, 0, len);
						os.flush();
					}
					os.close();
					is.close();
					surface=file;
				}
			}	
			Book b = (Book) request.getSession().getAttribute("book");
		Book book = new Book(id, name, stock, price, 0, publishedby, surface, 2, detail, author);
		
		int insert = new BookService().update(book);
		String msg;
		if (insert==0) {
			msg="修改失败";
		}else{
			msg="修改成功";
		}
		request.setAttribute("msg",msg);
		request.getRequestDispatcher("/WEB-INF/info.jsp").forward(request, response);
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 评价
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void eval(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		Map<String, String> params = new HashMap<String, String>();
		Map<String, String[]> map = request.getParameterMap();
		for (Map.Entry<String, String[]>entry:map.entrySet()) {
			String key = entry.getKey();
			String[] value = entry.getValue();
			params.put(key, value[0]);
		}
		User user = (User) request.getSession().getAttribute("user");
		//订单号
		int orderId = Integer.parseInt(params.get("orderid"));
		Order order = new OrderService().getById(orderId);
		Map<Integer, Integer> stars =new HashMap<Integer, Integer>();
		Map<Integer, String> contents =new HashMap<Integer, String>();
	
		//获取评价内容
		for (Map.Entry<String, String>entry:params.entrySet()) {
			String key = entry.getKey();
			String value = entry.getValue();
			if (key.contains("-")) {
				int bookid = Integer.parseInt(key.substring(key.indexOf("-")));
				if (key.startsWith("s")) {
					stars.put(bookid, Integer.parseInt(value));
				}else {
					contents.put(bookid, value);
				}
			}
		}
		EvalService es = new EvalService();
		Set<Integer> keySet = stars.keySet();
		for (int key:keySet) {
			int star =stars.get(key);
			String contString = contents.get(key);
			Eval eval = new Eval(contString, key, star, user.getId(), orderId);
			es.insert(eval);
		}
		//order.setIsevaluated(Order.YES);
		int i =new OrderService().eval(order);
		if (i == 0) {
			request.setAttribute("msg", "操作失败..");
			request.getRequestDispatcher("/WEB-INF/info.jsp").forward(request, response);
		} else {
			response.sendRedirect(request.getContextPath()+"/UserServlet/getOrders");
		}
	}
	
	
	
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
