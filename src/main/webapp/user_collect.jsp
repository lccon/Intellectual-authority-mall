<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <title>项目实战</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/usercenter.css">
    <link rel="stylesheet" href="css/spro.css">
    <script src="js/jquery.min.js" type="text/javascript"></script>
</head>
<style>
    .collect{
        float: right;
        padding: .5em 2em;
        color: #f46;
        border: 1px solid #f46;
        border-radius: 2px;
        text-decoration: none;
        -webkit-transition: all 217ms ease;
        transition: all 217ms ease;
    }
</style>
<body>
<div id="center11">
<div style="width:80px;">
    <ul>
        <li id="title">我的收藏</li>
    </ul>
    <ul id="title2">
        <li data-url="/businessCollected/findBusinessCollectedForPage?moduleType=1" ><a  class="item-inner" href="javascript:void(0);">知识产权商城</a></li>
        <li data-url="/businessCollected/findBusinessCollectedForPage?moduleType=2" ><a  class="item-inner" href="javascript:void(0);">代办公司</a></li>
        <li data-url="/businessCollected/findBusinessCollectedForPage?moduleType=3" ><a  class="item-inner" href="javascript:void(0);">任务发布</a></li>
    </ul>
</div>
    <c:if test="${gridPage.rows.size() == 0}">
<div class="info">
    <ul style="margin-left: 30px;">
        <strong style="margin-left: 150px;">
            <i style="margin:0;" id="icon" class="glyphicon glyphicon-info-sign"></i>
            您还没有收藏信息
        </strong>
        <li style="margin-left: 174px;">去<a style="color: #f46;" href="#">首页</a>随便逛逛，看看大家都在发些什么信息</li>
    </ul>
</div>
    </c:if>
<c:if test="${gridPage.rows.size() > 0}">

<div style="margin-top: 50px;">
    <c:forEach items="${gridPage.rows}" var="u">
    <div id="product1" class="product" style="height: 100px;">
        <div class="row">
            <div class="col-xs-10 col-sm-5 col-md-4 col-lg-10">
                <div class="media">
                    <div class="media-body" id="caps" >
                        <div style="width: 360px; float: left;">
                            <a href="#">${u.collectedContent}</a>
                        </div>
                        <div style="width: 300px; float: left; margin-top: 50px;">
                            <p id="desc">收藏于<fmt:formatDate value="${u.collectedDate}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
                        </div>
                    </div>

                </div>

            </div>
            <div style="margin: 50px 20px 20px 20px;">
                <a class="collect" href="javascript:void(0);" onclick="deletecollect(${u.userId},${u.moduleType},${u.moduleTypeId})">取消收藏</a>
            </div>
        </div>
    </div>
    </c:forEach>
</div>
</c:if>
</div>
<script>
    function deletecollect(userid,moduletype,moduletypeid) {
        $.ajax({
            type:"POST",
            url: "/businessCollected/deleteBusinessCollected?userId="+userid+"&moduleType="+moduletype+"&moduleTypeId="+moduletypeid,
            async : false,
            data:{type:1},
            timeout:1000,
            success: function(result) {
                if(result){
                    console.log(userid,moduletype,moduletypeid);
                    console.log("删除成功");
                    $("#product1").html("user_collect");
                }
                else {
                    console.log("删除失败");
                }

            },
        })
    }
    var $contentWrapper = $('#center11')

    var loadContent = function(path) {
        path = path || location.hash

        $.ajax({
            url : path,
            success : function(rst) {
                $contentWrapper.html(rst)
            }
        })
    }



    $('#title2').on('click','li', function() {
        var $elmLink = $(this);
        var link = $elmLink.data('url');
        console.log($elmLink,link)
        if(!link || link == ''){
            return;
        }
        window.location.hash = link;
        loadContent(link);
    })

</script>
</body>

</html>