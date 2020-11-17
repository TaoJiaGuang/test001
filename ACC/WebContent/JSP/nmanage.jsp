<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>需求管理</title>
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
	min-height:850px;
	border:1px #CCC solid;
}
.items{
	text-align:center;
	/* border:1px #CCC solid; */
}
.item,.item-first{
	width: 16.4%;
	height: 340px;
	border: 1px #CCC solid;
	float: left;
	margin: 1px;
	text-align: center;
}
.item:hover{
	border:1px green solid;
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
.layui-btn{
	background: green;	
	
}
.message {
	margin: 10px 0;
}
.message label{
	font-size:16px;
}
.add-button{
	background:#FFF;
	width:100%;
	height:100%;
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
					<h2 style="color:green;height:60px;line-height:60px;display: inline-block;">需求信息管理</h2>
				</div>				
			</div>
			<div class="layui-row items">
				<div class="item-first">
					<button class="add-button" onclick="add()">
						<i class="layui-icon" style="font-size:150px;color:#CCC; padding:0;margin:0; opacity:0.5;">&#xe654;</i>
					</button>
				</div>
				<c:forEach items="${needs }" var="need">
					<div class="item item${need.need_id }">
					<div class="image">
						<img alt="图片丢了" src="${pageContext.request.contextPath }/source/images/need/${need.need_image}" width="200px" height="200px">
					</div>
					<div class="message">
						<label>${need.need_name}</label>
					</div>
					<div class="button">
						<button class="layui-btn" onclick="detail(${need.need_id })">详情</button>
						<button class="layui-btn" onclick="update(${need.need_id })">修改</button>
						<button class="layui-btn" onclick="del(${need.need_id })">删除</button>
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
					  area: ['800px','640px'],
					  content: '${pageContext.request.contextPath }/JSP/Need/addneed.jsp',
					  success: function(layero, index){
						    console.log(layero, index);
						    var body = layer.getChildFrame('body', index);
						    var form = body.find("#form");
						    var select = body.find("#need_type");
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
								  layer.msg("增加成功！",{icon:1,time:2000},function(){
									  window.location.href = "${pageContext.request.contextPath }/need/management?user_name=${sessionScope.user.user_name}"
								  });								  
							  }else{
								  layer.msg("增加失败！");
							  }							  
						  },
					  btn:'增加',
					  closeBtn:1,			 
					  shade:0.5,
					  shadeClose:false,
					  yes:function (index,layero){						 
						  var body = layer.getChildFrame('body',index);//通过该对象可以获取iframe中的dom元素
						  var w = $(layero).find("iframe")[0].contentWindow;//通过该对象可以获取iframe中的变量，调用iframe中的方法
						  w.add(index); //调用iframe中的方法
						 
					  },cancel:function(index){
						  layer.close(index);
					  }
					 
				  });
				}); 	
		}
		function update(id){
			console.log(id);
			layui.use('layer', function(){
				var layer = layui.layer;
				layer.open({
					  type: 2,
					  title: ['修改农产品','font-size:18px;color:#FFF;background:green;opacity:0.5;text-align:center;height:50px;line-height:50px;'],
					  area: ['800px','580px'],
					  content: '${pageContext.request.contextPath }/JSP/Need/uddneed.jsp',
					  btn: '确认修改',
					  yes:function(index,layero){
						  var body = layer.getChildFrame('body', index); 
						  var w = $(layero).find("iframe")[0].contentWindow;
						  w.update(index); 
					  },
					  closeBtn:1,
					  shade:0.5,
					  cancel:function(index,layero){
						  layer.msg("取消修改！")
						  layer.close(index);
					  },
					  success:function(layero,index){
						  $.ajax({
								type:'post',
								url:'${pageContext.request.contextPath }/supply/getsort',
								datatype:'json',
								success:function(data){
									var body = layer.getChildFrame('body', index);
									var select = body.find("#need_type");
									console.log(data);
									for(var i = 0; i < data.length; i++){
										var str = "";
										str += "<option value='"+data[i].sort_name+"'>"+data[i].sort_name+"</option>";
										select.append(str);										
									}									
									
								}
								
							});
						  $.ajax({
								type:'post',
								url:"${pageContext.request.contextPath }/need/findbynid",
								datatype:'json',
								data:{need_id:id},
								success:function(data){
									console.log(data);
									
									 var body = layer.getChildFrame('body', index);									 
									 body.find("#need_name").val(data.need_name);
									 body.find("#need_id").val(data.need_id);									 
									 if(data.need_coor){		
										 console.log("1");
										 	body.find("#need_coor").find("option:first").attr("selected",true);
										 	
									}else{
										 console.log("0");
										 body.find("#need_coor").find("option:last").attr("selected",true);
									 }
																			 
									 body.find("#need_date").val(getDate("yyyy-mm-dd",data.need_date));
									 body.find("#need_price").val(data.need_price);
									 body.find("#need_type").val(data.need_type);
									 body.find("#need_address").val(data.need_address);
									 body.find("#need_content").val(data.need_content);
									 body.find("#need_telphone").val(data.need_telphone);
									 body.find("#image").attr("src","${pageContext.request.contextPath }/source/images/need/"+data.need_image);
									 
								}
							});
						  },end:function(){
							  var status = $("#status").val();
							  console.log(status);
							  if(status){
								  layer.msg("修改成功！",{icon:1,time:2000},function(){
									  window.location.href = "${pageContext.request.contextPath }/need/management?user_name=${sessionScope.user.user_name}"
								  });								  
							  }else{
								  layer.msg("修改失败！");
							  }							  
						  }
						  
					  });
			});
		}
		function detail(id){
			console.log(id);
			layui.use('layer', function(){
				var layer = layui.layer;
				layer.open({
					  type: 2,
					  title: ['农产品详情','font-size:18px;color:#FFF;background:green;opacity:0.5;text-align:center;height:50px;line-height:50px;'],
					  area: ['800px','540px'],
					  content: '${pageContext.request.contextPath }/JSP/Need/uddneed.jsp',
					  shade:0.5,	
					  closeBtn:1,			
					  success:function(layero,index){
						  $.ajax({
								type:'post',
								url:'${pageContext.request.contextPath }/supply/getsort',
								datatype:'json',
								success:function(data){
									var body = layer.getChildFrame('body', index);
									var select = body.find("#need_type");
									console.log(data);
									for(var i = 0; i < data.length; i++){
										var str = "";
										str += "<option value='"+data[i].sort_name+"'>"+data[i].sort_name+"</option>";
										select.append(str);										
									}									
									
								}
								
							});
						  $.ajax({
								type:'post',
								url:"${pageContext.request.contextPath }/need/findbynid",
								datatype:'json',
								data:{need_id:id},
								success:function(data){
									console.log(data);
									
									 var body = layer.getChildFrame('body', index);									 
									 body.find("#need_name").val(data.need_name);
									 body.find("#need_id").val(data.need_id);
									 if(data.need_coor){		
										 console.log("1");
										 	body.find("#need_coor").find("option:first").attr("selected",true);
										 	
									}else{
										 console.log("0");
										 body.find("#need_coor").find("option:last").attr("selected",true);
									 }							 										
									 body.find("#need_date").val(getDate("yyyy-mm-dd",data.need_date));
									 body.find("#need_price").val(data.need_price);
									 body.find("#need_type").val(data.need_type);
									 body.find("#need_address").val(data.need_address);
									 body.find("#need_content").val(data.need_content);
									 body.find("#need_telphone").val(data.need_telphone);
									 body.find("#image").attr("src","${pageContext.request.contextPath }/source/images/need/"+data.need_image);
								}
							});
					  }
				});

			});
			
		}
		function del(id){
			console.log(id);
			$.ajax({
				type: 'post',
				url: "${pageContext.request.contextPath }/need/delete",
				data: {need_id:id},
				dataType: 'json',
				success:function(data){
					console.log(data);
					if(data){
						layui.use('layer',function(){
							layer.msg("已删除！",{icon:1,time:2000},function(){
								window.location.href="${pageContext.request.contextPath }/need/management?user_name=${sessionScope.user.user_name}";
							})
						})
						$("item"+id).remove();
					}else{
						layui.use('layer',function(){
							layer.msg("删除失败！")
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
	<script>
layui.use('laypage', function(){
  var laypage = layui.laypage;
  var count = ${totalpage};
  var username = '${sessionScope.user.user_name}';
  //执行一个laypage实例
  laypage.render({
    elem: 'page' //注意，这里的 test1 是 ID，不用加 # 号
    ,theme: '#CCC'
    ,count: count  //数据总数，从服务端得到
    ,limit: 11
    ,jump:function(obj,first){
    	console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。	
    	if(!first){
    		$.ajax({
				 type : "POST",
					url : '${pageContext.request.contextPath }/need/manage/findbypage',
					data : {user_name:username,page:obj.curr},
					dataType : 'json',
					success : function(data) {
						console.log(data);
						$('.item').remove();
						for(var i = 0 ; i < data.length; i++){
							console.log(data[i].need_id);
							var str = "";
							str += "<div class='item'>";
							str += "<div class='image'>";
							str += "<img alt='图片丢了' src='${pageContext.request.contextPath }/source/images/need/"+data[i].need_image+"' width='200px' height='200px'>";
							str += "</div>";
							str += "<div class='message'>";
							str += "<label>"+data[i].need_name+"</label>";
							str += "</div>";
							str += "<div class='button'>";
							str += "<button class='layui-btn' onclick='detail("+ data[i].need_id+")'>详情</button>";
							str += "<button class='layui-btn' onclick='update("+ data[i].need_id+")'>修改</button>";
							str += "<button class='layui-btn' onclick='del("+ data[i].need_id+")'>删除</button>";
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
</body>
</html>