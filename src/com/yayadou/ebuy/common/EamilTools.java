package com.yayadou.ebuy.common;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

//邮件发送工具 
public class EamilTools {
	
	/**
	 * 1、邮件接收人地址。recAddress
	 * 2、邮件的标题。subject
	 * 3、邮件的内容。content
	 * 4、发件人地址（为了设置发件人的服务器），一般是写在配置文件中。sendAdress
	 * 5、登入名：loginName
	 * 6、授权码：authCode
	 */
	public static boolean send
	(String recAddress,String sendAdress,String mailHost,String subject,String content,String loginName,String authCode){
		//1创建资源文件类对象
		Properties pro=new Properties();
		//邮件的协议
		pro.put("mail.transport.protocol", "smtp");
		//邮件服务器
		pro.put("mail.host", mailHost);
		//发件人地址
		pro.put("mail.from", sendAdress);
		
		//相当于客户端与邮件服务区建立连接
		Session session=Session.getDefaultInstance(pro);
		//设置为调试模式
		session.setDebug(true);
		
		//正式发送邮件
		try {
			//2获取发送邮件的对象
			Transport transport=session.getTransport();
			//发送人的登入名和授权
			transport.connect(loginName,authCode);
			
			//3创建邮件主体
			MimeMessage message=new MimeMessage(session);
			message.setFrom(new InternetAddress(sendAdress));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(recAddress));
			//设置邮件主题
			message.setSubject(subject);
			//设置邮件的内容
			message.setContent(content,"text/html;charset=UTF-8");
			//发送邮件
			transport.sendMessage(message, InternetAddress.parse(recAddress));
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public static void main(String[] args) {
		send("33018953@qq.com","looktest@163.com","smtp.163.com","会议通知","明早8:00开会","looktest","cba123456");
	}
}
