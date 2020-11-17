<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	 <link rel="Shortcut Icon" href="${pageContext.request.contextPath }/source/images/icon/logo3.ico" type="image/x-icon" />
	 <link rel="stylesheet" href="${pageContext.request.contextPath }/source/layui/css/layui.css"/> 
<style>
hr {
	margin: 0px;
	padding: 0px;
}
.supply{
	height:30px;
	width:100%;
	display:inline;
}
.supply input{
	height:30px;
	border:none;
	font-size:large;
}
.supply_name{	
	width:60%;
	margin-left:10%;
}
.supply_pc{
	width:10%;
	margin:1%;
}
.layui-inline{
	height:38px;
	margin:0px;
	padding:0;
	width:99%;
}
.layui-inline input{
	border-top:none;
	border-left:none;
	border-right:none;
	margin:2px 0;
	width:320px;
	font-size:14px;
}
.layui-inline:last-child{
	margin-bottom:5px;
}
	

</style>
</head>
	<body>
		<hr>
		<form class="layui-from" id="form" method="post"  action="##">
		<div style="margin-top:5%;">
			<div class="">
				<input type="hidden" id="state">
 				<input type="hidden" name="supply_id" id="supply_id" class="layui-input">
 			</div>
 			<div class="">
				<input type="hidden" name="fuser_name" id="fuser_name" class="layui-input">
 			</div>
			<div class="supply">
				<input type="text" name="supply_name" id="supply_name" class="lay-ignore supply_name">
				<input type="text" name="supply_price" id="supply_price" class="lay-ignore supply_pc">*
				<input type="text" name="order_count" id="order_count" class="lay-ignore supply_pc">
			</div>
 			<div class="layui-inline">
				<label class="layui-form-label">收货人</label>
				<div class="layui-input-inline" style="">
					<input type="text" name="buser_name" id="buser_name" class="layui-input">
				</div>
			</div>					
 			<div class="layui-inline">
				<label class="layui-form-label">联系电话</label>
				<div class="layui-input-inline" style="">
					<input type="text" name="order_telphone" id="order_telphone" class="layui-input">
				</div>
			</div>				
 			<div class="layui-inline">
				<label class="layui-form-label">联系地址</label>
				<div class="layui-input-inline" style="">
					<input type="text" name="order_address" id="order_address" class="layui-input">
				</div>
			</div>				
 			<div class="layui-inline" >				
				<div class="layui-input-inline" style="float:right;width:80px;">
					<input type="text" name="order_total" id="order_total" class="layui-input" style="color:red;width:80px;" readonly="readonly">
				</div>
				<label class="layui-form-label" style="float:right;">合计：</label>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">输入密码</label>
				<div class="layui-input-inline">
					<input type="password" name="password" id="password" class="layui-input">
				</div>
			</div>
		</div>
		</form><hr>
	<script type="text/javascript" src="${pageContext.request.contextPath }/source/layui/layui.all.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/source/js/jquery-1.11.3.min.js"></script>
	<script>
		function addorder(index){				       	
			 $.ajax({
				  type : "POST",
					url : '${pageContext.request.contextPath }/order/addorder',
					dataType: 'json',
					data : $("#form").serialize(),
					success : function(data) {
						 console.log(data);
						var index = parent.layer.getFrameIndex(window.name);
					    if (data == 1) {
					       	layui.use('layer',function(){
					       		var layer = layui.layer;
					       		layer.msg("支付成功！",{icon:1,timem:3000},function(){
					       			 parent.layer.close(index);	
					       			window.location.reload();
					       		});
					       	})					       				       
					    }else if(data == 0){
					    	layui.use('layer',function(){
					       		var layer = layui.layer;
					       		layer.msg("支付失败！",{icon:2,time:1000},function(){
					       			parent.layer.close(index);
					       		});					       		
					       	});				     
					       
					    }else if(data == -2){
					    	layui.use('layer',function(){
					       		var layer = layui.layer;
					       		layer.msg("支付密码错误",{icon:4,time:1000},function(){
					       			
					       		});
					    	});
					    }else if(data == -1){
					    	layui.use('layer',function(){
					       		var layer = layui.layer;
					       		layer.msg("账户余额不足",{icon:5,time:1000},function(){
					       			
					       		});
					    	});
					    }
						
					}
			  })
		}
	</script>
</body>
</html>	