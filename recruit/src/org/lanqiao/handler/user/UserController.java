package org.lanqiao.handler.user;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.lanqiao.entity.company.PostAndResume;
import org.lanqiao.entity.user.MyResume;
import org.lanqiao.entity.user.Position2;
import org.lanqiao.entity.user.User;
import org.lanqiao.json.ProfileJson;
import org.lanqiao.service.company.PostAndResumeService;
import org.lanqiao.service.user.EducationalBackgroundService;
import org.lanqiao.service.user.MyResumeService;
import org.lanqiao.service.user.Position2Service;
import org.lanqiao.service.user.PositionService;
import org.lanqiao.service.user.UserService;
import org.lanqiao.service.user.WorkExperienceService;
import org.lanqiao.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;

@SessionAttributes("code")
@RequestMapping(value = "/userController")
@Controller
public class UserController {

	@Autowired
	UserService us;
	@Autowired
	Position2Service p2s;
	@Autowired
	PositionService ps;
	@Autowired
	WorkExperienceService wes;
	@Autowired
	EducationalBackgroundService ebs;
	@Autowired
	MyResumeService myResumeService;
	@Autowired
	UserService userService;
	@Autowired
	PostAndResumeService postAndResumeService;

	/**
	 * 渭南师范二期-许园园 2017年9月19日下午19:49:18
	 * 
	 * @param email
	 * @param pwd
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/checkPsw")
	public void checkPsw(String oldpassword, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String oldpwd = UserUtil.MessageDigest(oldpassword);
		Integer userId = (Integer) request.getSession().getAttribute("userId");
		User user = userService.selectUser(userId);
		String pwd = user.getPwd();
		PrintWriter out = response.getWriter();
		if (oldpwd.equals(pwd)) {
			out.print(true);
		} else {
			out.print(false);
		}
	}

	/**
	 * 渭南师范二期-许园园 2017年9月19日下午19:55:18
	 * 
	 * @param oldpassword
	 * @param request
	 * @return
	 */
	@RequestMapping("/updatePsw")
	public String updatePsw(String newpassword, HttpServletRequest request) {
		Integer userId = (Integer) request.getSession().getAttribute("userId");
		User user = userService.selectUser(userId);
		String pwd1 = UserUtil.MessageDigest(newpassword);
		user.setPwd(pwd1);
		int j = us.updateUser(user);
		if (j != 0) {
			return "success";
		} else {
			return "updatePwdFail";
		}
	}

	/**
	 * 发送验证码 渭南师范二期-张四宝 2017年8月23日 上午11:21:48
	 */
	@RequestMapping("/getVCode")
	public void getVCode(String email, Map<String, Object> map) {
		int code = (int) (Math.random() * 99999);
		map.put("code", code);
		UserUtil.getVcode(email, "蓝桥招聘网", "您的验证码是：" + code);
	}

	/**
	 * 检查验证码 渭南师范二期-张四宝 2017年8月23日 下午3:27:59
	 * 
	 * @return
	 */
	@RequestMapping("/testVCode")
	public void testVCode(HttpServletRequest request, HttpServletResponse response) {
		String vCode = request.getParameter("vCode");
		Object code = request.getSession().getAttribute("code");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			if (vCode.equals(code.toString())) {
				out.print(1);
			} else {
				out.print(0);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			out.flush();
			out.close();
		}
	}

	/**
	 * 用户注册 渭南师范二期-张四宝 2017年8月24日 上午9:13:33
	 * 
	 * @return
	 */
	@RequestMapping("/register")
	public String register(String email, String pwd, String vCode, Map<String, Object> map,
			HttpServletRequest request) {
		// 通过邮箱查询对象是否存在
		User u = us.selectUserByEmail(email);
		// 如果存在，直接跳到登录页面
		if (u != null) {
			map.put("mag", "该邮箱已存在,请直接登录");
			return "register";
		}
		Object code = request.getSession().getAttribute("code");
		if (code == null) {
			map.put("mag", "验证码错误");
			return "register";
		}
		if (!vCode.equals(code.toString())) {
			map.put("mag", "验证码错误");
			return "register";
		}
		// 如果不存在，注册
		String pwd2 = UserUtil.MessageDigest(pwd);
		User user = new User(email, pwd2);
		int i = us.insertUser(user);
		if (i == 0) {
			map.put("mag", "系统出现未知错误，请稍后继续......");
			return "register";
		} else {
			map.put("mag", "注册成功,请登录");
			request.getSession().setAttribute("userId", user.getId());
			request.getSession().setAttribute("email", user.getEmail());
			return "myresume/resume";
		}
	}

