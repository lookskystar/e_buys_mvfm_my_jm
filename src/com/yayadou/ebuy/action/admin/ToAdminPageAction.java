package com.yayadou.ebuy.action.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * ����̨ģ������ҳ��
 * @author Administrator
 */
@Controller
@RequestMapping("admin")
public class ToAdminPageAction {
	//����̨userģ������ҳ��
	@RequestMapping("toUserPage")
	public String toUserPage(String pageName){
		return "/WEB-INF/behindWeb/User/"+pageName;
	}
	
	//����̨goodsģ������ҳ��
	@RequestMapping("toGoodsPage")
	public String toGoodsPage(String pageName){
		return "/WEB-INF/behindWeb/goods/"+pageName;
	}
	
	
}
