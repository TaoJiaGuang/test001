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
	<link rel="stylesheet" href="${pageContext.request.contextPath }/source/css/layui.css" media="all"/>  
	<link rel="stylesheet" href="${pageContext.request.contextPath }/source/css/bootstrap.css" />	
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
	margin-top: 5%;
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
	border-radius:0px;
}
.item dis-input{
	 disabled:disabled;
}
.item textarea {	
	min-height: 160px;
	max-height: 160px;
	min-width: 87%;
	max-width:87%;
	display: inline-block;
	border-radius:5px;
}
.image {
	float: left;
	width: 40%;
	text-align: center;
	height:100%;
}
.image img{
	margin:20px;
	width:230px; 
	height:230px;
	border:1px #CCC solid;
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
	<form id="form" action="##" method="post" enctype="multipart/form-data"  style="width: 800px; height: 380px;" >
	<div class="image">
		<div class="item">
			<canvas id="cvs" width="230" height="230" style="border:1px #CCC solid; margin:15px 0;"></canvas>
			<img id="image" alt="" src="" width="230" height="230" style="position:absolute;margin:15px -28.99%;">			
			<div class="item"></div>
			<span class="upload">上传图片<input type="file" class="upload_pic" id="upload" name="file"/></span>
		</div>
	</div>
	<div class="data">
		<input type="hidden" name="supply_id" id="supply_id">
		<div class="item">
			<label>名称</label>
			<input type="text" name="supply_name" id="supply_name" style="width:80%;">			
		</div>
		<div class="item">
			<label >类型</label>
			<select id="supply_type" name="supply_type" style="width:81%;">
				<option value="">请选择</option>
			</select>
		</div>		
		<div class="item">
			<label >价格</label>
			<input type="text" name="supply_price" id="supply_price" style="width:96px;">
			<label >库存</label>
			<input type="text" name="supply_surplus" id="supply_surplus" style="width:96px;">
			<label >销量</label>
			<input type="text" name="supply_sales" id="supply_sales" style="width:96px;" readonly="readonly">
		</div>
		<div class="item">
			<label>长期合作</label>
			<select id="supply_cooperation" name="supply_cooperation" style="width:11%;">
				<option value="true">是</option>
				<option value="false">否</option>
			</select>
			<label>联系电话</label>
			<input type="text" name="supply_telphone" id="supply_telphone" style="width:49%">
		</div>
		<div class="item">			
			<textarea name="supply_text" id="supply_text" placeholder="请输入介绍内容"></textarea>
		</div>
	</div>
</form>
	<hr>
	<script type="text/javascript" src="${pageContext.request.contextPath }/source/layui/layui.all.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/source/js/jquery-1.11.3.min.js"></script>
	<script>	
		function update(index){
			var form = document.getElementById("form");
			// 用表单来初始化
			 $.ajax({
				  type : "POST",
					url : '${pageContext.request.contextPath }/supply/update',
					data :new FormData	($('#form')[0]),
					processData: false,
	                contentType: false,
	                cache: false,
					dataType : 'json',
					success : function(data) {
						 console.log(data);
						var index = parent.layer.getFrameIndex(window.name);
					    if (data) {
					    	
					    	
					       layui.use('layer',function(){
					    	   var layer = layui.layer;
					    	   layer.msg("修改成功",{icon:1,time:3000},function(){
					    		   parent.layer.close(index);
					    		   window.location.Reload(index);					    		   
					    	   })
					       })
					        
					    } else{
					        layui.use('layer',function(){
						    	   var layer = layui.layer;
						    	   layer.msg("修改失败",{icon:2,time:3000},function(){
						    		   parent.layer.close(index);
						    	   });
						       })
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