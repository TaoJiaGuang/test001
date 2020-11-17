<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	 <link rel="Shortcut Icon" href="${pageContext.request.contextPath }/source/images/icon/logo3.ico" type="image/x-icon" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/source/css/layui.css" media="all"/>  
	<link rel="stylesheet" href="${pageContext.request.contextPath }/source/css/bootstrap.css" />	
<style>
hr {
	margin: 0px;
	padding: 0px;
}

.main {
	width: 90%;
	min-height:760px;
	margin: 0 5%;
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
.item .image{
	height:180px; width:41.6%; float:left; margin:9px;
}
.item .image img{
	width:180px; height:180px; border:1px #CCC solid;
}
table{	
	width:100%;
	height:196px;
	margin:1px;
	border:1px #CCC solid;
}
table tr{

}
table tr td{
	height:30px;
}
</style>	
</head>
	<body>
		<jsp:include page="/JSP/head.jsp"></jsp:include>
		<hr>
		<div class="main">
			<div class="layui-row title">				
				<div class="" style="height:70px;display: inline-block;float:left;">
					<img src="${pageContext.request.contextPath }/source/images/icon/logo3.png" height="50px" style="margin:8px">
				</div>
				<div class="" style="height:70px;display: inline-block;float:left; width:90%;">
					<h1 style="color:green;height:60px;line-height:70px;display: inline-block; margin-right:32.5%;">农商合作社+平台</h1>
					<h2 style="color:green;height:60px;line-height:60px;display: inline-block;">购物车管理</h2>
				</div>				
			</div>
			<div class="layui-row items" style="margin:5px 12px; width:100%;">
				<c:forEach items="${carts }" var="cart" >
					<div class="item item${cart.cart_id }">
					<div class="image">
						<img alt="图片丢了" src="${pageContext.request.contextPath }/source/images/supply/${cart.supply.supply_image }" >
					</div>
					<div class="content">
						<table class="" border="1">
							<tr><td colspan="3" >农产品名称</td></tr>
							<tr><td colspan="3">${cart.supply.supply_name }</td></tr>
							<tr><td>单价</td><td>数量</td><td>总计</td></tr>
							<tr><td id="price${cart.cart_id }">${cart.supply.supply_price }</td>
							<td id="count${cart.cart_id }">${cart.cart_count }</td>
							<td id="total${cart.cart_id }">							
							<fmt:formatNumber type="number" value="${cart.cart_count * cart.supply.supply_price}" pattern="0.00" maxFractionDigits="2"/>
							</td></tr>
							<tr><td colspan="3" style="height:50px;border:none;">
								<button class="layui-btn layui-btn-sm" style="margin:2px;" onclick="buy(${cart.cart_id},${cart.supply.supply_id })">购买</button>
								<button class="layui-btn layui-btn-sm" style="margin:2px" onclick="sub(${cart.cart_id})">减少</button>
								<button class="layui-btn layui-btn-sm" style="margin:2px;" onclick="add(${cart.cart_id},${cart.supply.supply_surplus })">增加</button>
								<button class="layui-btn layui-btn-sm" style="margin:2px;" onclick="del(${cart.cart_id})">删除</button>
							</td></tr>
						</table>
					</div>
				</div>					
				</c:forEach>
				
				
				
				
			</div>
		</div>
		<div class="layui-row" style="text-align:center;">
			<div id="test1" style=""></div>
		</div>
		
		<hr>
		<jsp:include page="/JSP/footer.jsp"></jsp:include>
		<script type="text/javascript" src="${pageContext.request.contextPath }/source/layui/layui.all.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/source/js/jquery-1.11.3.min.js"></script>
	<script>
	
	</script>
<script>
layui.use('laypage', function(){
  var laypage = layui.laypage;  
  //执行一个laypage实例
  laypage.render({
    elem: 'test1' //注意，这里的 test1 是 ID，不用加 # 号
    ,layout: ['prev','page','next','count']
    ,theme: '#CCC'
    ,count: '${pages}' //数据总数，从服务端得到
    ,limit: 9
    ,jump:function(obj,first){
    	 if(!first){
		    	$.ajax({
			    	type : "POST",
					url : '${pageContext.request.contextPath }/order/findbycpage',								
					dataType : 'json',
					data:{user_name:'${sessionScope.user.user_name}',page:obj.curr},
					success : function(data){
						console.log(data);
						$('.items').empty();	
						for(var i = 0; i < data.length; i++){
							var str = "";
							str += "<div class='item item"+data[i].cart_id+"'>";
							str += "<div class='image'>";
							str += "<img alt='图片丢了' src='${pageContext.request.contextPath }/source/images/supply/"+data[i].supply.supply_image+"'>";
							str += "</div>";
							str += "<div class='content'>";
							str += "<table border='1'>";
							str += "<tr><td colspan='3'>农产品名称</td></tr>";
							str += "<tr><td colspan='3'>"+data[i].supply.supply_name+"</td></tr>";
							str += "<tr><td>单价</td><td id='count'>数量</td><td>总计</td></tr>";
							str += "<tr><td id='price"+data[i].cart_id+"'>"+data[i].supply.supply_price +"</td>";
							str += "<td id='count"+data[i].cart_id+"'>"+data[i].cart_count +"</td>";
							str += "<td id='total"+data[i].cart_id+"'>"
							var count = data[i].cart_count;
							var price = data[i].supply.supply_price;
							str += (count * price).toFixed(2);
							str += "</td></tr>";
							str += "<tr><td colspan='3' style='height:50px;border:none;'>";
							str += "<button class='layui-btn layui-btn-sm' style='margin:2px;' onclick='buy("+data[i].cart_id+","+data[i].supply.supply_id +")'>购买</button>";
							str += "<button class='layui-btn layui-btn-sm' style='margin:2px' onclick='sub("+data[i].cart_id+")'>减少</button>";
							str += "<button class='layui-btn layui-btn-sm' style='margin:2px;' onclick='add("+data[i].cart_id+","+data[i].supply_surplus +")'>增加</button>";
							str += "<button class='layui-btn layui-btn-sm' style='margin:2px;' onclick='del("+data[i].cart_id+")'>删除</button>";
							str += "</td></tr>";
							str += "</table>";
							str += "</div>";
							$('.items').append(str);
						}								
					}
		    	})
		    }
    }
  });
});
function add(id,surplus){
	console.log(id);
	var count = parseInt($("#count"+id).text());
	var price = parseFloat($("#price"+id).text());
	
	if(count >= surplus){				
		layui.use('layer',function(){
			var layer = layui.layer;
			layer.msg("没有更多了！");
		});
}else{
	$.ajax({
		type : "POST",
		url : '${pageContext.request.contextPath }/order/addcount',								
		dataType : 'json',
		data:{cart_id:id},
		success : function(data){
			console.log(data);
			if(data >= 1){
				count += 1;
				$("#count"+id).text(count);			
				$("#total"+id).text((count*price).toFixed(2));
			}
		}
	})
}
}
function sub(id){
	console.log(id);
	var count = parseInt($("#count"+id).text());
	var price = parseFloat($("#price"+id).text());
	if(count <= 1){				
		layui.use('layer',function(){
			var layer = layui.layer;
			layer.msg("不能再减了！");
		});
}else{
	$.ajax({
		type : "POST",
		url : '${pageContext.request.contextPath }/order/subcount',								
		dataType : 'json',
		data:{cart_id:id},
		success : function(data){
			console.log(data);
			if(data >= 1){
				count -= 1;
				$("#count"+id).text(count);			
				$("#total"+id).text((count*price).toFixed(2));
			}
		}
	})
}		
	
}
function del(id){
	console.log(id);
	$.ajax({
		type : "POST",
		url : '${pageContext.request.contextPath }/order/delcart',								
		dataType : 'json',
		data:{cart_id:id},
		success : function(data){
			console.log(data);
			if(data >= 1){
				layui.use('layer',function(){
					var layer = layui.layer;
					layer.msg("已删除",{icon:1,time:3000},function(){
						window.location.reload();
					});
				});				
			}
		}
	})
}
function buy(id,supply_id){
	console.log(id,supply_id);
	layui.use('layer',function(){
		var layer = layui.layer;
			  layer.open({
				  type: 2, 
				  title:['确认订单','background:green;text-align:center;font-size:large;color:#FFF;'],				  
				  area: ['500px','400px'],
				  content: '${pageContext.request.contextPath }/JSP/Order/addorder.jsp',
				  closeBtn: 1,
				  scrollBar: false,
				  btn:'支付',
				  yes: function(index, layero){
					  layer.msg("<i class='layui-icon'>&#xe63d;</i>支付加载中",{time:2000},function(){
						  var body = layer.getChildFrame('body',index);
						  var w = window[layero.find('iframe')[0]['name']];
						  w.addorder(index);
					  });
					 
				  },
				  cancel: function(index, layero){ 
					  if(confirm('确定要取消吗')){ //只有当点击confirm框的确定时，该层才会关闭
					    layer.close(index);
					    layer.msg("订单取消");
					  }
					  return false; 
					} ,
				  success:function(layero,index){	
					  var count = parseInt($("#count"+id).text());
						var price = parseFloat($("#price"+id).text());
					  $.ajax({
						type: 'post',
						url: '${pageContext.request.contextPath }/supply/findbysid',
						dataType: 'json',
						data: {supply_id:supply_id},
						success:function(data){
							console.log(data);	
							var supply_name = data.supply_name;
							var fuser_name = data.user_name;
							console.log(fuser_name);
							var body = layer.getChildFrame('body', index); //通过该对象可以获取iframe中的dom元素
							  console.log(body);
							  body.find("#supply_id").val(supply_id);
							  body.find("#supply_name").val(supply_name);
							  body.find("#supply_price").val(price);
							  body.find("#fuser_name").val(fuser_name);
							  body.find("#buser_name").val('${sessionScope.user.user_name}');					 
							  body.find("#order_count").val(count);
							  body.find("#order_telphone").val('${sessionScope.user.telphone}');
							  body.find("#order_address").val('${sessionScope.user.address}');
							  body.find("#order_total").val((count*price).toFixed(2));
						}
					 });
					  
				  }
				  
				});
		  }); 	
}
</script>
</body>
</html>