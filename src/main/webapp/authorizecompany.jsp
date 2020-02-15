<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<head>
    <jsp:include page="jsinclude.jsp"/>
</head>

<body onload="url1()">
<!--网页头部-->
<jsp:include page="head.jsp" />
<!--商品行业分类-->
<div class="container" id="kind" style="margin-top:100px;">
    <div class="row">
        <div class="col-xs-12 col-sm-7 col-md-6 col-lg-6">
            <ul class="list-inline">
                <li>主办业务分类：</li>
                <li><a href="#">申请专利</a></li>
                <li><a href="#">证书买卖</a></li>
                <li><a href="#">技术成果转让</a></li>
                <li><a href="#">法律咨询</a></li>
            </ul>
        </div>
    </div>
</div>
<!--搜索框-->
<div class="span">
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
        <c:forEach items="${requestScope.pagemsg.lists}" var="u">
            <div class="product">
                <div class="row">
                    <div class="col-xs-12 col-sm-7 col-md-6 col-lg-12">
                        <div class="media" style="width: 1150px;">
                            <script>
                                function url1() {
                                    var url1="${u.companyPictureUrl}".split(",");
                                    var img1=document.getElementById("img1");
                                    img1.src="${pageContext.request.contextPath}"+url1[0];
                                }
                            </script>
                            <div class="media-left">
                                <a href="/authorizeCompany/getAuthorizeCompanyById?id=${u.id}"><img id="img1" style="max-width:450px;max-height: 190px;" src="" class="media-object" alt=""></a>
                            </div>
                            <div class="media-body" id="caps">
                                <a href="/authorizeCompany/getAuthorizeCompanyById?id=${u.id}">${u.companyName }</a>
                                <p id="desc">${u.companyDescribe }</p>
                                <p id="desc">浏览量：100</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="warp">
                    <a class="label label-primary bstreedit">收藏<span class="glyphicon glyphicon-heart-empty"></span></a>
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
                <a href="${pageContext.request.contextPath }/authorizeCompany/findpageauthorizeCompanyForList?currentPage=1">[首页]</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath }/authorizeCompany/findpageauthorizeCompanyForList?currentPage=${requestScope.pagemsg.currPage-1}">&laquo;</a>
            </li>
        </c:if>


        <c:if test="${requestScope.pagemsg.currPage != requestScope.pagemsg.totalPage}">
            <li>
                <a href="${pageContext.request.contextPath }/authorizeCompany/findpageauthorizeCompanyForList?currentPage=${requestScope.pagemsg.currPage+1}">&raquo;</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath }/authorizeCompany/findpageauthorizeCompanyForList?currentPage=${requestScope.pagemsg.totalPage}">[尾页]</a>
            </li>
        </c:if>
        <li>
            <span>第${requestScope.pagemsg.currPage }/ ${requestScope.pagemsg.totalPage}页</span>
            <span>总记录数：${requestScope.pagemsg.totalCount }  每页显示:${requestScope.pagemsg.pageSize}</span>
        </li>
    </ul>
</div>
<div class="container">
    <div class="row pad-15">
        <div class="col-md-12">
            <nav class="pagination-outer" aria-label="Page navigation">
                <ul class="pagination">
                    <li class="page-item">
                        <a href="${pageContext.request.contextPath }/authorizeCompany/findpageauthorizeCompanyForList?currentPage=${requestScope.pagemsg.currPage-1}" class="page-link" aria-label="Previous">
                            <span aria-hidden="true">«</span>
                        </a>
                    </li>
                    <li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath }/authorizeCompany/findpageauthorizeCompanyForList?currentPage=1">1</a></li>
                    <c:forEach var="i" begin="2" end="${requestScope.pagemsg.totalCount }" step="1">
                        <li class="page-item">
                            <a class="page-link" href="#" onclick="aaa(${i})">${i}</a>
                        </li>
                    </c:forEach>
                    <li class="page-item">
                        <a href="${pageContext.request.contextPath }/authorizeCompany/findpageauthorizeCompanyForList?currentPage=${requestScope.pagemsg.currPage+1}" class="page-link" aria-label="Next">
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
    function aaa(i) {
        $.ajax({
            type: "POST",
            url: "/authorizeCompany/findpageauthorizeCompanyForList", //你的请求程序页面随便啦
            async: false,//同步：意思是当有返回值以后才会进行后面的js程序。
            data: {},//请求需要发送的处理数据
            success: function (msg) {
                if (msg) {//根据返回值进行跳转
                    window.location.href = "/authorizeCompany/findpageauthorizeCompanyForList?currentPage=" + i;
                }
            }
        })
    }
</script>
</body>

</html>