<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
	<title></title>
	 <link rel="Shortcut Icon" href="${pageContext.request.contextPath }/source/images/icon/logo3.ico" type="image/x-icon" />
	 <link rel="stylesheet" href="${pageContext.request.contextPath }/source/layui/css/layui.css"/> 
<style>
hr {
	margin: 0px;
	padding: 0px;
}

.main {
	width: 95%;
	margin: 0 2.5%;
}

.image_head {
	display: inline-block;
	width: 300px;
	height: 300px;
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
	margin-left: 10%;
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

.item {
	height: 35px;
	line-height: 30px;
	margin: 15px;
}

.item:first-child {
	height: 30px;
	line-height: 30px;
	margin-top: 10px;
}

.item:last-child {
	height: 120px;
	width: 90%;
}
textarea{
	min-width:83%;
	max-width:83%;
	min-height:180px;
	max-height:180px;
	margin:0;
}
.item:last-child label {
	font-size: 110%;
	height:30px;
	margin:0;
}
.item label {
	font-size: 110%;
}

.item input {
	height: 30px;
	margin: 5px;
	display: inline-block;
}

.image {
	float: left;
	width: 40%;
	text-align: center;
}

.data {
	width: 60%;
	height:100%;
	float: right;
}
</style>	
</head>
	<body>
	<hr>
	<form id="form" action="##" method="post" style="width:800px; height:436px; margin-bottom:3px;" >
	<div class="image">
		<canvas id="cvs" width="270" height="270" style="border:1px #CCC solid;margin:60px 25px 25px 25px;"></canvas>
			<span class="upload">上传图片<input type="file" class="upload_pic" id="upload" name="file"/></span>
	</div>
	<div class="data">
		<div class="item">
			<label style="width:92px;letter-spacing: 20px;">名称</label>
			<input type="text" name="supply_name" id="supply_name" style="width:274px;">			
		</div>
		<div class="item">
			<label style="width:92px;letter-spacing: 20px;">类型</label>
			<select id="supply_type" name="supply_type" style="width:278px;height:35px;margin-left:5px;margin-top:5px;">
				<option value="">请选择</option>
			</select>
		</div>		
		<div class="item">
			<label style="width:92px;letter-spacing: 20px;">价格</label>
			<input type="text" name="supply_price" id="supply_price" style="width:96px;height:30px;">
			<label style="width:62px;letter-spacing: 10px;margin-left:10px;">库存</label>
			<input type="text" name="supply_surplus" id="supply_surplus" style="width:96px;height:30px;">
		</div>
		<div class="item">
			<label>支持长期合作</label>
			<select id="supply_cooperation" name="supply_cooperation" style="width:260px;height:35px;margin-left:5px;margin-top:5px;">
				<option value="true">是</option>
				<option value="false">否</option>
			</select>
		</div>
		<div class="item">
			<label style="width:92px;letter-spacing: 7px;">联系地址</label>
			<input type="text" name="supply_address" id="supply_address" style="width:260px;">
		</div>
		<div class="item">
			<textarea name="supply_text" id="supply_text" placeholder="请输入内容"></textarea>
		</div>
	</div>
</form>
	<hr>
		<script type="text/javascript" src="${pageContext.request.contextPath }/source/layui/layui.all.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/source/js/jquery-1.11.3.min.js"></script>
	<script>	
		function submit(index){
			 var form = document.forms.namedItem("form");
			var formData = new FormData(form);
			 $.ajax({
				  type : "POST",
					url : '${pageContext.request.contextPath }/supply/addsupply',
					data : formData,
					dataType : 'json',
					processData: false, 
					contentType: false, 
					success : function(data) {
						 console.log(data);
						var index = parent.layer.getFrameIndex(window.name);
					    if (data) {
					        parent.$("#status").val(true);
					          parent.layer.close(index);
					    } else{
					        parent.$("#status").val(false);
					        parent.layer.close(index);
					    }
						
					}
			  })
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
					ctx.drawImage(image, 0, 0, 230, 230);

				};
			}
		};
	</script>
</body>
</html>