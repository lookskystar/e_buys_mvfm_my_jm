<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/behindWeb/common/taglibs.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
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
	<form action="${ctxurl}admin/addUser.do" method="post" class="definewidth m20">
		<table class="table table-bordered table-hover definewidth m10">
		    <tr>
		        <td width="10%" class="tableleft">登录名</td>
		        <td><input type="text" id="userId" name="userId"/></td>
		    </tr>
		    <tr>
		        <td class="tableleft">密码</td>
		        <td><input type="password" id="passWord" name="passWord"/></td>
		    </tr>
		    <tr>
		        <td class="tableleft">真实姓名</td>
		        <td><input type="text" id="name" name="name"/></td>
		    </tr>
		    <tr>
		        <td class="tableleft">邮箱</td>
		        <td><input type="text" id="email" name="email"/></td>
		    </tr>
		    <tr>
		        <td class="tableleft">状态</td>
		        <td>
		            <input type="radio" id="activeStatus" name="activeStatus" value="1" checked/> 启用
		           <input type="radio" id="activeStatus" name="activeStatus" value="0"/> 禁用
		        </td>
		    </tr>
		    <tr>
		        <td class="tableleft">角色</td>
		        <td>{$role_checkbox}</td>
		    </tr>
		    <tr>
		        <td class="tableleft"></td>
		        <td>
		            <button type="submit" class="btn btn-primary" type="button">保存</button> &nbsp;&nbsp;<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
		        </td>
		    </tr>
		</table>
	</form>
	</body>
</html>
<script>
    $(function () {       
		$('#backid').click(function(){
				window.location.href="index.html";
		 });

    });
</script>
