<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<head>
    <jsp:include page="jsinclude.jsp"/>
</head>

<body>
<div id="center11">
    <!--网页头部-->
    <jsp:include page="head.jsp" />
    <!--商品行业分类-->
    <div class="container" id="kind1" style="margin-top:100px;">

    </div>
    <!--搜索框-->
    <div class="span"  >
        <div class="container">
            <div class="input-group">
                <input type="text" class="form-control" id="input1" placeholder="默认搜索项">
                <div class="input-group-btn">
                    <a class="btn btn-default" id="button1" href="javascript:void(0);" onclick="findpage()">搜索</a>
                    <script>
                        function findpage() {
                            var a1=document.getElementById("button1");
                            var input1=document.getElementById("input1").value;
                            a1.href="/api/getSearchBusinessData?page=1&rows=40&productName="+input1+"&productBrief="+input1;
                        }
                    </script>
                </div>
            </div>

            <div class="container" id="newline">
                <a href="javascript:void(0);">关键词</a>
                <a href="javascript:void(0);">关键词</a>
                <a href="javascript:void(0);">关键词</a>
                <a href="javascript:void(0);">关键词</a>
                <a href="javascript:void(0);">关键词</a>
            </div>
            <script>
                $("#newline").on("click","a",function () {
                    window.location.href="${pageContext.request.contextPath }/api/getSearchBusinessData?page=1&rows=40&productName="+$(this).text()+"&productBrief="+$(this).text();
                })
            </script>
        </div>
    </div>






    <!--需求列表-->
    <c:if test="${SearchBusinessvO.intellectualTaskList.size()==0 && SearchBusinessvO.authorizeCompanyList.size()==0 && SearchBusinessvO.taskReleaseList.size()==0}">
        <div style="margin-top: 50px;">
            <div class="container" >
                <div class="info">
                    <ul style="margin-left: 30px;">
                        <strong style="margin-left: 150px;">
                            <i style="margin:0;" id="icon" class="glyphicon glyphicon-info-sign"></i>
                            您搜索信息暂未找到
                        </strong>
                        <li style="margin-left: 174px;">你可以继续去<a style="color: #f46;" href="/">首页</a>随便逛逛，浏览其他信息</li>
                    </ul>
                </div>
            </div>
        </div>
    </c:if>
    <div style="margin-top: 50px;">
        <div class="container">
            <c:if test="${SearchBusinessvO.intellectualTaskList.size()>0}">
            <c:forEach items="${SearchBusinessvO.intellectualTaskList}" var="u">
                <div class="product">
                    <div class="row">
                        <div class="col-xs-12 col-sm-7 col-md-6 col-lg-12">
                            <div class="media" style="width: 1150px;">
                                <div class="media-left">
                                    <a href="/intellectualTask/getIntellectualTaskById?id=${u.id}"><img  id="intellimg${u.id}" style="width:250px;height: 170px;" src="" class="media-object" alt=""></a>
                                </div>
                                <div class="media-body" id="caps">
                                    <a href="/intellectualTask/getIntellectualTaskById?id=${u.id}">${u.productName }</a>
                                    <p class="desc">${u.productBrief }</p>
                                    <p id="price">价格面议</p>
                                    <p class="desc">浏览量：${u.browseVolume}</p>
                                </div>
                                <script type="text/javascript">
                                        var url11="${u.productPictureUrl}".split(",");
                                        var img1=document.getElementById("intellimg${u.id}");
                                        img1.src="${pageContext.request.contextPath}"+url11[0];
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="warp">
                        <c:if test="${u.hasCollectedState==0}">
                            <a id="abc" href="javascript:void(0);" onclick="addcollect(1,${u.id});" class="label label-primary bstreedit">收藏<span id="addcollect" class="glyphicon glyphicon-heart-empty"></span></a>
                        </c:if>
                        <c:if test="${u.hasCollectedState==1}">
                            <a id="abc" href="javascript:void(0);" onclick="deletecollect(${UserId},1,${u.id})" class="label label-primary bstreedit">已收藏<span id="addcollect" class="glyphicon glyphicon-heart-empty"></span></a>
                        </c:if>
                    </div>
                </div>
            </c:forEach>
            </c:if>
            <c:if test="${SearchBusinessvO.authorizeCompanyList.size()>0}">
            <c:forEach items="${SearchBusinessvO.authorizeCompanyList}" var="u">
                <div class="product">
                    <div class="row">
                        <div class="col-xs-12 col-sm-7 col-md-6 col-lg-12">
                            <div class="media" style="width: 1150px;">
                                <div class="media-left">
                                    <a href="/authorizeCompany/getAuthorizeCompanyById?id=${u.id}"><img  id="authimg${u.id}" style="width:250px;height: 170px;" src="" class="media-object" alt=""></a>
                                </div>
                                <div class="media-body" id="caps">
                                    <a href="/authorizeCompany/getAuthorizeCompanyById?id=${u.id}">${u.companyName }</a>
                                    <p class="desc1" style="height: 20px;">${u.companyDescribe }</p>
                                    <p class="desc">浏览量：${u.browseVolume}</p>
                                </div>
                                <script type="text/javascript">

                                        var url11="${u.companyPictureUrl}".split(",");
                                        var img1=document.getElementById("authimg${u.id}");
                                        img1.src="${pageContext.request.contextPath}"+url11[0];
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="warp">
                        <c:if test="${u.hasCollectedState==0}">
                            <a id="abc" href="javascript:void(0);" onclick="addcollect(2,${u.id});" class="label label-primary bstreedit">收藏<span id="addcollect" class="glyphicon glyphicon-heart-empty"></span></a>
                        </c:if>
                        <c:if test="${u.hasCollectedState==1}">
                            <a id="abc" href="javascript:void(0);" onclick="deletecollect(${UserId},1,${u.id})" class="label label-primary bstreedit">已收藏<span id="addcollect" class="glyphicon glyphicon-heart-empty"></span></a>
                        </c:if>
                    </div>
                </div>
            </c:forEach>
            </c:if>
            <c:if test="${SearchBusinessvO.taskReleaseList.size()>0}">
            <c:forEach items="${SearchBusinessvO.taskReleaseList}" var="u">
                <div class="product">
                    <div class="row">
                        <div class="col-xs-12 col-sm-7 col-md-6 col-lg-12">
                            <div class="media" style="width: 1150px;">
                                <div class="media-left">
                                    <c:if test="${u.taskCategory==1}">
                                        <a href="/taskRelease/getTaskReleaseById?id=${u.id}"><img style="width:250px;height: 170px;" src="${pageContext.request.contextPath}/img/tab1-1.png" class="media-object" alt=""></a>
                                    </c:if>
                                    <c:if test="${u.taskCategory==2}">
                                        <a href="/taskRelease/getTaskReleaseById?id=${u.id}"><img style="width:250px;height: 170px;" src="${pageContext.request.contextPath}/img/tab1-2.jpg" class="media-object" alt=""></a>
                                    </c:if>
                                </div>
                                <div class="media-body" id="caps">
                                    <a href="/taskRelease/getTaskReleaseById?id=${u.id}">${u.purpose }</a>
                                    <p class="desc1" style="height: 20px;">${u.detailedDesc }</p>
                                    <p class="desc">浏览量：${u.browseVolume}</p>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="warp">
                        <c:if test="${u.hasCollectedState==0}">
                            <a id="abc" href="javascript:void(0);" onclick="addcollect(3,${u.id});" class="label label-primary bstreedit">收藏<span id="addcollect" class="glyphicon glyphicon-heart-empty"></span></a>
                        </c:if>
                        <c:if test="${u.hasCollectedState==1}">
                            <a id="abc" href="javascript:void(0);" onclick="deletecollect(${UserId},1,${u.id})" class="label label-primary bstreedit">已收藏<span id="addcollect" class="glyphicon glyphicon-heart-empty"></span></a>
                        </c:if>
                    </div>
                </div>
            </c:forEach>
            </c:if>
        </div>
    </div>
</div>

<script>
    var d_url=document.location.href.substr(21);
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
                    window.location.href=d_url;
                }
                else {
                    console.log("新增失败");
                }

            },
        })
    }

    //删除收藏
    function deletecollect(userid,moduletype,moduletypeid) {
        $.ajax({
            type:"POST",
            url: "/businessCollected/deleteBusinessCollected?userId="+userid+"&moduleType="+moduletype+"&moduleTypeId="+moduletypeid,
            async : false,
            data:{type:1},
            timeout:1000,
            success: function(result) {
                if(result){
                    console.log("删除成功");
                    window.location.href=d_url;
                }
                else {
                    console.log("删除失败");
                }

            },
        })
    }
</script>
<!--网页底部-->
<jsp:include page="footer.jsp" />
</body>

</html>