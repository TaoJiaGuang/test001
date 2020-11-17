<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>合同详情</title>
	 <link rel="Shortcut Icon" href="${pageContext.request.contextPath }/source/images/icon/logo3.ico" type="image/x-icon" />
		 <link rel="stylesheet" href="${pageContext.request.contextPath }/source/layui/css/layui.css"/> 	
	<style>
.tips {
	vertical-align: middle;
	height: 30px;
	line-height: 30px;
}

.tips a, p {
	display: inline-block;
	font-size: 13px;
	color: #CCC;
	padding: 0 10px;
}

.tips a:hover {
	text-decoration: none;
	color: red;
}

.login {
	border: 1px black solid;
	height: 300px;
}

hr {
	margin: 1px 0;
	padding: 0px;
}

.foot {
	background: black;
	opacity: 0.8;
}

.foot p {
	text-align: center;
}

.word {
	margin:0 auto;
	text-align:center;
	width:595px;
	height:842px;
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
	width:50px; 
	height:50px;	
	position:relative;
	float:left;
	margin:0 auto;
}
.title h1{
	position:relative;
	height:50px;
	line-height:50px;
	display: inline-block;
	float:left;
	margin:0 auto;
}
.content{
	margin-top:15%;
	height: 450px; 
	
}
.content p{
	letter-spacing: 2px;
	font-size:20px;
	line-height:50px;
	color:#000;
	text-indent: 48px;
	text-align: left;
}
.footer{
	margin-top:50px;
	height:100px;
}

.footer label{
	padding:0 10px;
	font-size:18px;
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
</style>	
</head>
	<body>
		<hr>
		<div class="main">
		<jsp:include page="/JSP/head.jsp"></jsp:include><hr>
		<div class="word">
		<div class="cid">
				<label>合同编号：${item.cid }</label>
		</div>
		<div class="title">
			<label><img src="${pageContext.request.contextPath }/source/images/icon/logo3.png">
				<h1>农商合作社+交易合同</h1></label>			
		</div>
		<div class="content">
			<p>本人<c:if test="${sessionScope.user.user_type == '农户' }"><em>${item.fuser_name }</em>与<em>${item.buser_name }</em></c:if>
			<c:if test="${sessionScope.user.user_type == '商户'}"><em>${item.buser_name }</em>与<em>${item.fuser_name }</em></c:if>
			就以其农产品<em>${item.supply.supply_name }</em>签订农产品交易合同，签约时限：
			<em><fmt:formatDate pattern="yyyy年MM月dd日" value="${item.cdate }" />至<fmt:formatDate pattern="yyyy年MM月dd日" value="${endtime}" /></em>
			,为期：<em>${item.ctime }</em>个月，在此期间诚实守信，遵守规则不恶意单方面撕毁合同。不损坏合作方利益，合作共赢，互利互惠。</p>	
		</div>
		<div class="footer">
			<div class="user">
				<label class="a">甲方：<em>${item.fuser_name }</em>(农户)</label>
				<label class="b">乙方：<em>${item.buser_name }</em>(商户)</label>
			</div>
			<div class="date">			
				<label class="b">签订日期：<em><fmt:formatDate pattern="yyyy年MM月dd日" value="${item.cdate}" /></em></label>
			</div>
		</div>
	</div>
	</div>
		<hr>
		<jsp:include page="/JSP/footer.jsp"></jsp:include>
	<script type="text/javascript" src="${pageContext.request.contextPath }/source/layui/layui.all.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/source/js/jquery-1.11.3.min.js"></script>
	<script>
	
	</script>
</body>
</html>