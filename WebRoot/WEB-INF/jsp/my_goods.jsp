<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我上架的商品</title>
</head>
<body>
<input type="button" onclick="javascript:history.back(-1);" value="返回">
	<table border="1">
		<tr>
			<th>编号</th><th>物品名</th><th>价格</th><th>售卖状态(可售1/已售0)</th><th>上架时间</th><th>详情</th><th>操作</th>
		</tr>
		<c:forEach items="${goodsList}" var="goods">
		<tr>
			<td>${goods.gid}</td>
			<td>${goods.gname}</td>
			<td>${goods.price}</td>
			<td>${goods.sellstaus}</td>
			<td>${goods.createtime}</td>
			<td>${goods.content}</td>
			<td><a href="${pageContext.request.contextPath}/linkto_change_goods?gid=${goods.gid}">修改</a></td>
			<td><a href="${pageContext.request.contextPath}/del_goods?uid=${goods.sellerid}&gid=${goods.gid}">删除</a></td>
		</tr>
		</c:forEach>
	</table>

</body>
</html>