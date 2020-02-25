<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <jsp:include page="jsinclude.jsp"/>
</head>

<body style="background-color: #e5e5e5e5;">

<jsp:include page="/admin/baseInclude.jsp" />
<nav class="navbar navbar-default navbar-fixed-top">
    <div id="login">
        <c:if test="${userRealName!=null}">
            <ul>
                <li>
                    <a href="/usercenter.jsp">个人中心</a>
                </li>
            </ul>
        </c:if>
        <ul>
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
<div style="margin-top:100px;background-color: #e5e5e5e5;" >
    <ol class="breadcrumb" style="background-color: #e5e5e5e5;" >
        <li><a href="/">返回首页</a></li>
        <li>信息发布</li>
    </ol>
</div>
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-7 col-md-6 col-lg-12">
                <div class="top-title">
                    <ol class="breadcrumb" style="margin-left:300px; background-color: #e5e5e5e5;">
                        <li> <label class="num">1</label>
                            选择身份类别
                        </li>
                        <span class="glyphicon glyphicon-menu-right"></span>
                        <li> <label class="num" style="background-color: #666;">2</label>
                            选择身份类别
                        </li>
                        <span class="glyphicon glyphicon-menu-right"></span>
                        <li> <label class="num"  style="background-color: #666;">3</label>
                            选择身份类别
                        </li>
                    </ol>
                    <div class="choose-lb">
                        <span>请选择你的个体身份类别</span>
                    </div>
                    <div class="main">
                        <ul>
                            <li><a href="/intellectualTask/IntellectualTaskPost" >知识产权信息（供方）</a></li>
                            <li><a href="/taskRelease/TaskReleasePost">代办公司信息（中介方）</a></li>
                            <li><a href="/authorizeCompany/AuthorizeCompanyPost" >需求任务发布（需方）</a></li>
                        </ul>
                    </div>
                </div>
            
            </div>
        </div>
    </div>
   
   

    <script src="http://code.jquery.com/jquery-1.8.0.min.js"></script>

</body>

</html>