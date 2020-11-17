<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="java.util.*,com.acc.pojo.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>个人首页</title>
	<link rel="Shortcut Icon" href="${pageContext.request.contextPath }/source/images/icon/logo3.ico" type="image/x-icon" />
	 <link rel="stylesheet" href="${pageContext.request.contextPath }/source/layui/css/layui.css"/> 
	<style>
hr {
	margin: 0px;
	padding: 0px;
}

.layui-container {
	width: 70%;
	margin: 0 15%;
}

a:hover{
	color:#FFF;
}
select {
	color: #FFF;
	height: 40px;
	font-size: 16px;
	border-radius: 40px 0 0 40px;
	border: none;
	width: 100%;
	text-indent: 15px;
	background: green;
}

.product {
	border: 1px #ccc solid;
	border-radius: 2px;
	min-height: 325px;
	max-height:325px;
	margin-bottom: 1px;
}

.product:hover {
	border: 2px #CCCCC0 solid;
}

.product img {
	margin: 5%;
	border: 1px #CCC solid;
	width: 190px;
	height: 190px;
}

.menu {
	border-radius: 3px;
	height: 38px;
	background: #F0F0F0;
	margin-bottom: 5px;
	width: 100%;
}

#menu-item {
	margin: 0;
	background: green;
	opacity: 0.7;
}

#menu-item:hover {
	text-decoration: none;
	background: green;
	opacity: 0.9;
	border: none;
}

.title {
	border-radius: 5px 0 0 0;
	height: 30px;
	background: #F0F0F0;
	width: 100%;
}

.ppage {
	border-radius: 5px 0 0 0;
	height: 50px;
	width: 100%;
	margin: 0 22px;
}

.title-p {
	font-size: 15px;
	color: #FFF;
	text-align: center;
	height: 30px;
	width: 100px;
	line-height: 30px;
	background: green;
	display: inline-block;
	border-radius: 5px 0 0 0;
}

.more {
	border-radius: 0 0 5px 0;
	height: 30px;
	background: #F0F0F0;
	width: 100%;
	text-align: right;
}

.more p {
	font-size: 15px;
	color: #FFF;
	height: 30px;
	width: 70px;
	line-height: 30px;
	background: #CCF;
	display: inline-block;
	border-radius: 0 0 5px 0;
}

.layui-row {
	margin: 0px;
	padding: 0px;
}

.border-up {
	border: 1px #CCB solid;
	border-radius: 5px 0 5px 0;
	margin-bottom: 15px;
}

.policy {
	height: 330px;
	/* border:1px black solid; */
}

.policy p {
	color: #000;
	height: 30px;
	text-align: center;
	line-height: 30px;
}

.policy a {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	padding-left: 20px;
	width: 80%;
	color: #000;
	opacity: 0.5;
	font-size: 18px;
	line-height: 20px;
	margin: 5px 0;
}

.policy a:hover {
	color: #000;
	font-size: 19px;
	opacity: 0.9;
	color: red;
	text-decoration: underline;
}

#spot {
	color: #FFF;
	font-size: 12px;
	background: #32CD32;
	border-radius: 5px;
	float:left;
}

.hota {
	text-align: left;
	color: #000;
	height: 30.3px;
	line-height: 30px;
	margin: 0;
	padding: 0;
	border: 1px #CCC solid;
}

.hota:hover {
	background: #F5F5F5;
}

.hotp {
	color: #000;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.newa {
	border: 1px #CCC solid;
	text-align: left;
	color: #000;
	height: 28.3px;
	line-height: 30px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	display: block;
	padding-left: 5%;
}

.newa:hover {
	background: #F5F5F5;
	text-decoration: none;
	color: #000;
}

.over {
	margin: 0 5%;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	width: 90%;
}

.need-item {
	height: 20px;
	line-height: 20px;
	margin: 0 4%;
}
.need-item label{
	
}
.need-item span i {
	float: left;
}

