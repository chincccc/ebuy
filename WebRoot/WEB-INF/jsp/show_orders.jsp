<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的订单</title>
</head>
<body>
	<table border="1">

		<c:forEach items="${userList}" var="user">
	<tr>
		<th>编号</th><th>卖家编号</th><th>买家编号</th><th>物品编号</th><th>上架时间</th><th>购买时间</th><th>配送地址</th><th>操作</th>
	</tr>
	<c:forEach items="${ordersList}" var="orders">
	<tr>
		<td>${orders.oid}</td>
		<td><a href="${pageContext.request.contextPath}/xianqin?uid=${user.uid}&uid2=${orders.sellerid}">  ${orders.sellerid} </a></td>
		<td><a href="${pageContext.request.contextPath}/xianqin?uid=${user.uid}&uid2=${orders.buyid}">  ${orders.buyid} </a></td>
		<td>${orders.gid}</td>
		<td>${orders.createtime}</td>
		<td>${orders.selltime}</td>
		<td>${orders.address}</td>
		<td><a href="${pageContext.request.contextPath}/linkto_change_orders?oid=${orders.oid}">修改</a>
		<td><a href="${pageContext.request.contextPath}/del_orders?uid=${user.uid}&oid=${orders.oid}">删除</a></td>
	</tr>
	</c:forEach>
	</table>
	</c:forEach>
	<input type="button" onclick="javascript:history.back(-1);" value="返回">
</body>
</html>