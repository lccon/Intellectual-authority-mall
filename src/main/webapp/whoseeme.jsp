<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
    <link href="${pageContext.request.contextPath}/css/whoseeme.css" rel='stylesheet' type='text/css' />
</head>
<body>
<div id="center11">
    <c:if test="${whoSeeMeVOList==null}">
        <div class="info">
            <ul style="margin-left: 30px;">
                <strong style="margin-left: 150px;">
                    <i style="margin:0;" id="icon" class="glyphicon glyphicon-info-sign"></i>
                    还没有人看过您发布的信息，
                </strong>
                <li style="margin-left: 174px;">您可以去<a style="color: #f46;" href="/">首页</a>随便逛逛，看看大家都在发些什么信息</li>
            </ul>
        </div>
    </c:if>
    <c:if test="${whoSeeMeVOList!=null}">
    <div class="agil-info-calendar">
        <!-- //calendar -->
        <div class="col-xs-8 w3agile-notifications">
            <div class="notifications">
                <!--notification start-->

                <header class="panel-heading">
                    谁看过我
                </header>
                <div class="notify-w3ls">

                        <c:forEach items="${whoSeeMeVOList}" var="u">
                            <div class="alert alert-success">
                                <span class="alert-icon" style="border-radius: 50%;"><img style="width: 40px;height: 40px;border-radius: 50%;" id="${u.createDate}"></span>
                                <script>
                                    var url11="${u.headPortrait}".split(",");
                                    var img1=document.getElementById("${u.createDate}");
                                    img1.src="${pageContext.request.contextPath}"+url11[0];
                                </script>
                                <div class="notification-info">
                                    <ul class="clearfix notification-meta">
                                        <li class="pull-left notification-sender"><span><a href="javascript:void(0);">${u.userName}</a></span> 查看了您发布的信息 </li>
                                        <li class="pull-right notification-time"><fmt:formatDate value="${u.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></li>
                                    </ul>
                                    <p>
                                       ${u.businessContent}
                                    </p>
                                </div>
                            </div>
                        </c:forEach>

                </div>
                <!--notification end-->
            </div>
        </div>
        <div class="clearfix"> </div>
    </div>
    </c:if>
</div>
</body>

</html>