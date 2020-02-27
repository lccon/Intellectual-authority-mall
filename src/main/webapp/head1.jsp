
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
                    <a href="/usercenter.jsp">个人中心</a>
                </li>
            </ul>
        </c:if>
        <ul style="margin:0;">
            <li>
                <c:if test="${userRealName!=null}">
                    <a href="/usercenter.jsp"><span class="glyphicon glyphicon-user"></span>${userRealName}</a>
                    <a class="quit" href="/admin/userlogout">退出</a>
                </c:if>
                <c:if test="${userRealName==null}">
                    <a href="/login.jsp"><span class="glyphicon glyphicon-user"></span>登录</a>/
                    <a href="/register.jsp">注册</a>
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
</body>
</html>
