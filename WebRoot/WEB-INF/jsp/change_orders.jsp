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

<c:forEach items="${ordersList}" var="orders">
	<div style ="border:solid 1px red;  ">
		<form:form action="${pageContext.request.contextPath }/change_orders_fun" method="post" modelAttribute="orders">
			订单编号：<input type="text" name="oid" value="${orders.oid}" style="display:none"/>${orders.oid}<br>
			卖家编号：<input type="text" name="sellerid" value="${orders.sellerid}" style="display:none"/>${orders.sellerid}<br>
			买家编号：<input type="text" name="buyid" value="${orders.buyid}" style="display:none"/>${orders.buyid}<br>
			物品编号：<input type="text" name="gid" value="${orders.gid}" style="display:none"/>${orders.gid}<br>
			创建时间：<input type="text" name="createtime" value="${orders.createtime}" style="display:none"/>${orders.createtime}<br>
			创建时间：<input type="text" name="selltime" value="${orders.selltime}" style="display:none"/>${orders.selltime}<br>
			收货地址：<input type="text" name="address" value="${orders.address}"/><br>
			<form:errors path="*"></form:errors>
			<input type="submit" value="确认修改"/>
		</form:form>
	</div>
</c:forEach>
<input type="button" onclick="javascript:history.back(-1);" value="返回">
</body>
</html>