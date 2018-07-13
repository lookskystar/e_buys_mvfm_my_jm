package com.yayadou.ebuy.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import com.yayadou.ebuy.dto.User;

//登入拦截器
public class LoginInterceptor implements HandlerInterceptor {

	//视图解析之后执行
	@Override
	public void afterCompletion
	(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	//在执行action之后，视图解析之前执行
	@Override
	public void postHandle
	(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	//在视图解析之前执行
	@Override
	public boolean preHandle
	(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
		System.out.println("----LoginInterceptor-----preHandle---------");
		//获取ession
		HttpSession session=request.getSession();
		//获得session中存储的登录用户数据
		User user=(User) session.getAttribute("session_user");
		if(user!=null){
			System.out.println("--------用户存在--------");
			//继续执行
			return true;
		}else{
			System.out.println("--------用户不存在------------");
			//用户没有登录，重新登录
			response.sendRedirect("../behindWeb/common/msg.jsp");
			return false;
		}
	}
	
}
