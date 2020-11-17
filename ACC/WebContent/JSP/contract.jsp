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
.message{
	margin-bottom: 85px;
}
.message layui-row:last-child{
	margin-bottom: 85px;
}
.message label{
	margin:5px;
	height:30px;
	line-height:30px;
	color:#CCC;
}
.message p{	
	background: #FCFCFC;
	margin:5px;
	font-size:12px;
	border:1px #CCC solid;
	border-radius:5px;
	line-height:30px;
	max-width:300px;
	padding:0 5px;
	display:inline-block;	
}
.message .layui-row img{
	display:inline-block;
	width:30px;
	heigth:30px;
	border:1px #CCC solid;
	border-radius:5px;
	margin:5px 3px;
}
.image-left{
	float:left;
}
.image-right{
	float:right;
}
.label-left{
	float:left;
}
.label-right{
	float:right;
}
.pleft{
	float:left;
	text-align:left;
}
.pright{
	margin-left:45%;
	text-align:right;
	float:right;
}
.send{
	display:block;
	position: fixed;
	left:0px;
	bottom:0px;
	width:100%;
	margin:0px;
	padding:0px;
	height:20%;
}
.send textarea{
	min-width: 99.5%;
	max-width: 99.5%;
	margin:0 1px;
	min-height: 84px;
	max-height: 84px;
	border-radius:2px;
	margin-top:6px;
	/* opacity:0.5; */
}

</style>	
</head>
	<body style="width:537px;">
		<div class="message" id="message">
			
		</div>
		<div class="send"> 
			<textarea placeholder="请输入文字" name="message" id="msg" ></textarea>
		</div>
	<script type="text/javascript" src="${pageContext.request.contextPath }/source/layui/layui.all.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/source/js/jquery-1.11.3.min.js"></script>
	<script>
		function send(index,user_name){
			var msg = document.getElementById('msg').value;
			var curr_user_name = '${sessionScope.user.user_name}'; //当前用户
			var send_user_name = user_name; //联系者
			console.log("当前用户："+curr_user_name);
			console.log("联系者："+send_user_name);
			console.log(msg);
			if('${sessionScope.user.user_type}' == "农户"){
				console.log("1");
				var fuser_name = curr_user_name;
				var buser_name = send_user_name;
			}else{
				var fuser_name = send_user_name;
				var buser_name = curr_user_name;
				console.log("2");
			}
			var regu = "^[ ]+$";
			var re = new RegExp(regu);
			if(msg == null || msg =="" || re.test(msg)){
				layui.use('layer',function(){
					var layer = layui.layer;
					layer.msg("发送的信息不能为空");
				})
			}else{
				document.getElementById('msg').value = "";
				 $.ajax({
					type: 'post',
					url: '${pageContext.request.contextPath }/message/send',
					data:{message:msg,fuser_name:fuser_name,buser_name:buser_name,whosend:curr_user_name},
					dataType: 'json',
					success:function(data){
						console.log(data);
						if(data != null){
							var str = "";
							var date = getDate("yyyy-mm-dd",data.msgdate);
							str += "<div class='layui-row'>";
							if(data.whosend == data.fuser_name){
								console.log("农户！");
								str += "<img alt='头像呢' src='${pageContext.request.contextPath }/source/images/head/"+data.fhead_image+"' class='image-left'>";
							}else{
								console.log("客商！");
								str += "<img alt='头像呢' src='${pageContext.request.contextPath }/source/images/head/"+data.bhead_image+"' class='image-left'>";
							}
							str += "<p class='pleft'>"+data.message+"</p>";
							str += "<label class='label-left'>"+date+"</label>";
							str += "</div>";
							$("#message").append(str);
						}					
					}
				})
				
			}
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