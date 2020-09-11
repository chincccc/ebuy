<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>校园二手交易网</title>
</head>

<body>
    <c:forEach items="${userList}" var="user">
        ID:${user.uid}  昵称:<a href="${pageContext.request.contextPath}/myself?uid=${user.uid}">  ${user.nikename}  </a>
        <a href="${pageContext.request.contextPath}/sign_out">退出登录</a><br>
        <a href="${pageContext.request.contextPath}/linketo_seach?uid=${user.uid}">搜索</a><br><br><br>
        <a href="${pageContext.request.contextPath}/linkto_my_goods?uid=${user.uid}">我上架的商品</a><br>
        <a href="${pageContext.request.contextPath}/linkto_my_start?uid=${user.uid}">我收藏的商品</a><br>
        <a href="${pageContext.request.contextPath}/my_orders?type=1&uid=${user.uid}">我买到的商品</a><br>
        <a href="${pageContext.request.contextPath}/my_orders?type=0&uid=${user.uid}">我卖出的商品</a><br><br>
        <a href="${pageContext.request.contextPath}/input?input_type=1&uid=${user.uid}">上架新的商品</a><br><br>

    已隐藏已售空或不再出售商品
    <table border="1">
        <tr>
            <th>编号</th><th>卖家编号</th><th>物品名</th><th>价格</th><th>上架时间</th><th>商品介绍</th><th>操作</th>
        </tr>
        <c:forEach items="${goodsList}" var="goods">
            <tr>
                <td><a href="${pageContext.request.contextPath}/xianqin_goods?uid=${user.uid}&gid=${goods.gid}">  ${goods.gid} </a></td>
                <td><a href="${pageContext.request.contextPath}/xianqin?uid=${user.uid}&uid2=${goods.sellerid}">  ${goods.sellerid} </a></td>
                <td>${goods.gname}</td>
                <td>${goods.price}</td>
                <td>${goods.createtime}</td>
                <td>${goods.content}</td>
                <td><a href="${pageContext.request.contextPath}/goumai?uid=${user.uid}&gid=${goods.gid}&uid2=${goods.sellerid}">购买</a>
                    <a href="${pageContext.request.contextPath}/goumai?uid=${user.uid}&gid=${goods.gid}&uid2=0">收藏</a></td>
            </tr>
        </c:forEach>
    </table>
    </c:forEach>
</body>
</html>
