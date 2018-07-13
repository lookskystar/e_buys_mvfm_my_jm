<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/behindWeb/common/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="${ctxurl}/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="${ctxurl}/css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="${ctxurl}/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${ctxurl}/css/admin-right.css" />
    <script type="text/javascript" src="${ctxurl}/js/jquery-1.11.0.js"></script>
    <script type="text/javascript" src="${ctxurl}/js/jquery-migrate-1.2.1.js"></script>

    <script src="${ctxurl}/js/artDialog-6.0.2/dist/dialog-min.js"></script>
	<link rel="stylesheet" href="${ctxurl}/js/artDialog-6.0.2/css/ui-dialog.css">
	
	<script type="text/javascript">
	     function deleteUser(id){
	    		var d = dialog({
					title: '温馨提示',  
					content: 
		'<img src=${ctx}/images/logo2.png><br><font size=6 color=red>您确定要删除对应的数据吗?</font>',
				    okValue:'确定',
				    ok:function(){
				    	this.title("请稍等...");
				    	window.location="${ctx}/admin/user/delete?id="+id;
				    	return false;
				    },
				    cancelValue:'取消',
				    cancel:function(){}
				});
				d.showModal();
	    	}
     </script>

  </head>
  
  <body>
    <form class="form-inline definewidth m20" 
    action="${ctx}/admin/user/userList" method="post">  
             用户名称：
    <input type="text" name="userId" id="userId"class="abc input-default" 
    placeholder="请输入需要查询的用户名称" value="">&nbsp;&nbsp;  
    <button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp;
</form>
<table class="table table-bordered table-hover definewidth m10" >
    <thead>
    <tr>
        <th>商品类型编号</th>
        <th>商品类型名称</th>
        <th>商品类型备注</th>
        <th colspan="2" style="text-align:center">操作</th>
    </tr>
    </thead>
    	<#if goodstypeList??>
    	<#list goodstypeList as goodstype>
	     <tr>
            <td>${goodstype.code}</td>
            <td>${goodstype.name}</td>
            <td>${goodstype.remark}</td>
            <td>
                  <a href="${ctx}/admin/user/showUpdate?id=${user.id}">修改</a>
            </td>
             <td>
                  <a href="javascript:;" onclick="deleteUser(${user.id})">删除</a>
            </td>
        </tr>
        </#list>
        </#if>
        </table>
  </body>
</html>
