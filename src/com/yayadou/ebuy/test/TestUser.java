package com.yayadou.ebuy.test;

import javax.validation.constraints.Pattern;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

/**
 * 测试JSR-303验证框架-模型对象（实体类）
 * @author Administrator
 */
public class TestUser {
	@NotEmpty(message="用户名不能为空")
	private String name;
	@Range(min=18,max=40,message="年龄必须在{18-40}岁之间")
	private int age;
	@Pattern(regexp="13[0-9]{9}",message="手机格式不对")
	private String phone;
	@Email(message="电子邮件格式不对")
	private String email;
	
	public TestUser() {
		super();
	}
	
	public TestUser(String name, int age, String phone, String email) {
		super();
		this.name = name;
		this.age = age;
		this.phone = phone;
		this.email = email;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
}
