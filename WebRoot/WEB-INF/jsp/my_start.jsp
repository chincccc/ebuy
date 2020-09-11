<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的收藏</title>
</head>
<body>

	<table border="1">
	<tr>
		<th>编号</th><th>物品编号</th><th>物品名</th><th>加入时间</th><th>价格</th><th>操作</th>
	</tr>
	<c:forEach items="${startList}" var="start">
	<tr>
		<td>${start.sid}</td>
		<td><a href="${pageContext.request.contextPath}/xianqin_goods?uid=${start.uid}&gid=${goods.gid}">  ${goods.gid} </a></td>
		<td>${start.gname}</td>
		<td>${start.createtime}</td>
		<td>${start.price}</td>
		<td><a href="${pageContext.request.contextPath}/del_start?uid=${start.uid}&sid=${start.sid}">删除</a></td>
	</tr>
	</c:forEach>
	</table>
	<input type="button" onclick="javascript:history.back(-1);" value="返回">
</body>
</html>