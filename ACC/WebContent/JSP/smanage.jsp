<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
	<title>供应管理</title>
	<link rel="Shortcut Icon" href="${pageContext.request.contextPath }/source/images/icon/logo3.ico" type="image/x-icon" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/source/layui/css/layui.css"/> 
<style>
hr {
	margin: 0px;
	padding: 0px;
}

.main {
	width: 80%;
	margin: 0 10%;
	min-height:820px;
	border:1px #CCC solid;
}

.items {
	text-align: center;
}

.item,.item1 {
	width: 16.4%;
	height: 340px;
	border: 1px #CCC solid;
	float: left;
	margin: 1px;
	text-align: center;
}

.item:hover {
	border: 1px green solid;
}

.item i:hover {
	color: #CCC;
	opacity: 0.6;
}

.item img {
	margin: 18px 0 0 0;
	border:1px #CCC solid;
	width:220px;
	height:220px;
}

.layui-btn {
	background: green;
}

.message {
	margin: 10px 0;
}
.message label{
	font-size:16px;
}
.add-button {
	background: #FFF;
	height: 340px;
	width:100%;
	border:none;
}
.add-button:hover{
	background:green;
	opacity:0.5;
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
					<h2 style="color:green;height:60px;line-height:60px;display: inline-block;">供应信息管理</h2>
				</div>				
			</div>
			<div class="layui-row items">
				<div class="item1">
					<button class="add-button" onclick="add()">
						<i class="layui-icon" style="font-size:200px;color:#CCC; padding:0;margin:0;opacity:1;">&#xe654;</i>
					</button>
				</div>
				<c:forEach items="${ supplys}" var="supply">
					<div class="item" id="item${supply.supply_id}">
					<div class="image">						
						<img alt="图片丢了" src="${pageContext.request.contextPath }/source/images/supply/${supply.supply_image}">
					</div>
					<div class="message">
						<label>${supply.supply_name}</label>
					</div>
					<div class="button">
						<button class="layui-btn" onclick="details(${supply.supply_id})">详情</button>
						<button class="layui-btn" onclick="update(${supply.supply_id})">修改</button>
						<button class="layui-btn" onclick="del(${supply.supply_id})">删除</button>						
					</div>
				</div>
				</c:forEach>				
			</div>
			<input id="status" value="" hidden="hidden">
			<div class="layui-row" style="width:100%;text-align:center;margin:10px 0;">
				<div id="page"></div>
			</div>				
		</div>
		<hr>
		<jsp:include page="/JSP/footer.jsp"></jsp:include>
		<script type="text/javascript" src="${pageContext.request.contextPath }/source/layui/layui.all.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/source/js/jquery-1.11.3.min.js"></script>
	<script>
		function add(){					
			layui.use('layer', function(){
				  var layer = layui.layer;				 
				  layer.open({
					  type: 2,
					  title: ['新增农产品','font-size:18px;color:#FFF;background:green;opacity:0.5;text-align:center;height:50px;line-height:50px;'],
					  skin: 'demo-class add',
					  area: ['800px','550px'],
					  content: '${pageContext.request.contextPath }/JSP/AddSupply.jsp',
					  success: function(layero, index){
						    console.log(layero, index);
						    var body = layer.getChildFrame('body', index);
						    var select = body.find("#supply_type");
						    console.log(select);
						    $.ajax({
								type:'post',
								url:'${pageContext.request.contextPath }/supply/getsort',
								datatype:'json',
								success:function(data){
									console.log(data);
									for(var i = 0; i < data.length; i++){
										var str = "";
										str += "<option value='"+data[i].sort_name+"'>"+data[i].sort_name+"</option>";
										select.append(str);
									}
									
								}
								
							})
						  },end:function(){
							  var status = $("#status").val();
							  console.log(status);
							  if(status){
								  layer.msg("增加成功！",function(){
									  window.location.href = "${pageContext.request.contextPath }/supply/management?user_name=${sessionScope.user.user_name}";
								  });								  
							  }else{
								  layer.msg("增加失败！");
							  }
								  
							  
						  },
					  btn:['增加','取消'],
					  closeBtn:0,			 
					  shade:0.5,
					  shadeClose:false,
					  yes:function (index,layero){
						  var body = layer.getChildFrame('body', index);//通过该对象可以获取iframe中的dom元素
						  var w = $(layero).find("iframe")[0].contentWindow;//通过该对象可以获取iframe中的变量，调用iframe中的方法
						  w.submit(index); //调用iframe中的方法
						 
					  },btn2:function(index){
						  layer.close(index);
					  }
					 
				  });
				}); 	
			
		}
		function update(id){
			layui.use('layer', function(){
				  var layer = layui.layer;		
				  var user = "${sessionScope.user.user_name}";
				  console.log(user);
				  layer.open({
					  type: 2,
					  title: ['修改农产品信息','font-size:18px;color:#FFF;background:green;opacity:0.5;text-align:center;height:50px;line-height:50px;'],
					  skin: 'demo-class add',
					  area: ['800px','500px'],
					  content: '${pageContext.request.contextPath }/JSP/Supply/UpdateSupply.jsp',
					  btn:'修改',
					  closeBtn:1,			 
					  shade:0.5,
					  shadeClose:false,
					  success:function(layero, index){
						  console.log(layero, index);
						    var body = layer.getChildFrame('body', index);
						    var select = body.find("#supply_type");		
						    $.ajax({
								type:'post',
								url:'${pageContext.request.contextPath }/supply/getsort',
								datatype:'json',
								success:function(data){
									console.log(data);
									for(var i = 0; i < data.length; i++){
										var str = "";
										str += "<option value='"+data[i].sort_name+"'>"+data[i].sort_name+"</option>";
										select.append(str);
									}
									
								}
								
							})
						    $.ajax({
						    	type:'post',
								url:'${pageContext.request.contextPath }/supply/findbysid?supply_id='+id,
								datatype:'json',
								success:function(data){
									console.log(data);									
									body.find("#supply_name").val(data.supply_name);						
									body.find("#supply_address").val(data.supply_address);
									body.find("#supply_telphone").val(data.supply_telphone);
									body.find("#supply_type").val(data.supply_type);
									if(data.supply_cooperation)
										body.find("#supply_cooperation").find("option:first").attr("selected",true);
									else
										body.find("#supply_cooperation").find("option:last").attr("selected",true);
									body.find("#supply_text").val(data.supply_text);
									body.find("#supply_sales").val(data.supply_sales);
									body.find("#supply_price").val(data.supply_price);
									body.find("#supply_surplus").val(data.supply_surplus);
									body.find("#image").attr("src","${pageContext.request.contextPath }/source/images/supply/"+data.supply_image);
									body.find("#supply_id").val(data.supply_id);
								}
						    })						    
					  },
					  cancel:function(index){
						layer.msg("取消修改",function(){
							layer.close(index);
						})  
					  },
					  yes:function (index,layero){
						  var body = layer.getChildFrame('body', index);//通过该对象可以获取iframe中的dom元素
						  var w = $(layero).find('iframe')[0].contentWindow;//通过该对象可以获取iframe中的变量，调用iframe中的方法
						  console.log(w);
						  w.update(index); //调用iframe中的方法
						  
					  }					 
				  });
				}); 		
		}
		function details(id){
			$.ajax({
				type:'post',
				url:"${pageContext.request.contextPath }/supply/findbysid",
				datatype:'json',
				data:{supply_id:id},
				success:function(data){
					console.log(data);					
					var str = "";
					str += "<div class='layui-row' id='detl'>";
					str += "<div class='pic'>";
					str += "<img src='${pageContext.request.contextPath }/source/images/supply/"+data.supply_image+"' width='310px' height='310px'>";
					str += "<label style='margin:10px;'>"+data.supply_image+"</label>";
					str += "</div>";
					str += "<div style='width:420px;float:left; margin:20px 0px;'>";
					str += "<div class='detail-item'>";
					str += "<label class='labelw'  style='letter-spaceing:15px;'>名称</label><p>"+data.supply_name+"</p>";	
					str += "<label class='labels'  style='letter-spaceing:15px;'>类型</label><p>"+data.supply_type+"</p>";			
					str += "</div>";
					str += "<div class='detail-item'>";
					var date = getDate("yyyy-mm-dd",data.supply_date);
					str += "<label class='labelw'>发布日期</label><p>"+date+"</p>";			
					str += "</div>";
					str += "<div class='detail-item'>";
					str += "<label class='labelw'  style='letter-spaceing:15px;'>销量</label><p>"+data.supply_sales+"</p>";
					str += "<label class='labels'  style='letter-spaceing:15px;'>价格</label><p>"+data.supply_price+"</p>";	
					str += "<label class='labels'  style='letter-spaceing:15px;'>库存</label><p>"+data.supply_surplus+"</p>";				
					str += "</div>"; 
					str += "<div class='detail-item'>";
					if(data.supply_cooperation == true)
						var coor = "是";
					else
						var coor = "否";
					str += "<label class='labelw'>支持长期合作</label><p>"+coor+"</p>";
					str += "<label class='label2'>联系地址</label><p>"+data.supply_address+"</p>";			
					str += "</div>";
					str += "<div class='detail-item'>";
					str += "<label class='labelw'>联系电话</label><p>"+data.supply_telphone+"</p>	";		
					str += "</div>";
					str += "<div class='detail-item'>";
					str += "<label class='labelw'>详细介绍</label>";
					str += "<textarea class='layui-textarea' style='height:130px;'>"+data.supply_text+"</textarea>";		
					str += "</div>";
					str += 	"</div>";
					str += "</div>"; 
					layui.use('layer', function(){
						  var layer = layui.layer;					 	
						  layer.open({
							  type: 1,
							  title: ['农产品详情','font-size:18px;color:#FFF;background:green;opacity:0.5;text-align:center;height:50px;line-height:50px;'],
							  skin: 'demo-class add',
							  area: ['800px','500px'],
							  content: str,
							  btn:'关闭',
							  closeBtn:0,			 
							  shade:0.5,
							  shadeClose:false,
							  yes:function (index){
								  layer.close(index);
							  }
							 
						  });
						});
				}
			})
			 		
		}
		function del(id){
			layui.use('layer',function(){
				layer.confirm('确定要删除吗', {icon: 3, title:'提示'}, function(index){
					  //do something				  
					  $.ajax({
							type:'post',
							url: '${pageContext.request.contextPath }/supply/manage/delete',
							data:{supply_id:id},
							datatype:'json',
							success:function (data){
								if(data){			
									var item = "item"+id;
									console.log(item);
									layui.use('layer', function(){
										 var layer = layui.layer;
										 $("#"+item).remove();
										  layer.msg("删除成功！",function(){
											  window.location.href = "${pageContext.request.contextPath }/supply/management?user_name=${sessionScope.user.user_name}";
										  });
										  });
											
								}else{
									layui.use('layer', function(){
										 var layer = layui.layer;
										  layer.msg("删除失败！");	});
								}
							}
						});					  
					});
			})	
			
		}
	</script>
	<script>
		var count = ${count};
		var username = '${sessionScope.user.user_name}';
		layui.use('laypage', function() {
			var laypage = layui.laypage;
			laypage.render({
				elem : 'page' ,
				theme : '#CCC',
				count : count,
				limit : 11
				,jump: function(obj, first){
				    console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。		    
				    //首次不执行
				    if(!first){
						$.ajax({
							 type : "POST",
								url : '${pageContext.request.contextPath }/supply/manage/findbypage',
								data : {user_name:username,page:obj.curr},
								dataType : 'json',
								success : function(data) {
									console.log(data);
									$('.item').remove();
									for(var i = 0 ; i < data.length; i++){
										var str = "";
										str += "<div class='item'>";
										str += "<div class='image'>";
										str += "<img alt='图片丢了' src='${pageContext.request.contextPath }/source/images/supply/"+data[i].supply_image+"' width='200px' height='200px'>";
										str += "</div>";
										str += "<div class='message'>";
										str += "<label>"+data[i].supply_name+"</label>";
										str += "</div>";
										str += "<div class='button'>";
										str += "<button class='layui-btn' onclick='details("+data[i].supply_id+")'>详情</button>";
										str += "<button class='layui-btn' onclick='update("+data[i].supply_id+")'>修改</button>";
										str += "<button class='layui-btn' onclick='del("+data[i].supply_id+")''>删除</button>";						
										str += "</div>";
										str += "</div>";										
										$('.items').append(str);
									}
									
								}
							
						})
				    }
				  }
			});
		});
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
	   	    oTime = oYear +'-'+ getzf(oMonth) +'-'+ getzf(oDay);//最后拼接时间
	    }else if(format == 'yyyy/mm/dd'){
	    	oTime = oYear +'/'+ getzf(oMonth) +'/'+ getzf(oDay);//最后拼接时间
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
<style>
.detail-item {
	height: 30px;
	line-height: 30px;
	width: 100%;
	margin: 5px;
}

.detail-item label {
	font-size: 120%;
	color: #CCC;
}

.labelw {
	width: 25%;
}

.labels {
	width: 10%;
}

.detail-item p {
	font-size: 120%;
	color: black;
}

.pic {
	width: 310px;
	float: left;
	margin: 20px;
	border: 1px #CCC solid;
	text-align: center;
}

.detl {
	width: 800px;
	height: 394px;
	border: 2px #CCC solid;
}
</style>
</html>