package com.yayadou.ebuy.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import com.yayadou.ebuy.dto.User;

//����������
public class LoginInterceptor implements HandlerInterceptor {

	//��ͼ����֮��ִ��
	@Override
	public void afterCompletion
	(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	//��ִ��action֮����ͼ����֮ǰִ��
	@Override
	public void postHandle
	(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	//����ͼ����֮ǰִ��
	@Override
	public boolean preHandle
	(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
		System.out.println("----LoginInterceptor-----preHandle---------");
		//��ȡession
		HttpSession session=request.getSession();
		//���session�д洢�ĵ�¼�û�����
		User user=(User) session.getAttribute("session_user");
		if(user!=null){
			System.out.println("--------�û�����--------");
			//����ִ��
			return true;
		}else{
			System.out.println("--------�û�������------------");
			//�û�û�е�¼�����µ�¼
			response.sendRedirect("../behindWeb/common/msg.jsp");
			return false;
		}
	}
	
}
