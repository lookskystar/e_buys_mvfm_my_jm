<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'edit.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="<%=basePath%>behindWeb/Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>behindWeb/Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>behindWeb/Css/style.css" />
    <script type="text/javascript" src="<%=basePath%>behindWeb/Js/jquery.js"></script>
    <script type="text/javascript" src="<%=basePath%>behindWeb/Js/jquery.sorted.js"></script>
    <script type="text/javascript" src="<%=basePath%>behindWeb/Js/bootstrap.js"></script>
    <script type="text/javascript" src="<%=basePath%>behindWeb/Js/ckform.js"></script>
    <script type="text/javascript" src="<%=basePath%>behindWeb/Js/common.js"></script>

	<style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }

    </style>
  </head>
  
  <body>
	<form action="{:U('User/edit')}" method="post" class="definewidth m20">
	<input type="hidden" name="id" value="{$user.id}" />
	    <table class="table table-bordered table-hover definewidth m10">
	        <tr>
	            <td width="10%" class="tableleft">登录名</td>
	            <td><input type="text" name="username" value="{$user.username}"/></td>
	        </tr>
	        <tr>
	            <td class="tableleft">密码</td>
	            <td><input type="password" name="password"/></td>
	        </tr>
	        <tr>
	            <td class="tableleft">真实姓名</td>
	            <td><input type="text" name="realname" value="{$user.realname}"/></td>
	        </tr>
	        <tr>
	            <td class="tableleft">邮箱</td>
	            <td><input type="text" name="email" value="{$user.email}"/></td>
	        </tr>
	        <tr>
	            <td class="tableleft">状态</td>
	            <td>
	                <input type="radio" name="status" value="0" />
	                    <eq name="user.status" value='0'>checked</eq> 启用
	              <input type="radio" name="status" value="1" />
	                    <eq name="user.status" value='1'>checked</eq>  禁用
	            </td>
	        </tr>
	        <tr>
	            <td class="tableleft">角色</td>
	            <td>{$role_checkbox}</td>
	        </tr>
	        <tr>
	            <td class="tableleft"></td>
	            <td>
	                <button type="submit" class="btn btn-primary" type="button">保存</button>				 &nbsp;&nbsp;<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
	            </td>
	        </tr>
	    </table>
	</form>
</body>
</html>
<script>
    $(function () {       
		$('#backid').click(function(){
				window.location.href="{:U('User/index')}";
		 });

    });
</script>