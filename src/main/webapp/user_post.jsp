<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <title>项目实战</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/usercenter.css">
    <link rel="stylesheet" href="css/spro.css">
</head>
<body>
<div style="width:80px;">
    <ul>
        <li id="title">我的发布</li>
    </ul>
    <ul id="title2">
        <li>知识产权商城</li>
        <li>代办公司</li>
        <li>需求发布</li>
    </ul>
</div>
<div class="info">

    <ul style="margin-left: 30px;">
        <strong style="margin-left: 150px;">
            <i style="margin:0;" id="icon" class="glyphicon glyphicon-info-sign"></i>
            您还没有发布信息
        </strong>
        <li style="margin-left: 174px;">1.您可以<a style="color: #f46;" href="#">点击这里免费发布</a></li>
        <li style="margin-left: 174px;">2.去<a style="color: #f46;" href="#">首页</a>随便逛逛，看看大家都在发些什么信息</li>
    </ul>

</div>
<div style="margin-top: 50px;">
            <div class="product" style="height: 120px;">
                <div class="row">
                    <div class="col-xs-10 col-sm-5 col-md-4 col-lg-10">
                        <div class="media">
                            <div class="media-body" id="caps">
                                <a style="width: 400px;" href="/taskRelease/getTaskReleaseById?id=${u.id}">中国移动中国移动中国移动中国移动中国移动中国移动中国移动中国移动中国移动中国移动中国移动中国移动</a>
                                <p id="desc">浏览量：100</p>
                                <p id="price">待审核</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
</div>
</body>

</html>