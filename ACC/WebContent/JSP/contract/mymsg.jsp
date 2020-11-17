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
	text-align:center;
	width: 50%;
	min-height:800px;
	margin: 0 25%;
}
.main img{
	width:50px;
	height:50px;
}
.main label{
	font-size:larger;
}
.main button{
	float:right;
	margin:0 2%;
}
</style>	
</head>
	<body>
		<jsp:include page="/JSP/head.jsp"></jsp:include>
		<hr>
		<div class="main">
			<table  class="layui-table" lay-size="sm" lay-skin="line">
				<colgroup>
				    <col width="200">
				    <col width="200">
				    <col width="200">
				 </colgroup>
				 <thead>
				 	<tr ><td colspan="3">消息列表</td></tr>
				 </thead>
				<tbody>
					<c:forEach items="${messages }" var="message">
					<tr>
					<c:if test="${message.fuser_name == sessionScope.user.user_name }">
						<td>
							<img alt="图呢" src="${pageContext.request.contextPath }/source/images/head/${message.bhead_image }">
						</td>
						<td>
							<label>${message.buser_name}</label>
						</td>
						<td>
							<button class="layui-btn layui-btn-sm" onclick="reply('${message.buser_name}')">回复</button>
						</td>	
					</c:if>
					<c:if test="${message.buser_name == sessionScope.user.user_name }">
						<td>
							<img alt="图呢" src="${pageContext.request.contextPath }/source/images/head/${message.fhead_image}">
						</td>
						<td>
							<label>${message.fuser_name}</label>
						</td>
						<td>
							<button class="layui-btn layui-btn-sm" onclick="reply('${message.fuser_name}')">回复</button>
						</td>	
					</c:if>										
					</tr>
				</c:forEach>
				</tbody>
				
				
			</table>
		</div>
		<hr>
		<jsp:include page="/JSP/footer.jsp"></jsp:include>
	<script type="text/javascript" src="${pageContext.request.contextPath }/source/layui/layui.all.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/source/js/jquery-1.11.3.min.js"></script>
	<script>
		function reply(user_name){
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