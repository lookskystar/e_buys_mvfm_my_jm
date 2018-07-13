<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>测试JSR-303验证框架-注册页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<!-- 提交表单 -->
    <form action="validaterUser.do" method="post">
    	用户名：<input type="text" name="name" /><br>
    	年龄：<input type="text"  name="age" /><br>
    	手机：<input type="text"  name="phone" /><br>
    	Email：<input type="text"  name="email" /><br>
    	<input type="submit" value="提交" />
    </form>
  </body>
</html>
