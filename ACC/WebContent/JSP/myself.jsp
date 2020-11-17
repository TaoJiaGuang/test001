<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>个人中心</title>
	 <link rel="Shortcut Icon" href="${pageContext.request.contextPath }/source/images/icon/logo3.ico" type="image/x-icon" />
	 <link rel="stylesheet" href="${pageContext.request.contextPath }/source/layui/css/layui.css"/> 	
<style>
hr {
	margin: 0px;
	padding: 0px;
}

.main {
	width: 90%;
	margin: 0 5%;
	min-height:820px;
	background:#CCC;
}
.layui-btn{
	background:green;
}
#form{
	width:60%;
	height:450px;
	padding:10px;
	margin:0 18%;
	padding: 2% 1%;
	border:2px green solid;
}
input{
	background:#CCF;
}
.image_head {
	display: inline-block;
	width: 300px;
	height: 330px;
	text-align: center;
	padding: 10px;
	margin-left: 9%;
}

.upload_pic {
	display: block;
	width: 100%;
	height: 40px;
	position: absolute;
	left: 0;
	top: 0;
	opacity: 0;
	border-radius: 5px;
}

.upload {
	display: block;
	position: relative;
	margin-left: 0%;
	margin-top: 10%;
	width: 80%;
	height: 40px;
	line-height: 40px;
	text-align: center;
	background: green;
	display: block;
	font-size: large;
	color: #FFF;
	border-radius: 5px;
}
.layui-col-md5 img{
	width:280px;
	height:280px;
	position: absolute;
	margin:1px;
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
					<h1 style="color:green;height:60px;line-height:70px;display: inline-block; margin-right:35%;">农商合作社+平台</h1>
				</div>		
				<button class="layui-btn" style="background:red;float:right;" onclick="exit(${user.user_id})">注销</button>		
			</div>
			<h2 style="color:green;width:100%;height:60px;line-height:60px;display: inline-block;text-align:center;">修改用户信息</h2>
			<form action="##" method="post" enctype="multipart/form-data" class="layui-form" id="form" >
				<div class="layui-col-md5"
					style="border: 1px green solid; height: 450px; text-align: center;">
					<h5 style="margin:10px 0;">头像图片</h5>
					<img id="image" src="${pageContext.request.contextPath }/source/images/head/${user.headimage}">
					<canvas id="cvs" width="280px" height="280px" style="border:1px #CCC solid;"></canvas>					
					<div class="layui-col-md12 layui-input-block" style="margin-left:9%;">						
						<span class="upload">更换头像<input type="file" class="upload_pic" id="upload" name="file" /></span>
					</div>
				</div>
				<div class="layui-col-md7" style="height:350px;">		
					<div class="layui-form-item" style="margin-top:5px;">
							<label class="layui-form-label" style="width: auto;">用户名</label>
							<div class="layui-input-block">
								<input type="text" name="user_name" id="name" class="layui-input" value="${user.user_name }" readonly="readonly">
							</div>
						</div>			
						<div class="layui-form-item" style="margin-top:5px;">
							<label class="layui-form-label" style="width: auto;">用户类型</label>
							<div class="layui-input-block">
								<select disabled="disabled">									
									<c:if test="${user.user_type == '农户' }">
										<option value=""></option>
										<option value="农户" selected="selected">农户</option>
										<option value="商户">商户</option>
										<option value="客户">客户</option>
									</c:if>
									<c:if test="${user.user_type == '商户' }">
										<option value=""></option>
										<option value="农户" >农户</option>
										<option value="商户" selected="selected">商户</option>
										<option value="客户">客户</option>
									</c:if>
									<c:if test="${user.user_type == '客户' }">
										<option value=""></option>
										<option value="农户" >农户</option>
										<option value="商户" >商户</option>
										<option value="客户" selected="selected">客户</option>
									</c:if>
								</select>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label" style="width: auto;">性别</label>
							<div class="layui-input-block">
							<c:if test="${user.sex == '男' }">
								<input type="radio" name="sex" value="男" title="男" checked>
								<input type="radio" name="sex" value="女" title="女" >
							</c:if>
							<c:if test="${user.sex == '女' }">
								<input type="radio" name="sex" value="男" title="男" >
								<input type="radio" name="sex" value="女" title="女" checked>
							</c:if>
								
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label" style="width: auto;">出生日期</label>
							<div class="layui-input-block">
								<input type="text" placeholder="请输入出生日期" value="<fmt:formatDate value='${user.birthday }' type='date' pattern='yyyy-MM-dd'/>"  class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label" style="width: auto;">联系电话</label>
							<div class="layui-input-block">
								<input type="text" name="telphone" placeholder="请输入联系电话" value="${user.telphone }"  class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label" style="width: auto;">电子邮箱</label>
							<div class="layui-input-block">
								<input type="text" name="email"	placeholder="请输入电子邮箱" value="${user.email }"  class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label" style="width: auto;">联系地址</label>
							<div class="layui-input-block">
								<input type="text" name="address"	placeholder="请输入联系地址" value="${user.address }"  class="layui-input">
							</div>
						</div>
						<div class="layui-form-item" style="margin-top:8%;">
							<div class="layui-input-block" style="padding-left:70%;">
								<button class="layui-btn" onclick="update('${user.user_name}')">修改</button>								
							</div>
						</div>					
				</div>
				</form>
				
		</div>
		<hr>
		<jsp:include page="/JSP/footer.jsp"></jsp:include>
	<script type="text/javascript" src="${pageContext.request.contextPath }/source/layui/layui.all.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/source/js/jquery-1.11.3.min.js"></script>
	<script>
		function update(user_name){
			 var form = document.forms.namedItem("form");
			 var formData = new FormData(form);
			$.ajax({
				  type : "POST",
					url : '${pageContext.request.contextPath }/upuser',
					data : formData,
					dataType: 'json',
					contentType: false,
					processData: false,	               
	                cache: false,
					success : function(data) {	
						console.log(data);
					if (data) {	
						layui.use('layer',function(){
							 var layer = layui.layer;
							 layer.msg("修改资料成功！");
						 });
					} else {
						layui.use('layer',function(){
							 var layer = layui.layer;
							 layer.msg("修改资料成功！");
						 });
					}
				}
			});
			return false;
		}
		function exit(id){
			console.log(id);
			layui.use('layer',function(){
				layer.confirm('确定要注销吗', {icon: 3, title:'提示'}, function(index){
					  //do something
					  layer.close(index);					  
					  window.location.href= "${pageContext.request.contextPath }/deluser?user_id="+id; 					  
					});
			})			
		}
	</script>
	<script>
		//获取上传按钮
		var input1 = document.getElementById("upload");
		var headimage = document.getElementById("image");
		if (typeof FileReader === 'undefined') {
			//result.innerHTML = "抱歉，你的浏览器不支持 FileReader"; 
			input1.setAttribute('disabled', 'disabled');
		} else {
			input1.addEventListener('change', readFile, false);

		}

		function readFile() {
			headimage.style.visibility = "hidden";
			var file = this.files[0]; //获取上传文件列表中第一个文件
			if (!/image\/\w+/.test(file.type)) {
				//图片文件的type值为image/png或image/jpg
				alert("文件必须为图片！");
				return false;
			}
			// console.log(file);
			var reader = new FileReader(); //实例一个文件对象
			reader.readAsDataURL(file); //把上传的文件转换成url
			//当文件读取成功便可以调取上传的接口
			reader.onload = function(e) {

				var image = new Image();
				// 设置src属性 
				image.src = e.target.result;
				var max = 200;
				// 绑定load事件处理器，加载完成后执行，避免同步问题
				image.onload = function() {
					// 获取 canvas DOM 对象 
					var canvas = document.getElementById("cvs");
					// 获取 canvas的 2d 环境对象, 
					var ctx = canvas.getContext("2d");
					// canvas清屏 
					ctx.clearRect(0, 0, canvas.width, canvas.height);
					ctx.drawImage(image, 0, 0, 280, 280);

				};
			}
		};
	</script>
</body>
</html>