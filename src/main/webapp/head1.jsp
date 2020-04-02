
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
            <ul class="grzx">
                <li>
                    <a href="/userCenter">个人中心</a>
                </li>
            </ul>
        </c:if>
        <c:if test="${userRealName!=null}">
        <ul style="margin:0;">
            <li>
                    <a href="/userCenter"><img src="" class="layui-nav-img" id="headimg">${userRealName}</a>
                    <c:if test="${authorizeType==2}">
                        <img src="${pageContext.request.contextPath}/img/daban.png">
                    </c:if>
                    <script>
                        var url11="${HeadPortrait}".split(",");
                        var headimg=document.getElementById("headimg");
                        headimg.src="${pageContext.request.contextPath}"+url11[0];
                    </script>
                    <a class="quit" href="/admin/userlogout">退出</a>
            </li>
        </ul>
        </c:if>
        <c:if test="${userRealName==null}">
            <ul class="dl">
                <li>
                    <a href="/login"><span class="glyphicon glyphicon-user"></span>登录</a>/
                    <a href="/register">注册</a>
                </li>
            </ul>
        </c:if>
    </div>
    <div class="container">
        <div class="navbar-header" style="height:65px;">
            <a href="/" class="navbar-brand logo" style="margin-top:7px;margin-bottom: 7px;"><img src="${pageContext.request.contextPath}/img/login1.ico" alt="公司logo"></a>
        </div>
    </div>
</nav>
</body>
</html>
