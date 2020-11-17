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
	margin:0px;
	padding: 0px;
}


.main {
	border:1px #CCC solid;
	width: 60%;
	min-height:820px;
	margin: 0 20%;
}
.main hr{
	margin:20px 0;
}
.main h1{
	text-align: center;
	margin-top:20px;
}
.main p{
	font-size:16px;
	line-height:20px;
	color: #000;
	text-indent: 32px;
	margin-bottom:50px;
}

</style>	
</head>
	<body>
		<jsp:include page="/JSP/head.jsp"></jsp:include>
		<hr>
		<div class="main">
			<h1>${policy.title }</h1>
			<hr>
			<p>${policy.content}</p>
		</div>
		<hr>
		<jsp:include page="/JSP/footer.jsp"></jsp:include>
	<script type="text/javascript" src="${pageContext.request.contextPath }/source/layui/layui.all.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/source/js/jquery-1.11.3.min.js"></script>
	<script>
	
	</script>
</body>
</html>