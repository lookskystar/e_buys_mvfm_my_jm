package com.yayadou.ebuy.action.admin;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 到loginAdmin.jsp页面
 * @author Administrator
 */
@Controller
@RequestMapping("/loginAdmin")  //规定如果是loginAdmin访问前缀就不拦截
@Scope("prototype")
public class ToLoginAdminPageAction {
	@RequestMapping("/toLoginPage")
	public ModelAndView toLoginPage(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/WEB-INF/behindWeb/Public/loginAdmin.jsp");
		return mv;
	}
}
