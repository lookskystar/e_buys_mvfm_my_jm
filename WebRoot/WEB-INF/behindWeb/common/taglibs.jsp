<%@ page contentType="text/html; charset=UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 根目录路径 -->
<c:set value="<%=path%>" var="ctx"></c:set>
<!-- url -->
<c:set value="<%=basePath%>" var="ctxurl"></c:set>

<!-- behindWebStyle/indexBehind.jsp样式文件、js、jquery引入 -->
<link href="${ctxurl}behindWebStyle/assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
<link href="${ctxurl}behindWebStyle/assets/css/bui-min.css" rel="stylesheet" type="text/css" />
<link href="${ctxurl}behindWebStyle/assets/css/main-min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctxurl}behindWebStyle/assets/js/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="${ctxurl}behindWebStyle/assets/js/bui-min.js"></script>
<script type="text/javascript" src="${ctxurl}behindWebStyle/assets/js/common/main-min.js"></script>
<script type="text/javascript" src="${ctxurl}behindWebStyle/assets/js/config-min.js"></script>

<!--behindWebStyle/User/indexUser.jsp 样式文件引入  -->
<!--behindWebStyle/User/addUser.jsp 样式文件引入  -->
<!--behindWebStyle/Public/loginAdmin.jsp 样式文件引入  -->
<link rel="stylesheet" type="text/css" href="${ctxurl}/behindWebStyle/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="${ctxurl}/behindWebStyle/css/bootstrap-responsive.css" />
<link rel="stylesheet" type="text/css" href="${ctxurl}/behindWebStyle/css/style.css" />
<script type="text/javascript" src="${ctxurl}/behindWebStyle/js/jquery.js"></script>
<script type="text/javascript" src="${ctxurl}/behindWebStyle/js/jquery.sorted.js"></script>
<script type="text/javascript" src="${ctxurl}/behindWebStyle/js/bootstrap.js"></script>
<script type="text/javascript" src="${ctxurl}/behindWebStyle/js/ckform.js"></script>
<script type="text/javascript" src="${ctxurl}/behindWebStyle/js/common.js"></script>


