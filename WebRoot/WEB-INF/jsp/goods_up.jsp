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
<form:form action="${pageContext.request.contextPath }/add_goods" method="post" modelAttribute="goods">
	商品名<input type="text" name="gname"/><br><br>
	价格：<input type="text" name="price"/><br><br>
	商品介绍：<input type="text" name="content"/>
	<input type="text" style="display:none" name="sellerid" value=${user.uid}>
	<form:errors path="*"></form:errors><br><br><br>
	<input type="submit" value="上架"/>
</form:form>
</c:forEach>
<input type="button" onclick="javascript:history.back(-1);" value="返回">
</body>
</html>
