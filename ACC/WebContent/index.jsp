<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>首页</title>
	<link rel="Shortcut Icon" href="${pageContext.request.contextPath }/source/images/icon/logo3.ico" type="image/x-icon" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/source/layui/css/layui.css" media="all"/>  
	<script type="text/javascript" src="${pageContext.request.contextPath }/source/layui/layui.all.js" ></script>
<style>
hr {
	margin: 0px;
	padding: 0px;
}

.main {
	min-height: 800px;
}
.main label{
	display:inline-block;
	font-size:30px;
	margin:10% 45%;
}
.main label i{
	font-size:30px;
}
</style>
</head>
	<body onload="loading()">
	<jsp:include page="/JSP/head.jsp"></jsp:include>
	<hr>
		<div class="main">
			<label><i class="layui-icon">&#xe63d;</i>loading……</label>
		</div>		
	<hr>
	<jsp:include page="/JSP/footer.jsp"></jsp:include>
	
	<script>
	function loading(){
		setTimeout(function() {
			window.location.href="${pageContext.request.contextPath}/loading";
		}, 1000);
		
	}
	</script>
</body>
</html>