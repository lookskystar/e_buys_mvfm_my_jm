<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.yayadou.ebuy.dto.User"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>E购通电子商务平台-首页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="<%=basePath%>/css/base.css"/>
	<link rel="stylesheet" href="<%=basePath%>/css/index.css"/>
	<link rel="stylesheet" href="<%=basePath%>/css/home.css"/>
	<!-- 引入jQuery框架 -->
	<script type="text/javascript" src="<%=basePath%>/js/jquery-1.11.0.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/jquery-migrate-1.2.1.js"></script>
	<!-- 引入自定义的日期插件 -->
	<script type="text/javascript" src="<%=basePath%>/js/jquery-timer-1.0.js"></script>

	<script type="text/javascript">
		
		/** 文档加载完 */
		$(function(){
			/** 获取所有的主菜单 */
			var menu = $(".nav-menu > li");
			/** 为所有的主菜单绑定onmouseover与onmouseout事件 */
			menu.hover(
				function(){ // onmouseover
					/** 为主菜单li添加样式 */
					$(this).addClass("active");
					/** 通过主菜单找对应的子菜单用300毫秒滑下显示出来 */
					$(this).find(".sub-Menu").slideDown(300);
				},
				function(){ // onmouseout
					/** 首页主菜单li的样式不删除 */
					if (this.id != "home"){
						/** 删除主菜单li样式 */
						$(this).removeClass("active");
					}
					/** 通过主菜单找对应的子菜单用10毫秒滑上隐藏出来 */
					$(this).find(".sub-Menu").slideUp(10);
				}
			);
			
			/**======== 图片轮播广告 =========*/
			/** 定义计数器 */
			var cursor = 0;
			/** 定义当前显示的li中图片索引号 */
			var current = 0;
			/** 获取所有的图片切换圆点*/
			var lis = $("#ol_circle > li");
			/** 迭代所有的li元素 */
			lis.each(function(i, item){
				/** 为它们绑定onmouseover事件 */
				$(item).mouseover(function(event){
					/** 当前li添加class样式 */
					$(this).addClass("active");
					/** 其它的li删除红色圆点class样式 */
					lis.not(this).removeClass("active");
					/** 显示当前圆点对应的图片 */
					$("#ul_img_ad > li").eq(i).fadeIn(500);
					/** 设置其它的图片隐藏 */
					$("#ul_img_ad > li").not($("#ul_img_ad > li").eq(i)).hide();
					/** 设置当前索引为用户光标对应的图片索引号 */
					cursor = i;
					/** 缓存当前显示图片的索引号 */
					current = i;
				})
			});
			
			/** 开启定时器 */
			window.setInterval(function(){
				if (cursor >= lis.length){
					cursor = 0;
				}
				/** 获取当前切换圆点li */
				$(lis.get(cursor)).trigger("mouseover");
				/** 自加 */
				cursor++;
			}, 5000);

			/** 图片广告向左 */
			$(".prev").click(function(){
				cursor = current;
				if (cursor < 0){
					cursor = lis.length; // 初始化它的长度
				}
				/** 自减 */
				cursor--;
				/** 获取当前切换圆点li,触发它的mouseover事件 */
				$(lis.get(cursor)).trigger("mouseover");
			});

			/** 图片广告向右 */
			$(".next").click(function(){
				cursor = current;
				if (cursor >= lis.length - 1){
					cursor = -1; // 初始化为-1
				}
				/** 自加 */
				cursor++;
				/** 获取当前切换圆点li */
				$(lis.get(cursor)).trigger("mouseover");
				
			});


			
			/** 限时抢购(倒计时) */
			//$("#down_count_span").downCount("2015-07-03 00:00:00", "还剩", "结束");
			
		});
	</script>
  </head>
  
  <body>
   <!-- header 头部 -->
	<div class="header">
		<!-- header-top 头部上面部分 -->
		<div class="header-top clear">
			<div class="container">
				<div class="left">
					<span class="home"><em>E购通首页</em></span>
					<span>
						<% 
							User user = (User)session.getAttribute("session_user");	
							if(user != null){
						%>
							${session_user.userId}，欢迎来到E购通
						<%		
							}else{
						%>
							亲，欢迎来到E购通
						<%
							}
						%>
					</span>
					<span>
						<% 
							if(user != null){
						%>
							<a href="LogoutServlet.do">注销</a>
						<%		
							}else{
						%>
							请<a href="<%=basePath%>/frontWeb/login.jsp">登录</a>
						<%
							}
						%>
					</span>
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

		<!-- search-logo 搜索部分 -->
		<div class="search-logo">	
			<div  class="clear container">
				<a href="#" class="left lo1"><img src="<%=basePath%>/images/logo.png" alt=""></a>
				<form class="left fr1" action="" mothed="">
					<p>
						<input placeholder="手机搜索  OPPO N3（N5209）白色" class="f14 c-999999" type="text"><input type="submit" class="f14 white" value="搜索">
					</p>
					<p class="text-2em">
						<a href="#">618狂欢</a>
						<a href="#">西门子</a>
						<a href="#">199减100</a>
						<a href="#">6.18元</a>
						<a href="#">魅蓝note</a>
						<a href="#">图书</a>
						<a href="#">61812期免息</a>
						<a href="#">领500元</a>
					</p>
				</form>
				<span class="right">
					<a href="buycar.html" class="shopingcart"></a><font>99</font>
					<a href="buycar.html">我的购物车</a>
				</span>
			</div>
			<!-- search-logo end-->
		</div>
	</div>
	<!-- header end-->


	<!-- nav 导航区开始 -->
	<div class="nav">
		<div class="container">
			<ul class="nav-menu">
				<!-- 主菜单 -->
				<li id="home" class="active">
					<a href="index.html">首  页</a>
				</li>
				<!-- 主菜单 -->
				<li>
					<a href="index.html">手  机</a>
					<!-- 子菜单 -->
					<ul class="sub-Menu">
						<li><a href="#">三星</a></li>
						<li><a href="#">华为</a></li>
						<li><a href="#">OPPO</a></li>
						<li><a href="#">vivo</a></li>
						<li><a href="#">苹果</a></li>
						<li><a href="#">TCL</a></li>
						<li><a href="#">酷派</a></li>
						<li><a href="#">大神</a></li>
					</ul>
				</li>
				<!-- 主菜单 -->
				<li>
					<a href="index.html">数码相机</a>
					<!-- 子菜单 -->
					<ul class="sub-Menu">
						<li><a href="#">佳能</a></li>
						<li><a href="#">尼康</a></li>
						<li><a href="#">索尼</a></li>
						<li><a href="#">富士徕卡</a></li>
						<li><a href="#">卡西欧</a></li>
						<li><a href="#">奥林巴斯</a></li>
						<li><a href="#">酷派</a></li>
						<li><a href="#">松下</a></li>
					</ul>
				</li>
				<!-- 主菜单 -->
				<li>
					<a href="index.html">电  视</a>
					<!-- 子菜单 -->
					<ul class="sub-Menu">
						<li><a href="#">三星</a></li>
						<li><a href="#">华为</a></li>
						<li><a href="#">OPPO</a></li>
						<li><a href="#">vivo</a></li>
						<li><a href="#">苹果</a></li>
						<li><a href="#">TCL</a></li>
						<li><a href="#">酷派</a></li>
						<li><a href="#">大神</a></li>
					</ul>
				</li>
				<!-- 主菜单 -->
				<li>
					<a href="index.html">空  调</a>
					<!-- 子菜单 -->
					<ul class="sub-Menu">
						<li><a href="#">三星</a></li>
						<li><a href="#">华为</a></li>
						<li><a href="#">OPPO</a></li>
						<li><a href="#">vivo</a></li>
						<li><a href="#">苹果</a></li>
						<li><a href="#">TCL</a></li>
						<li><a href="#">酷派</a></li>
						<li><a href="#">大神</a></li>
					</ul>
				</li>
				<!-- 主菜单 -->
				<li>
					<a href="index.html">冰  箱</a>
					<!-- 子菜单 -->
					<ul class="sub-Menu">
						<li><a href="#">三星</a></li>
						<li><a href="#">华为</a></li>
						<li><a href="#">OPPO</a></li>
						<li><a href="#">vivo</a></li>
						<li><a href="#">苹果</a></li>
						<li><a href="#">TCL</a></li>
						<li><a href="#">酷派</a></li>
						<li><a href="#">大神</a></li>
					</ul>
				</li>
				<!-- 主菜单 -->
				<li>
					<a href="index.html">洗衣机</a>
					<!-- 子菜单 -->
					<ul class="sub-Menu">
						<li><a href="#">三星</a></li>
						<li><a href="#">华为</a></li>
						<li><a href="#">OPPO</a></li>
						<li><a href="#">vivo</a></li>
						<li><a href="#">苹果</a></li>
						<li><a href="#">TCL</a></li>
						<li><a href="#">酷派</a></li>
						<li><a href="#">大神</a></li>
					</ul>
				</li>
				<!-- 主菜单 -->
				<li>
					<a href="index.html">平板电脑</a>
					<!-- 子菜单 -->
					<ul class="sub-Menu">
						<li><a href="#">三星</a></li>
						<li><a href="#">华为</a></li>
						<li><a href="#">OPPO</a></li>
						<li><a href="#">vivo</a></li>
						<li><a href="#">苹果</a></li>
						<li><a href="#">TCL</a></li>
						<li><a href="#">酷派</a></li>
						<li><a href="#">大神</a></li>
					</ul>
				</li>
				<li>
					<a href="index.html" class="gd_">更多</a>
					<div  class="sub-Menu tc"> 
						<div class="lx_">
							<img src="<%=basePath%>/images/6.jpg"><a href=""><span>女装</span></a>
						</div>
						<div class="xl_ clear" id="xl_">
							<a href="">夏新品</a>
							<a href="">夏新品</a>
							<a href="">夏新品</a>
							<a href="">夏dsadsdadsas新品</a>
							<a href="">fsad夏新ewrew品</a>
							<a href="">夏新品</a>
							<a href="">夏新品</a>
							<a href="">夏新fdsf品</a>
							
						</div>
						<div class="lx_">
							<img src="images/7.jpg"><a href=""><span>女鞋</span></a>
						</div>
						<div class="xl_ clear" id="xl_">
							<a href="">夏新品</a>
							<a href="">夏新品</a>
							<a href="">夏新品</a>
							<a href="">夏dsadsdadsas新品</a>
							<a href="">fsad夏新ewrew品</a>
							<a href="">夏新品</a>
							<a href="">夏新品</a>
							<a href="">夏新fdsf品</a>
							
						</div>
					</div>
					
						
					
				</li>
			</ul>
		</div>
	</div>
	<!-- nav end 导航区结束-->


	<!-- banner 横幅广告 -->
	<div class="banner">
		
		<div class="banner-wrap">
			<ul id="ul_img_ad" class="clear">
				<li><a href="#"><img style="width:1440px;" src="<%=basePath%>/images/banner/1.jpg"></a></li>
				<li><a href="#"><img style="width:1440px;" src="<%=basePath%>/images/ad/3.jpg"></a></li>
				<li><a href="#"><img style="width:1440px" src="<%=basePath%>/images/ad/4.jpg"></a></li>
				<li><a href="#"><img style="width:1440px" src="<%=basePath%>/images/ad/5.jpg"></a></li>
				<li><a href="#"><img style="width:1440px" src="<%=basePath%>/images/ad/6.jpg"></a></li>
			</ul>
		</div>
		<div class="container">
			<!-- 向左 -->
			<a class="prev" href="javascript: void(0)"></a>
			<!-- 向右 -->
			<a class="next" href="javascript: void(0)"></a>
			<!-- 图片切换的圆点 -->
			<ol id="ol_circle" class="clear">
				<li class="active"></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
			</ol>
		</div>
	</div>
	<!-- banner end-->


	<!-- content -->
	<div class="content">
		<div class="container">
			<div class="section">
				<div class="tips clear">
					<span class="left f24 white">限时抢购</span>
					<span class="left white text-bottom s1">
						<!-- 还剩<font>0</font><font>0</font><strong>:</strong>
						<font>0</font><font>0</font><strong>:</strong>
						<font>0</font><font>0</font>结束 -->
					</span>
					<a class="right b-tgl" href="#"><em>下期预告</em></a>
				</div>
				<div class="clear bg-white pr1">
					<a href="#" class="left img-bg"><img src="<%=basePath%>/images/product/1.jpg" alt=""></a>
					<ul class="right">
						<li class="clear qg_">
							<a href="details.html" class="left l1"><img src="<%=basePath%>/images/product/2.jpg" alt=""></a>
							<span class="text-top left">
								<a href="details.html">三星<br>GALAXY S6<br>Edge</a>
								<p>抢码价：</p>
								<p class="f18 bg-c40000 white">¥6800</p>
								<p>【限时疯抢】</p>
							</span>
							<div>33:33:33</div>
						</li>
						<li class="clear qg_">
							<a href="details.html" class="left l1"><img src="<%=basePath%>/images/product/3.jpg" alt=""></a>
							<span class="text-top left">
								<a href="details.html">三星<br>GALAXY S6<br>Edge</a>
								<p>抢码价：</p>
								<p class="f18 bg-c40000 white">¥6800</p>
								<p>【限时疯抢】</p>
							</span>
							<div></div>
						</li>
						<li class="clear qg_">
							<a href="details.html" class="left l1"><img src="<%=basePath%>/images/product/4.jpg" alt=""></a>
							<span class="text-top left">
								<a href="details.html">三星<br>GALAXY S6<br>Edge</a>
								<p>抢码价：</p>
								<p class="f18 bg-c40000 white">¥6800</p>
								<p>【限时疯抢】</p>
							</span>
							<div></div>
						</li>
						<li class="clear qg_">
							<a href="details.html" class="left l1"><img src="<%=basePath%>/images/product/5.jpg" alt=""></a>
							<span class="text-top left">
								<a href="details.html">三星<br>GALAXY S6<br>Edge</a>
								<p>抢码价：</p>
								<p class="f18 bg-c40000 white">¥6800</p>
								<p>【限时疯抢】</p>
							</span>
							<div></div>
						</li>
						<li class="clear qg_">
							<a href="details.html" class="left l1"><img src="<%=basePath%>/images/product/7.jpg" alt=""></a>
							<span class="text-top left">
								<a href="details.html">三星<br>GALAXY S6<br>Edge</a>
								<p>抢码价：</p>
								<p class="f18 bg-c40000 white">¥6800</p>
								<p>【限时疯抢】</p>
							</span>
							<div></div>
						</li>
						<li class="clear qg_">
							<a href="details.html" class="left l1"><img src="<%=basePath%>/images/product/3.jpg" alt=""></a>
							<span class="text-top left">
								<a href="details.html">三星<br>GALAXY S6<br>Edge</a>
								<p>抢码价：</p>
								<p class="f18 bg-c40000 white">¥6800</p>
								<p>【限时疯抢】</p>
							</span>
							<div></div>
						</li>
					</ul>
				</div>
			</div>
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
