
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <jsp:include page="/admin/baseInclude.jsp" />
</head>

<body>
<!--网页头部-->
<
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
        <ul>
            <li>
                <c:if test="${userRealName!=null}">
                    <a href="/userCenter"><span class="glyphicon glyphicon-user"></span>${userRealName}</a>
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
            <a href="/" class="navbar-brand logo"><img src="#" alt="公司logo"></a>
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="collapse navbar-collapse" id="navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li id="li1"><a href="/"><span class="glyphicon glyphicon-home"></span> 首页</a></li>
                <li id="li1"><a href="/intellectualTask/findpageIntellectualTaskForList"> 知识产权商城</a></li>
                <li id="li1"><a href="/authorizeCompany/findpageauthorizeCompanyForList"> 代办公司</a></li>
                <li id="li1"><a href="/taskRelease/findpageTaskReleaseForList"> 任务发布</a></li>
                <li id="li1"><a href="/policyAdvice/findpagepolicyAdviceForList"> 政策资讯</a></li>
                <li id="li1"><a href="/about.jsp"><span class="glyphicon glyphicon-question-sign"></span> 关于我们</a></li>
            </ul>
        </div>
    </div>
</nav>

</body>
</html>
