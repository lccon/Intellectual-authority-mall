<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
    <jsp:include page="jsinclude.jsp"/>
    <link href="${pageContext.request.contextPath}/css/whoseeme.css" rel='stylesheet' type='text/css' />

</head>
<body>
<div id="center11">
    <div class="agil-info-calendar">
        <!-- //calendar -->
        <div class="col-md-10 w3agile-notifications">
            <div class="notifications">
                <!--notification start-->

                <header class="panel-heading">
                    谁看过我
                </header>
                <div class="notify-w3ls">
                    <c:if test="${whoSeeMeVOList.size()>0}">
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
                    </c:if>
                </div>
                <!--notification end-->
            </div>
        </div>
        <div class="clearfix"> </div>
    </div>

</div>
</body>

</html>