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
	min-height:850px;
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
	margin: 10px 0;
	text-align: center;
}

.product {
	border: 1px #ccc solid;
	border-radius: 2px;
	height: 320px;
	width: 16.32%;
	margin: 0.1%;
	float: left;
}

.product:hover {
	border: 1px green solid;
}

.product img {
	display: inline-block;
	border: 1px #CCC solid;
	margin: 5% 10%;
	height: 200px;
	width: 200px;
}

#spot {
	color: #FFF;
	font-size: 12px;
	background: #32CD32;
	border-radius: 5px;
	float:left;
}

.content {
	height: 25px;
	width: 210px;
	line-height: 25px;
	margin-left: 8%;
}

.content label {
	font-size: 12px;
	margin-right: 5px;
}

.content label p {
	margin: 0 1px ;
	padding: 0px;
}
.content span{
	heigth: 25px;
	display: inline-block;
	line-height: 25px;
	margin-left: 6%;
}
.content span p{
	margin:0;
	padding:0;
	float:left;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	width:78px;
}
.content span i{
	float:left;
}
.menu-ul {
	background: green;
	opacity: 0.9;
	height: 40px;
	line-height: 40px;
	margin: 0;
}

/* .over {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	
} */
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
						<input id="searchkey" type="text" placeholder="请输入您想要的信息" style="width:70%; height:36px; padding:0px; margin:0px; float:left;">
						<button onclick="search()" style=" font-size:19px; color:#FFF; width:17%; height:36px; padding:0px; margin:0px; float:left; border-radius:0 40px 40px 0; border:none; background:green;">搜索</button>
					</div>
				</div>
			</div>
			</div>
			<div class="layui-row menu">
				<div class="layui-col-md12">
				<ul class="layui-col-md12 menu-ul">
					<li class="layui-btn li-item" style="margin: 0px;">
						<a href="${pageContext.request.contextPath }/supply/moresupply">全部</a>
					</li>
					<c:forEach items="${items }" var="item">
						<li class="layui-btn li-item" style="margin: 0px;"><a
							href="${pageContext.request.contextPath }/supply/findbyclass?classname=${item.sort_name}">${item.sort_name}</a>
						</li>
					</c:forEach>
				</ul>
			</div>
			</div>
			<div class="layui-row item">
				<div class="layui-col-md12 products">
				<c:forEach items="${supplys }" var="supply">				
					<a href="${pageContext.request.contextPath }/supply/findbyid?supply_id=${supply.supply_id}">
					<div class="product">
						<img src="${pageContext.request.contextPath }/source/images/supply/${supply.supply_image }"/>
					<div class="content">
						<label>
							<p style="color:#CCC;">价格</p>
							<p style="color:#F00;">${supply.supply_price }</p>
							<c:if test="${supply.supply_type == '水果'}">元/公斤</c:if>
							<c:if test="${supply.supply_type == '茶叶'}">元/公斤</c:if>
							<c:if test="${supply.supply_type == '蔬菜'}">元/公斤</c:if>
							<c:if test="${supply.supply_type == '禾谷'}">元/公斤</c:if>
							<c:if test="${supply.supply_type == '薯类'}">元/公斤</c:if>
							<c:if test="${supply.supply_type == '树种'}">元/株</c:if>
							<c:if test="${supply.supply_type == '牲畜'}">元/只</c:if>
							<c:if test="${supply.supply_type == '蛋类'}">元/个</c:if>
						</label>
						<label>
							<p style="color:#CCC;">销量</p>
							<p style="marign:0;padding:0;color:red;">${supply.supply_sales }</p>
							<c:if test="${supply.supply_type == '水果'}">公斤</c:if>
							<c:if test="${supply.supply_type == '茶叶'}">公斤</c:if>
							<c:if test="${supply.supply_type == '蔬菜'}">公斤</c:if>
							<c:if test="${supply.supply_type == '禾谷'}">公斤</c:if>
							<c:if test="${supply.supply_type == '薯类'}">公斤</c:if>
							<c:if test="${supply.supply_type == '树种'}">株</c:if>
							<c:if test="${supply.supply_type == '牲畜'}">只</c:if>
							<c:if test="${supply.supply_type == '蛋类'}">个</c:if>
						</label>
					</div>	
					<div class="content over">
						<a href="${pageContext.request.contextPath }/supply/findbyid?supply_id=${supply.supply_id}">${supply.supply_name}</a>
					</div>
					<div class="content">
						<p id="spot">
							<c:if test="${supply.supply_cooperation  == true}">支持合同签订</c:if>
							<c:if test="${supply.supply_cooperation == false}">暂不支持合同</c:if>
						</p>
						<span>
							<i class="layui-icon">&#xe715;</i>
							<p>${supply.supply_address }</p>
						</span>						
					</div>				
				</div>
				</a>		
				</c:forEach>												
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
						    var curr = obj.curr;
						    console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
						    console.log(obj.limit); //得到每页显示的条数						    
						    
						    //首次不执行
						    if(!first){
						    	$.ajax({
							    	type : "POST",
									url : '${pageContext.request.contextPath }/supply/findbypage?page='+curr,								
									dataType : 'json',
									data:{searchtype:searchtype,classkey:classkey},
									success : function(data){
										console.log(data);
										$('.products').empty();									
									for(var i = 0; i < data.length; i++){
										console.log(i);
										/* <a href="${pageContext.request.contextPath }/supply/findbyid?supply_id=${supply.supply_id}">
										<div class="product">
											<img src="${pageContext.request.contextPath }/source/images/supply/${supply.supply_image }"/>
										<div class="content">
											<label>
												<p style="color:#CCC;">价格</p>
												<p style="color:#F00;">${supply.supply_price }</p>
												<c:if test="${supply.supply_type == '水果'}">元/公斤</c:if>
												<c:if test="${supply.supply_type == ''}">元/公斤</c:if>
												<c:if test="${supply.supply_type == ''}">元/公斤</c:if>
												<c:if test="${supply.supply_type == ''}">元/公斤</c:if>
												<c:if test="${supply.supply_type == ''}">元/公斤</c:if>
												<c:if test="${supply.supply_type == ''}">元/株</c:if>
												<c:if test="${supply.supply_type == ''}">元/只</c:if>
												<c:if test="${supply.supply_type == ''}">元/个</c:if>
											</label>
											<label>
												<p style="color:#CCC;">销量</p>
												<p style="marign:0;padding:0;color:red;">${supply.supply_sales }</p>
												<c:if test="${supply.supply_type == '水果'}">公斤</c:if>
												<c:if test="${supply.supply_type == '茶叶'}">公斤</c:if>
												<c:if test="${supply.supply_type == '蔬菜'}">公斤</c:if>
												<c:if test="${supply.supply_type == '禾谷'}">公斤</c:if>
												<c:if test="${supply.supply_type == '薯类'}">公斤</c:if>
												<c:if test="${supply.supply_type == '树种'}">株</c:if>
												<c:if test="${supply.supply_type == '牲畜'}">只</c:if>
												<c:if test="${supply.supply_type == '蛋类'}">个</c:if>
											</label>
										</div>	
										<div class="content over">
											<a href="${pageContext.request.contextPath }/supply/findbyid?supply_id=${supply.supply_id}">${supply.supply_name}</a>
										</div>
										<div class="content">
											<p id="spot">
												<c:if test="${supply.supply_cooperation  == true}">支持合同签订</c:if>
												<c:if test="${supply.supply_cooperation == false}">暂不支持合同</c:if>
											</p>
											<span>
												<i class="layui-icon">&#xe715;</i>
												<p>${supply.supply_address }</p>
											</span>						
										</div>				
									</div>
									</a> */
										var supply = "";										
										supply += "<a  href='${pageContext.request.contextPath }/supply/findbyid?supply_id=" + data[i].supply_id + "'>";
										supply += "<div class='product'><img src='${pageContext.request.contextPath }/source/images/supply/" + data[i].supply_image+"'/>";
										supply += "<div class='content'><label><p style='color:#CCC;'>价格</p><p style='color:red;'>"+data[i].supply_price+"</p>";
										if(data[i].supply_type == '水果')
											supply += "元/公斤";
										if(data[i].supply_type == '茶叶')
											supply += "元/公斤";
										if(data[i].supply_type == '蔬菜')
											supply += "元/公斤";
										if(data[i].supply_type == '禾谷')
											supply += "元/公斤";
										if(data[i].supply_type == '薯类')
											supply += "元/公斤";
										if(data[i].supply_type == '牲畜')
											supply += "元/只";
										if(data[i].supply_type == '蛋类')
											supply += "元/个";
										if(data[i].supply_type == '树种')
											supply += "元/株";
										supply += "</label>";
										supply += "<label><p style='color:#CCC;'>销量</p><p style='color:red;'>" + data[i].supply_sales +"</p>";
										if(data[i].supply_type == '水果')
											supply += "公斤";
										if(data[i].supply_type == '茶叶')
											supply += "公斤";
										if(data[i].supply_type == '蔬菜')
											supply += "公斤";
										if(data[i].supply_type == '禾谷')
											supply += "公斤";
										if(data[i].supply_type == '薯类')
											supply += "公斤";
										if(data[i].supply_type == '牲畜')
											supply += "只";
										if(data[i].supply_type == '蛋类')
											supply += "个";
										if(data[i].supply_type == '树种')
											supply += "株";
										supply += "</label></div>";
										supply += "<div class='content over'><a href='${pageContext.request.contextPath }/supply/findbyid?supply_id=" + data[i].supply_id+"'>"+data[i].supply_name+"</a></div>";
										supply += "<div class='content'>";
										if(data[i].supply_cooperation == true)
											supply += "<p id='spot'>支持合同签订</p>";
										else												
											supply += "<p id='spot'>暂不支持合同</p>";
										supply += " <i class='layui-icon'>&#xe715;</i>";
										supply += " <p>"+data[i].supply_address+"</p></div>";
										supply += "</div></a>";
										$('.products').append(supply);
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
			var key = document.getElementById("searchkey").value;			
			if(key != "" && key != null){
				window.location.href = "${pageContext.request.contextPath }/supply/findbykey?supply_name="+key;
				/* $.ajax({
					type : "POST",
					url : '${pageContext.request.contextPath }/supply/findbykey?supply_name='+key,
					dataType : 'json',				
					success : function(data){
						console.log(data);
						$('.products').empty();	
						$('#page').count = data.length;
						
						for(var i = 0; i < data.length; i++){
							console.log(i);
							var supply = "";
							supply += "<a class='product-a' href='${pageContext.request.contextPath }/supply/findbyid?supply_id=" + data[i].supply_id + "'>";
							supply += "<div class='product'><img src='${pageContext.request.contextPath }/source/images/supply/" + data[i].supply_image;
							supply += "' width='180px' height='180px'/>";
							supply += "<div class='content'><label><p style='color:#CCC; font-size:12px;''>价格</p><p style='marign:0;padding:0;color:red;'>"+data[i].supply_price+"</p></label>";
							supply += "<label><p style='color:#CCC; font-size:12px;'>销量</p><p style='marign:0;padding:0;color:red;'>" + data[i].supply_sales +"</p></label></div>";
							supply += "<div class='content'><a style='color:black; font-size:14px;margin:10px;' href='${pageContext.request.contextPath }/supply/findbyid?supply_id=" + data[i].supply_id+"'>"+data[i].supply_name+"</a></div>";
							supply += "<div class='content'>";
							if(data[i].supply_cooperation == true)
								supply += "<p id='spot'>支持合同签订</p>";
							else												
								supply += "<p id='spot'>暂不支持合同</p>";
							supply += "<i class='layui-icon' style='color:#CCC;padding:0px;'>&#xe715;</i>";
							supply += "<p style='margin:0 1px;padding:0 1px;'>"+data[i].supply_address+"</p></div>";
							supply += "</div></a>";
							$('.products').append(supply);
						}
					}
				}) */	
			}
			
		}
	</script>
</body>
</html>