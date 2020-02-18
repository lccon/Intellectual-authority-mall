<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<head>
    <jsp:include page="jsinclude.jsp"/>
</head>

<body onload="url1()">
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
            <c:forEach items="${IntellectualTask}" var="u">
                <div class="product">
                    <div class="row">
                        <div class="col-xs-12 col-sm-7 col-md-6 col-lg-12">
                            <div class="media" style="width: 1150px;">
                                <div class="media-left">
                                    <a href="/intellectualTask/getIntellectualTaskById?id=${u.id}"><img  id="intellimg${u.id}" style="max-width:450px;max-height: 190px;" src="" class="media-object" alt=""></a>
                                </div>
                                <div class="media-body" id="caps">
                                    <a href="/intellectualTask/getIntellectualTaskById?id=${u.id}">${u.productName }</a>
                                    <p id="desc">${u.productBrief }</p>
                                    <p id="price">1800元</p>
                                    <p id="desc">浏览量：100</p>
                                </div>
                                <script type="text/javascript">
                                    function url1() {
                                        var url11="${u.productPictureUrl}".split(",");
                                        var img1=document.getElementById("intellimg${u.id}");
                                        img1.src="${pageContext.request.contextPath}"+url11[0];
                                    }
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="warp">
                        <a id="abc" href="javascript:void(0);" onclick="addcollect();" class="label label-primary bstreedit">收藏<span id="addcollect" class="glyphicon glyphicon-heart-empty"></span></a>
                        <script>
                            function addcollect() {
                                var a=document.getElementById("addcollect");
                                var abc=document.getElementById("abc");
                                $.ajax({
                                    type:"POST",
                                    url: "/businessCollected/addBusinessCollected?moduleType=1&moduleTypeId=${u.id}",
                                    cache:false,
                                    contentType: false,
                                    processData: false,
                                    success: function(result) {
                                        if(result){
                                            a.class="glyphicon glyphicon-heart";
                                            abc.innerText="收藏成功";
                                            console.log(a.class);
                                        }
                                        else {
                                            console.log("456");
                                        }

                                    },
                                })
                            }
                        </script>
                        <a class="label label-primary bstreedit">置顶<span class="glyphicon glyphicon-chevron-up"></span></a>
                    </div>
                </div>
            </c:forEach>
            <c:forEach items="${AuthorizeCompanylist}" var="u">
                <div class="product">
                    <div class="row">
                        <div class="col-xs-12 col-sm-7 col-md-6 col-lg-12">
                            <div class="media" style="width: 1150px;">
                                <div class="media-left">
                                    <a href="/authorizeCompany/getAuthorizeCompanyById?id=${u.id}"><img  id="authimg${u.id}" style="max-width:450px;max-height: 190px;" src="" class="media-object" alt=""></a>
                                </div>
                                <div class="media-body" id="caps">
                                    <a href="/authorizeCompany/getAuthorizeCompanyById?id=${u.id}">${u.companyName }</a>
                                    <p id="desc">${u.companyDescribe }</p>
                                    <p id="desc">浏览量：100</p>
                                </div>
                                <script type="text/javascript">
                                    function url1() {
                                        var url11="${u.companyPictureUrl}".split(",");
                                        var img1=document.getElementById("authimg${u.id}");
                                        img1.src="${pageContext.request.contextPath}"+url11[0];
                                    }
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="warp">
                        <a id="abc" href="javascript:void(0);" onclick="addcollect();" class="label label-primary bstreedit">收藏<span id="addcollect" class="glyphicon glyphicon-heart-empty"></span></a>
                        <script>
                            function addcollect() {
                                var a=document.getElementById("addcollect");
                                var abc=document.getElementById("abc");
                                $.ajax({
                                    type:"POST",
                                    url: "/businessCollected/addBusinessCollected?moduleType=2&moduleTypeId=${u.id}",
                                    cache:false,
                                    contentType: false,
                                    processData: false,
                                    success: function(result) {
                                        if(result){
                                            a.class="glyphicon glyphicon-heart";
                                            abc.innerText="收藏成功";
                                            console.log(a.class);
                                        }
                                        else {
                                            console.log("456");
                                        }

                                    },
                                })
                            }
                        </script>
                        <a class="label label-primary bstreedit">置顶<span class="glyphicon glyphicon-chevron-up"></span></a>
                    </div>
                </div>
            </c:forEach>

            <c:forEach items="${TaskRelease}" var="u">
                <div class="product">
                    <div class="row">
                        <div class="col-xs-12 col-sm-7 col-md-6 col-lg-12">
                            <div class="media" style="width: 1150px;">
                                <div class="media-left">
                                    <a href="/taskRelease/getTaskReleaseById?id=${u.id}"><img  id="taskimg${u.id}" style="max-width:450px;max-height: 190px;" src="" class="media-object" alt=""></a>
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
                        <script>
                            function addcollect() {
                                var a=document.getElementById("addcollect");
                                var abc=document.getElementById("abc");
                                $.ajax({
                                    type:"POST",
                                    url: "/businessCollected/addBusinessCollected?moduleType=3&moduleTypeId=${u.id}",
                                    cache:false,
                                    contentType: false,
                                    processData: false,
                                    success: function(result) {
                                        if(result){
                                            a.class="glyphicon glyphicon-heart";
                                            abc.innerText="收藏成功";
                                            console.log(a.class);
                                        }
                                        else {
                                            console.log("456");
                                        }

                                    },
                                })
                            }
                        </script>
                        <a class="label label-primary bstreedit">置顶<span class="glyphicon glyphicon-chevron-up"></span></a>
                    </div>
                </div>
            </c:forEach>
        </div>

    </div>


    <div class="container">
        <ul class="pagination">

            <c:if test="${requestScope.pagemsg.currPage != 1}">
                <li>
                    <a href="${pageContext.request.contextPath }/intellectualTask/findpageIntellectualTaskForList?currentPage=1">[首页]</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath }/intellectualTask/findpageIntellectualTaskForList?currentPage=${requestScope.pagemsg.currPage-1}">&laquo;</a>
                </li>
            </c:if>


            <c:if test="${requestScope.pagemsg.currPage != requestScope.pagemsg.totalPage}">
                <li>
                    <a href="${pageContext.request.contextPath }/intellectualTask/findpageIntellectualTaskForList?currentPage=${requestScope.pagemsg.currPage+1}">&raquo;</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath }/intellectualTask/findpageIntellectualTaskForList?currentPage=${requestScope.pagemsg.totalPage}">[尾页]</a>
                </li>
            </c:if>
            <li>
                <span>第${requestScope.pagemsg.currPage }/ ${requestScope.pagemsg.totalPage}页</span>
                <span>总记录数：${requestScope.pagemsg.totalCount }  每页显示:${requestScope.pagemsg.pageSize}</span>
            </li>
        </ul>
    </div>
