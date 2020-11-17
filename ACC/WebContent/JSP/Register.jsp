<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
<title>注册</title>
<link rel="Shortcut Icon" href="${pageContext.request.contextPath }/source/images/icon/logo3.ico" type="image/x-icon" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/source/layui/css/layui.css"/> 
<style>
html {height: 100%; }
body {height: 100%; }
*html .main {height:100%; background-color:#f00;}
*html body {height:100%; }
hr {
	margin: 0px;
	padding: 0px;
}
.main {
	margin:0 10%;
	width:80%;
	border:1px #CCC solid;
	min-height: 78%;
	text-align: center;
	padding-bottom:50px;
	padding-top:30px;
	background-image: linear-gradient(#4aec6c, #4ed226, #87d226);
}

.frame {
	float: left;
	height: 38px;
	margin: 20px 50px;
	width: 80%;
}

.bar {
	border: 1px #CCC solid;
	height: 5px;
	border-left: none;
	border-right: none;
}

.image_head {
	display: inline-block;
	width: 200px;
	height: 230px;
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
	margin-top: 0%;
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

#userdata {
	height: 360px;
	margin-top: 100px;
	border: 0px #CCC solid;
	visibility: hidden;
	position: absolute;
}

#next {
	background: green;
	width: 40%;
}

#apply {
	visibility: visible;
}

