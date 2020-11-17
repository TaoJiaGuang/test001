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

.main {
	width: 100%;
	min-height:800px;
	margin: 0;
}

.layui-row label, p {
	height: 25px;
	line-height: 25px;
}

.content {
	border: 1px #CCC solid;
	border-top: none;
	border-bottom: none;
	border-right:none;
	height: 199px;
	width: 53.8%;
	float: left;
	text-align: center;
	margin:0;
}
.items{
	margin:0 25px;
}
.item {
	margin: 5px;
	border: 1px #CCC solid;
	height: 200px;
	width: 32%;
	float: left;
	background:#FCFCFC;
}
.layui-btn{
	background:green;
}
</style>	
</head>
	<body>
		<jsp:include page="/JSP/head.jsp"></jsp:include>
		<hr>
		<div class="main">
			<div class="layui-row title">				
				<div class="" style="height:70px;display: inline-block;float:left;margin-left:1%;">
					<img src="${pageContext.request.contextPath }/source/images/icon/logo3.png" height="50px" style="margin:8px">
				</div>
				<div class="" style="height:70px;display: inline-block;float:left; width:90%;">
					<h1 style="color:green;height:60px;line-height:70px;display: inline-block; margin-right:32.5%;">农商合作社+平台</h1>
					<h2 style="color:green;height:60px;line-height:60px;display: inline-block;">我的货单</h2>
				</div>				
			</div>
			<div class="layui-row items" style="margin:5px 1%; width:98%;">
				<table class="layui-table" lay-size="sm" id="ordertable" style="text-align:center;">
				<colgroup>
					<col width="100">
					<col width="100">
					<col width="150">
					<col width="40">
					<col width="100">
					<col width="200">
					<col width="200">
					<col width="80">
					<col width="90">
				</colgroup>
				<thead>
					<tr>					
						<td>订单号</td>
						<td >农产品</td>	
						<td >订单日期</td>	
						<td >总价</td>											
						<td >收货人</td>
						<td >联系电话</td>
						<td >联系地址</td>
						<td >订单状态</td>						
						<td>操作</td>
					</tr>
				</thead>
				<tbody id="tbody">		
					<c:forEach items="${items }" var="item">
						<tr id="tr${item.order_id}">				
						<td>${item.order_id }</td>
						<td>${item.supply.supply_name }</td>
						<td>							
							<p><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${item.order_date}" /></p>
						</td>
						<td>${item.order_total }</td>
						<td>${item.buser_name }</td>
						<td>${item.order_telphone}</td>
						<td>${item.order_address }</td>
						<td>
						<p id="msg${item.order_id }">
							<c:if test="${item.order_state == -1 }">
								未发货
							</c:if>
							<c:if test="${item.order_state == 0 }">
								待收货
							</c:if>
							<c:if test="${item.order_state == 1}">
								已收货
							</c:if>
						<p>
						</td>
						<td>
							<c:if test="${item.order_state == -1 }">
								<button id="btn${item.order_id}" class="layui-btn layui-btn-sm" onclick="upd(${item.order_id})">发货</button>
							</c:if>
							<c:if test="${item.order_state == 0 }">
								<button id="btn${item.order_id}" class="layui-btn layui-btn-sm">等待</button>
							</c:if>
							<c:if test="${item.order_state == 1}">
								<button id="btn${item.order_id}" class="layui-btn layui-btn-sm" onclick="del(${item.order_id})">删除</button>
							</c:if>						
						</td>
					</tr>
					</c:forEach>		
				</tbody>
				<tfoot>
					<tr><td colspan="9">
						<div id="page"></div>		
					</td></tr>	
				</tfoot>
		</table>				
			</div>
		</div>		
		<hr>
		<jsp:include page="/JSP/footer.jsp"></jsp:include>
	<script type="text/javascript" src="${pageContext.request.contextPath }/source/layui/layui.all.js"  ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/source/js/jquery-1.11.3.min.js"></script>
	<script>
		function upd(id){
			$.ajax({
				type: 'post',
				url: '${pageContext.request.contextPath }/order/fupdate',
				data:{order_id:id},
				dataType: 'json',
				success:function(data){
					console.log(data);	
					if(data >= 0){						
						layui.use('layer',function(){
							var layer = layui.layer;
							layer.msg("已发货");
							$("#msg"+id).html("待收货");
							$("#btn"+id).text("等待");
						})						
					}
				}
			})
		}
		function del(id){
			console.log(id);
			$.ajax({
				type: 'post',
				url: '${pageContext.request.contextPath }/order/fdelete',
				data:{order_id:id},
				dataType: 'json',
				success:function(data){
					if(data == 1){
						layui.use('layer',function(){
							var layer = layui.layer;
							layer.msg("已删除",{icon:1,time:1000},function(){
								window.location.reload();
							});
						})
					}else{
						layui.use('layer',function(){
							var layer = layui.layer;
							layer.msg("删除失败",{icon:2,time:1000});
						})						
					}
						
				}
			})
		}
	</script>
	<script>
	function getDate(format,str){  
		var oDate = new Date(str),  
	    oYear = oDate.getFullYear(),  
	    oMonth = oDate.getMonth()+1,  
	    oDay = oDate.getDate(),  
	    oHour = oDate.getHours(),  
	    oMin = oDate.getMinutes(),  
	    oSec = oDate.getSeconds(); 
	    if(format == 'yyyy-mm-dd'){
	   	    oTime = oYear +'-'+ getzf(oMonth) +'-'+ getzf(oDay) +' '+ getzf(oHour) +':'+ getzf(oMin) +':'+getzf(oSec);//最后拼接时间
	    }else if(format == 'yyyy/mm/dd'){
	    	oTime = oYear +'/'+ getzf(oMonth) +'/'+ getzf(oDay) +' '+ getzf(oHour) +':'+ getzf(oMin) +':'+getzf(oSec); //最后拼接时间
	    }
	    return oTime;  
	 };
	 //补0操作  
	 function getzf(num){  
	     if(parseInt(num) < 10){  
	         num = '0'+num;  
	     }  
	     return num;  
	 }
	</script>
	<script>
