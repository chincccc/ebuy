<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>商品上架</title>
</head>

<body>

<c:forEach items="${userList}" var="user">
	<form:form action="${pageContext.request.contextPath }/seach" method="post" modelAttribute="goods">
		<input type="text" name="gname"/><br><br>
		<input type="text" style="display:none" name="sellerid" value=${user.uid}>
		<form:errors path="*"></form:errors>
		<input type="submit" value="搜索"/>
	</form:form>


<table border="1">
	<tr>
		<th>编号</th><th>卖家编号</th><th>物品名</th><th>价格</th><th>上架时间</th><th>商品介绍</th><th>操作</th>
	</tr>
	<c:forEach items="${goodsList}" var="goods">
		<tr>
			<td><a href="${pageContext.request.contextPath}/xianqin_goods?uid=${user.uid}&gid=${goods.gid}">  ${goods.gid} </a></td>
			<td><a href="${pageContext.request.contextPath}/xianqin?uid=${user.uid}&uid2=${goods.sellerid}">  ${goods.sellerid} </a></td>
			<td>${goods.gname}</td>
			<td>${goods.price}</td>
			<td>${goods.createtime}</td>
			<td>${goods.content}</td>
			<td><a href="${pageContext.request.contextPath}/goumai?uid=${user.uid}&gid=${goods.gid}&uid2=${goods.sellerid}">购买</a>
				<a href="${pageContext.request.contextPath}/goumai?uid=${user.uid}&gid=${goods.gid}&uid2=0">收藏</a></td>
		</tr>
	</c:forEach>
</table>

<a href="${pageContext.request.contextPath }/back_home?uid=${user.uid}">返回首页</a>
</c:forEach>
</body>
</html>