.need-item span p {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	width: 80px;
	float: left;
	padding:0 1px;margin:0 1px;
}
</style>	
</head>
	<body>
		<jsp:include page="/JSP/head.jsp"></jsp:include>
		<hr>
		<div class="layui-container">
			<div class="layui-row" style="height:70px; margin-bottom:5px;">
				<div class="layui-col-md1" style="height:70px;">
					<img src="source/images/icon/logo3.png" height="60px" style="margin:8px 30px;">
				</div>
				<div class="layui-col-md3">
					<h1 style="color:green;height:70px;line-height:70px;">农商合作社+平台</h1>
				</div>
				<div class="layui-col-md6" style="height:70px;">
					<div style="margin-top:15px; height:40px; border:2px green solid; border-radius:20px; background:green;" >
						<div style="width:12%; float:left; height:36px;">
							 <c:if test="${sessionScope.user == null}">
							 	 <select id="type">
							  		<option style="text-indent:10px;">供应</option>
							  		<option style="text-indent:10px;">需求</option>
							 	 </select> 
							</c:if>	
							<c:if test="${sessionScope.user.user_type == '农户'}">
								<input id="type" value="需求" readonly="readonly" style="margin-left:10px;color:#FFF; font-size:16px;height:36px; border-radius:40px 0 0 40px; border:none; width:100%; text-indent: 10px; background:green;"> 
							</c:if>	
							<c:if test="${sessionScope.user.user_type == '商户' || sessionScope.user.user_type == '客户'}">
								<input id="type" value="供应" readonly="readonly" style="margin-left:10px;color:#FFF; font-size:16px;height:36px; border-radius:40px 0 0 40px; border:none; width:100%; text-indent: 10px; background:green;"> 
							</c:if>							 
						</div>
						<input id="text" type="text" placeholder="请输入您想要的信息" style="width:70%; height:36px; padding:0px; margin:0px; float:left;">
						<button onclick="search()" style="font-size:19px; color:#FFF; width:17%; height:36px; padding:0px; margin:0px; float:left; border-radius:0 40px 40px 0; border:none; background:green;">搜索</button>
					</div>
				</div>
			</div>
			<div class="layui-row nav">
				<div class="layui-col-md12 menu">	
					<a class="layui-btn" id="menu-item" href="${pageContext.request.contextPath }/loading">首页</a>
					<c:if test="${sessionScope.user == null}">
						<a class="layui-btn" id="menu-item" href="${pageContext.request.contextPath }/supply/moresupply">供应信息</a>
						<a class="layui-btn" id="menu-item" href="${pageContext.request.contextPath }/need/moreneed">需求信息</a>
					</c:if>				
					<c:if test="${sessionScope.user.user_type == '客户'}">
						<a class="layui-btn" id="menu-item" href="${pageContext.request.contextPath }/supply/moresupply">供应信息</a>
						<a class="layui-btn" id="menu-item" href="${pageContext.request.contextPath }/order/tocart?user_name=${sessionScope.user.user_name}">购物车管理</a>
						<a class="layui-btn" id="menu-item" href="${pageContext.request.contextPath }/order/toorder?user_name=${sessionScope.user.user_name}">订单管理</a>
					</c:if>						
					<c:if test="${sessionScope.user.user_type == '农户'}">			
						<a class="layui-btn" id="menu-item" href="${pageContext.request.contextPath }/need/moreneed">需求信息</a>			
						<a class="layui-btn" id="menu-item" href="${pageContext.request.contextPath }/supply/management?user_name=${sessionScope.user.user_name}">供应管理</a>	
						<a class="layui-btn" id="menu-item" href="${pageContext.request.contextPath }/order/goorder?user_name=${sessionScope.user.user_name}">订单管理</a>
						<a class="layui-btn" id="menu-item"  href="${pageContext.request.contextPath }/tocontract?user_name=${sessionScope.user.user_name}">合同管理</a>					
					</c:if>	
					<c:if test="${sessionScope.user.user_type == '商户'}">
						<a class="layui-btn" id="menu-item" href="${pageContext.request.contextPath }/supply/moresupply">供应信息</a>
						<a class="layui-btn" id="menu-item" href="${pageContext.request.contextPath }/need/management?user_name=${sessionScope.user.user_name}">需求管理</a>
						<a class="layui-btn" id="menu-item" href="${pageContext.request.contextPath }/order/toorder?user_name=${sessionScope.user.user_name}">订单管理</a>
						<a class="layui-btn" id="menu-item"  href="${pageContext.request.contextPath }/tocontract?user_name=${sessionScope.user.user_name}">合同管理</a>
					</c:if>					
				</div>
			</div>
			<div class="layui-row" style=" height:302px; margin-bottom:5px; border:1px #CCC solid; border-radius:5px 5px 0 0;">	
			<!-- 最新农产品供应 -->
				<c:if test="${empty sessionScope.user}">
				<div class="layui-col-md3">
					<div class="layui-col-md12" style="background:#CCC; text-align: center; color:green; height:30px; line-height: 30px;">最新农产品供应</div>
					<div class="layui-col-md12">
						<c:forEach items="${news }" var="item">						
						<a class="clayui-col-md12 newa" href="${pageContext.request.contextPath }/supply/findbyid?supply_id=${item.supply_id}">
							<fmt:formatDate value='${item.supply_date }' pattern='yyyy-MM-dd'/>&nbsp;${item.supply_name }
						</a>	
						</c:forEach>	
					</div>					
				</div>	
				</c:if>
				<!-- 最新农产品需求 -->
				<c:if test="${sessionScope.user.user_type == '农户'}">
				<div class="layui-col-md3">
					<div class="layui-col-md12" style="background:#CCC; text-align: center; color:green; height:30px; line-height: 30px;">最新农产品需求</div>
					<div class="layui-col-md12">
						<c:forEach items="${newneeds }" var="item">
						<a class="clayui-col-md12 newa" href="${pageContext.request.contextPath }/need/findbyid?need_id=${item.need_id}">
							<fmt:formatDate value='${item.need_date }' pattern='yyyy-MM-dd'/>&nbsp;${item.need_name }
						</a>													
						</c:forEach>
					</div>								
				</div>	
				</c:if>	
				<!-- 最新农产品供应 -->
				<c:if test="${sessionScope.user.user_type == '商户' || sessionScope.user.user_type == '客户'}">
				<div class="layui-col-md3">
					<div class="layui-col-md12" style="background:#CCC; text-align: center; color:green; height:30px; line-height: 30px;">最新农产品供应</div>
					<div class="layui-col-md12">
						<c:forEach items="${news }" var="item">
						<a class="clayui-col-md12 newa" href="${pageContext.request.contextPath }/supply/findbyid?supply_id=${item.supply_id}">
							<fmt:formatDate value='${item.supply_date }' pattern='yyyy-MM-dd'/>&nbsp;${item.supply_name }
						</a>																			
						</c:forEach>
					</div>								
				</div>		
				</c:if>			
				<div class="layui-col-md6" style="margin-top:2px;">
				<div class="layui-carousel" id="test1">
				<div carousel-item>
					<div>
						<img src="source/images/ShowImages/picture1.jpg" height="300px" width="100%">
					</div>
					<div>
						<img src="source/images/ShowImages/picture2.jpg" height="300px" width="100%">
					</div>
					<div>
						<img src="source/images/ShowImages/picture6.png" height="300px" width="100%">
					</div>
					<div>
						<img src="source/images/ShowImages/picture4.jpg" height="300px" width="100%">
					</div>	
					<div>
						<img src="source/images/ShowImages/picture5.jpg" height="300px" width="100%">
					</div>				
				</div>
			</div>						
				</div>
				<c:if test="${empty sessionScope.user}">
				<div class="layui-col-md3">
					<div class="layui-col-md12" style="background:#CCC; text-align: center; color:green; height:30px; line-height: 30px;">最新农产品需求</div>
					<div class="layui-col-md12">
						<c:forEach items="${newneeds }" var="item">
						<a class="clayui-col-md12 newa" href="${pageContext.request.contextPath }/need/findbyid?need_id=${item.need_id}">
							<fmt:formatDate value='${item.need_date }' pattern='yyyy-MM-dd'/>&nbsp;${item.need_name }
						</a>													
						</c:forEach>
					</div>								
				</div>	
				<!-- 最早农产品需求 -->
				</c:if>
				<c:if test="${sessionScope.user.user_type == '农户'}">
				<div class="layui-col-md3">
					<div class="layui-col-md12" style="background:#CCC; text-align: center; color:red; height:30px; line-height: 30px;">最早农产品需求</div>
					<div class="layui-col-md12">
						<c:forEach items="${oldneeds }" var="item">
						<a class="clayui-col-md12 newa" href="${pageContext.request.contextPath }/need/findbyid?need_id=${item.need_id}">
							<fmt:formatDate value='${item.need_date }' pattern='yyyy-MM-dd'/>&nbsp;${item.need_name }
						</a>													
						</c:forEach>
					</div>								
				</div>	
				</c:if>	
				<!-- 最热农产品供应 -->
				<c:if test="${sessionScope.user.user_type == '商户' || sessionScope.user.user_type == '客户'}">
				<div class="layui-col-md3">
					<div class="layui-col-md3" style="background:#CCC; width:100%; text-align: center; color:red; height:30px; line-height: 30px;">最热农产品供应</div>
					<div class="layui-col-md12">
						<c:forEach items="${hots }" var="item">						
						<a class="layui-col-md12 hota" href="${pageContext.request.contextPath }/supply/findbyid?supply_id=${item.supply_id}">
							<p class="layui-col-md7 hotp">${item.supply_name }</p>
							<p class="layui-col-md4 hotp"><i class="layui-icon" style="color:red;">&#xe756;</i>${item.supply_sales}</p>
						</a>	
						</c:forEach>	
					</div>								
				</div>
				</c:if>
			</div>
			<c:if test="${sessionScope.user.user_type == '商户' || sessionScope.user.user_type == '客户' || sessionScope.user == null}">
				<div class="layui-row border-up">
				<div class="layui-col-md12 title">
					<p class="title-p">供应信息</p>
				</div>
				<c:forEach items="${supplys }" var="supply">	
				<a href="${pageContext.request.contextPath }/supply/findbyid?supply_id=${supply.supply_id}">					
					<div class="layui-col-md2 product" style="min-height:300px;max-height:300px;">
					<img src="${pageContext.request.contextPath }/source/images/supply/${supply.supply_image }" alt="图片丢了" />
					<div style="height:25px; line-height: 25px;">
						<label><p style="color:#CCC; font-size:12px;">价格</p><p style="marign:0;padding:0;color:red;">${supply.supply_price }</p></label>
						<label><p style="color:#CCC; font-size:12px;">销量</p><p style="marign:0;padding:0;color:red;">${supply.supply_sales }</p></label>
					</div>
					<div class="over">
						<a style="color:black; font-size:14px;" href="${pageContext.request.contextPath }/supply/findbyid?supply_id=${supply.supply_id}">${supply.supply_name}</a>
					</div>		
					<div class="need-item" style="height:20px; line-height: 20px; margin:2% 4%;">				
						<p id="spot">
							<c:if test="${supply.supply_cooperation  == true}">支持合同签订</c:if>
							<c:if test="${supply.supply_cooperation == false}">暂不支持合同</c:if>
						</p>		
						<span>
							<i class="layui-icon" style="color:#CCC;padding:0px;">&#xe715;</i>
							<p>${supply.supply_address }</p>	
						</span>			
					</div>				
					</div>	
					</a>
				</c:forEach>				
				<div class="layui-col-md12 more">
					<a href="${pageContext.request.contextPath }/supply/moresupply"  class="title-p">更多>></a>
				</div>
			</div>
			</c:if>			
			<c:if test="${sessionScope.user.user_type == '农户'  || sessionScope.user == null}">
				<div class="layui-row border-up">
				<div class="layui-col-md12 title">
					<p class="title-p">需求信息</p>
				</div>	
				<c:forEach items="${needs }" var="need">
					<a href="${pageContext.request.contextPath }/need/findbyid?need_id=${need.need_id}">
					<div class="layui-col-md2 product">
						<img src="${pageContext.request.contextPath }/source/images/need/${need.need_image }"/>
						<div class="need-item" style="height:25px; line-height: 25px;">
							<label>
								<p style="color:#CCC; font-size:12px;">需求产品</p>
								<p style="marign:0;padding:0; color:#000;font-weight:500;">${need.need_name }</p>
							</label>
						</div>	
						<div class="need-item" style="height:25px; line-height: 25px;">
							<label>
								<p style="color:#CCC; font-size:12px;">发布日期</p>
								<p style="marign:0;padding:0;color:#000;font-weight:500;">
									<fmt:formatDate value='${need.need_date }' pattern='yyyy-MM-dd'/>
								</p>
							</label>
						</div>
						<div class="need-item" style="height:25px; line-height: 25px;">
							<label>
								<p style="color:#CCC; font-size:12px; float:left;">收购价格</p>
								<p style="marign:0;padding:0;color:#000; font-weight:500;width:120px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">${need.need_price }</p>
							</label>
						</div>
						<div class="need-item">
							<p id="spot">
								<c:if test="${need.need_coor  == true}">支持长期合作</c:if>
								<c:if test="${need.need_coor == false}">暂不支持长期</c:if>
							</p>						
							<span>
								<i class="layui-icon" style="color:#CCC;padding:0px;">&#xe715;</i>
								<p>${need.need_address }</p>
							</span>							
						</div>					
					</div>
					</a>								
				</c:forEach>
				<div class="layui-col-md12 more">
					<a href="${pageContext.request.contextPath }/need/moreneed" class="title-p">更多>></a>
				</div>
			</div>
			</c:if>			
			<div class="layui-row" style="border:1px #CCC solid; border-radius:5px;">
				<div class="layui-col-md12 title">
					<p class="title-p">扶贫指南</p>
				</div>
				<div class="layui-col-md12 policy">
					<p class="layui-col-md12" style="background:#F9F9F9;">扶贫政策发布</p>
					<div class="pitem">
						<c:forEach items="${policys }" var="policy">					
							<a class="layui-col-md12" href="${pageContext.request.contextPath }/policy?pid=${policy.pid}">${policy.title}</a>
						</c:forEach>
					</div>									
				</div>
				<hr>
				<div class="layui-col-md12 ppage">
					<div id="page" style=""></div>
				</div>
			</div>			
		</div>
	<hr>
	<jsp:include page="/JSP/footer.jsp"></jsp:include>

	<script type="text/javascript" src="${pageContext.request.contextPath }/source/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/source/layui/layui.all.js" ></script>
	<script>
		layui.use('carousel', function() {
			var carousel = layui.carousel;
			//建造实例
			carousel.render({
				elem : '#test1',
				width : '100%' //设置容器宽度
				,height : '296px' //设置容器高度
				,arrow : 'hover'//始终显示箭头
				,anim : 'default' //切换动画方式
				,interval: '2000'
			});
		});
		layui.use('laypage', function(){
			  var laypage = layui.laypage;			  
			  //执行一个laypage实例
			  laypage.render({
			    elem: 'page' //注意，这里的 test1 是 ID，不用加 # 号
			    ,theme: '#CCC'
			    ,count: '${pages}' //数据总数，从服务端得到
			    ,layout: ['count','prev','page','next','skip']
			    ,limit:10
			   	,prev: "<i class='layui-icon'>&#xe603;</i>"
			   	,next: "<i class='layui-icon'>&#xe602;</i>"
				,jump:function(obj,first){
					console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
				    console.log(obj.limit); //得到每页显示的条数
				    var curr = obj.curr;
				    if(!first){
				    	$.ajax({
					    	type : "POST",
							url : '${pageContext.request.contextPath }/findpolicy?page='+curr,								
							dataType : 'json',
							success : function(data){
								console.log(data);
								$('.pitem').empty();	
								for(var i = 0; i < data.length; i++){
									var str = "<a class='layui-col-md12' href='${pageContext.request.contextPath }/policy?pid="+data[i].pid+"'>"+data[i].title+"</a>";
									$('.pitem').append(str);
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
			var type = document.getElementById("type").value;
			var text = document.getElementById("text").value;
			if(text != "" && text != null){
				if(type == "供应"){
					window.location.href = "${pageContext.request.contextPath }/supply/findbykey?supply_name="+text;
				}else if(type == "需求"){
					window.location.href = "${pageContext.request.contextPath }/need/findbykey?need_name="+text;
				}
				
			}
		}
	</script>
</body>
</html>