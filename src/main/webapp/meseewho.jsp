<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<jsp:include page="jsinclude.jsp"/>
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
            <li id="title">我看过谁</li>
        </ul>
    </div>
    <c:if test="${meSeeWhoVO.intellectualTaskList==null && meSeeWhoVO.taskReleaseList==null && meSeeWhoVO.authorizeCompanyList==null}">
        <div class="info">
            <ul style="margin-left: 30px;">
                <strong style="margin-left: 150px;">
                    <i style="margin:0;" id="icon" class="glyphicon glyphicon-info-sign"></i>
                    您还没有浏览信息
                </strong>
                <li style="margin-left: 174px;">去<a style="color: #f46;" href="/">首页</a>随便逛逛，看看大家都在发些什么信息</li>
            </ul>
        </div>
    </c:if>
    <c:if test="${meSeeWhoVO.intellectualTaskList.size() > 0}">

        <div style="margin-top: 50px;margin-left: 0;">
            <div class="container">
                <c:forEach items="${meSeeWhoVO.intellectualTaskList}" var="u">
                    <div id="product1" class="product" style="height: 200px;width: 960px;margin-top:20px;">
                        <div class="row">
                            <div class="col-xs-10 col-sm-5 col-md-4 col-lg-10">
                                <div class="media-body" id="caps">
                                    <a style="width:300px;" href="/intellectualTask/getIntellectualTaskById?id=${u.id}">${u.productName }</a>
                                    <p class="desc">${u.productBrief }</p>
                                    <p id="price">价格面议</p>
                                    <p class="desc">浏览量：${u.browseVolume}</p>
                                </div>
                            </div>
                            <c:if test="${u.hasCollectedState!=1}">
                            <div style="margin: 95px 20px 20px 20px;">
                                <a class="collect" href="javascript:void(0);" onclick="addcollect(1,${u.id})">收藏</a>
                            </div>
                            </c:if>
                            <c:if test="${u.hasCollectedState==1}">
                                <div style="margin: 95px 20px 20px 20px;">
                                    <span class="collect" href="javascript:void(0);">已收藏</span>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </c:if>
    <c:if test="${meSeeWhoVO.authorizeCompanyList.size()>0}">
        <div style="margin-top: 50px;">
            <div class="container">
                <c:forEach items="${meSeeWhoVO.authorizeCompanyList}" var="u">
                    <div id="product1" class="product" style="height: 200px;width: 960px;margin-top:20px;">
                        <div class="row">
                            <div class="col-xs-10 col-sm-5 col-md-4 col-lg-10">
                                <div class="media-body" id="caps">
                                    <a href="/authorizeCompany/getAuthorizeCompanyById?id=${u.id}">${u.companyName }</a>
                                    <p id="desc">${u.companyDescribe }</p>
                                    <p class="desc">浏览量：${u.browseVolume}</p>
                                </div>
                            </div>
                            <c:if test="${u.hasCollectedState!=1}">
                                <div style="margin: 95px 20px 20px 20px;">
                                    <a class="collect"  href="javascript:void(0);" onclick="addcollect(2,${u.id})">收藏</a>
                                </div>
                            </c:if>
                            <c:if test="${u.hasCollectedState==1}">
                                <div style="margin: 95px 20px 20px 20px;">
                                    <span class="collect"  href="javascript:void(0);">已收藏</span>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </c:if>
    <c:if test="${meSeeWhoVO.taskReleaseList.size()>0}">
        <div style="margin-top: 50px;">
            <div class="container">
                <c:forEach items="${meSeeWhoVO.taskReleaseList}" var="u">
                    <div id="product1" class="product" style="height: 200px;width: 960px;margin-top:20px;">
                        <div class="row">
                            <div class="col-xs-10 col-sm-5 col-md-4 col-lg-10">
                                <div class="media-body" id="caps">
                                    <a href="/taskRelease/getTaskReleaseById?id=${u.id}">${u.purpose }</a>
                                    <p id="desc">${u.detailedDesc }</p>
                                    <p class="desc">浏览量：${u.browseVolume}</p>
                                </div>
                            </div>
                            <c:if test="${u.hasCollectedState!=1}">
                                <div style="margin: 95px 20px 20px 20px;">
                                    <a class="collect"  href="javascript:void(0);" onclick="addcollect(3,${u.id})">收藏</a>
                                </div>
                            </c:if>
                            <c:if test="${u.hasCollectedState==1}">
                                <div style="margin: 95px 20px 20px 20px;">
                                    <span class="collect"  href="javascript:void(0);">已收藏</span>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </c:if>
</div>
<script>
    //填加收藏
    function addcollect(moduleType,id) {
        var a=document.getElementById("addcollect");
        var abc=document.getElementById("abc");
        $.ajax({
            type:"POST",
            url: "/businessCollected/addBusinessCollected?moduleType="+moduleType+"&moduleTypeId="+id,
            cache:false,
            contentType: false,
            processData: false,
            success: function(result) {
                if(result){
                    window.location.hash="/businessBrowse/getMeSeeWho";
                    loadContent("/businessBrowse/getMeSeeWho");
                    console.log("${u.hasCollectedState}")
                }
                else {
                    console.log("新增失败");
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
                $contentWrapper.html(rst);
            }
        })
    }

</script>
</body>

</html>