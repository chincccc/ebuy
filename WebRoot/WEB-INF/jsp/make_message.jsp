<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的订单</title>
	<style>
		body{text-align:center;}
		div{float: left;text-align:center;}
		#left{
			height:400px;
			width:599px;
			border-style:solid solid none none;
			border-style-width:2px;
			border-color:#ddd;
		}
		#right{
			padding-left:50%;
			margin-left:-6px;
			width:599px;
			height:400px;
			border-style:solid none none none;
			border-style-width:1px;
			border-color:#ddd;
			position:absolute;
		}
	</style>
</head>

<body>
<c:forEach items="${userList1}" var="user1">
<c:forEach items="${userList2}" var="user2">

<div id="left">
	我收到的
	<table border="1">
		<h2>${user2.nikename}</h2>
			<tr>
			<th>内容</th><th>发送时间</th>
		</tr>
		<c:forEach items="${massagesList2}" var="massages2">
			<tr>
				<td>${massages2.content}</td>
				<td>${massages2.sendtime}</td>
			</tr>
		</c:forEach>
	</table>
</div>

<div id="right">
	我发送的
	<table border="1">
		<h2>我 ${user1.nikename}</h2>
		<tr>
			<th>内容</th><th>发送时间</th>
		</tr>
		<c:forEach items="${massagesList1}" var="massages1">
		<tr>
			<td>${massages1.content}</td>
			<td>${massages1.sendtime}</td>
		</tr>
		</c:forEach>
	</table>
	<form:form action="${pageContext.request.contextPath }/add_messages" method="post" modelAttribute="messages">
		<input type="text" style="display:none" name="sendid" value=${user1.uid}>
		<input type="text" style="display:none" name="getid" value=${user2.uid}>
		<input type="text" name="content"/><br><br>
		<input type="submit" value="发送"/>
	</form:form>
	<br>
	<a href="${pageContext.request.contextPath }/back_home?uid=${user1.uid}">返回首页</a>
</div>

<div id="bottom">

</div>

</c:forEach>
</c:forEach>

</body>
</html>