
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/admin/baseInclude.jsp" />
</head>
<body>
<style>
    .quit{
        margin-left: 30px;
    }
</style>
<nav class="navbar navbar-default navbar-fixed-top">
    <div id="login">
        <c:if test="${userRealName!=null}">
            <ul>
                <li>
                    <a href="/userCenter">个人中心</a>
                </li>
            </ul>
        </c:if>
        <ul style="margin:0;">
            <li>
                <c:if test="${userRealName!=null}">
                    <a href="/userCenter"><img src="" class="layui-nav-img" id="headimg">${userRealName}</a>
                    <img src="${pageContext.request.contextPath}/img/daban.png">
                    <script>
                        var url11="${HeadPortrait}".split(",");
                        var headimg=document.getElementById("headimg");
                        headimg.src="${pageContext.request.contextPath}"+url11[0];
                    </script>
                    <a class="quit" href="/admin/userlogout">退出</a>
                </c:if>
                <c:if test="${userRealName==null}">
                    <a href="/login"><span class="glyphicon glyphicon-user"></span>登录</a>/
                    <a href="/register">注册</a>
                </c:if>
            </li>

        </ul>
    </div>
    <div class="container">
        <div class="navbar-header">
            <a href="index.jsp" class="navbar-brand logo"><img src="#" alt="公司logo"></a>
        </div>
    </div>
</nav>
<div style="margin-top:100px;background-color: #e5e5e5e5; margin-top:130px;" >
    <ol class="breadcrumb" style="background-color: #e5e5e5e5;" >
        <li><a href="/">返回首页</a></li>
    </ol>
</div>
</body>
</html>
