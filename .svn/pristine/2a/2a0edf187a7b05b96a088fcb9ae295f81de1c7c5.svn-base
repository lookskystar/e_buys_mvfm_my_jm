<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
	//通过请求对象获取cookis数据
	Cookie[] cookies = request.getCookies();
	//如果cookies不为>0,不能为null，在进行循环取值
	if(cookies!=null&&cookies.length>0){
		//循环判断cookie数据
		for(Cookie cookie : cookies){
			if("userId".equals(cookie.getName())){
				//解码cookie数据
				String cv = URLDecoder.decode(cookie.getValue(), "UTF-8");
				String[] c = cv.split("-");
				//设置到页面中，方便后面获取
				pageContext.setAttribute("userId", c[0]);
				pageContext.setAttribute("userPass", c[1]);
				break;
			}
		}
	}
%>    

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>E购通电子商务平台-登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="<%=basePath%>frontWeb/css/base.css"/>
	<link rel="stylesheet" href="<%=basePath%>frontWeb/css/login.css"/>
	<link rel="stylesheet" href="<%=basePath%>frontWeb/css/home.css"/>
	<!-- 引入jQuery框架 -->
	<script type="text/javascript" src="<%=basePath%>frontWeb/js/jquery-1.11.0.js"></script>
	<script type="text/javascript" src="<%=basePath%>frontWeb/js/jquery-migrate-1.2.1.js"></script>
	
	<script type="text/javascript">
		/** 监听文档加载完事件 */
		$(function(){
			//绑定记住我复选框点击事件
			$("#remember").click(function(){
				//判断复选框是否选中状态
				if($(this).is(":checked")){
					//alert(1);
					//选中状态设置复选框值为1
					$(this).val("1");
				}else{
					//alert(0);
					//选中状态设置复选框值为0
					$(this).val("0");
				}
			});
			
			//判断pageContext页面对象中是否有userid和userpass对象数据
			if(${not empty userId} && ${not empty userPass}){
				//给页面元素赋值
				$("#userId").val("${userId}");  //设置用户名输入框
				$("#password").val("${userPass}");	//设置密码输入框
				$("#remember").val("1");        //设置复选框框值
				$("#remember").attr("checked",true); //设置复选框为选中状态
			}
		
			/** 为验证码看不清楚绑定点击事件 */
			$("a[class='transform']").click(function(){
				/** 生成1-4之间的随机数(包含1与4) */
				var cursor = Math.ceil(Math.random() * 4);
				/** 重新设置验证码图片的src属性，让它引用一张新的图片 */
				$("#vimg").attr("src", "authCode.do?"+cursor);
			});
	
			/** 为提交按钮绑定click提交事件 */
			$("#loginBtn").click(function(){
				/** 做表单输入校验 */
				var userId = $("#userId");
				var pwd = $("#password");
				var code = $("#code");
				var tip = "";
				if ($.trim(userId.val()) == ""){
					tip = "账号不能为空！";
					userId.focus();// 调用文本框获取焦点方法
				}else if (!/^\w{5,20}$/.test($.trim(userId.val()))){
					tip = "账号格式不正确！";
					userId.focus();// 调用文本框获取焦点方法
				}else if ($.trim(pwd.val()) == ""){
					tip = "密码不能为空！";
					pwd.focus();// 调用文本框获取焦点方法
				}else if (!/^\w{6,20}$/.test($.trim(pwd.val()))){
					tip = "密码格式不正确！";
					pwd.focus();// 调用文本框获取焦点方法
				}else if ($.trim(code.val()) == ""){
					tip = "验证码不能为空！";
					code.focus();// 调用文本框获取焦点方法
				}else if (!/^[a-zA-Z0-9]{4}$/.test($.trim(code.val()))){
					tip = "验证码格式不正确！";
					code.focus();// 调用文本框获取焦点方法
				} 
				/** 判断表单是否通过校验 */
				if (tip != ""){
					alert(tip);
					return false;
				}else{
					//此处编写ajax登录代码
					var params = $("#loginForm").serialize();
					var url = "<%=basePath%>/customer/loginAjax.do";
					$.post(url,params,function(data,status){
						
						if(status=="success"){
							if(data.status == 0){
								window.location = "<%=basePath%>/customer/home.do";
							}else{
								alert(data.tip);
								//刷新验证码
								$("a[class='transform']").trigger("click");
							}
						}else{
							alert("数据加载失败!");
						}
					},"json");	
				}
			});
		});
	</script>

  </head>
  
  <body>
    <div class="header-1">
		<div class="container">
			<a href="index.html" class="lo1"><img src="<%=basePath%>frontWeb/images/logo.png"></a>
			<strong class="f24 normal c-333333">欢迎登录</strong>
		</div>
	</div>	
	<div class="content">
		<div class="container clear">
			<!-- 登录表单 -->
			<form class="fr1" id="loginForm" method="post">
				<div class="left ad1">
					<img src="<%=basePath%>frontWeb/images/ad/1.jpg" alt="">
				</div>
				<div class="right login-dialog">
					<p class="tabs-option">
						<span>快速登录</span>
						<a href="<%=basePath%>frontWeb/frontWeb/register.jsp"><span>注册</span></a>
					</p>
					<p class="p1">
						<i></i><span class="f18">会员</span>
					</p>
					<p class="p2">
						<label class="user">
							<input type="text" id="userId" name="userId" 
								placeholder="邮箱/用户名/已验证手机"/>
						</label>
					</p>
					<p  class="p3">
						<label class="password">
							<input type="password" id="password"" name="password" placeholder="密码"/>
						</label>
					</p>
					<p class="clear p4">
						<label class="left">
							<input type="checkbox" name="remember" id="remember" value="0"/>
							<em class="c-999999">记住我</em>
						</label>
						<a class="right" href="#">忘记密码</a>
					</p>
					<p class="p5">
						<label class="f-999999">
							验证码：<input type="text" id="code" name="code"/>
						</label>
						<img src="authCode.do" id="vimg" alt="验证码"/>
						<a href="javascript: void(0)" class="transform"></a>
					</p>
					<p class="p6">
						<input type="button" id="loginBtn" name="" value="登录"><input type="reset"> 
					</p>
				</div>
			</form>
		</div>
	</div>
	<!-- content -->
	<div class="footer">
		 <p class="text-center">
		 	<span>
		 		<a href="about-us.html">关于我们</a><font>|</font>
		 		<a href="about-us.html">商务合作</a><font>|</font>
		 		<a href="about-us.html">网站地图</a><font>|</font>
		 		<a href="about-us.html">友情链接</a><font>|</font>
		 		<a href="about-us.html">法律声明</a>
		 	</span>
		 </p>
		 <p class="text-center">
		 	<span>
		 		Copyright©2012 广州市E购通网络科技有限公司 版权所有
		 	</span>
		 </p>
	</div>
  </body>
</html>
