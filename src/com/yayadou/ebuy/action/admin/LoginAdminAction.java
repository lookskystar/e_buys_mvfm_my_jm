package com.yayadou.ebuy.action.admin;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.yayadou.ebuy.dto.User;
import com.yayadou.ebuy.service.UserService;

/**
 * 登录处理类
 * 
 * @author Administrator
 */
@Controller
@RequestMapping("/loginAdmin")  //规定如果是loginAdmin访问前缀就不拦截
@Scope("prototype")
public class LoginAdminAction {
	// 注入userService这个业务逻辑层类对象，使用时，就不需要new了
	@Resource(name = "userService")
	private UserService userService;
	// 注入user这个实体类对象，使用时，就不需要new了
	@Resource(name = "user")
	private User user;

	/**
	 * ajax登录
	 * 
	 * @param userId
	 * @param password
	 * @param vcode
	 * @return Map<String,Object>
	 * @throws IOException
	 * 
	 */
	@RequestMapping(value = "/login")
	public String login(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		String passWord = request.getParameter("passWord");

		// 封装数据
		user.setUserId(userId);
		user.setPassWord(passWord);
		//状态，1:会员,2:管理员
		user.setRole(2);

		User u = userService.getUserByUserIdAndPwdAndRole(user);
		if (u != null) {
			// 将登录成功的用户存储到session中
			HttpSession session = request.getSession();
			session.setAttribute("session_user", u);
			return "WEB-INF/behindWeb/indexBehind.jsp";	
		} else {
			return "WEB-INF/behindWeb/Public/loginAdmin.jsp";
		}
	}
}
