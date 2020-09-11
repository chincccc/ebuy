<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>我的个人信息</title>
</head>
<body>

<c:forEach items="${userList}" var="user">
	<div style ="border:solid 1px red;  ">
		<form:form action="${pageContext.request.contextPath }/change_user" method="post" modelAttribute="user">
			编号：<input type="text" name="uid" value="${user.uid}" style="display:none"/>${user.uid}<br>
			帐号：<input type="text" name="account" value="${user.account}" style="display:none"/>${user.account}<br><br>
			密码：<input type="text" name="password" value="${user.password}"/><br><br>
			昵称：<input type="text" name="nikename" value="${user.nikename}"/><br><br>
			真实姓名：<input type="text" name="realname" value="${user.realname}"/><br><br>
			性别：${user.sex}<select name="sex" value="${user.sex}">
			<option value ="男">男</option>
			<option value ="女">女</option>
			</select><br><br>
			手机号码：<input type="text" name="phone" value="${user.phone}"/><br><br>
			地址：<input type="text" name="address" value="${user.address}"/><br><br>
			邮箱：<input type="text" name="email" value="${user.email}"/><br><br>
			<form:errors path="*"></form:errors>
			<input type="submit" value="确认修改"/>
		</form:form>
	</div>
</c:forEach>
<input type="button" onclick="javascript:history.back(-1);" value="返回">

</body>
</html>