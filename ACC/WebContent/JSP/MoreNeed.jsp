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
	width: 80%;
	min-height: 820px;
	margin: 0 10%;
}

.item {
	height: auto;
	margin: 5px;
	margin: 0;
}

.li-item {
	background: green;
	opacity: 0.7;
	text-align: center;
	margin: 0;
	border-radius: 0px;
	float: left;
}

.li-item a {
	color: #FFF;
	text-decoration: none;
}

.li-item:hover {
	font-size: 120%;
	background: rgba(225, 225, 225, 0.2);
}

.pagepart {
	text-align: center;
	margin: 10px 0;
}

.product {
	border: 1px #ccc solid;
	border-radius: 2px;
	height: 340px;
	width:16.4%;
	margin:1px;
	float:left;
}

.product:hover {
	border: 1px green solid;
}
.product img{
	border:1px #CCC solid;
	margin: 5% 10%;
	height: 200px;
	width: 200px;
}
#spot {
	color: #FFF;
	font-size: 12px;
	background: #32CD32;
	border-radius: 5px;
	height:25px;
	line-height: 25px;
	float:left;
}
.content {
	height: 25px;
	line-height: 25px;
	margin:0 10%;
}
.content label{
	color:#CCC;
}
.content label p{
	color:#000;
	font-size:12px;
	
}
.content span{
	heigth: 25px;
	display: inline-block;
	line-height: 25px;
	margin-left: 6%;
}
.content span i{
	float:left;
	margin:0 1px;
}
.content span p{
	margin:0;
	padding:0;
	width:65px;
	overflow: hidden;
	white-space: nowrap;
	float:left;
}
</style>	
</head>
	<body>
		<jsp:include page="/JSP/head.jsp"></jsp:include><hr>
		<div class="main">
			<div class="layui-row search">
				<div class="layui-row" style="height:70px; margin-bottom:5px;">
				<div class="" style="height:70px;display: inline-block;float:left; margin-left:60px;">
					<img src="${pageContext.request.contextPath }/source/images/icon/logo3.png" height="60px" style="margin:8px">
				</div>
				<div class="" style="height:70px;display: inline-block;float:left;">
					<h1 style="color:green;height:70px;line-height:70px;">农商合作社+平台</h1>
				</div>
				<div class="layui-col-md6" style="height:70px;margin-left:60px;">
					<div style="margin-top:15px; height:40px; border:2px green solid; border-radius:20px; background:green;" >
						<div style="width:12%; float:left; height:36px; line-height:36px;">
							 <i class="layui-icon" style="font-size:32px; color:#FFF; padding:0 35%;margin-top:2px;display: inline-block;">&#xe615;</i>
						</div>
						<input id="searchcontent" type="text" placeholder="请输入您想要的信息" style="width:70%; height:36px; padding:0px; margin:0px; float:left;">
						<button onclick="search()" style=" font-size:19px; color:#FFF; width:17%; height:36px; padding:0px; margin:0px; float:left; border-radius:0 40px 40px 0; border:none; background:green;">搜索</button>
					</div>
				</div>
			</div>
			</div>
			<div class="layui-row menu">
				<div class="layui-col-md12">
					<ul class="layui-col-md12" style="background:green; opacity:0.9;border:1px #CCC solid; height:40px; line-height:40px;margin:0;">
					<li class="layui-btn li-item" style="margin:0px;"><a href="${pageContext.request.contextPath }/need/moreneed">全部</a></li>		
					<c:forEach items="${sorts }" var="sort">
						<li class="layui-btn li-item" style="margin:0px;">
							<a href="${pageContext.request.contextPath }/need/findbyclass?need_type=${sort.sort_name}">${sort.sort_name }</a>
						</li>	
					</c:forEach>			
				</ul>
				</div>
			</div>
			<div class="layui-row item">
				<div class="layui-col-md12 products">
				<c:forEach items="${needs }" var="need">				
					<a class="product-a" href="${pageContext.request.contextPath }/need/findbyid?need_id=${need.need_id}">
					<div class="product">
					<img src="${pageContext.request.contextPath }/source/images/need/${need.need_image }"/>
					<div class="content">
						<label>需求产品
							<p>${need.need_name }</p>
						</label>
					</div>	
					<div class="content">
						<label>发布日期
							<p><fmt:formatDate value='${need.need_date }' pattern='yyyy-MM-dd'/></p>
						</label>
					</div>	
					<div class="content">
						<label>收购价格
							<p>${need.need_price }</p>
						</label>
					</div>
					<div class="content">
						<p id="spot">
							<c:if test="${need.need_coor  == true}">支持长期合作</c:if>
							<c:if test="${need.need_coor == false}">暂不支持长期</c:if>
						</p>
						<span>
							<i class="layui-icon">&#xe715;</i>
							<p>${need.need_address }</p>						
						</span>						
					</div>				
				</div>
				</a>		
				</c:forEach>												
				</div>
			</div>
			<div class="layui-row item">
				<div class="layui-col-md12">												
				</div>
				<div class="layui-col-md12 pagepart">
					<div class="" id="page"></div>
				</div>
			</div>
		</div><hr>
		<jsp:include page="/JSP/footer.jsp"></jsp:include>
	<script type="text/javascript" src="${pageContext.request.contextPath }/source/layui/layui.all.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/source/js/jquery-1.11.3.min.js"></script>
	<script>
		layui.use('laypage', function() {
			var laypage = layui.laypage;
			var pages = ${pages};
			var searchtype = ${searchtype};
			var classkey = '${classkey}';
			//执行一个laypage实例
			laypage.render({
				elem : 'page' //注意，这里的 test1 是 ID，不用加 # 号
				,count : pages
				,limit: 12
				,groups:5
				,prev:'上一页'
				,next:'下一页'
				,layout:['skip','prev','page','next','count']
				,theme:'#CCC'
					  ,jump: function(obj, first){
						    //obj包含了当前分页的所有参数，比如：
						   
						    console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
						    console.log(obj.limit); //得到每页显示的条数
						    var curr = obj.curr;
						    //首次不执行
						    if(!first){
						    	$.ajax({
							    	type : "POST",
									url : '${pageContext.request.contextPath }/need/findbypage?page='+curr,								
									dataType : 'json',
									data:{searchtype:searchtype,classkey:classkey},
									success : function(data){
										console.log(data);
										$('.products').empty();									
									for(var i = 0; i < data.length; i++){
										console.log(i);
										var need = "";
										need += "<a class='product-a' href='${pageContext.request.contextPath }/need/findbyid?need_id=" + data[i].need_id + "'>";
										need += "<div class='product'><img src='${pageContext.request.contextPath }/source/images/need/" + data[i].need_image + "'/>";
										need += "<div class='content'><label>需求产品<p>" + data[i].need_name+"</p></label></div>";
										need += "<div class='content'><label>发布日期";
										need += "<p>"+ getDate("yyyy-mm-dd",data[i].need_date);
										need += "</p></label></div>";
										need += "<div class='content'><label>收购价格<p>" + data[i].need_price + "</p></label></div>";
										need += "<div class='content'>";
										if(data[i].need_coor == true)
											need += "<p id='spot'>支持长期合作</p>";
										else												
											need += "<p id='spot'>暂不支持长期</p>";
										need += "<span>"
										need += " <i class='layui-icon' >&#xe715;</i>";
										need += " <p>"+data[i].need_address+"</p>";
										need += "</span></div>";
										need += "</div></a>";
										$('.products').append(need);
									}
									}
						    	  })					  
						    }
						  }
			});
		});
	</script>
	<script>
		function search(){
			var text = document.getElementById("searchcontent").value;
			if(text != "" && text != null){
				window.location.href = "${pageContext.request.contextPath }/need/findbykey?need_name="+text;
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
	   	    oTime = oYear +'-'+ getzf(oMonth) +'-'+ getzf(oDay);//最后拼接时间
	    }else if(format == 'yyyy/mm/dd'){
	    	oTime = oYear +'/'+ getzf(oMonth) +'/'+ getzf(oDay);//最后拼接时间
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