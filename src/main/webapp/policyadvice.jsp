<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<head>
    <jsp:include page="jsinclude.jsp"/>
</head>

<body>
<!--网页头部-->
<jsp:include page="head.jsp" />
<!--商品行业分类-->
<div class="container" id="kind" style="margin-top:100px;">
    <div class="row">
        <div class="col-xs-12 col-sm-7 col-md-6 col-lg-6">
            <ul class="list-inline">
                <li>资讯分类：</li>
                <li><a href="#">政策法规</a></li>
                <li><a href="#">平台动态</a></li>
                <li><a href="#">新闻实事</a></li>
                <li><a href="#">行业知识</a></li>
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
                            <div class="media-left">
                                <a href="/policyAdvice/getPolicyAdviceById?id=${u.id}">
                                    <img  id="img${u.id}" style="max-width:450px;height: 170px;" src="" class="media-object" alt="">
                                    <script>
                                            var url1="${u.advicePictureUrl}".split(",");
                                            var img1=document.getElementById("img${u.id}");
                                            img1.src="${pageContext.request.contextPath}"+url1[0];
                                    </script>
                                </a>
                            </div>
                            <div class="media-body" id="caps">
                                <a href="/policyAdvice/getPolicyAdviceById?id=${u.id}">${u.adviceTitle }</a>
                                <p id="desc">${u.adviceSubtitle }</p>
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


<div>
    <span>第${requestScope.pagemsg.currPage }/ ${requestScope.pagemsg.totalPage}页</span>
    <span>总记录数：${requestScope.pagemsg.totalCount }  每页显示:${requestScope.pagemsg.pageSize}</span>
    <span>
       <c:if test="${requestScope.pagemsg.currPage != 1}">
           <a href="${pageContext.request.contextPath }/policyAdvice/findpagepolicyAdviceForList?currentPage=1">[首页]</a>
           <a href="${pageContext.request.contextPath }/policyAdvice/findpagepolicyAdviceForList?currentPage=${requestScope.pagemsg.currPage-1}">[上一页]</a>
       </c:if>

       <c:if test="${requestScope.pagemsg.currPage != requestScope.pagemsg.totalPage}">
           <a href="${pageContext.request.contextPath }/policyAdvice/findpagepolicyAdviceForList?currentPage=${requestScope.pagemsg.currPage+1}">[下一页]</a>
           <a href="${pageContext.request.contextPath }/policyAdvice/findpagepolicyAdviceForList?currentPage=${requestScope.pagemsg.totalPage}">[尾页]</a>
       </c:if>
   </span>

</div>
<div class="container">
    <div class="row pad-15">
        <div class="col-md-12">
            <nav class="pagination-outer" aria-label="Page navigation">
                <ul class="pagination">
                    <li class="page-item">
                        <a href="${pageContext.request.contextPath }/policyAdvice/findpagepolicyAdviceForList?currentPage=${requestScope.pagemsg.currPage-1}" class="page-link" aria-label="Previous">
                            <span aria-hidden="true">«</span>
                        </a>
                    </li>
                    <li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath }/policyAdvice/findpagepolicyAdviceForList?currentPage=1">1</a></li>
                    <c:forEach var="i" begin="2" end="${requestScope.pagemsg.totalPage }" step="1">
                        <li class="page-item">
                            <a class="page-link" href="#" onclick="aaa(${i})">${i}</a>
                        </li>
                    </c:forEach>
                    <li class="page-item">
                        <a href="${pageContext.request.contextPath }/policyAdvice/findpagepolicyAdviceForList?currentPage=${requestScope.pagemsg.currPage+1}" class="page-link" aria-label="Next">
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
</body>

</html>