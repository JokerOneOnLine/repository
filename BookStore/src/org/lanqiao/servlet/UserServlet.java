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

import org.lanqiao.entity.Consignee;
import org.lanqiao.entity.Item;
import org.lanqiao.entity.Order;
import org.lanqiao.entity.User;
import org.lanqiao.service.CardSerice;
import org.lanqiao.service.ConsigneeService;
import org.lanqiao.service.ItemService;
import org.lanqiao.service.OrderService;
import org.lanqiao.service.UserService;
import org.lanqiao.utils.MyUtils;

public class UserServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String methodName = requestURI.substring(requestURI.lastIndexOf("/") + 1);
		Class c = UserServlet.class;
		try {
			Method m = c.getDeclaredMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
			m.invoke(this, request, response);
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
	/*
	 * 评价订单
	 */
	public void toEva(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String strid = request.getParameter("id");
		Order order = new OrderService().getById(Integer.parseInt(strid));
		request.setAttribute("order", order);
		request.getRequestDispatcher("/user/evalform.jsp").forward(request, response);
	}
	public void addToCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String booid = request.getParameter("bookId");
		User u = (User) request.getSession().getAttribute("user");
		// 加入购物车 获取用户的购物车
		int i = new UserService().addToCart(u, Integer.parseInt(booid), 1, true);
		String msg = "";
		if (i == 0) {
			msg = "加入购物车失败..";
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("/WEB-INF/info.jsp");
		} else if (i == -1) {
			msg = "超过库存了..";
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("/WEB-INF/info.jsp");
		} else {
			response.sendRedirect(request.getContextPath() + "/BookServlet/queryPage");
		}
	}

	public void removeItem(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String itemid = request.getParameter("id");
		int id = Integer.parseInt(itemid);
		new ItemService().remove(id);
		User u = (User) request.getSession().getAttribute("user");
		u.getCart().getItems().remove(new Item(id));
	}

	/**
	 * 订单查询
	 */
	public void getOrders(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		List<Order> orders = new OrderService().getOrdersByUserId(user.getId());
		request.getSession().setAttribute("orders", orders);
		request.getRequestDispatcher("/user/orders.jsp").forward(request, response);
	}

	/*
	 * 去下单
	 */
	public void toOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		User user = (User) request.getSession().getAttribute("user");
		List<Consignee> consignees = new UserService().getConsigneesByUserId(user.getId());
		request.getSession().setAttribute("cons", consignees);
		response.sendRedirect(request.getContextPath() + "/user/toOrder.jsp");
		// request.getRequestDispatcher("/user/toOrder.jsp");
	}

	public void addConsignee(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String tel = request.getParameter("tel");
		Consignee consignee = new Consignee(name, addr, tel);
		User user = (User) request.getSession().getAttribute("user");
		int i = new ConsigneeService().insert(user, consignee);
		if (i == 0) {
			String msg = "添加收货信息失败....";
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("/WEB-INF/info.jsp").forward(request, response);
		} else {
			// response.sendRedirect(request.getContextPath()+"/UserServlet/toOrder");
			List<Consignee> cons = (List<Consignee>) request.getSession().getAttribute("cons");
			cons.add(consignee);
			response.sendRedirect(request.getContextPath() + "/user/toOrder.jsp");
		}
	}
	/**
	 * 结算
	 * 
	 */
	public void order(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cid = request.getParameter("consigneeid");
		User user = (User) request.getSession().getAttribute("user");
		user = new UserService().getUser(user.getName(),user.getPwd());
		request.getSession().setAttribute("user", user);
		double balance = user.getBalance();
		double totalPrice = user.getCart().getTotalPrice();
		if (balance < totalPrice) {
			request.setAttribute("msg", "余额不足，请充值");
			request.getRequestDispatcher("/user/toOrder.jsp").forward(request, response);
		} else {
			int i = new OrderService().order(user, Integer.parseInt(cid));
			if (i == 0) {
				request.setAttribute("msg", "结算失败..");
			} else {
				// 清空购物车
				user.getCart().getItems().clear();
				request.setAttribute("msg", "下单成功，订单号为：" + i);
			}
			request.getRequestDispatcher("/WEB-INF/info.jsp").forward(request, response);
		}
	}

	/**
	 * 充值recharge
	 */
	public void recharge(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String key = request.getParameter("card");
		User user = (User) request.getSession().getAttribute("user");
		String str = new CardSerice().recharge(user,key);
		request.setAttribute("msg", str);
		request.getRequestDispatcher("/WEB-INF/info.jsp").forward(request, response);
	}

	/**
	 * 修改交易项
	 */
	public void modifyItem(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String strCount = request.getParameter("count");
		String strId = request.getParameter("id");
		int count = Integer.parseInt(strCount);
		int id = Integer.parseInt(strId);
		User u = (User) request.getSession().getAttribute("user");
		// List<Item> items = u.getCart().getItems();
		int i = new UserService().addToCart(u, id, count, false);
		// PrintWriter out = response.getWriter();
		// out.print(i);
		// out.flush();
		// out.close();
	}

	/*
	 * 检查登录用户名是否可用
	 */
	public void checkName(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name1");
		int i = new UserService().checkName(name);
		PrintWriter out = response.getWriter();
		out.print(i);
		out.flush();
		out.close();
	}

	/**
	 * 用户注册
	 */
	public void regist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name1");
		String email = request.getParameter("email1");
		String pwd = request.getParameter("pwd1");
		pwd = MyUtils.md5(pwd);
		if (email==null||email.equals("")) {
			email="";
		}
		//email=email==null?"":email;
		User user = new User(name, pwd, email);
		int i = new UserService().insert(user);
		String msg;
		msg = i == 0 ? "操作失败" : "操作成功";
		request.setAttribute("msg", msg);
		request.getRequestDispatcher("/WEB-INF/info.jsp").forward(request, response);
	}

	/*
	 * 用户登录
	 */
	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		pwd = MyUtils.md5(pwd);
		User user = new UserService().getUser(name, pwd);
		request.getSession().setAttribute("user", user);
		if (user == null) {
			request.setAttribute("msg", "请正确输入用户名和密码.......");
			request.getRequestDispatcher("/WEB-INF/info.jsp").forward(request, response);
		} else {
			request.getSession().setAttribute("user", user);
			// response.sendRedirect("../BookServlet/queryPage");
			response.sendRedirect(request.getContextPath() + "/BookServlet/queryPage");// 项目名称
		}
	}

	/*
	 * 找回密码
	 */
	public void findPwd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		String stremail = (String) request.getSession().getAttribute("email");
		String msg;
		if (!email.equals(stremail)) {
			msg = "還有這種操作";
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("/WEB-INF/info.jsp").forward(request, response);
			return;
		}
		User u = new UserService().getUserByEmailAndName(name, email);
		u.setPwd(MyUtils.md5(pwd));
		int i = new UserService().update(u);
		if (i == 1) {
			msg = "操作成功^-^";
		} else {
			msg = "操作失败-.-";
		}
		request.setAttribute("msg", msg);
		request.getRequestDispatcher("/WEB-INF/info.jsp").forward(request, response);
	}

	/*
	 * 修改个人信息
	 */
	public void modify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name1");
		String age = request.getParameter("age");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String profile = request.getParameter("profile");
		String contextPath = request.getContextPath();
		profile = profile.replace(contextPath + "/", "");
		User u = (User) request.getSession().getAttribute("user");

		if (name == null) {
			name = u.getName();
		}
		if (age == null) {
			age = "" + u.getAge();
		}
		if (email == null) {
			email = u.getEmail();
		}
		if (gender == null) {
			gender = "" + u.getGender();
		}
		if (profile == null) {
			profile = u.getProfile();
		}
		u.setName(name);
		u.setEmail(email);
		u.setAge(Integer.parseInt(age));
		u.setGender(Integer.parseInt(gender));
		u.setProfile(profile);
		int i = new UserService().update(u);
		String msg;
		if (i == 1) {
			msg = "操作成功^-^";
		} else {
			msg = "操作失败-.-";
		}
		request.setAttribute("msg", msg);
		request.getRequestDispatcher("/WEB-INF/info.jsp").forward(request, response);
	}

	/*
	 * 退出
	 */
	public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.getSession().removeAttribute("user");
		request.setAttribute("msg", "成功退出");
		request.getRequestDispatcher("/WEB-INF/info.jsp").forward(request, response);
	}

	/*
	 * 检验验证
	 */
	public void checkVCode(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String vCode = request.getParameter("vCode");
		String sCode = (String) request.getSession().getAttribute("vCode");
		if (vCode.equals(sCode)) {
			out.print(1);
		} else {
			out.print(0);
		}
		out.flush();
		out.close();
	}

	/*
	 * 获取验证码
	 */
	public void getVCode(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		request.getSession().setAttribute("email", email);
		int vCode = (int) (Math.random() * 9999);
		String subject = "你正在找回密码";
		String content = "你的验证码是" + vCode + "。";
		MyUtils.sendEmail(email, subject, content);
		request.getSession().setAttribute("vCode", vCode);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
