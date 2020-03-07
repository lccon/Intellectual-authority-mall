<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
</head>
<body>
<script>
    $.ajax({
        type:"POST",
        url: "/advertising?siteType=4",
        datatype:"JSON",
        success: function(data) {
            for(var i=0;i<=14;i++){
                document.getElementById(i+"righta").href="http://"+data[i].addressUrl;
                document.getElementById(i+"rightimg").src=data[i].sitePictureUrl.split(",")[0]
            }
        },
    })
    $.ajax({
        type:"POST",
        url: "/advertising?siteType=3",
        datatype:"JSON",
        success: function(data) {
            for(var i=0;i<=4;i++){
                document.getElementById(i+"lefta").href="http://"+data[i].addressUrl;
                document.getElementById(i+"leftimg").src=data[i].sitePictureUrl.split(",")[0]
            }
        },
    })

</script>
<div class="rightguanggao" style="margin-top:130px;">
        <c:forEach begin="0" end="14" step="1" var="i">
                <a href="" target="_blank" class="thumbnail" id="${i}righta" style="margin-bottom: 0;">
                    <img src="" id="${i}rightimg">
                </a>
        </c:forEach>
</div>
<div class="leftguanggao">
        <c:forEach var="i" begin="0" end="4" step="1">
            <a href="" target="_blank" class="thumbnail" id="${i}lefta" style="margin-bottom: 0;">
                <img src="" id="${i}leftimg">
            </a>
        </c:forEach>
</div>



</body>
</html>
