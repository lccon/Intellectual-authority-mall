<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <title>项目实战</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/usercenter.css">
    <link rel="stylesheet" href="css/spro.css">
</head>
<style>
    .collect{
        float: right;
        padding: .5em 2em;
        color: #f46;
        border: 1px solid #f46;
        border-radius: 2px;
        text-decoration: none;
        -webkit-transition: all 217ms ease;
        transition: all 217ms ease;
    }
</style>
<body>
<div style="width:80px;">
    <ul>
        <li id="title">我的收藏</li>
    </ul>
</div>
<div class="info">

    <ul style="margin-left: 30px;">
        <strong style="margin-left: 150px;">
            <i style="margin:0;" id="icon" class="glyphicon glyphicon-info-sign"></i>
            您还没有收藏信息
        </strong>
        <li style="margin-left: 174px;">去<a style="color: #f46;" href="#">首页</a>随便逛逛，看看大家都在发些什么信息</li>
    </ul>

</div>
<div style="margin-top: 50px;">
    <c:forEach items="${gridPage.rows}" var="u">
    <div class="product" style="height: 100px;">
        <div class="row">
            <div class="col-xs-10 col-sm-5 col-md-4 col-lg-10">
                <div class="media">
                    <div class="media-body" id="caps" >
                        <div style="width: 360px; float: left;">
                            <a href="#">${u.collectedContent}</a>
                        </div>
                        <div style="width: 300px; float: left; margin-top: 50px;">
                            <p id="desc">收藏于<fmt:formatDate value="${u.collectedDate}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
                        </div>
                    </div>

                </div>

            </div>
            <div style="margin: 50px 20px 20px 20px;">
                <a class="collect" href="/businessCollected/deleteBusinessCollected?userId=11&moduleType=1&moduleTypeId=1">取消收藏</a>
            </div>
        </div>
    </div>
    </c:forEach>
</div>
</body>

</html>