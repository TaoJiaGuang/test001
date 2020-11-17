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
	width: 70%;
	margin: 0 15%;
	border: 1px #CCC solid;
	border-top: none;
	border-bottom: none;
}

.img {
	width: 400px;
	height: 400px;
	border: 5px #E6E6FA solid;
}

.content {
	padding: 10px;
	width: 55%;
	margin: 3% 0;
}

.content-item {
	margin: 5px 0;
}
.content-item label{
	color:#CCC;
	font-size:16px;
}
textarea {
	margin:10px 0;
	padding:10px;
	text-indent: 28px;
	min-height: 250px;
	max-height: 250px;
	min-width: 80%;
	max-width:80%;
	line-height: 18px;	
}
.layui-btn{
	background:green;
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

.content p {
	margin:0;
	padding: 0 0 0 20px;
	display: inline-block;
	height: 30px;
	font-size:15px;
	line-height: 30px;
	color: #000;
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
		<div class="layui-row main">
			<div class="layui-row title">				
				<div class="" style="height:70px;display: inline-block;float:left;">
					<img src="${pageContext.request.contextPath }/source/images/icon/logo3.png" height="50px" style="margin:8px">
				</div>
				<div class="" style="height:60px;display: inline-block;float:left;">
					<h1 style="color:green;height:60px;line-height:70px;">农商合作社+平台</h1>
				</div>				
			</div>
			<hr>	
			
			<div class="layui-row" style="background:#EFEFEF; min-height:680px; border:1px #CCC solid; padding:10px 0;">
				<div class="layui-col-md5 image" style="margin:5% 0;">
					<div class="part1" style="text-align: center;">
						<img class="img" src="${pageContext.request.contextPath }/source/images/need/${need.need_image}" >
					</div>					
				</div>
				<div class="layui-col-md7 content">
					<div class="layui-row content-item">
						<label>需求产品</label>
						<p>${need.need_name}</p>
					</div>
					<div class="layui-row content-item">
						<label>需求类型</label>
						<p>${need.need_type}</p>
					</div>
					<div class="layui-row content-item">
						<label>发布时间</label>
						<p><fmt:formatDate value='${need.need_date}' pattern='yyyy-MM-dd'/></p>
					</div>
					<div class="layui-row content-item">
						<label>收购价格</label>
						<p>${need.need_price}</p>
					</div>
					<div class="layui-row content-item">
						<label>长期合作</label>
						<p >
							<c:if test="${need.need_coor  == true}">支持长期合作</c:if>
							<c:if test="${need.need_coor == false}">暂不支持长期</c:if>
						</p>
					</div>
					<div class="layui-row content-item">
						<label>所属商家</label>
							<p>${need.user_name}</p>
					</div>
					<div class="layui-row content-item">
						<label>联系地址</label>
							<p>${need.need_address}</p>
					</div>
					<div class="layui-row content-item">
						<label>需求说明</label><br>
						<textarea readonly="readonly">${need.need_content}</textarea>
					</div>									
					<div class="layui-row content-item">
						<button class="layui-btn" onclick="contract('${need.user_name}')">联系商户</button>
					</div>
				</div>
				<hr style="margin:0;padding:0px;">
			
			</div>
		</div>
		<hr>
		<jsp:include page="/JSP/footer.jsp"></jsp:include>
	<script type="text/javascript" src="${pageContext.request.contextPath }/source/layui/layui.all.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/source/js/jquery-1.11.3.min.js"></script>
	<script>
		function contract(user_name){
			console.log(user_name);	
			var user_name1 = user_name; //联系者
			var user_name2 = '${sessionScope.user.user_name}';		//当前用户	
			if('${sessionScope.user.user_type}' == "农户"){
				console.log("1");
				var fuser_name = user_name2;
				var buser_name = user_name1;
			}else{
				var fuser_name = user_name1;
				var buser_name = user_name2;
				console.log("2");
			}			
			layui.use('layer',function(){
				var layer =  layui.layer;
				 if(buser_name == null || buser_name == ""){
					  layer.msg("请先登录系统！");
				  }else{
				layer.open({
					type:2,
					title:[user_name,"text-align:center;"],
					content: '${pageContext.request.contextPath }/JSP/contract.jsp',
					area:['556px','560px'],
					btn:'发送',
					scrollbar: true,
					yes:function(index, layero){
						var body = layer.getChildFrame('body', index);
						var w = $(layero).find("iframe")[0].contentWindow;
						w.send(index,user_name1);
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
									if(data[i].whosend == user_name2){
										str += "<div class='layui-row'>";
										if(data[i].whosend == data[i].fuser_name){
											console.log("农户！");
											str += "<img alt='头像呢' src='${pageContext.request.contextPath }/source/images/head/"+data[i].fhead_image+"' class='image-left'>";
										}else{
											console.log("客商！");
											str += "<img alt='头像呢' src='${pageContext.request.contextPath }/source/images/head/"+data[i].bhead_image+"' class='image-left'>";
										}
										
										str += "<p class='pleft'>"+data[i].message+"</p>";
										str += "<label class='label-left'>"+date+"</label>";
										str += "</div>";
									}else{
										str += "<div class='layui-row'>";	
										if(data[i].whosend == data[i].fuser_name){
											console.log("农户！");
											str += "<img alt='头像呢' src='${pageContext.request.contextPath }/source/images/head/"+data[i].fhead_image+"' class='image-right'>";
										}else{
											console.log("客商！");
											str += "<img alt='头像呢' src='${pageContext.request.contextPath }/source/images/head/"+data[i].bhead_image+"' class='image-right'>";
										}										
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