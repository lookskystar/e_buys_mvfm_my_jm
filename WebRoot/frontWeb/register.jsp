<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>E购通电子商务平台-注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="<%=basePath%>frontWeb/css/base.css"/>
	<link rel="stylesheet" href="<%=basePath%>frontWeb/css/register.css"/>
	<link rel="stylesheet" href="<%=basePath%>frontWeb/css/home.css"/>
	<!-- 引入jQuery框架 -->
	<script type="text/javascript" src="<%=basePath%>frontWeb/js/jquery-1.11.0.js"></script>
	<script type="text/javascript" src="<%=basePath%>frontWeb/js/jquery-migrate-1.2.1.js"></script>
	<!-- 引入外部的js文件(数据文件) -->
	<script type="text/javascript" src="<%=basePath%>frontWeb/js/cityData.js"></script>
	<!-- 引入日期js控件 -->
	<script type="text/javascript" src="<%=basePath%>frontWeb/js/My97DatePicker/WdatePicker.js"></script>

	<script type="text/javascript">
		/** 文档加载完 */
		$(function(){
			/** 填充省份与城市下拉列表 */
			/** 迭代数据 */
			$.each(cityData, function(){
				/** 填充省份 */
				$("<option/>").val(this.code).text(this.name).appendTo("#province");
			});

			/** 为省份下拉列表绑定onchange事件 */
			$("#province").change(function(){
				/** 先清空城市 */
				$("#city > option:gt(0)").remove();
				/** 获取当前选中的option的值 */
				var proCode = this.value;
				/** 再次迭代数据 */
				$.each(cityData, function(){
					/** 判断当前选中的是哪个省份 */
					if (proCode == this.code){
						/** 获取该省份对应的所有城市,再次迭代 */
						$.each(this.cities, function(){
							/** 填充城市 */
							$("<option/>").val(this.code)
										 .text(this.name).appendTo("#city");
						});
					}
				});
			});

			//用户名是否重复检查
			$("#userId").blur(function(){
				var url = "${ctx}/customer/userIdCheck";
				$.post(url,$("#userId"),function(data){
						if(data.status == 1){
							$("#userId_tip").html("用户名已经存在！").show();
							$("#userId").focus(); //获取焦点
							var isSubmit = false;
						}else{
							$("#userId_tip").hide();
							var isSubmit = true;
						}
				},"json");
			});
			
			/** 为表单绑定提交事件onsubmit */
			$("form[class='fr-re']").submit(function(){
				/** 表单输入校验 */
				var userId = $("#userId");
				var pwd = $("#passWord");
				var okPwd = $("#okPwd");
				var name = $("#name");
				var provice = $("#province");
				var city = $("#city");
				var birthday = $("#birthday");
				var phone = $("#phone");
				var education = $("#education");
				

				/** 隐藏所有的提示信息 */
				$("strong[id$='_tip']").hide(); 

				/** 定义是否提交表单的标识符 */
				var isSubmit = true;
				if ($.trim(userId.val()) == ""){
					isSubmit = false;
					$("#userId_tip").html("* 用户名不能空！").show();
					userId.focus(); // 获取焦点
				}else if (!/^\w{5,20}$/.test($.trim(userId.val()))){
					isSubmit = false;
					$("#userId_tip").html("* 用户名必须在5-20位之间！").show();
					userId.focus(); // 获取焦点
				}else if ($.trim(pwd.val()) == ""){
					isSubmit = false;
					$("#pwd_tip").html("* 设置密码不能空！").show();
					pwd.focus(); // 获取焦点
				}else if (!/^\w{6,20}$/.test($.trim(pwd.val()))){
					isSubmit = false;
					$("#pwd_tip").html("* 设置密码必须在6-20位之间！").show();
					pwd.focus(); // 获取焦点
				}else if ($.trim(okPwd.val()) == ""){
					isSubmit = false;
					$("#okPwd_tip").html("* 确认密码不能空！").show();
					okPwd.focus(); // 获取焦点
				}else if (!/^\w{6,20}$/.test($.trim(okPwd.val()))){
					isSubmit = false;
					$("#okPwd_tip").html("* 确认密码必须在6-20位之间！").show();
					okPwd.focus(); // 获取焦点
				}else if (pwd.val() != okPwd.val()){
					isSubmit = false;
					$("#okPwd_tip").html("* 两次密码输入不一致！").show();
				}else if ($.trim(name.val()) == "") { // 真实姓名
					isSubmit = false;
					$("#name_tip").html("* 真实姓名不能为空！").show();
					name.focus();
				}else if (provice.val() == 0){
					isSubmit = false;
					$("#procity_tip").html("* 请选择省份！").show();
				}else if (city.val() == 0){
					isSubmit = false;
					$("#procity_tip").html("* 请选择城市！").show();
				}else if ($.trim(birthday.val()) == ""){
					isSubmit = false;
					$("#birthday_tip").html("* 请选择出生日期！").show();
					birthday.focus();
				}else if ($.trim(phone.val()) == ""){ // 手机号码
					isSubmit = false;
					$("#phone_tip").html("* 手机号码不能为空！").show();
					phone.focus();
				}else if (!/^1[3|4|5|8]\d{9}$/.test($.trim(phone.val()))){ // 手机号码
					isSubmit = false;
					$("#phone_tip").html("* 手机号码格式不正确！").show();
					phone.focus();
				}else if ($.trim(education.val()) == ""){ // 学历
					isSubmit = false;
					$("#education_tip").html("* 学历不能为空！").show();
					education.focus();
				}else if (!$("#agreen").attr("checked")){ // 同意
					isSubmit = false;
					$("#education_tip").html("* 请勾选我已经阅读并同意！").show();
				}
				var params=$("#registerForm").serialize();
				alert(params);
				return isSubmit;
			});
		});
	</script>
  </head>
  
  <body>
    <!-- header -->
	<div class="header">
		<!-- header-top -->
		<div class="header-top clear">
			<div class="container">

				<div class="left">
					<span class="home"><em><a href="index.html">E购通首页</a></em></span>
					<span>亲，欢迎来到E购通</span>
					<span>请<a href="login.html">登录</a></span>
					<a href="register.html">免费注册</a>
				</div>
				<ul class="right clear">
					<li><a href="index.html">我的E购通</a></li>
					<li><a href="#">我的订单</a></li>
					<li><a href="#">服务中心</a><i></i>
						<ul>
							<li><a href="#">子导航一</a></li>
							<li><a href="#">子导航二</a></li>
							<li><a href="#">子导航三</a></li>
							<li><a href="#">子导航四</a></li>
						</ul>
					</li>
					<li><a href="#">网站导航</a><i></i>
						<ul>
							<li><a href="#">子导航一</a></li>
							<li><a href="#">子导航二</a></li>
							<li><a href="#">子导航三</a></li>
							<li><a href="#">子导航四</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<!-- header-top  end-->
		<!-- search-logo -->
		<div class="search-logo">	
			<div  class="clear container">
				<a href="index.html" class="left lo1"><img src="<%=basePath%>frontWeb/images/logo.png"></a>
				<strong class="f24 c-333333">欢迎注册</strong>
			</div>
			<!-- search-logo end-->
		</div>
	</div>
	<!-- header end-->

	<!-- content -->
	<div class="content">
		<div class="container">
			<div class='text-center option'>
				<span>
					<strong class="f18 actives c-c40000 active">个人用户<i></i></strong>
					<strong class="f18 c-c40000">企业用户<i></i></strong>
					<font class="f14">
					我已经注册，现在就 
					<a class="c-c40000" href="<%=basePath%>frontWeb/frontWeb/login.jsp">登录</a></font>
				</span>
			</div>
			
			<!-- 注册表单 -->
			<form class="fr-re" id="registerForm" action="<%=basePath%>customer/register.do" 
				method="post">
					<p class="type">
						<span>用户名：</span>
						<label><i class="user"></i>
						<input name="userId" id="userId" type="text" value="andy123"></label>
						<font>
							<strong  id="userId_tip" class="normal">* 用户名不能为空！</strong>
						</font>
					</p>

					<p class="type">
						<span>设置密码：</span>
						<label><i class="password"></i>
						<input name="passWord" id="passWord" type="password" value="123456"/></label>
						<font>
							<strong id="pwd_tip" class="normal">* 设置密码不能为空！</strong>
						</font>
					</p>

					<p class="type">
						<span>确认密码：</span>
						<label><i class="password"></i>
						<input type="password" name="okPwd" id="okPwd" value="123456"></label>
						<font>
							<strong id="okPwd_tip" class="normal">* 确认密码不能为空！</strong>
						</font>
					</p>
					<p class="type p4">
						<span>真实姓名：</span>
						<label><input name="name" id="name" type="text" value="刘备"></label>
						<font>
							<strong  id="name_tip" class="normal">* 真实姓名不能为空！</strong>
						</font>
					</p>

					<p>
						<span>城市选择：</span>
						<select style="height:30px;width:155px;" name="province" id="province">
							<option value="0">==请选择省份==</option>
						</select><select style="height:30px;" name="city" id="city">
							<option value="0">==请选择城市==</option>
						</select>
						<font>
							<strong id="procity_tip" class="normal">* 请选择省份！</strong>
						</font>
					</p>
					<p class="p1">
						<span>性别：</span>
						<label>
						<input type="radio" name="sex" id="sex" value="1" checked="true">男性</label>
						<label><input type="radio" name="sex" id="sex"  value="0">女性</label>
					</p>
					
					<p class="type p4">
						<span>出生日期：</span>
						<label><input  class="Wdate" id="birthday"  name="birthday" 
							type="text" placeholder="请选择出生日期" 
							onfocus="WdatePicker({lang:'zh-cn',fmt:'yyyy-MM-dd'});" /></label>
						<font>
							<strong id="birthday_tip" class="normal">* 请选择出生日期！</strong>
						</font>
					</p>
					<p class="type p4">
						<span>手机号码：</span>
						<label><input type="text" id="phone" name="phone" value="13907341024"></label>
						<font>
							<strong id="phone_tip" class="normal">* 手机号码不能为空！</strong>
						</font>
					</p>
					<p class="type p4">
						<span>学历：</span>
						<label><input type="text" name="education" id="education" value="高中"></label>
						<font>
							<strong id="education_tip" class="normal">* 学历不能为空！</strong>
						</font>
					</p>
					<p class="p3">
						<span></span>
						<label>
							<input type="checkbox" id="agreen"/>
							<em class="c-999999">我已经阅读并同意</em>
							<a class="c-c40000" href="#">《E购通用户注册协议》</a>
						</label>
						<strong id="agreen_tip" class="normal"></strong>
					</p>
					<p><span></span><input type="submit" value="立即注册"></p>
			
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
