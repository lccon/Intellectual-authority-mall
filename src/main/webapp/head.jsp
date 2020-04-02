
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
        <ul class="grzx">
            <li>
                <a href="/userCenter">个人中心</a>
            </li>
        </ul>
</c:if>
        <c:if test="${userRealName!=null}">
        <ul>
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
        <div class="navbar-header">
            <a href="/" class="navbar-brand logo" style="margin-top:7px;margin-bottom: 7px;"><img src="${pageContext.request.contextPath}/img/login1.ico" alt="公司logo"></a>
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
                <span>导航</span>
            </button>
        </div>
        <div class="collapse navbar-collapse" id="navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li id="li1"><a href="/"><span class="glyphicon glyphicon-home"></span> 首页</a></li>
                <li id="li1"><a href="/intellectualTask/findpageIntellectualTaskForList"> 知识产权商城</a></li>
                <li id="li1"><a href="/authorizeCompany/findpageauthorizeCompanyForList"> 代办公司</a></li>
                <li id="li1"><a href="/taskRelease/findpageTaskReleaseForList?taskCategory=1"> 最新发布</a></li>
                <li id="li1"><a href="/post-message"> 任务发布</a></li>
                <li id="li1"><a href="/policyAdvice/findpagepolicyAdviceForList"> 政策资讯</a></li>
                <li id="li1"><a href="/about.jsp"><span class="glyphicon glyphicon-question-sign"></span> 关于我们</a></li>
            </ul>
        </div>
    </div>
</nav>
</body>
</html>