	/**
	 * 根据邮箱和密码查询用户是否存在 渭南师范二期-刘如艳 2017年8月23日下午3:27:14 用户登录
	 * 
	 * @return
	 */
	@RequestMapping("/userLogin")
	public String checkStudent(HttpServletRequest request, HttpServletResponse response, String pwd, String email,
			Map<String, Object> map, HttpSession session) {
		String pwd1 = UserUtil.MessageDigest(pwd);
		User u = us.selectUserByEmailAndPwd(email, pwd1);
		if (u == null) {
			map.put("msg", "密码错误");
			return "userlogin";
		}
		map.put("user", u);
		request.getSession().setAttribute("email", u.getEmail());
		request.getSession().setAttribute("userId", u.getId());
		request.getSession().setAttribute("userName", u.getName());
		String url = request.getParameter("url");
		if (url != null && !url.equals("")) {
			return "redirect:" + url;
		} else if (u.getName() == null || u.getName().equalsIgnoreCase("")) {
			return "myresume/resume";
		} else {
			map.put("user", u);
			return "myresume/user";
		}
	}

	@RequestMapping("/getUserInfo")
	@ResponseBody
	public Map<String, Object> getUserInfo(Integer userId) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		User user = userService.selectUser(userId);
		result.put("user", user);
		return result;
	}
	
	@RequestMapping("/getEmail")
	public String getEmail(HttpServletRequest request, HttpServletResponse response,Map<String, Object> map) {
		String email = request.getParameter("email");
		map.put("email", email);
		return "checkemail";
	}

	/**
	 * 
	 * 用户登录找回密码 渭南师范二期-刘如艳 2017年8月23日下午8:56:18
	 * 
	 * @param email
	 * @return
	 */
	@RequestMapping("/findPwd")
	public String findPwd(String email, String pwd, HttpServletRequest request) {
		User user = us.selectUserByEmail(email);
		String pwd1 = UserUtil.MessageDigest(pwd);
		user.setPwd(pwd1);
		int j = us.updateUser(user);
		if (j != 0) {
			return "userlogin";
		}
		return "findpwd";
	}

	/**
	 * 
	 * 头像上传 渭南师范二期-刘如艳 2017年8月24日下午3:26:35
	 * 
	 * @param user
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/updateUser")
	public ProfileJson updateUser(MultipartFile headPic, HttpServletRequest request) throws Exception {
		int userId = (int) request.getSession().getAttribute("userId");
		User user = userService.selectUser(userId);
		InputStream is = headPic.getInputStream();
		String filename = headPic.getOriginalFilename();
		String extendname = filename.substring(filename.lastIndexOf("."));
		String path2 = UserUtil.getPath(request.getServletContext(), "imags");
		ProfileJson pj = new ProfileJson();
		if (is.available() > 0) {
			String realPath = request.getServletContext().getRealPath("/");
			String path = realPath + path2 + extendname;
			System.out.println(realPath + "fhnguugnik");
			OutputStream os = new FileOutputStream(path);
			byte[] b = new byte[1024];
			int len;
			if ((len = is.read(b)) != -1) {
				os.write(b);
				os.flush();
			}
			os.close();
			is.close();
			user.setProfile(path2 + extendname);

			int i = us.updateUser(user);
			if (i != 0) {
				pj.setContent(path);
				pj.setSuccess(true);
				return pj;
			}
			pj.setSuccess(false);
			return pj;
		}

		return pj;
	}

	/**
	 * 高瑞 增加用户简历（没有填写过时）
	 */
	@RequestMapping("/insertResume")
	@ResponseBody
	public Map<String, Object> insertResume(User user, HttpServletRequest request, HttpSession session) {
		Map<String, Object> result = new HashMap<String, Object>();
		String educationName = request.getParameter("topdegree");
		Integer education = ebs.getId(educationName);
		user.setEducation(education);
		String workName = user.getWorkName();
		Integer workyear = wes.getId(workName);
		user.setWorkyear(workyear);
		Integer id = user.getId();
		MyResume myResume = user.getMyResume();
		int i = us.update(user);
		if (myResume == null) {
			myResume = new MyResume();
			myResume.setUserId(id);
			myResumeService.inserMyResumeByUserId(myResume);
		}
		if (i == 0) {
			result.put("msg", "更新失败");
			return result;
		} else {
			session.setAttribute("user", user);
		}
		return result;

	}

	/**
	 * 修改个人信息 渭南师范二期-刘如艳 2017年9月9日上午9:08:13
	 */
	@RequestMapping("/update")
	public void update(HttpServletRequest request, HttpServletResponse response, Map<String, Object> userMap,
			HttpSession session) {
		int userId = (int) request.getSession().getAttribute("userId");
		User user = userService.selectUser(userId);
		String name = request.getParameter("name");
		user.setName(name);
		String gender = request.getParameter("gender").trim();
		int gen = 0;
		if (gender.equals("男")) {
			gen = 1;
		}
		user.setGender(gen);
		String educationName = request.getParameter("topDegree");
		Integer education = ebs.getId(educationName);
		user.setEducation(education);
		String workName = request.getParameter("workyear");
		Integer workyear = wes.getId(workName);
		user.setWorkyear(workyear);
		String position3Name = request.getParameter("nowpost");
		if (position3Name.equals("")) {
			user.setPosition3(0);
		} else {
			Integer position3 = ps.getId(position3Name);
			user.setPosition3(position3);
		}
		String addr = request.getParameter("addr");
		user.setAddr(addr);
		String tel = request.getParameter("tel");
		user.setTel(tel);
		String declaration = request.getParameter("declaration");
		user.setDeclaration(declaration);
		int i = us.update(user);
		try {
			PrintWriter out = response.getWriter();
			if (i != 0) {
				out.print(1);
			} else {
				out.print(0);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	@RequestMapping("toUserInfo")
	public String toUserInfo(HttpSession session, Map<String, Object> map) {
		int userId = (int) session.getAttribute("userId");
		User user = userService.selectUser(userId);
		map.put("user", user);
		return "myresume/user";
	}

	@RequestMapping("UserResumeInfo")
	public String toUserResumeInfo(HttpSession session, Map<String, Object> map) {
		int userId = (int) session.getAttribute("userId");
		User user = userService.selectUser(userId);
		map.put("user", user);
		return "myresume/show";
	}

	@RequestMapping("/up")
	@ResponseBody
	public Map<String, Object> up(HttpServletRequest request, HttpSession session) {
		Map<String, Object> result = new HashMap<String, Object>();
		int userId = (int) session.getAttribute("userId");
		User user = us.selectUser(userId);
		System.out.println(user.getId());
		String name = request.getParameter("name");
		user.setName(name);
		System.out.println(user.getName());

		String educationName = request.getParameter("topdegree");
		System.out.println("educationName" + educationName);
		Integer education = ebs.getId(educationName);
		System.out.println("education" + education);
		user.setEducation(education);

		String workName = request.getParameter("workName");
		System.out.println(workName);
		Integer workyear = wes.getId(workName);
		System.out.println("workyear" + workyear);
		user.setWorkyear(workyear);

		String tel = request.getParameter("tel");
		System.out.println(tel);
		user.setTel(tel);

		String addr = request.getParameter("addr");
		System.out.println(addr);
		user.setAddr(addr);

		int i = us.update(user);
		if (i == 1) {
			result.put("user", user);

			return result;
		} else {
			result.put("msg", "更新失败");
		}
		return result;

	}

	// @RequestMapping("/logout")
	// public String logout(HttpSession httpSession) {
	// httpSession.removeAttribute("userId");
	// httpSession.removeAttribute("email");
	// Object obj = httpSession.getAttribute("userId");
	// System.out.println("obj:"+obj);
	// return "index";
	//
	// }
	/**
	 * 用戶退出登陸
	 * 
	 * @author 渭南师范学院二期 李晨晨 2017年9月22日
	 */
	@RequestMapping("/logout")
	public String loggout(HttpServletRequest request) {
		request.getSession().invalidate();
		  return "redirect:/"; 
	}

	@RequestMapping("/getUser")
	@ResponseBody
	public Map<String, Object> getUser(HttpServletRequest request, Integer userId) {
		Map<String, Object> map = new HashMap<String, Object>();
		User user = userService.getUserById(userId);
		map.put("name", user.getName());
		map.put("gender", user.getGender());
		map.put("birth", user.getStrBirth());
		map.put("addr", user.getAddr());
		map.put("tel", user.getTel());
		map.put("declaration", user.getDeclaration());
		return map;
	}

	/**
	 * 樊璐璐 2017年09月25日
	 * 
	 * @param request
	 * @param httpSession
	 * @return
	 */
	// 我的投递
	@RequestMapping(value = "/getAllPost")
	public ModelAndView getAllPost(HttpServletRequest request, HttpSession httpSession) {
		Integer userId = (Integer) httpSession.getAttribute("userId");
		MyResume mr = myResumeService.getMyResumeByUserId(userId);
		List<PostAndResume> par = postAndResumeService.getByResumeId(mr.getId());
		ModelAndView mv = new ModelAndView("user/delivery");
		mv.addObject("pars", par);
		return mv;
	}
//获取用户名字
	@RequestMapping("/getUserName")
	@ResponseBody
	public Map<String, Object> getUserName(HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user= new User();
		if (null !=session.getAttribute("userId")) {
			Integer userId = (Integer) session.getAttribute("userId");
			user = us.selectUser(userId);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("UserName", user.getName());
		return map;
	}
}
