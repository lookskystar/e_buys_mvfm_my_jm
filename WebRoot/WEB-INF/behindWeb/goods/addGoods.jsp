<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/behindWeb/common/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>商品管理-添加商品</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="${ctxurl}css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="${ctxurl}css/bootstrap-responsive.css" />
	<link rel="stylesheet" type="text/css" href="${ctxurl}css/style.css" />
	<link rel="stylesheet" type="text/css" href="${ctxurl}css/admin-right.css" />
	<script type="text/javascript" src="${ctxurl}js/jquery-1.11.0.js"></script>
	<script type="text/javascript" src="${ctxurl}js/jquery-migrate-1.2.1.js"></script>
	<script type="text/javascript" src="${ctxurl}js/My97DatePicker/WdatePicker.js"></script>
	<!-- 导入tinymce 编辑器 -->
	<script type="text/javascript" src="${ctxurl}js/tiny_mce/tiny_mce.js"></script>
	
	<script type="text/javascript">
    	 tinyMCE.init({
			mode : "exact", // mode:指定附加的模式 textareas : html页面上所有的textarea元素都附加上.
			elements : "descTextArea", // exact:精确的模式， 需要指定html元素id属性值
			theme : "advanced", // 主题：advanced(高级的) 、simple(简单的)
			language : "zh-cn", // 国际化
			/** 指定工具按钮资源文件存放的文件夹 */
			plugins : "autolink,lists,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,wordcount,advlist,autosave",
			/** 指定工具按钮在上面放四排 */
			theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
			theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
			theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
			theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak,restoredraft",
			
			/** 指定工具按钮上下的位置 top、bottom */
			theme_advanced_toolbar_location : "top",
			/** 指定工具按钮左、中、右显示的位置 left、center、right */
			theme_advanced_toolbar_align : "left",
			/** 指定状态栏的位置 (top、bottom) */
			theme_advanced_statusbar_location : "bottom",
			/** 指定编辑器是否可以拖动 */
			theme_advanced_resizing : true
		    });
    	 
    	 	$(function(){
		    	/** 为添加商品表单绑定提交事件 */
		    	$("#addGoodsForm").submit(function(){
		    		/** 表单输入校验 */
		    		var title = $("#title");
		    		var brandName = $("#brandName");
		    		var price = $("#price");
		    		var favorablePrice = $("#favorablePrice");
		    		var groundingDate = $("#groundingDate");
		    		var storage = $("#storage");
		    		var pic = $("#pic");
		    		var desc = tinyMCE.get('descTextArea').getContent();
		    		var msg = "";
		    		
		    		// 判断表单元素
		    		if ($.trim(title.val()) == ""){
		    			msg = "商品标题不能为空！";
		    			title.focus();
		    		}else if ($.trim(brandName.val()) == ""){
		    			msg = "品牌名称不能为空！";
		    			brandName.focus();
		    		}else if ($.trim(price.val()) == ""){
		    			msg = "价格不能为空！";
		    			price.focus();
		    		}else if (isNaN($.trim(price.val()))){
		    			msg = "价格格式不正确！";
		    			price.focus();
		    		}else if ($.trim(favorablePrice.val()) == ""){
		    			msg = "优惠价格不能为空！";
		    			favorablePrice.focus();
		    		}else if (isNaN($.trim(favorablePrice.val()))){
		    			msg = "优惠价格格式不正确！";
		    			favorablePrice.focus();
		    		}else if ($.trim(groundingDate.val()) == ""){
		    			msg = "上架日期不能为空！";
		    			groundingDate.focus();
		    		}else if ($.trim(storage.val()) == ""){
		    			msg = "库存不能为空！";
		    			storage.focus();
		    		}else if (isNaN($.trim(storage.val()))){
		    			msg = "库存格式不正确！";
		    			storage.focus();
		    		}else if ($.trim(pic.val()) == ""){
		    			msg = "请选择要上传的商品封面！";
		    		}else if ($.trim(desc) == ""){
		    			msg = "商品描述不能为空！";
		    		}
		    		
		    		if (msg != ""){
		    			alert(msg);
		    			return false;
		    		}else{
		    			return true;
		    		}
		    	});
		    	
		    	/** 为返回按钮绑定点击事件 */
				$('#backid').click(function(){
					window.location.href = "${ctx}/admin/goods/goodsList";
				});
    	 	});
		</script>

  </head>
  
  <body>
    <table class="table table-bordered table-hover definewidth m10">
		    <form id="addGoodsForm" action="${ctxurl}/admin/goods/addGoods" method="POST" class="definewidth m20">
		        <tr>
		        	<td width="10%" class="tableleft">商品类型</td>
		            <td>
		            	<select id="goodsTypeSelect" name="goodsType.code">
		            		<option>请选择商品类型</option>
		            		<#if goodstypeList??>
		            		<#list goodstypeList as goodstype>
		            			<option value="${goodstype.code}">${goodstype.name}</option>
		            		</#list>
		            		</#if>
		            	</select>
		            </td>
		            
		            <td width="10%" class="tableleft">商品标题</td>
		            <td><input type="text" name="title" id="title"/></td>
		        </tr>
		        <tr>
		        	<td width="10%" class="tableleft">品牌名称</td>
		            <td><input type="text" name="brandName" id="brandName"/></td>
		            
		            <td width="10%" class="tableleft">商品价格</td>
		            <td><input type="text" name="price" id="price"/></td>
		        </tr>
		        <tr>
		        	<td width="10%" class="tableleft">优惠价格</td>
		            <td><input type="text" name="favorablePrice" id="favorablePrice"/></td>
		            
		            <td width="10%" class="tableleft">上架日期</td>
		             <td><input type="text" class="Wdate" name="groundingDate" id="groundingDate" onfocus="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd'});"/></td>
		        </tr>
		        <tr>
		            <td width="10%" class="tableleft">商品库存</td>
		            <td><input type="text" name="storage" id="storage"/></td>
		            
		            <td width="10%" class="tableleft">商品封面</td>
		            <td><input type="file" name="pic" id="pic"/></td>
		        </tr>
		        <tr>
		            <td width="10%" class="tableleft">商品描述</td>
		            <td colspan="3">
		            	<textarea name="description" id="descTextArea" rows="12" cols="200" cssStyle="width:100%;"></textarea>
		            </td>
		        </tr>
		        &nbsp;&nbsp;<button type="submit" class="btn btn-primary">保存</button>
		    </form>
	        <tr>
	            <td class="tableleft"></td>
	            <td>
	            	<form id="picForm" enctype="multipart/form-data">
	            		<input type="file" name="pic"/>
	            		<button type="submit" class="btn btn-primary" form="picForm">上传</button>
	            	</form>
	            	
	            	
	                &nbsp;&nbsp;<button type="button" class="btn btn-success" name="backid" id="backid">返回</button>
	            </td>
	        </tr>
		</table>
  </body>
</html>
