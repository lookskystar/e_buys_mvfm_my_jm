package com.yayadou.ebuy.exception;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 异常处理的Servlet
 * @author Administrator
 */
public class ExceptionServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//通过响应，创建页面
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().println("出现了异常");
		response.getWriter().println("<br/>");
		
		// 获取所有请求的属性名字
		Enumeration<String> names = request.getAttributeNames();
		while (names.hasMoreElements()) {
			String name = names.nextElement();
			Object o = request.getAttribute(name);
			response.getWriter().println(name);
			response.getWriter().println("=");
			response.getWriter().println(o);
			response.getWriter().println("<br/>");
		}
		
		//获取异常类型
		Class<?> cla = (Class<?>) request.getAttribute("javax.servlet.error.exception_type");
		//获取异常的提示信息
		String message = (String) request.getAttribute("javax.servlet.error.message");
		//获取异常对象
		Exception ex = (Exception) request.getAttribute("javax.servlet.error.exception");
		response.getWriter().println("异常类型：" + cla.getName());
		response.getWriter().println("<br/>");
		response.getWriter().println("异常信息：" + message);
		response.getWriter().println("<br/>");
		
		//输出异常堆栈的信息
		response.getWriter().println("异常堆栈<br/>");
		StackTraceElement[] eles = ex.getStackTrace();
		PrintWriter out = response.getWriter();
		for(StackTraceElement ele : eles){
			out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
			out.print(ele.getClassName());
			out.print(".");
			out.print(ele.getMethodName());
			out.print("(");
			out.print(ele.getFileName());
			out.print(":");
			out.print(ele.getLineNumber());
			out.print(")<br/>");
		}
	}
}
