package com.yayadou.ebuy.dao.impl;

import java.io.InputStream;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 * ��ȡSqlSession�͹ر�SqlSession�Ļ�����
 * @author Administrator
 */
public class BaseDao {

	private static ThreadLocal<SqlSession> threadLocal = new ThreadLocal<>();
	
	//��Ϊ����ע������в��ܰ�����̬����飬���ԣ��Ѿ�̬�������еĴ���ϲ�������ķ�����
	/**
	 * ��ȡSqlSession����
	 * @return
	 */
	public static SqlSession getSqlSession(){
		try {
			InputStream in = Resources.getResourceAsStream("mybatis-config.xml");
			SqlSessionFactory factory  = new SqlSessionFactoryBuilder().build(in);
			//ͨ��ThreadLocal��ȡsqlSession����
			SqlSession sqlSession = threadLocal.get();
			if(sqlSession == null){
				//��ȡһ��SqlSession����
				sqlSession = factory.openSession();
				//���洢��ThreadLocal�����У�ͨ��ThreadLocal������Է�������߳�ͬ������
				threadLocal.set(sqlSession);
			}
			return sqlSession;
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("���ݿ����ӹ�����ȡʧ�ܣ�");
		}
		return null;
	}
	/**
	 * �ر�SqlSession����
	 */
	public static void closeSqlSession(){
		SqlSession sqlSession = threadLocal.get();
		if(sqlSession != null){
			sqlSession.close();
		}
		threadLocal.remove();
	}
}
