<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
</head>
<body>
<div class="rightguanggao" style="margin-top:130px;">
        <c:forEach items="${rightadv}" begin="0" end="14" step="1" var="i">
                <a href="http://${i.addressUrl}" target="_blank" class="thumbnail" style="margin-bottom: 0;">
                    <img src="${i.sitePictureUrl.split(",")[0]}">
                </a>
        </c:forEach>
</div>
<div class="leftguanggao">
        <c:forEach items="${leftadv}" var="i" begin="0" end="4" step="1">
            <a href="http://${i.addressUrl}" target="_blank" class="thumbnail"  style="margin-bottom: 0;">
                <img src="${i.sitePictureUrl.split(",")[0]}" >
            </a>
        </c:forEach>
</div>



</body>
</html>
