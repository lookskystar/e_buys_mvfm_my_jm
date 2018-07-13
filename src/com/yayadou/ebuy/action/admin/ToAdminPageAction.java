package com.yayadou.ebuy.action.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 到后台模块任意页面
 * @author Administrator
 */
@Controller
@RequestMapping("admin")
public class ToAdminPageAction {
	//到后台user模块任意页面
	@RequestMapping("toUserPage")
	public String toUserPage(String pageName){
		return "/WEB-INF/behindWeb/User/"+pageName;
	}
	
	//到后台goods模块任意页面
	@RequestMapping("toGoodsPage")
	public String toGoodsPage(String pageName){
		return "/WEB-INF/behindWeb/goods/"+pageName;
	}
	
	
}
