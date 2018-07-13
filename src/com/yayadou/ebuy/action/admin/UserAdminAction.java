package com.yayadou.ebuy.action.admin;

import java.text.SimpleDateFormat;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.yayadou.ebuy.dto.User;
import com.yayadou.ebuy.service.UserService;

@Controller
@RequestMapping("/admin")
//写上这个就表示每次请求都重新创建一个ACTION，与SINGALON对应，俗称“多例”。
@Scope("prototype")    
public class UserAdminAction {
	@Resource(name="userService")
	private UserService userService;
	@Resource(name="user")
	private User user;
	/**
	 * 用户注册
	 * @return
	 */
	@RequestMapping("/addUser")
	public String addUser(HttpServletRequest req,HttpServletResponse repsonse){
		
		System.out.println("UserAdminAction---------->addUser");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			req.setCharacterEncoding("UTF-8");
			String userId=req.getParameter("userId");
			String passWord =req.getParameter("passWord");
			String name=req.getParameter("name");
			String email=req.getParameter("email");
			String activeStatus=req.getParameter("activeStatus");
			int activeStatusInt=Integer.parseInt(activeStatus);
			
			user.setUserId(userId);
			user.setPassWord(passWord);
			user.setName(name);
			user.setEmail(email);
			user.setActiveStatus(activeStatusInt);
			
			//根据userId判断该用户是否存在（课堂练习）
			int count=userService.insertUser(user);
			
			return "WEB-INF/behindWeb/User/indexUser.jsp";	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "WEB-INF/behindWeb/User/addUser.jsp";
	}
}
