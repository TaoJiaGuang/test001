<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<link rel="Shortcut Icon"
	href="${pageContext.request.contextPath }/source/images/icon/logo3.ico"
	type="image/x-icon" />
	 <link rel="stylesheet" href="${pageContext.request.contextPath }/source/layui/css/layui.css"/>
<style>
hr {
	margin: 0px;
	padding: 0px;
}

.main {
	height: 800px;
	text-align: center;
}

.login {
	border: 1px #CCC solid;
	height: 60%;
	margin-top: 100px;
	background: #FFF;
}

#login {
	border: 1px #CCC solid;
	border-radius: 5px;
}

.column {
	height: 40px;
	line-height: 40px;
	border: 1px #CCC solid;
	margin-bottom: 20px;
	border-top: none;
	border-left: none;
	border-right: none;
}

.icon {
	font-size: 30px;
	float: left;
}

.frame {
	float: left;
	height: 38px;
	border: none;
}
</style>
</head>
<body onload="init()">
	<jsp:include page="/JSP/head.jsp"></jsp:include>
	<hr>
	<div class="layui-row main" style="background:url(${pageContext.request.contextPath }/source/images/ShowImages/picture3.jpg);">
		<div class="layui-col-md4 layui-col-md-offset6 login">
			<h2 style="color:green; margin:10% 0 5% 0;">账户登录</h2>
			<form method="Post" action="${pageContext.request.contextPath}/login" onsubmit="return sure();">
				<div class="layui-col-md10 layui-col-md-offset1 column">
					<i class="layui-icon icon">&#xe66f;</i>
					<input class="frame" id="username" type="text" placeholder="用户名" name="user_name">
				</div>
				<div class="layui-col-md10 layui-col-md-offset1 column">
					<i class="layui-icon icon">&#xe673;</i>
					<input class="frame" id="password" type="password" placeholder="密码" name="password">
				</div>	
				<div class="layui-col-md6 layui-col-md-offset1 column">
					<i class="layui-icon icon">&#xe672;</i>
					<input class="frame" id="rancode" type="text" placeholder="验证码">
				</div>
				<div class="layui-col-md4" style="border:1px #CCC solid; height:40px; line-height:40px;margin-left:3px;">
					<p id="code" style="width:100%; font-size:18px; letter-spacing: 10px;"></p>
				</div>	
				<div class="layui-col-md12" >
					<p id="msg" style="color:red; text-align:right;">${msg }</p>
				</div>
				<div class="layui-col-md10 layui-col-md-offset1" style="height:40px; margin-bottom:20px;">
					<input class="layui-btn" id="login" type="submit" value="登录" style="margin:5% 0; font-size:16px; letter-spacing:30px; width:100%; background:green;">
				</div>		
			</form>
		</div>
	</div>
	<hr>
	<jsp:include page="/JSP/footer.jsp"></jsp:include>
	
<script type="text/javascript" src="${pageContext.request.contextPath }/source/js/jquery-1.11.3.min.js"></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath }/source/layui/layui.all.js" ></script>
<script>
var code = document.getElementById("code");
var randcode = "";
function init(){
	var randomcode = "";
	for(var i = 0; i <= 3; i++){
	    var r = Math.floor(Math.random() * 10);
	    randomcode += r;
	}
	randcode = randomcode;
	code.innerHTML = randomcode;
}
$(document).ready(function(){
	$("#code").click(function(){
		var randomcode = "";
		for(var i = 0; i <= 3; i++){
		    var r = Math.floor(Math.random() * 10);
		    randomcode += r;
		}
		randcode = randomcode;
		code.innerHTML = randomcode;
	});
});
function sure(){
	var rancode = document.getElementById("rancode").value;
	var username = document.getElementById("username").value;
	var password = document.getElementById("password").value;
	var msg = document.getElementById("msg");
	if(username==""){
		msg.innerHTML = "请输入用户名！";
		setTimeout(function(){
			  msg.innerHTML = "";
			  },2000);		  
		return false;
	}else if(password==""){
		msg.innerHTML = "请输入密码！";
		setTimeout(function(){
			  msg.innerHTML = "";
			  },2000);	
		return false;
	}else if(rancode==""){
		msg.innerHTML = "请输入验证码！";
		setTimeout(function(){
			  msg.innerHTML = "";
			  },2000);	
		return false;
	}else if(rancode !=randcode){
		msg.innerHTML = "验证码错误！";
		setTimeout(function(){
			  msg.innerHTML = "";
			  },2000);	
		var randomcode = "";
		for(var i = 0; i <= 3; i++){
		    var r = Math.floor(Math.random() * 10);
		    randomcode += r;
		}
		randcode = randomcode;
		$(" #rancode").val("");
		code.innerHTML = randomcode;
		return false;
	}else{
		return true;
	}		
}
</script>
</body>
</html>