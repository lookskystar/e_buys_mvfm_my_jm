package com.yayadou.ebuy.action;

import java.awt.image.BufferedImage;
import java.io.IOException;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yayadou.ebuy.common.AuthCode;

/**
 * 验证码处理Servlet类
 * @author Administrator
 *
 */
@Controller
public class AuthCodeAction{
	private static final long serialVersionUID = 1L;
	@RequestMapping("/authCode")
	@ResponseBody
	protected void authCode(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取字符串验证码
		String code = AuthCode.getAuthCode();
		//将验证码存储到session中，方便后面的判断
		HttpSession session = request.getSession();
		session.setAttribute("authCode",code);
		
		//获取验证码图片
		BufferedImage img = AuthCode.getCodeImg(code);
		//输出验证码图片到客户端
		ImageIO.write(img, "JPEG", response.getOutputStream());
	}
	
}
