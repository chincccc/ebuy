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

<c:forEach items="${goodsList}" var="goods">
	<div style ="border:solid 1px red;  ">
		<form:form action="${pageContext.request.contextPath }/change_goods_fun" method="post" modelAttribute="goods">
			商品编号：<input type="text" name="gid" value="${goods.gid}" style="display:none"/>${goods.gid}<br>
			商品名：<input type="text" name="gname" value="${goods.gname}"/><br>
			价格：<input type="text" name="price" value="${goods.price}"/><br>
			售卖状态(可售1/不出售0)：${goods.sellstaus}<select name="sellstaus">
			<option value ="1">可售</option>
			<option value ="0">不出售</option>
			</select><br>
			创建时间：<input type="text" name="createtime" value="${goods.createtime}" style="display:none"/>${goods.createtime}<br>
			卖家编号:<input type="text" name="sellerid" value="${goods.sellerid}" style="display:none"/>${goods.sellerid}<br>
			商品介绍：<input type="text" name="content" value="${goods.content}"/><br>
			<form:errors path="*"></form:errors>
			<input type="submit" value="确认修改"/>
		</form:form>
	</div>
</c:forEach>
<input type="button" onclick="javascript:history.back(-1);" value="返回">
</body>
</html>