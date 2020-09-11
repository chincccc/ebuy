<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach items="${userList}" var="user">
<table border="1">
	<tr>
		<th>编号</th><th>卖家编号</th><th>买家编号</th><th>物品名</th><th>价格</th><th>售卖状态(可售1/已售0)</th><th>上架时间</th><th>商品详情</th>
	</tr>
	<c:forEach items="${goodsList}" var="goods">
		<tr>
			<td>${goods.gid}</td>
			<td>${goods.sellerid}</td>
			<td>${user.uid}</td>
			<td>${goods.gname}</td>
			<td>${goods.price}</td>
			<td>${goods.sellstaus}</td>
			<td>${goods.createtime}</td>
			<td>${goods.content}</td>
		</tr>

</table>

<form:form action="${pageContext.request.contextPath }/buy" method="post" modelAttribute="orders">
	<input type="text" style="display:none" name="sellerid" value=${goods.sellerid}>
	<input type="text" style="display:none" name="buyid" value=${user.uid}>
	<input type="text" style="display:none" name="gid" value=${goods.gid}>
	<input type="text" style="display:none" name="createtime" value=${goods.createtime}>
	收货地址:<input type="text"  name="address" value=${user.address}>
	<input type="submit" value="确认下单"/>
</form:form>

	</c:forEach>
</c:forEach>
<input type="button" onclick="javascript:history.back(-1);" value="返回">
</body>
</html>