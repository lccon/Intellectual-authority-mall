<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<jsp:include page="jsinclude.jsp"/>
</head>
<body>
<div style="text-align: center">
    <p>订单号：${out_trade_no}</p>
    <p>交易号：${trade_no}</p>
    <p>订单金额：${total_amount}</p>
    <p>你的订单支付已经完成，请关闭当前页面返回网站继续操作</p>
</div>

</body>
</html>