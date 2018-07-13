package com.yayadou.ebuy.dao.impl;

import java.io.InputStream;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 * 获取SqlSession和关闭SqlSession的基础类
 * @author Administrator
 */
public class BaseDao {

	private static ThreadLocal<SqlSession> threadLocal = new ThreadLocal<>();
	
	//因为依赖注入的类中不能包含静态代码块，所以，把静态代码块的中的代码合并到下面的方法中
	/**
	 * 获取SqlSession对象
	 * @return
	 */
	public static SqlSession getSqlSession(){
		try {
			InputStream in = Resources.getResourceAsStream("mybatis-config.xml");
			SqlSessionFactory factory  = new SqlSessionFactoryBuilder().build(in);
			//通过ThreadLocal获取sqlSession对象
			SqlSession sqlSession = threadLocal.get();
			if(sqlSession == null){
				//获取一个SqlSession对象
				sqlSession = factory.openSession();
				//并存储到ThreadLocal对象中，通过ThreadLocal对象可以方便进行线程同步管理
				threadLocal.set(sqlSession);
			}
			return sqlSession;
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("数据库连接工厂获取失败！");
		}
		return null;
	}
	/**
	 * 关闭SqlSession对象
	 */
	public static void closeSqlSession(){
		SqlSession sqlSession = threadLocal.get();
		if(sqlSession != null){
			sqlSession.close();
		}
		threadLocal.remove();
	}
}
