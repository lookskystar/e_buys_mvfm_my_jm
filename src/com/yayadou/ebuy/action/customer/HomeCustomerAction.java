package com.yayadou.ebuy.action.customer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * �û�������
 * @author Administrator
 */
@Controller
@RequestMapping("/customer")
public class HomeCustomerAction {
	@RequestMapping("/home")
	public String home(){
		System.out.println("--home--");
		return "/frontWeb/home.jsp";
	}
}
