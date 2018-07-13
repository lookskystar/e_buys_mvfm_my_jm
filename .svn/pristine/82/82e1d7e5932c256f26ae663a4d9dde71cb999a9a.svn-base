package com.yayadou.ebuy.dao.impl;

import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.yayadou.ebuy.dto.User;
import com.yayadou.ebuy.dao.UserDao;
/**
 * 专门针对User对象的数据库操作
 * @author Administrator
 */
//@Repository:数据连接层注解，相当于new UserDaoImpl()成对象
@Repository("userDao")
public class UserDaoImpl extends BaseDao implements UserDao {
	
	//通过用户名和密码查询用户名（登录）
	public User getUserByUserIdAndPassword(User u){
		SqlSession session = getSqlSession();
		User user = session.selectOne
				("com.yayadou.ebuy.mapper.UserMapper.getUserByUserIdAndByPassword", u);
		closeSqlSession();
		System.out.println("--------"+user);
		return user;
	}
	
	//新增用户
	public int insertUser(User user){		
		SqlSession session = getSqlSession();
		int count = session.insert(NAMESPACE_NAME+"insertUser",user);
		session.commit();
		closeSqlSession();
		return count;
		
	}
	
	/**
	 * 用户激活操作
	 * @param map
	 * @return
	 */
	public int activeUser(Map<String,String> map){
		SqlSession session = getSqlSession();
		int count = session.update(NAMESPACE_NAME+"activeUser", map);
		session.commit();
		closeSqlSession();
		return count;
	}
	
	//检查用户名是否重复
	public boolean getUserByUserId(String userId){
		
		SqlSession session = getSqlSession();
		int count = session.selectOne(NAMESPACE_NAME+"getUserByUserId", userId);
		closeSqlSession();
		return count>0?true:false;
	}

	//通过用户名、密码和角色代码查询用户名（登录）-后台
	@Override
	public User getUserByUserIdAndPwdAndRole(User u) {
		System.out.println(u.getUserId()+"--"+u.getRole()+"--"+u.getPassWord());
		SqlSession session = getSqlSession();
		User user = session.selectOne
				(NAMESPACE_NAME+"getUserByUserIdAndPwdAndRole", u);
		closeSqlSession();
		return user;
	}
}
