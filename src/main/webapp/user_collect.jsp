<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
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
<div>
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
    <ul>
        <strong>
            <i style="margin:0;" id="icon" class="glyphicon glyphicon-info-sign"></i>
            您还没有收藏信息
        </strong>
        <li>去<a style="color: #f46;" href="/">首页</a>随便逛逛，看看大家都在发些什么信息</li>
    </ul>
</div>
    </c:if>
<c:if test="${gridPage.rows.size() > 0}">

<div style="margin-top: 30px;margin-left: 0;">
    <c:forEach items="${gridPage.rows}" var="u">
    <div id="product1" class="product" style="width: 960px;height: 100px;margin-left:20px;">
                <div class="media">
                    <div class="collectcap">
                        <div style="float: left;">
                            <c:if test="${u.moduleType==1}">
                            <a style="width:230px;" href="/intellectualTask/getIntellectualTaskById?id=${u.moduleTypeId}">${u.collectedContent}</a>
                            </c:if>
                            <c:if test="${u.moduleType==2}">
                                <a style="width:230px;" href="/authorizeCompany/getAuthorizeCompanyById?id=${u.moduleTypeId}">${u.collectedContent}</a>
                            </c:if>
                            <c:if test="${u.moduleType==3}">
                                <a style="width:230px;" href="/taskRelease/getTaskReleaseById?id=${u.moduleTypeId}">${u.collectedContent}</a>
                            </c:if>
                        </div>
                        <div style="float: left; margin-top: 50px;">
                            <p class="collecttime" style="width:200px;">收藏于<fmt:formatDate value="${u.collectedDate}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
                        </div>
                    </div>
            <div style="margin: 30px 30px 20px 70px;">
                <a class="collect" href="javascript:void(0);" onclick="deletecollect(${u.userId},${u.moduleType},${u.moduleTypeId})">取消收藏</a>
            </div>
        </div>
    </div>
    </c:forEach>
</div>
    <div class="container">
        <div class="row pad-15">
            <div class="col-md-12">
                <nav class="pagination-outer" aria-label="Page navigation">
                    <ul class="pagination">
                        <div id="demo2-1"></div>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
    <script>
        layui.use(['laypage', 'layer'], function(){
            var laypage = layui.laypage
                ,layer = layui.layer;
            laypage.render({
                elem: 'demo2-1',
                count: ${gridPage.records},
                limit:  15,
                theme: '#FF5722',
                curr:${gridPage.page},
                jump: function(obj, first){
                    //首次不执行
                    if(!first){
                        window.location.hash =link+"&page="+obj.curr;
                        loadContent(link+"&page="+obj.curr);
                        //do something
                    }
                }
            });
        });
    </script>
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
                    $("#product1").html(loadContent("/businessCollected/findBusinessCollectedForPage?moduleType="+moduletype));
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

    var link;
    $('#title2').on('click','li', function() {
        var $elmLink = $(this);
        link = $elmLink.data('url');
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