<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.acc.pojo.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<style>
.tips {
	vertical-align: middle;
	height: 30px;
	line-height: 30px;
}

.tips a, p {
	display: inline-block;
	font-size: 13px;
	color: #000;
	padding: 0 10px;
}

.tips a:hover {
	text-decoration: none;
	color: red;
}
</style>
<div class="layui-row tips">
	<c:if test="${!empty sessionScope.user }">
	<div class="layui-col-md3 layui-col-md-offset1" style="height: 30px;">
		<p>欢迎使用农商合作社+平台</p>
	<c:if test="${sessionScope.user.user_type =='客户' ||  sessionScope.user.user_type =='商户'}">
		<c:if test="${sessionScope.user.user_type =='客户' }">
			<a href="${pageContext.request.contextPath }/order/tocart?user_name=${sessionScope.user.user_name}">
				<i class="layui-icon">&#xe657;</i>购物车</a>			
		</c:if>		
		<a href="${pageContext.request.contextPath }/order/toorder?user_name=${sessionScope.user.user_name}">我的订单</a>
	</c:if>
	</div>
	</c:if>
	<c:if test="${empty sessionScope.user }">
	<div class="layui-col-md3 layui-col-md-offset1" style="height: 30px;">
		<p>欢迎使用农商合作社+平台</p>
		<a href="${pageContext.request.contextPath }/JSP/Login.jsp">请登录</a>
		<a href="${pageContext.request.contextPath }/JSP/Register.jsp">免费注册</a>
	</div>
	</c:if>	
	<div class="layui-col-md3 layui-col-md-offset4">
		<a href="${pageContext.request.contextPath }/loading"><i class="layui-icon">&#xe68e;</i>主页</a>|
		<c:if test="${!empty user }">			
			<a href="${pageContext.request.contextPath }/myself?username=${sessionScope.user.user_name}">
				<i class="layui-icon">&#xe770;</i>&nbsp;${sessionScope.user.user_type}:&nbsp;${sessionScope.user.user_name}
			</a>|
			<a><i class="layui-icon">&#xe65e;</i>&nbsp;账户余额:&nbsp;${sessionScope.user.charge}</a>|
			<a href="${pageContext.request.contextPath }/mymessage?user_name=${sessionScope.user.user_name}">
				我的消息<span class="layui-badge-dot layui-bg-red"></span></a>
		</c:if>
		<c:if test="${empty user }">
			<a href="${pageContext.request.contextPath }/JSP/Login.jsp">个人中心</a>
		</c:if>
		<c:if test="${!empty user }">
			|<a href="${pageContext.request.contextPath }/quit">退出</a>
		</c:if>
	</div>
</div>