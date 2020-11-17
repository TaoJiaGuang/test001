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
	margin: 5px 0 0 0;
	padding: 0px;
}

.main {
	width: 70%;
	margin: 0 15%;
	border: 1px #CCC solid;
	border-top: none;
	border-bottom: none;
	min-height: 820px;
}

.title {
	padding:0px;
	margin:0px 5%;
}

.content {
	
	padding: 10px;
	
}

.content h2 {
	text-align:center;
}

.label {
	margin:0;
	padding:0 10px 0 0;
	display: inline-block;
	height: 40px;
	line-height: 40px;
	font-size: 16px;
	color: #000;
	opacity: 0.5;
	float: left;
}

.p {
	margin:0;
	padding: 0;
	display: inline-block;
	height: 40px;
	font-size:15px;
	line-height: 40px;
	color: red;
}

.layui-btn {
	background: green;
}

textarea {
	border:1px #CCC solid;
	max-width:90%;
	min-width:80%;
	max-height: 250px;
	min-height:250px;
	font-size:16px;
	text-indent: 32px;
	line-height:25px;
	padding:10px;
}

.img {
	width: 400px;
	height: 400px;
	border: 5px #CCC solid;
}
h3{
	height:45px;
	line-height:45px;
	text-align:center;
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
				<div class="" style="height:60px;display: inline-block;float:left;">
					<h1 style="color:green;height:60px;line-height:70px;">农商合作社+平台</h1>
				</div>				
			</div>
			<hr>	
			<h3>农副产品信息</h3>
			<div class="layui-row" style="background:#EFEFEF; min-height:550px; border:1px #CCC solid; padding:10px 0;">
				<div class="layui-col-md5 image">
					<div class="part1" style="text-align: center; margin-top:12%; height:380px;">
						<img class="img" src="${pageContext.request.contextPath }/source/images/supply/${supply.supply_image}" >
					</div>					
				</div>
				<div class="layui-col-md7 content">
					<div class="layui-row">
						<h2>${supply.supply_name }</h2>					
					</div>
					<div class="layui-row">
						<div class="layui-col-md6">
							<label class="label">发布日期</label>
							<p class="p" style="color:#CCC;"><fmt:formatDate value='${supply.supply_date }' pattern='yyyy-MM-dd'/></p>
						</div>
						<div class="layui-col-md6">
							<label class="label">农产品类型</label>
							<p class="p" style="color:#CCC;">${supply.supply_type }</p>
						</div>
					</div>
					<div class="layui-row content-row">
						<div class="layui-col-md3">
							<label class="label">价格</label>
							<p class="p">${supply.supply_price }</p>
							<c:if test="${supply.supply_type == '水果'}">&nbsp;元/&nbsp;公斤</c:if>
							<c:if test="${supply.supply_type == '茶叶'}">&nbsp;元/&nbsp;公斤</c:if>
							<c:if test="${supply.supply_type == '蔬菜'}">&nbsp;元/&nbsp;公斤</c:if>
							<c:if test="${supply.supply_type == '禾谷'}">&nbsp;元/&nbsp;公斤</c:if>
							<c:if test="${supply.supply_type == '薯类'}">&nbsp;元/&nbsp;公斤</c:if>
							<c:if test="${supply.supply_type == '树种'}">&nbsp;元/&nbsp;株</c:if>
							<c:if test="${supply.supply_type == '牲畜'}">&nbsp;元/&nbsp;只</c:if>
							<c:if test="${supply.supply_type == '蛋类'}">&nbsp;元/&nbsp;个</c:if>
						</div>
						<div class="layui-col-md3">
							<label class="label">总销量</label>
							<p class="p">${supply.supply_sales }</p>	
							<c:if test="${supply.supply_type == '水果'}">&nbsp;&nbsp;公斤</c:if>
							<c:if test="${supply.supply_type == '茶叶'}">&nbsp;&nbsp;公斤</c:if>
							<c:if test="${supply.supply_type == '蔬菜'}">&nbsp;&nbsp;公斤</c:if>
							<c:if test="${supply.supply_type == '禾谷'}">&nbsp;&nbsp;公斤</c:if>
							<c:if test="${supply.supply_type == '薯类'}">&nbsp;&nbsp;公斤</c:if>
							<c:if test="${supply.supply_type == '树种'}">&nbsp;&nbsp;株</c:if>
							<c:if test="${supply.supply_type == '牲畜'}">&nbsp;&nbsp;只</c:if>
							<c:if test="${supply.supply_type == '蛋类'}">&nbsp;&nbsp;个</c:if>						
						</div>
						<div class="layui-col-md3">
							<label class="label">库存</label>
							<p class="p">${supply.supply_surplus }</p>
							<c:if test="${supply.supply_type == '水果'}">&nbsp;&nbsp;公斤</c:if>
							<c:if test="${supply.supply_type == '茶叶'}">&nbsp;&nbsp;公斤</c:if>
							<c:if test="${supply.supply_type == '蔬菜'}">&nbsp;&nbsp;公斤</c:if>
							<c:if test="${supply.supply_type == '禾谷'}">&nbsp;&nbsp;公斤</c:if>
							<c:if test="${supply.supply_type == '薯类'}">&nbsp;&nbsp;公斤</c:if>
							<c:if test="${supply.supply_type == '树种'}">&nbsp;&nbsp;株</c:if>
							<c:if test="${supply.supply_type == '牲畜'}">&nbsp;&nbsp;只</c:if>
							<c:if test="${supply.supply_type == '蛋类'}">&nbsp;&nbsp;个</c:if>
						</div>						
					</div>
					<div class="layui-row">
						<label class="label" style="width:100%;">详细介绍</label>
						<textarea readonly="readonly">${supply.supply_text}</textarea>			
					</div>
					<div class="layui-row" style="margin-top:10px;">
						<label class="label" style="float:left; height:30px; line-height:30px;color:black;">数量</label>
						<button onclick="subc()" class="layui-btn layui-btn-sm" style="float:left; width:30px;">-</button>
						<input type="text" disabled="disabled" value="1" name="order_count" id="count" style="text-align:center;width:50px; height:26px; line-height:30px;float:left;margin:0 5px;">
						<button onclick="addc()"  id="sub" class="layui-btn layui-btn-sm" style="float:left; width:30px;">+</button>
					</div>
					<div class="layui-row" style="margin:2% 1%;">
						<c:if test="${sessionScope.user.user_type == '客户'}">
							<button class="layui-btn" id="addcart">加入购物车</button>
						</c:if>
						<button class="layui-btn" id="buy">购买</button>
						<c:if test="${sessionScope.user.user_type == '商户'}">
							<button class="layui-btn" onclick="addContract()">合同签订</button>
						</c:if>
						<button class="layui-btn" onclick="contract()"><i class="layui-icon">&#xe606;</i>联系农户</button>						
					</div>					
				</div>
			</div>
			<hr style="margin:0;padding:0px;">
			<div class="layui-row" style="text-align:center;padding-bottom:30px;">
						<h3>农户信息</h3>
						<div class="layui-row">
							<div class="layui-col-md4" style="border:1px #CCC solid;text-align:center;">
								<label  class="label" style="padding:0 10px; background:#CFCFCF;border-radius:0;">农户名称</label>
								<p class="p" style="color:#000;">${supply.user_name }</p>
							</div>
							<div class="layui-col-md4" style="border:1px #CCC solid;text-align:center;">
								<label  class="label" style="padding:0 10px; background:#CFCFCF;border-radius:0;">联系电话</label>
								<p class="p" style="color:#000;">${supply.supply_telphone }</p>
							</div>
							<div class="layui-col-md4" style="border:1px #CCC solid;text-align:center;">
							<label  class="label" style="padding:0 10px; background:#CFCFCF;border-radius:0;">联系地址</label>
							<p class="p" style="color:#000;">${supply.supply_address }</p>
						</div>		
						</div>						
			</div>
		</div>
		<jsp:include page="/JSP/footer.jsp"></jsp:include>
	<script type="text/javascript" src="${pageContext.request.contextPath }/source/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/source/layui/layui.all.js" ></script>
	<script>
	layui.use('layer',function(){
		var layer = layui.layer;
		$(".layui-layer-ico").attr("value","关闭");
		  var supply_id = '${supply.supply_id}';
		  var supply_name = '${supply.supply_name }';
		  var supply_price = '${supply.supply_price}';		
		  var fuser_name = '${supply.user_name}'
		  var buser_name = '${sessionScope.user.user_name}';
		  var telphone = '${sessionScope.user.telphone}';
		  var address = '${sessionScope.user.address}';
		  $("#buy").click(function(){
			  if(buser_name == null || buser_name == ""){
				  layer.msg("请先登录系统！");
			  }else{
			  layer.open({
				  type: 2, 
				  title:['确认订单','background:green;text-align:center;font-size:large;color:#FFF;'],				  
				  area: ['500px','400px'],
				  content: '${pageContext.request.contextPath }/JSP/Order/addorder.jsp',
				  closeBtn: 1,
				  scrollBar: false,
				  btn:'支付',
				  yes: function(index, layero){
					  layer.msg("<i class='layui-icon'>&#xe63d;</i>支付中请稍等",{time:2000},function(){
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
					  var body = layer.getChildFrame('body', index); //通过该对象可以获取iframe中的dom元素
					  console.log(body);
					  var count = document.getElementById("count").value;
					  console.log(count);
					  body.find("#supply_id").val(supply_id);
					  body.find("#supply_name").val(supply_name);
					  body.find("#supply_price").val(supply_price);
					  body.find("#fuser_name").val(fuser_name);
					  body.find("#buser_name").val(buser_name);					 
					  body.find("#order_count").val(count);
					  body.find("#order_telphone").val(telphone);
					  body.find("#order_address").val(address);
					  body.find("#order_total").val((count*supply_price).toFixed(2));					  
				  }				  
				});
			  }
		  }); 
		  $("#addcart").click(function(){
			  console.log("addcart");
			  var count = document.getElementById("count").value;
			  console.log(count+supply_id+buser_name);
			  $.ajax({
				  type:'post',
				  url: '${pageContext.request.contextPath }/order/addcart',
				  dataType: 'json',
				  data:{cart_count:count,user_name:buser_name,supply_id:supply_id},
				  success:function(data){
					  console.log(data);
					  if(data>=1){
						  layui.use('layer',function(){
								var layer = layui.layer;
								layer.msg("已加入购物车",{icon:1,time:3000});
							});
					  }
				  }
			  })
		  })
		
	});		  
	</script>
	<script>
		function addc(){
			var count = parseInt(document.getElementById("count").value);
			var cinput = document.getElementById("count");
			var surplus = ${supply.supply_surplus }
			if(count >= surplus){				
					layui.use('layer',function(){
						var layer = layui.layer;
						layer.msg("没有更多了！");
					});
			}else{
				count += 1;
			}			
			console.log(count);
			cinput.value = count;
		}
		function subc(){
			var count = parseInt(document.getElementById("count").value);
			var cinput = document.getElementById("count");
			if(count <= 1){
				layui.use('layer',function(){
					var layer = layui.layer;
					layer.msg("不能再减了！");
				});
			}else{
				count -= 1;
			}		
			console.log(count);
			cinput.value = count;
		}
	
	</script>
	<script>
		function contract(){
			var fuser_name = '${supply.user_name}';
			var buser_name = '${sessionScope.user.user_name}';			
			layui.use('layer',function(){
				var layer =  layui.layer;
				 if(buser_name == null || buser_name == ""){
					  layer.msg("请先登录系统！");
				  }else{
				layer.open({
					type:2,
					title:'联系农户',
					content: '${pageContext.request.contextPath }/JSP/contract.jsp',
					area:['556px','560px'],
					btn:'发送',
					scrollbar: true,
					yes:function(index, layero){
						var body = layer.getChildFrame('body', index);
						var w = $(layero).find("iframe")[0].contentWindow;
						w.send(index,fuser_name);
					},
					success:function(layero, index){
						$.ajax({
							type: 'post',
							url: '${pageContext.request.contextPath }/getmsg',
							data:{fuser_name:fuser_name,buser_name:buser_name},
							dataType: 'json',
							success:function(data){
								console.log(data);
								var body = layer.getChildFrame('body', index);
								body.find("#message").empty();
								for(var i = 0; i < data.length; i++){	
									var date = getDate("yyyy-mm-dd",data[i].msgdate);
									var str = "";
									if(data[i].whosend == buser_name){
										str += "<div class='layui-row'>";
										str += "<img alt='头像呢' src='${pageContext.request.contextPath }/source/images/head/"+data[i].bhead_image+"' class='image-left'>";
										str += "<p class='pleft'>"+data[i].message+"</p>";
										str += "<label class='label-left'>"+date+"</label>";
										str += "</div>";
									}else if(data[i].whosend == fuser_name){
										str += "<div class='layui-row'>";
										str += "<img alt='头像呢' src='${pageContext.request.contextPath }/source/images/head/"+data[i].fhead_image+"' class='image-right'>";
										str += "<p class='pright'>"+data[i].message+"</p>";										
										str += "<label class='label-right'>"+date+"</label>";
										str += "</div>";
									}
									body.find("#message").append(str);
								}
							}
						})
					},
					
				})
				  }
			})
		}
	</script>
	<script>
		function addContract(){
			console.log("yser");
			layui.use('layer',function(){
				var layer =  layui.layer;
				layer.open({
					type:2,
					title:'合同签订',
					content: '${pageContext.request.contextPath }/JSP/contract/addC.jsp',
					area:['450px','620px'],
					btn:'确认',
					yes:function(index,layero){
						var body = layer.getChildFrame('body', index);
						var w = $(layero).find("iframe")[0].contentWindow;
						w.submit(index);
					},
					success:function(layero,index){							
						 var body = layer.getChildFrame('body', index); //通过该对象可以获取iframe中的dom元素
						  console.log(body);
						  var supply_id = '${supply.supply_id}';
						  var supply_name = '${supply.supply_name }';
						  var supply_price = '${supply.supply_price}';		
						  var fuser_name = '${supply.user_name}'
						  var buser_name = '${sessionScope.user.user_name}';
						  var cdate = getDate("yyyy-mm-dd",new Date());
						  console.log(count);
						  body.find("#supply_id").val(supply_id);
						  body.find("#supply_name").val(supply_name);
						  body.find("#fuser_name").val(fuser_name);
						  body.find("#buser_name").val(buser_name);					 
						  body.find("#fuser_name1").val(fuser_name);
						  body.find("#buser_name1").val(buser_name);	
						  body.find("#cdate").val(cdate);
					}
					
				})
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
	   	    oTime = oYear +'年'+ getzf(oMonth) +'月'+ getzf(oDay) +'日';//最后拼接时间
	    }else if(format == 'yyyy/mm/dd'){
	    	oTime = oYear +'/'+ getzf(oMonth) +'/'+ getzf(oDay) +' '+ getzf(oHour) +':'+ getzf(oMin) +':'+getzf(oSec);//最后拼接时间
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
</body>
</html>