<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	用户信息
	<table border="1">
	<tr>
	<th>编号</th><th>帐号</th><th>昵称</th><th>真名</th><th>性别</th><th>手机号</th><th>地址</th><th>邮件</th>
	</tr>
	<c:forEach items="${userList}" var="user">
	<c:forEach items="${userList2}" var="user2">
	<tr>
		<td>${user.uid}</td>
		<td>${user.account}</td>
		<td>${user.nikename}</td>
		<td>${user.realname}</td>
		<td>${user.sex}</td>
		<td>${user.phone}</td>
		<td>${user.address}</td>
		<td>${user.email}</td>
		<td><a href="${pageContext.request.contextPath}/linkto_message?uid=${user.uid}&uid2=${user2.uid}">私聊</a></td>
	</tr>
	</c:forEach>
	</c:forEach>
	
	</table>
<input type="button" onclick="javascript:history.back(-1);" value="返回">

</body>
</html>