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