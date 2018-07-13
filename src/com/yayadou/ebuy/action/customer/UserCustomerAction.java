package com.yayadou.ebuy.action.customer;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.yayadou.ebuy.dto.User;
import com.yayadou.ebuy.service.UserService;

@Controller
@RequestMapping("/customer")
//写上这个就表示每次请求都重新创建一个ACTION，与SINGALON对应，俗称“多例”。
@Scope("prototype")    
public class UserCustomerAction {
	@Autowired
	private UserService userService;
	@Autowired
	private User user;
	/**
	 * 用户注册
	 * @return
	 */
	@RequestMapping("/register")
	public String register(HttpServletRequest req,HttpServletResponse repsonse){
		//User user =new User();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			req.setCharacterEncoding("UTF-8");
			String userId=req.getParameter("userId");
			String passWord =req.getParameter("passWord");
			String name=req.getParameter("name");
			String province=req.getParameter("province");
			String city=req.getParameter("city");
			String birthday=req.getParameter("birthday");
			String phone=req.getParameter("phone");
			String sex=req.getParameter("sex");
			
			user.setUserId(userId);
			user.setPassWord(passWord);
			user.setName(name);
			user.setProvince(province);
			user.setCity(city);
			user.setBirthday(sdf.parse(birthday));
			user.setPhone(phone);
			user.setSex(Integer.parseInt(sex));
			//状态，1:会员,2:管理员
			user.setRole(1);
			System.out.println(birthday);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//发送激活邮件
		String activeCode = String.valueOf(System.currentTimeMillis());
		String activeURL = 
				"http://localhost:8080/e_buys_mvfm_my_jm/customer/active?userId="+
				user.getUserId()+"&activeCode="+activeCode;
		StringBuilder content = new StringBuilder();
		content.append(user.getUserId()+" 亲,您好，欢迎您使用我们商城，请点击下面的链接进行帐号激活:<br/>");
		content.append("<a href='"+activeURL+"'>"+activeURL+"</a>");
		boolean flag = true;
				//EmailTools.send(user.getEmail(), "E购通商城-注册激活", content.toString());
		if(flag){
			//创建帐号的时间
			user.setCreateDate(new Date());
			user.setActiveCode(activeCode);
			userService.insertUser(user);
		}else{
			return "frontWeb/register.jsp";
		}
		return "frontWeb/home.jsp";
	}
	
	
	/**
	 * 用户激活
	 * @param userId
	 * @param activeCode
	 * @return
	 */
	@RequestMapping("/active")
	public String active(String userId,String activeCode,Model data){
		Map<String,String> map = new HashMap<>();
		map.put("userId", userId);
		map.put("activeCode", activeCode);
		int count = userService.activeUser(map);
		String tip = true?"帐号激活成功":"帐号激活失败";
		data.addAttribute("tip",tip);
		return "login";
	}
	
	/**
	 * 检查注册用户名是否重复
	 * @param userId
	 * @return
	 */
	@RequestMapping("/userIdCheck")
	@ResponseBody
	public Map<String,Object> userIdCheck(String userId){
		boolean flag = userService.getUserByUserId(userId);
		Map<String,Object> map = new HashMap<>();
		//status等于 1 表示重复，0表示不重复
		map.put("status", (flag?1:0));
		return map;
	}
	
	
}