layui.use('laypage', function(){
  var laypage = layui.laypage;
  var count = ${count};
  console.log(count);
  //执行一个laypage实例
  laypage.render({
    elem: 'page' //注意，这里的 test1 是 ID，不用加 # 号
    ,count: count //数据总数，从服务端得到
    ,limit: 15
    ,jump:function(obj,first){    	
		var name = '${sessionScope.user.user_name}';
		 if(!first){
			 $.ajax({
					type: 'post',
					url: '${pageContext.request.contextPath }/order/findmore',
					data:{user_name:name,page:obj.curr},
					dataType: 'json',
					success:function(data){
						console.log(data);
						$("#ordertable tbody").empty();
						for(i = 0; i < data.length; i++){
							var str = "";
							str += "<tr id='tr${item.order_id}'>";
							str += "<td>"+data[i].order_id+"</td>";
							str += "<td>"+data[i].supply.supply_name+"</td>";								
							var date = getDate("yyyy-mm-dd",new Date(data[i].order_date));
							str += "<td><p>"+date+"</p></td>";	
							str += "<td>"+data[i].order_total+"</td>";
							str += "<td>"+data[i].buser_name+"</td>";
							str += "<td>"+data[i].order_telphone+"</td>";
							str += "<td>"+data[i].order_address+"</td>";
							if(data[i].order_state == -1){
								str += "<td><p id='msg"+data[i].order_id + "'>未发货</p></td>";								
							}else if(data[i].order_state == 0){
								str += "<td><p id='msg"+data[i].order_id + "'>待收货</p></td>";								
							}else if(data[i].order_state == 1){
								str += "<td><p id='msg"+data[i].order_id + "'>已完成</p></td>";								
							}
							if(data[i].order_state == -1){
								str += "<td><button id='btn"+data[i].order_id+"' class='layui-btn layui-btn-sm' onclick='upd("+data[i].order_id+")'>发货</button></td>";								
							}else if(data[i].order_state == 0){
								str += "<td><button id='btn"+data[i].order_id+"' class='layui-btn layui-btn-sm'>等待</button></td>";								
							}else if(data[i].order_state == 1){
								str += "<td><button id='btn"+data[i].order_id+"' class='layui-btn layui-btn-sm' onclick='del("+data[i].order_id+")'>删除</button></td>";								
							}							
							str += "</tr>";							
							$("#ordertable tbody").append(str);				
						
					}
					}
				});
		    }		
    }
  });
});
</script>
</body>
</html>