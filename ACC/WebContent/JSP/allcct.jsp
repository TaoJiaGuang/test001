<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>全部合同</title>
	 <link rel="Shortcut Icon" href="${pageContext.request.contextPath }/source/images/icon/logo3.ico" type="image/x-icon" />
		 <link rel="stylesheet" href="${pageContext.request.contextPath }/source/layui/css/layui.css"/> 	
<style>
hr {
	margin: 0px;
	padding: 0px;
}

.main {
	width: 95%;
	min-height:800px;
	margin: 0 2.5%;
}
.contract{
	width:
}
.item{
	
}
.layui-table{
	text-align:center;
	width:80%;
	margin:0 auto;
}
.layui-btn{
	background:green;	
}
</style>	
</head>
	<body>
		<jsp:include page="/JSP/head.jsp"></jsp:include>
		<hr>
		<hr>
		<div class="main">
			<div class="contract">
			<table class="layui-table" lay-skin="" lay-size="sm">
				<colgroup>
					<col width="200">
					<col width="150">
					<col width="150">
					<col width="200">
					<col width="80">
					<col width="200">
					<col>
				</colgroup>
				<thead>
					<tr style="text-align: left;"><td colspan="6">
					<div class="layui-row" style="height:50px; display:inline-block;">
						<label style="height:50px; line-height:50px; padding:0; margin:0;">
							<img src="${pageContext.request.contextPath }/source/images/icon/logo3.png" height="50px" style="float:left;padding:0;margin:0;">
							<h2 style="margin:0;color:green;display: inline-block; height:50px; line-height:50px;">农商合作社+平台</h2>
						</label>
					</div>
					<h2 style="display: inline-block;margin-left:26%;">合同管理</h2></td></tr>
					<tr>
						<th>合同编号</th>
						<th>甲方(农户)</th>
						<th>乙方(客商)
						<th>到期时间</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${temps }" var="temp">
						<tr>
						<td>${temp.cid }</td>
						<td>${temp.fuser_name }</td>
						<td>${temp.buser_name}</td>
						<td><fmt:formatDate pattern="yyyy年MM月dd日" value="${temp.cdate}" /></td>
						<td>
							<c:if test="${temp.cstate == '-2'}">申请签订</c:if>
							<c:if test="${temp.cstate == '-1'}">申请修改</c:if>							
							<c:if test="${temp.cstate == '0'}">申请续签</c:if>
							<c:if test="${temp.cstate == '1'}">生效中</c:if>
							<c:if test="${temp.cstate == '2'}">已拒绝</c:if>
						</td>
						<td>
							<a href="${pageContext.request.contextPath }/detail?cid=${temp.cid}" class="layui-btn layui-btn-sm">详情</a>
								<c:if test="${sessionScope.user.user_type == '商户' }">
									<button class="layui-btn layui-btn-sm" onclick="update(${temp.cid})">续签</button>
									<button class="layui-btn layui-btn-sm" onclick="uptime(${temp.cid})">修改</button>								
								</c:if>
								<c:if test="${sessionScope.user.user_type == '农户' }">
									<button class="layui-btn layui-btn-sm" onclick="agree(${temp.cid},${temp.cstate})">同意</button>
									<button class="layui-btn layui-btn-sm" onclick="defeat(${temp.cid},${temp.cstate})">拒绝</button>
								</c:if>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		</div>
		<hr>
		<jsp:include page="/JSP/footer.jsp"></jsp:include>
	<script type="text/javascript" src="${pageContext.request.contextPath }/source/layui/layui.all.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/source/js/jquery-1.11.3.min.js"></script>
	<script>
	//同意
		function agree(id,state){	
			console.log(id,state)
			if(state == 1){
				layui.use('layer',function(){
					var layer = layui.layer;
					layer.msg("拒绝操作，合同生效中!",{icon:2});
				});
			}else{
				$.ajax({
					type: 'POST',
					url: '${pageContext.request.contextPath }/agree',
					data:{id:id,state:state},
					dataType:'json',
					success:function(data){
						console.log(data);
						if(data>=1){
							layui.use('layer',function(){
								var layer = layui.layer;
								layer.msg("已同意");
							});
						}else{
							layui.use('layer',function(){
								var layer = layui.layer;
								layer.msg("操作失败");
							});
						}
					}
				})
			}			
		}
		//拒绝
		function defeat(id,state){
			console.log(id,state)
			if(state == 1){
				layui.use('layer',function(){
					var layer = layui.layer;
					layer.msg("拒绝操作，合同生效中！",{icon:2});
				});
			}else{
				$.ajax({
					type: 'POST',
					url: '${pageContext.request.contextPath }/defeat',
					data:{id:id,state:state},
					dataType:'json',
					success:function(data){
						console.log(data);
						if(data>=1){
							layui.use('layer',function(){
								var layer = layui.layer;
								layer.msg("已拒绝");
							});
						}else{
							layui.use('layer',function(){
								var layer = layui.layer;
								layer.msg("操作失败");
							});
						}
					}
				})
			}			
		}
		//续签
		function update(id){
			$.ajax({
				type: 'POST',
				url: '${pageContext.request.contextPath }/updatedate',
				data:{cid:id},
				dataType:'json',
				success:function(data){
					if(data>=1){
						layui.use('layer',function(){
							var layer = layui.layer;
							layer.msg("续签申请已提交！",{icon:1});
						});
					}else{
						layui.use('layer',function(){
							var layer = layui.layer;
							layer.msg("续签失败");
						});
					}
				}
			})
		}
		//修改
		function uptime(cid){
			layui.use('layer',function(){
				var layer = layui.layer;
				var str = "<div style='margin:20px 50px;'>";
				str += "<label style='font-size:18px;'>您想要修改成多长的合作时间呢？</label>";
				str += "<br><br><input type='text' id='count1' style='height:30px;margin:5px;border:2px green solid;border-radius:2px;'>个月";
				str += "</div>"
				layer.open({
					type: 1, 
					  title:['修改合同','background:green;text-align:center;font-size:large;color:#FFF;'],				  
					  area: ['400px','230px'],
					  content: str,
					  closeBtn: 1,
					  btn:'修改',
					  yes:function(){
						  var ctime = top.$('#count1').val();
						  $.ajax({
								type: 'POST',
								url: '${pageContext.request.contextPath }/updatetime',
								data:{cid:cid,ctime:ctime},
								dataType:'json',
								success:function(data){
									if(data>=1){
										layer.msg("修改申请已提交！",{icon:1,time:3000},function(index){
											layer.close(index);
											window.location.reload();
										});
									}else{
										layer.msg("修改失败");
									}
								}
						  })
					  }
				})
			})
		}
	</script>
</body>
</html>