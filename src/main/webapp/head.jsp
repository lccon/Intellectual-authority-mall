<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>

<body>
<!--网页头部-->
<nav class="navbar navbar-default navbar-fixed-top">
    <div id="login">
        <ul>
            <li>
                <a href=#>个人中心</a>
            </li>
        </ul>
        <ul>
            <li>
                <a href="#"><span class="glyphicon glyphicon-user"></span>用户名1234567</a>/
                <a href="#"><span class="glyphicon glyphicon-user"></span>登录</a>/
                <a href="#">注册</a>
            </li>

        </ul>
    </div>
    <div class="container">
        <div class="navbar-header">
            <a href="index.jsp" class="navbar-brand logo"><img src="#" alt="公司logo"></a>
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="collapse navbar-collapse" id="navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li id="li1"><a href="\index.jsp"><span class="glyphicon glyphicon-home"></span> 首页</a></li>
                <li id="li1"><a href="\intellectualTask/findIntellectualTaskForList"> 知识产权商城</a></li>
                <li id="li1"><a href="#"> 代办公司</a></li>
                <li id="li1"><a href="#"> 任务发布</a></li>
                <li id="li1"><a href="#"> 政策资讯</a></li>
                <li id="li1"><a href="\about.jsp"><span class="glyphicon glyphicon-question-sign"></span> 关于我们</a></li>
            </ul>
        </div>
    </div>
</nav>

</body>
</html>
