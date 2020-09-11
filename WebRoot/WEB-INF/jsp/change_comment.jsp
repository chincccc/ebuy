<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>留言修改</title>
</head>
<body>

<c:forEach items="${commentsList}" var="comment">
	<div style ="border:solid 1px red;  ">
		<form:form action="${pageContext.request.contextPath }/change_comments_fun" method="post" modelAttribute="comment">
			编号：<input type="text" name="cid" value="${comment.cid}" style="display:none"/>${comment.cid}<br>
			发送者编号：<input type="text" name="sendid" value="${comment.sendid}" style="display:none"/>${comment.sendid}<br>
			留言所在商品的编号：<input type="text" name="goodsid" value="${comment.goodsid}" style="display:none"/>${comment.goodsid}<br>
			发送时间：<input type="text" name="sendtime" value="${comment.sendtime}" style="display:none"/>${comment.sendtime}<br>
			内容:<input type="text" name="content" value="${comment.content}" /><br>
			<form:errors path="*"></form:errors>
			<input type="submit" value="确认修改"/>
		</form:form>
	</div>
</c:forEach>
<input type="button" onclick="javascript:history.back(-1);" value="返回">
</body>
</html>