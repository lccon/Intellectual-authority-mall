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
                    <button class="btn btn-default" id="button1">搜索</button>
                    <button class="btn btn-default" id="button2">免费发布信息</button>
                </div>
            </div>

            <div class="container" id="newline">
                <a href="#">关键词</a>
                <a href="#">关键词</a>
                <a href="#">关键词</a>
                <a href="#">关键词</a>
                <a href="#">关键词</a>
            </div>
        </div>
    </div>






    <!--需求列表-->
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
                                    <p id="desc">${u.productBrief }</p>
                                    <p id="price">价格面议</p>
                                    <p id="desc">浏览量：100</p>
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
                        <a id="abc" href="javascript:void(0);" onclick="addcollect();" class="label label-primary bstreedit">收藏<span id="addcollect" class="glyphicon glyphicon-heart-empty"></span></a>
                        <a class="label label-primary bstreedit">置顶<span class="glyphicon glyphicon-chevron-up"></span></a>
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
                                    <p id="desc">${u.companyDescribe }</p>
                                    <p id="desc">浏览量：100</p>
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
                        <a id="abc" href="javascript:void(0);" onclick="addcollect();" class="label label-primary bstreedit">收藏<span id="addcollect" class="glyphicon glyphicon-heart-empty"></span></a>
                        <a class="label label-primary bstreedit">置顶<span class="glyphicon glyphicon-chevron-up"></span></a>
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
                                    <p id="desc">${u.detailedDesc }</p>
                                    <p id="desc">浏览量：100</p>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="warp">
                        <a id="abc" href="javascript:void(0);" onclick="addcollect();" class="label label-primary bstreedit">收藏<span id="addcollect" class="glyphicon glyphicon-heart-empty"></span></a>
                        <a class="label label-primary bstreedit">置顶<span class="glyphicon glyphicon-chevron-up"></span></a>
                    </div>
                </div>
            </c:forEach>
            </c:if>
        </div>
    </div>


</div>

<div class="container">
    <div class="row pad-15">
        <div class="col-md-12">
            <nav class="pagination-outer" aria-label="Page navigation">
                <ul class="pagination">
                    <div id="demo2-2"></div>
                </ul>
            </nav>
        </div>
    </div>
</div>
<script>
    var ss=${SearchBusinessvO.totalRecord}/${SearchBusinessvO.rows}
    var ys=Math.ceil(ss);
    console.log(${SearchBusinessvO.page});
    console.log(${SearchBusinessvO.rows});
    console.log(ys);
    layui.use(['laypage', 'layer'], function(){
        var laypage = layui.laypage
            ,layer = layui.layer;
        laypage.render({
            elem: 'demo2-2',
            count: ${SearchBusinessvO.totalRecord},
            limit: ${SearchBusinessvO.rows},
            theme: '#FF5722',
            curr: ${SearchBusinessvO.page},
            jump: function(obj, first){
                //首次不执行
                if(!first){
                    bbb(obj.curr);
                    //do something
                }
            }
        });
    });
    function bbb(path) {
        var that=$(this);
        var $contentWrapper = $('#center11');
        var $ul1=$('pagination');
        $.ajax({
            url : "/api/getSearchBusinessData?page="+path,
            success : function(rst) {
                $contentWrapper.html(rst);
            }
        })
    }




    //填加收藏
    function addcollect(id) {
        var a=document.getElementById("addcollect");
        var abc=document.getElementById("abc");
        $.ajax({
            type:"POST",
            url: "/businessCollected/addBusinessCollected?moduleType=1&moduleTypeId="+id,
            cache:false,
            contentType: false,
            processData: false,
            success: function(result) {
                if(result){
                    bbb(${requestScope.pagemsg.currPage});
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
                    bbb(${requestScope.pagemsg.currPage});
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