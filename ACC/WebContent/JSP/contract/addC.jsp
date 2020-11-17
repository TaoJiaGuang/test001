<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>合同签订</title>
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
.word {
	margin:0 auto;
	text-align:center;
	width:357px;
	height:505px;
	border:1px #000 solid;
	padding:0 30px;
}
.cid{
	color:#CCC;
	margin:10px 0;
}
.title{
	width:auto;
	height:50px;
	padding:5% 20%;
}
.title img{
	display: inline-block;
	width:30px; 
	height:30px;	
	position:relative;
	float:left;
	margin:0 auto;
}
.title h3{
	position:relative;
	height:30px;
	line-height:30px;
	display: inline-block;
	float:left;
	margin:0 auto;
}
.content{
	margin-top:1%;
	height: 250px; 
	
}
.content p{
	letter-spacing: 2px;
	font-size:12px;
	line-height:20px;
	color:#000;
	text-indent: 24px;
	text-align: left;
}
.footer{
	margin-top:50px;
	height:80px;
}

.footer label{
	padding:0 10px;
	font-size:12px;
	margin:10px;
}
.a{
	float:left;
}
.b{
	float:right;
}
em{
	text-decoration: underline;
}
em input{
	width:60px;
	border:1px #CCC solid;
	background:#FFF;
	border-top:none;
	border-left:none;
	border-right:none;
	text-align: center;
}
</style>	
</head>
	<body>
		<hr>
		<div class="main">
			<form class="layui-from" id="form1" methond="POST" action="##">
				<div class="word">
		<div class="title">
			<label><img src="${pageContext.request.contextPath }/source/images/icon/logo3.png">
			<h3>农商合作社+交易合同</h3></label>			
		</div>
		<div class="content">
			<input type="hidden" name="supply_id" id="supply_id">
			<p>本人<em><input type="text" name="buser_name" id="buser_name"></em>与
			<em><input type="text" name="fuser_name" id="fuser_name"></em>
			就以其农产品<em><input type="text" id="supply_name"></em>签订农产品交易合同，签约时限：
			<em><input type="date" style="width:120px;" name="cdate" id="currdate">至
			<input type="date" style="width:120px;" id="enddate"></em>
			,为期：<em><input type="text" name="ctime" id="ctime" ></em>个月，在此期间诚实守信，遵守规则不恶意单方面撕毁合同。不损坏合作方利益，合作共赢，互利互惠。</p>	
		</div>
		<div class="footer">
			<div class="user">
				<label class="a">甲方：<em><input type="text" id="fuser_name1"></em>(农户)</label>
				<label class="b">乙方：<em><input type="text" id="buser_name1"></em>(商户)</label>
			</div>
			<div class="date">			
				<label class="b">签订日期：<em><input type="text" id="cdate" style="width:120px;"></em></label>
			</div> 
		</div>
	</div>
		</form>
		</div>
		<hr>
	<script type="text/javascript" src="${pageContext.request.contextPath }/source/layui/layui.all.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/source/js/jquery-1.11.3.min.js"></script>
	<script>
		function submit(index){
			var fuser_name = document.getElementById("fuser_name").value;
			var buser_name = document.getElementById("buser_name").value;
			var cdate= document.getElementById("cdate").value;
			var ctime = document.getElementById("ctime").value;
			var supply_id = document.getElementById("supply_id").value;
			console.log(fuser_name,buser_name,cdate,ctime);
			 $.ajax({
				  type : "POST",
					url : '${pageContext.request.contextPath }/addContract',
					dataType: 'json',
					data : {buser_name:buser_name,fuser_name:fuser_name,cdate:cdate,ctime:ctime,supply_id:supply_id},
					success : function(data) {
						 console.log(data);
						var index = parent.layer.getFrameIndex(window.name);
					    if (data > 0) {
					       	layui.use('layer',function(){
					       		var layer = layui.layer;
					       		layer.msg("签订成功！",{icon:1,timem:3000},function(){
					       			 parent.layer.close(index);	
					       			window.location.reload();
					       		});
					       	})					       				       
					    } else{
					    	layui.use('layer',function(){
					       		var layer = layui.layer;
					       		layer.msg("签订失败！",{icon:2,time:1000},function(){
					       			parent.layer.close(index);
					       		});
					       		
					       	});				     
					       
					    }
						
					}
			  })
			
		}
	</script>
</body>
</html>