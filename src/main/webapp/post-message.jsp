<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <jsp:include page="jsinclude.jsp"/>
</head>

<body style="background-color: #e5e5e5e5;">

<jsp:include page="head1.jsp"/>

    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-7 col-md-6 col-lg-12">
                <div class="top-title">
                    <ol class="breadcrumb" id="top-title11">
                        <li> <label class="num">1</label>
                            选择身份类别
                        </li>
                        <span class="glyphicon glyphicon-menu-right"></span>
                        <li> <label class="num" style="background-color: #666;">2</label>
                            填写信息
                        </li>
                        <span class="glyphicon glyphicon-menu-right"></span>
                        <li> <label class="num"  style="background-color: #666;">3</label>
                            完成发布
                        </li>
                    </ol>
                    <div class="choose-lb">
                        <span>请选择你的个体身份类别</span>
                    </div>
                    <div class="main">
                        <c:if test="${FreeMessageNum>0}">
                        <ul>
                            <li><a href="/intellectualTask/IntellectualTaskPost" >知识产权信息（供方）</a></li>
                            <li><a href="/authorizeCompany/AuthorizeCompanyPost">代办公司信息（中介方）</a></li>
                            <li><a href="/taskRelease/TaskReleasePost" >需求任务发布（需方）</a></li>
                        </ul>
                        </c:if>
                        <c:if test="${FreeMessageNum==0}">
                            <p>您可以发布的信息数量已经为：0，请先前往个人中心我的资料页面购买信息发布数量再来发布信息吧</p>
                        </c:if>
                    </div>
                </div>
            
            </div>
        </div>
    </div>
   
   

    <script src="http://code.jquery.com/jquery-1.8.0.min.js"></script>

</body>

</html>