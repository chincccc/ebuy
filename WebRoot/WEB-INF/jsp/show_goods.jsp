<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品详情</title>

</head>
<body>
<c:forEach items="${goodsList}" var="goods">
<c:forEach items="${userList}" var="user">
	<table border="1">
		<tr>
			<th>编号</th><th>物品名</th><th>物品名</th><th>价格</th><th>售卖状态(可售1/已售0)</th><th>上架时间</th><th>详情</th><th>操作</th>
		</tr>
		<tr>
			<td>${goods.gid}</td>
			<td>${goods.sellerid}</td>
			<td>${goods.gname}</td>
			<td>${goods.price}</td>
			<td>${goods.sellstaus}</td>
			<td>${goods.createtime}</td>
			<td>${goods.content}</td>
			<td><a href="${pageContext.request.contextPath}/goumai?uid=${user.uid}&gid=${goods.gid}&uid2=${goods.sellerid}">购买</a>
				<a href="${pageContext.request.contextPath}/goumai?uid=${user.uid}&gid=${goods.gid}&uid2=0">收藏</a></td>
		</tr>
	</table>
	<br><br>
	<h3>商品留言</h3>
	<table border="1">
		<tr>
			<th>编号</th><th>发送者id</th><th>发送时间</th><th>内容</th>
		</tr>
		<c:forEach items="${commentsList}" var="comments">
		<tr>
			<td>${comments.cid}</td>
			<td>${comments.sendid}</td>
			<td>${comments.sendtime}</td>
			<td>${comments.content}</td>
			<td><a href="${pageContext.request.contextPath}/linto_change_comment?uid=${user.uid}&cid=${comments.cid}&uid2=${comments.sendid}">修改</a></td>
			<td><a href="${pageContext.request.contextPath}/del_comments?uid=${user.uid}&cid=${comments.cid}&uid2=${comments.sendid}">删除</a></td>
		</tr>
		</c:forEach>
	</table>

	<br><br>
	<form:form action="${pageContext.request.contextPath }/comments_up" method="post" modelAttribute="comments">
		留言：<input type="text" name="content"/>
		<input type="text" style="display:none" name="sendid" value="${user.uid}">
		<input type="text" style="display:none" name="goodsid" value="${goods.gid}">
		<form:errors path="*"></form:errors>
		<input type="submit" value="发送"/>
</form:form>
</c:forEach>
</c:forEach>
<input type="button" onclick="javascript:history.back(-1);" value="返回">
</body>
</html>