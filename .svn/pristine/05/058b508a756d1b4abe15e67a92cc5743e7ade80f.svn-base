package com.yayadou.ebuy.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * 编码处理过滤器
 * @author Administrator
 */
public class CharsetEncodingFilter implements Filter{
	String charset = null; //编码格式
	//销毁
	@Override
	public void destroy() {
		System.out.println("--destroy----资源释放-------");
	}
	//过滤
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("--doFilter----处理过程-------");
		//设置请求编码
		request.setCharacterEncoding(charset);
		System.out.println("--doFilter----预处理-------");
		//传递请求到下一个Filter或者目标Servlet进行处理
		chain.doFilter(request, response);
		System.out.println("--doFilter----后处理-------");
		//设置响应编码
		response.setContentType("text/html;charset="+charset);
		
	}
	//初始化方法
	@Override
	public void init(FilterConfig config) throws ServletException {
		System.out.println("--init----初始化参数-------");
		//获取过滤器初始化参数
		charset = config.getInitParameter("charset");
	}
}
