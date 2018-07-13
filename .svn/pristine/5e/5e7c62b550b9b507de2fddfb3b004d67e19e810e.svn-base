package com.yayadou.ebuy.action.customer;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
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
 * @author Administrator
 */
@Controller
@RequestMapping("/customer")
@Scope("prototype") 
public class LoginCustomerAction {
	//注入userService这个业务逻辑层类对象，使用时，就不需要new了
	@Autowired
	private UserService userService;
	//注入user这个实体类对象，使用时，就不需要new了
	@Autowired
	private User user;
	
	/**
	 * ajax登录
	 * @param userId
	 * @param password
	 * @param vcode
	 * @return Map<String,Object> 
	 * @throws IOException 
	 * 
	 */
	@ResponseBody
	@RequestMapping(value="/loginAjax")
	public Map<String,Object> login(HttpServletRequest request, HttpServletResponse response) 
			throws IOException{
		Map<String,Object> map = new HashMap<>();
		
		request.setCharacterEncoding("UTF-8");
		//获取Session对象
		HttpSession session = request.getSession();
		//从Session对象中获取验证码
		String code = (String)session.getAttribute("authCode");
		if(code!=null){
			String codeReq=request.getParameter("code");
			//判断提交的验证码和Session中的验证码是否相同
			if(!code.equals(codeReq)){
				System.out.println("---验证码不同----");
				
				/*
				 * 此处可以通过验证框架的异常，返回响应的值（课后作业）
				 * 	登录成功 = 0
					验证码不正确 = 1
					账号或密码不能为空 = 2
					账号或密码格式不正确 = 3
					用户还未激活 = 4
					非法用户=5
				 */
				
				map.put("tip", "验证码不正确");
				map.put("status", 1);
			}else{
				System.out.println("---验证码相同----");
				//相同，获取登录名和密码，并跳转到首页
				String userId = request.getParameter("userId");
				String password = request.getParameter("password");
				
				//封装数据
				user.setUserId(userId);
				user.setPassWord(password);
				
				System.out.println("="+user.getUserId());
				
				User u=userService.getUserByUserIdAndByPassword(user);
				if(u!=null){
					//将登录成功的用户存储到session中
					session.setAttribute("session_user", u);
					
					//获取请求参数中的记住我复选框的值-处理Cookies
					String remember = request.getParameter("remember");
					//创建Cookie对象并编码绑定cookie值 。eg:andy:andy-123456
					Cookie cookie = new Cookie("userId",URLEncoder.encode(userId+"-"+password, "UTF-8"));
					//当remember的值为1的时候，设置cookie的有效时间为24小时，当remember的值不为1的是的时候，设置cookis的有效时间为0
					int maxAge = "1".equals(remember) ? 24*60*60 : 0;
					//设置cookie的生命周期
					cookie.setMaxAge(maxAge);
					//将cookie对象添加到response响应对象中
					response.addCookie(cookie);
					
					map.put("tip", "登录成功");
					map.put("status", 0);
					
				}else{
					map.put("tip", "非法用户");
					map.put("status", 5);
				}
			}
		}else{
			map.put("tip", "验证码异常，请刷新页面，重新登入");
			map.put("status", 1);
		}
		return map;
	}
}
