package com.yayadou.ebuy.test;

import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * ����JSR-303��֤���-������
 * @author Administrator
 */
@Controller
public class TestValidateAction {
	@RequestMapping(value="/validaterUser")
	public String validaterUser(@Valid TestUser testUser,Errors errors){
		if(errors.hasErrors()){
			return "test/error";
		}else{
			return "test/welcome";
		}
	}
}
