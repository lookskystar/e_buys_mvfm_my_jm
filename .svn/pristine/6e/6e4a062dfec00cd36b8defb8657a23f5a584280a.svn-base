<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!-- 在JSP页面引入Spring标签库 -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>测试JSR-303验证框架-错误页面</title>
    
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
    <!--  
  	通过form元素显示错误信息
  	commandName：代表验证的JavaBean；
	path：代表对JavaBean的哪个属性的验证异常信息；
	* ：表示所有字段的验证异常信息；
  	-->
  	<form:form commandName="testUser">
  		<form:errors path="*" cssStyle="color:red"></form:errors>
  	</form:form>
  </body>
</html>
