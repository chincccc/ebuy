<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">

	<title>注册</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
<form:form action="${pageContext.request.contextPath }/add" method="post" modelAttribute="user">
	帐号：<input type="text" name="account"/><br><br>
	密码：<input type="text" name="password"/><br><br>
	昵称：<input type="text" name="nikename"/><br><br>
	真实姓名：<input type="text" name="realname"/><br><br>
	性别：<select name="sex">
	<option value ="男">男</option>
	<option value ="女">女</option>
	</select><br><br>
	手机号码：<input type="text" name="phone"/><br><br>
	地址：<input type="text" name="address"/><br><br>
	邮箱：<input type="text" name="email"/><br><br>
	<form:errors path="*"></form:errors><br><br><br>
	<input type="submit" value="注册"/>
</form:form>
</body>
</html>
