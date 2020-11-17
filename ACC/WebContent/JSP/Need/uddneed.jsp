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
	margin-left: 10%;
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
	line-height: 30px;
	margin: 10px;
}

.item label {
	
	width:60px;
	text-align:justify;
	text-align-last: justify;
}

.item input {
	
	height: 36px;
	display: inline-block;
	border-radius:5px;
}
.item dis-input{
	 disabled:disabled;
}
.item textarea {	
	height: 160px;
	width: 94%;
	display: inline-block;
	border-radius:5px;
}
.image {
	float: left;
	width: 40%;
	text-align: center;
	height:100%;
}
.data {
	width: 60%;
	height:100%;
	float: right;
}
select {
	border-radius:5px;
	font-size:12px;
	height:36px;
	line-height:30px;
	width:70%;
	color:#000;
	
}
select option{
	margin:10px;
	height:30px;
	line-height:30px;
	border-radius:5px;
	font-size:12px;
	color: green;
}
</style>	
</head>
	<body>
	<hr>
	<form id="form" action="##" method="post" enctype="multipart/form-data" style="width: 800px; height: 460px;" >
	<div class="image">
	<div class="item" style="margin-top:30px;">
			<input type="hidden" name="need_id" id="need_id" style="width:80%;text-align:center;"  readonly="readonly">			
		</div>
		<div class="item">
			<canvas id="cvs" width="230" height="230" style="border:1px #CCC solid;"></canvas>
			<img id="image" alt="" src="" width="230" height="230" style="position:absolute;margin-top:1px;left:5.6%;">			
			<div class="item"></div>
			<span class="upload">上传图片<input type="file" class="upload_pic" id="upload" name="upload"/></span>
		</div>
		
	</div>
	<div class="data">
		<div class="item">
			<label>需求产品</label>
			<input type="text" name="need_name" id="need_name" style="width:80%;">			
		</div>
		<div class="item">
			<label >需求类型</label>
			<select name="need_type" id="need_type" style="width:45%;">
				<option value="">请选择</option>
			</select>
			<label>长期合作</label>
			<select name="need_coor" id="need_coor" style="width:20%;">
				<option value="true">是</option>
				<option value="false">否</option>
			</select>
		</div>		
		<div class="item">
			<label >发布时间</label>
			<input type="text" id="need_date" style="width:80%;" readonly="readonly">
		</div>
		<div class="item">
			<label >收购价格</label>
			<input type="text" name="need_price" id="need_price" style="width:80%;">
		</div>
		<div class="item">
			<label >联系地址</label>
			<input type="text" name="need_address" id="need_address" style="width:80%;">
		</div>
		<div class="item">			
			<textarea name="need_content" id="need_content" placeholder="请输入要求内容" class="layui-textarea"></textarea>
		</div>
	</div>
</form>
	<hr>
	<script type="text/javascript" src="${pageContext.request.contextPath }/source/layui/layui.all.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/source/js/jquery-1.11.3.min.js"></script>
	<script>	
		function update(index){
			var form = document.forms.namedItem("form");
			var formData = new FormData(form);
			 $.ajax({
				  type : "POST",
					url : '${pageContext.request.contextPath }/need/update',
					data : formData,
					processData: false,
	                contentType: false,
	                cache: false,
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
		var image = document.getElementById("image");
		
		if (typeof FileReader === 'undefined') {
			//result.innerHTML = "抱歉，你的浏览器不支持 FileReader"; 
			input1.setAttribute('disabled', 'disabled');
			
		} else {
			input1.addEventListener('change', readFile, false);

		}

		function readFile() {
			image.style.visibility = "hidden";	
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