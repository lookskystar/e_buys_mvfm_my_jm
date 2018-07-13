package com.yayadou.ebuy.dao;

import java.util.Map;
import com.yayadou.ebuy.dto.User;

//UserDao接口
public interface UserDao{
	public static final String NAMESPACE_NAME = "com.yayadou.ebuy.mapper.UserMapper.";

	//通过用户名和密码查询用户名（登录）
	public User getUserByUserIdAndPassword(User u);
	// 新增用户
	public int insertUser(User user);
	//用户激活操作
	public int activeUser(Map<String,String> map);
	//检查用户名是否重复
	public boolean getUserByUserId(String userId);
	//通过用户名、密码和角色代码查询用户名（登录）-后台
	public User getUserByUserIdAndPwdAndRole(User u);
}
