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
	margin: 0px;
	padding: 0px;
}

.foot {
	background: black;
	opacity: 0.8;
}

.foot p {
	text-align: center;
}

.main {
	width: 95%;
	margin: 0 2.5%;
}

</style>	
</head>
	<body>
		<jsp:include page="/JSP/head.jsp"></jsp:include>
		<hr>
		<div class="main"></div>
		<hr>
		<jsp:include page="/JSP/footer.jsp"></jsp:include>
	<script type="text/javascript" src="${pageContext.request.contextPath }/source/layui/layui.all.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/source/js/jquery-1.11.3.min.js"></script>
	<script>
	
	</script>
</body>
</html>