</div>
<div class="container">
    <div class="row pad-15">
        <div class="col-md-12">
            <nav class="pagination-outer" aria-label="Page navigation">
                <ul class="pagination">
                    <li class="page-item">
                        <a href="${pageContext.request.contextPath }/intellectualTask/findpageIntellectualTaskForList?currentPage=${requestScope.pagemsg.currPage-1}" class="page-link" aria-label="Previous">
                            <span aria-hidden="true">«</span>
                        </a>
                    </li>
                    <li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath }/intellectualTask/findpageIntellectualTaskForList?currentPage=1">1</a></li>
                    <c:forEach var="i" begin="2" end="${requestScope.pagemsg.totalCount }" step="1">
                        <li class="page-item">
                            <a class="page-link" href="javascript:void(0);" onclick="aaa(${i})">${i}</a>
                        </li>
                    </c:forEach>
                    <li class="page-item">
                        <a href="${pageContext.request.contextPath }/intellectualTask/findpageIntellectualTaskForList?currentPage=${requestScope.pagemsg.currPage+1}" class="page-link" aria-label="Next">
                            <span aria-hidden="true">»</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
<!--网页底部-->
<jsp:include page="footer.jsp" />

<script>
    $(document).ready(function(){
        $('.pagination li').click(function(){
            $(this).addClass('active').siblings().removeClass("active");
            console.log("111");
        });
    })
</script>
<script>
    function aaa(path) {
        var $contentWrapper = $('#center11')
        $.ajax({
            url : "${pageContext.request.contextPath }/intellectualTask/findpageIntellectualTaskForList?currentPage="+path,
            success : function(rst) {
                $contentWrapper.html(rst)
                url1();
            }
        })
    }
</script>
</body>

</html>