package org.lanqiao.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.lanqiao.entity.Book;
import org.lanqiao.entity.Card;
import org.lanqiao.entity.Consult;
import org.lanqiao.entity.Eval;
import org.lanqiao.entity.Order;
import org.lanqiao.service.BookService;
import org.lanqiao.service.CardSerice;
import org.lanqiao.service.ConsultService;
import org.lanqiao.service.EvalService;
import org.lanqiao.service.OrderService;
import org.lanqiao.utils.BookCreteria;
import org.lanqiao.utils.Page;

public class AdminServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String methodName = requestURI.substring(requestURI.lastIndexOf("/")+1);
		Class c = AdminServlet.class;
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
	
	
	public void getAllbooks(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		request.getRequestDispatcher("/admin/allBooks.jsp").forward(request, response);
		
	}
	/**
	 * 查看咨询
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void getConsults(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Consult> cons = new ConsultService().getAll();
		request.setAttribute("cons", cons);
		request.getRequestDispatcher("/admin/consult.jsp").forward(request, response);
	}
	/**
	 * 查看评价
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void getEvals(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Eval> evals = new EvalService().getAll();
		request.setAttribute("evals", evals);
		request.getRequestDispatcher("/admin/eval.jsp").forward(request, response);
	}
	/**
	 * 查询充值卡的信息
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void getCards(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Card> cards =new CardSerice().getAll();
		request.setAttribute("cards", cards);
		request.getRequestDispatcher("/admin/cards.jsp").forward(request, response);
	}
	/*
	 * 发货
	 */
	public void send(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String strid = request.getParameter("id");
		int i =new OrderService().send(Integer.parseInt(strid));
		String msg="";
		if (i==0) {
			msg="操作失败..";
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("/WEB-INF/info.jsp").forward(request, response);
		}else {
			//msg="操作成功..";
			request.getRequestDispatcher("/AdminServlet/getOrders").forward(request, response);
		}
		
	}
	public void getOrders(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Order> orders = new OrderService().getAll();
		request.setAttribute("orders", orders);
		request.getRequestDispatcher("/admin/orders.jsp").forward(request, response);
		
	}
	public void creatCards(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String strAmount = request.getParameter("amount");
		String strCount = request.getParameter("count");
		List<Card> cards =new CardSerice().creatCards(Integer.parseInt(strAmount),Integer.parseInt(strCount));
		//已下载的方式
		response.addHeader("content-disposition", "attachment;filename="+strCount+"张"+strAmount+"元.txt");
		PrintWriter out = response.getWriter();
		for(Card c:cards){
			out.print(c.getCardKey()+"\t"+c.getAmount()+"元");
			out.println();
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