#success {
	height: 350px;
	margin-top: 100px;
	visibility: hidden;
	position: absolute;
}
</style>
</head>
<body>
	<jsp:include page="/JSP/head.jsp"></jsp:include>
	<hr>
	<div class="layui-row main">
		<div class="layui-col-md12" style="height:45px; display:inline-block; text-align: left;">
			<img src="${pageContext.request.contextPath }/source/images/icon/logo3.png" height="60px" style="margin:0 50px;">
			<h2 style="color:green;display: inline-block;">农商合作社+平台</h2>
			<h4 style="color:green;display: inline-block; margin-left:30px;">用户注册</h4>
		</div>				
		<div class="layui-col-md10 layui-col-md-offset1" style="height:650px; border:1px #CCC solid; margin-top:10px; background:#FFF;">
			<div class="layui-col-md4" style=" margin-top:50px;">账户申请</div>
			<div class="layui-col-md4" style=" margin-top:50px;">填写资料</div>
			<div class="layui-col-md4" style=" margin-top:50px;">注册成功</div>
			<div class="layui-col-md4 bar" id="bar1" style="background:green;"></div>
			<div class="layui-col-md4 bar" id="bar2"></div>
			<div class="layui-col-md4 bar" id="bar3"></div>
			<div class="layui-col-md6 layui-col-md-offset3" style="height:350px; margin-top:50px;" id="apply">
				<form id="form1" method="post" action="##">
					<div class="layui-col-md10 layui-col-md-offset1">
						<input class="frame" id="username" type="text" name="user_name" placeholder="用户名" onBlur="usernamejudge()">
					</div>
					<div class="layui-col-md10 layui-col-md-offset1">
						<input class="frame" id="password" type="password" name="password" placeholder="密码" onBlur="passwordjudge()">
					</div>
					<div class="layui-row">
						<div class="layui-col-md3 layui-col-md-offset2" id="tips"
							style="height: 38px; line-height: 38px; visibility: hidden;">
							<p id="tip" style="color: red; font-size: 16px;"></p>
						</div>
						<div class="layui-col-md6">
							<input type="button" class="layui-btn" id="next" onclick="register()"  value="注册">
						</div>
					</div>
				</form>
			</div>
		 	<div class="layui-col-md7 layui-col-md-offset2" id="userdata">
				<form action="##" method="post" enctype="multipart/form-data" class="layui-form" id="form2" >
				<div class="layui-col-md4"
					style="border: 1px #ccc solid; height: 350px; text-align: center;">
					<h5 style="margin:10px 0;">头像图片</h5>
					<canvas id="cvs" width="200" height="200" style="border:1px #CCC solid;"></canvas>
					<div class="layui-col-md12" style="height:30px; line-height:30px;">						
						<input type="text" name="user_name" id="name" style="color:red; text-align:center; border:none; height:30px; line-height: 30px; background:#FFF;" readonly="readonly">
					</div>
					<div class="layui-col-md12 layui-input-block" style="margin-left:9%;">						
						<span class="upload">上传头像<input type="file" class="upload_pic" id="upload" name="file" /></span>
					</div>
				</div>
				<div class="layui-col-md8" style="height:350px;">					
						<div class="layui-form-item" style="margin-top:5px;">
							<label class="layui-form-label" style="width: auto;">用户类型</label>
							<div class="layui-input-block">
								<select name="user_type">
									<option value=""></option>
									<option value="农户">农户</option>
									<option value="商户">商户</option>
									<option value="客户">客户</option>
								</select>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label" style="width: auto;">性别</label>
							<div class="layui-input-block">
								<input type="radio" name="sex" value="男" title="男" checked> <input
									type="radio" name="sex" value="女" title="女" >
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label" style="width: auto;">出生日期</label>
							<div class="layui-input-block">
								<input type="date" name="birthday" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label" style="width: auto;" name="telphone">联系电话</label>
							<div class="layui-input-block">
								<input type="text" name="telphone" placeholder="请输入联系电话"  class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label" style="width: auto;">电子邮箱</label>
							<div class="layui-input-block">
								<input type="text" name="email"	placeholder="请输入电子邮箱"  class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label" style="width: auto;">联系地址</label>
							<div class="layui-input-block">
								<input type="text" name="address"	placeholder="请输入联系地址"  class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-input-block">
								<input type="button" class="layui-btn"  onclick="update()" id="sure" style="background:green;" value="确定">
								<button type="reset" class="layui-btn layui-btn-primary">重置</button>
								<button type="button" class="layui-btn layui-btn-primary" onclick="skip()">取消</button>
							</div>
						</div>					
				</div>
				</form>
			</div>
			<div class="layui-col-md6 layui-col-md-offset3" id="success">
				<label style="margin-top:100px; font-size:18px;">
					注册成功！请<a style="color:red;" href="${pageContext.request.contextPath  }/JSP/Login.jsp">点击登录>></a>
				</label>				
			</div>
		</div>
	</div>
	<hr>
	<jsp:include page="/JSP/footer.jsp"></jsp:include>
	<script type="text/javascript" src="${pageContext.request.contextPath }/source/layui/layui.all.js" ></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath }/source/js/jquery-1.11.3.min.js"></script>
	<script>
	//判断用户名是否存在		

		function usernamejudge() {
			var username = document.getElementById("username").value;
			var password = document.getElementById("password").value;
			var tips = document.getElementById("tips"); //错误提示组
			var tip = document.getElementById("tip"); //错误提示显示信息
			var regu = "^[ ]+$";
			var re = new RegExp(regu);
			if (username != "" && !re.test(username)) {
				$.ajax({
					type : "POST",
					url : '${pageContext.request.contextPath}/findByUsername',
					data : {
						username : username
					},
					dataType : 'json',
					async : true,
					success : function(data) {
						if (data) {
							tip.innerHTML = "用户名已被占用!";
							tips.style.visibility = "visible";
							setTimeout(function() {
								tips.style.visibility = "hidden";
							}, 2000);
						}
					}
				});
			} else if (username == "") {
				tip.innerHTML = "请填写用户名！";
				tips.style.visibility = "visible";
				setTimeout(function() {
					tips.style.visibility = "hidden";
				}, 2000);
			} else if (re.test(username)) {
				tip.innerHTML = "名称中含有空格!";
				tips.style.visibility = "visible";
				setTimeout(function() {
					tips.style.visibility = "hidden";
				}, 2000);
			}
		}
		function passwordjudge() {
			var username = document.getElementById("username").value;
			var password = document.getElementById("password").value;
			var tips = document.getElementById("tips"); //错误提示组
			var tip = document.getElementById("tip"); //错误提示显示信息
			var regu = "^[ ]+$";
			var re = new RegExp(regu);
			if (password == "") {
				tip.innerHTML = "请填写密码!";
				tips.style.visibility = "visible";
				setTimeout(function() {
					tips.style.visibility = "hidden";
				}, 2000);
			} else if (re.test(password)) {
				tip.innerHTML = "填写正确的密码!";
				tips.style.visibility = "visible";
				setTimeout(function() {
					tips.style.visibility = "hidden";
				}, 2000);
			}
		}

		function register() {
			var username = document.getElementById("username").value;
			var password = document.getElementById("password").value;
			var tips = document.getElementById("tips"); //错误提示组
			var next = document.getElementById("next"); //下一步按钮
			var tip = document.getElementById("tip"); //错误提示显示信息
			var bar1 = document.getElementById("bar1"); //进度条1
			var bar2 = document.getElementById("bar2"); //进度条2
			var apply = document.getElementById("apply"); //账户申请部分
			var data = document.getElementById("data"); //资料部分
			if (username != "" && password != "") {
				$.ajax({
					type : "POST",
					url : '${pageContext.request.contextPath }/register',
					data : {user_name:username,password:password},
					dataType : 'json',
					success : function(data) {
						if (data) { 
							bar1.style.background = "white";
							bar2.style.background = "green";
							apply.style.visibility = "hidden";
							userdata.style.visibility = "visible";
							var name = document.getElementById("name");
							name.value = username;
						} else {
							tip.innerHTML = "注册失败！";
						}
					}
				});

			} else if (re.test(username)) {
				tip.innerHTML = "用户名与密码为空!";
				tips.style.visibility = "visible";
				setTimeout(function() {
					tips.style.visibility = "hidden";
				}, 2000);
			}

		}
		function update(){
			var bar2 = document.getElementById("bar2"); //进度条2
			var bar3 = document.getElementById("bar3"); //进度条3
			var userdata = document.getElementById("userdata"); //资料填写部分
			var success = document.getElementById("success"); //成功提示部分
			 var form = document.forms.namedItem("form2");
			   var formData = new FormData(form);
			$.ajax({
				  type : "POST",
					url : '${pageContext.request.contextPath }/update',
					data : formData,
					contentType: false,
					processData: false,	               
	                cache: false,
					success : function(data) {
					if (data) {			
						bar2.style.background = "white";
						bar3.style.background = "green";
						userdata.style.visibility = "hidden";
						success.style.visibility = "visible";
					} else {
						alert("修改资料失败！");
					}
				}
			});
		}
		function skip(){
			var bar2 = document.getElementById("bar2"); //进度条2
			var bar3 = document.getElementById("bar3"); //进度条3
			var userdata = document.getElementById("userdata"); //资料填写部分
			var success = document.getElementById("success"); //成功提示部分
			bar2.style.background = "white";
			bar3.style.background = "green";
			userdata.style.visibility = "hidden";
			success.style.visibility = "visible";
		}
	</script>
	
	
	<script>
		//获取上传按钮
		var input1 = document.getElementById("upload");
		if (typeof FileReader === 'undefined') {
			//result.innerHTML = "抱歉，你的浏览器不支持 FileReader"; 
			input1.setAttribute('disabled', 'disabled');
		} else {
			input1.addEventListener('change', readFile, false);

		}

		function readFile() {
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
					ctx.drawImage(image, 0, 0, 200, 200);

				};
			}
		};
	</script>
</body>
</html>