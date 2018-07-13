package com.yayadou.ebuy.action.customer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 用户退出
 * @author Administrator
 */
@Component
@RequestMapping("/customer")
@Scope("prototype") 
public class LogoutCustomerAction{
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			//获取Session对象
			HttpSession session = request.getSession();
			//注销session
			session.invalidate();
			
			return "frontWeb/home.jsp";
	}
	
	
}
