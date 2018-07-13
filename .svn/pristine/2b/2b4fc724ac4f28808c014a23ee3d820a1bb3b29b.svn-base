package com.yayadou.ebuy.service;

import java.util.Map;
import com.yayadou.ebuy.dto.User;

/**
 * UserService接口
 * @author Administrator
 */
public interface UserService {
	
	//通过用户id和密码查找用户
	public User getUserByUserIdAndByPassword(User u);
	
	//添加用户
	public int insertUser(User user);
	
	//激活用户
	public int activeUser(Map<String,String> map);
	
	//检查用户名知否重复
	public boolean getUserByUserId(String userId);
	
	//通过用户名、密码和角色代码查询用户名（登录）-后台
	public User getUserByUserIdAndPwdAndRole(User u);
}
