package com.yayadou.ebuy.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.yayadou.ebuy.dao.UserDao;
import com.yayadou.ebuy.dto.User;
import com.yayadou.ebuy.service.UserService;

/**
 * 专门针对User对象的业务逻辑
 * @author Administrator
 */
//@Service：业务逻辑层注解，相当于new UserServiceImpl()为对象
@Service("userService")
public class UserServiceImpl implements UserService{
	//注入userDao这个数据连接层类对象，使用时，就不需要new了
	@Resource(name="userDao")
	private UserDao userDao;
	 
	//通过用户名和密码查询用户名（登录）
	public User getUserByUserIdAndPassword(User u){
		return userDao.getUserByUserIdAndPassword(u);
	}
	
	//添加用户
	public int insertUser(User user){
		System.out.println("us-----"+user.getName());
		return userDao.insertUser(user);
	}
	
	//激活用户
	public int activeUser(Map<String,String> map){
		return userDao.activeUser(map);
	}
	
	//检查用户名知否重复
	public boolean getUserByUserId(String userId){
		return userDao.getUserByUserId(userId);
	}

	@Override
	public User getUserByUserIdAndByPassword(User u) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User getUserByUserIdAndPwdAndRole(User u) {
		return userDao.getUserByUserIdAndPwdAndRole(u);
	}	
}
