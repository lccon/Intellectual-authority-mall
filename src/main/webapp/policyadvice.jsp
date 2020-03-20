<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<head>
    <jsp:include page="jsinclude.jsp"/>
</head>

<body>
<style>
    @media (min-width: 1326px){
        .container {
            width: 1000px;
        }
    }
</style>
<div id="center11">
<!--网页头部-->
<jsp:include page="head.jsp" />
<!--商品行业分类-->
<div class="container" id="kind" style="margin-top:114px;">
    <div class="row">
        <div class="col-xs-12 col-sm-7 col-md-6 col-lg-6">
            <ul class="list-inline">
                <li>资讯分类：</li>
                <li><a href="javascript:void(0)">政策法规</a></li>
                <li><a href="javascript:void(0)">平台动态</a></li>
                <li><a href="javascript:void(0)">新闻实事</a></li>
                <li><a href="javascript:void(0)">行业知识</a></li>
            </ul>

        </div>
    </div>


</div>
<jsp:include page="advertising.jsp"/>
<!--需求列表-->
    <c:if test="${requestScope.pagemsg.lists.size() == 0}">
        <div>
            <div class="container" >
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                    <div class="info">
                        <ul style="margin-left: 30px;">
                            <strong>
                                <i  id="icon" class="glyphicon glyphicon-info-sign"></i>
                                您搜索信息暂未找到
                            </strong>
                            <li>你可以继续去<a style="color: #f46;" href="/authorizeCompany/findpageauthorizeCompanyForList">首页</a>随便逛逛，浏览其他信息</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </c:if>
    <c:if test="${requestScope.pagemsg.lists.size()>0}">
<div>
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <c:forEach items="${requestScope.pagemsg.lists}" var="u">
            <div class="product">
                <c:if test="${u.roofPlaceState==2}">
                    <div class="new-item-badge">置顶信息</div>
                </c:if>
                        <div class="media" style="width: 1150px;height: 200px;">
                            <div class="media-left" style="width: 250px;">
                                <a href="/policyAdvice/getPolicyAdviceById?id=${u.id}">
                                    <img  id="img${u.id}" src="" class="media-object" alt="">
                                    <script>
                                            var url1="${u.advicePictureUrl}".split(",");
                                            var img1=document.getElementById("img${u.id}");
                                            img1.src="${pageContext.request.contextPath}"+url1[0];
                                    </script>
                                </a>
                            </div>
                            <div class="media-body" id="caps">
                                <a href="/policyAdvice/getPolicyAdviceById?id=${u.id}">${u.adviceTitle }</a>
                                <p class="desc1" style="height: 20px;">${u.adviceSubtitle }</p>
                                <p class="desc">浏览量：${u.browseVolume}</p>
                            </div>

                        </div>
                    </div>
        </c:forEach>
            </div>
        </div>
    </div>

</div>

<!--分页-->
<div class="container" style="margin-top:40px;">
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
    </c:if>
<script>
    layui.use(['laypage', 'layer'], function(){
        var laypage = layui.laypage
            ,layer = layui.layer;
        laypage.render({
            elem: 'demo2-1',
            count: ${requestScope.pagemsg.totalCount },
            limit:${requestScope.pagemsg.pageSize},
            theme: '#FF5722',
            curr:${requestScope.pagemsg.currPage },
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
        var $contentWrapper = $('#center11');
        $.ajax({
            url : "${pageContext.request.contextPath }/policyAdvice/findpagepolicyAdviceForList?currentPage="+path,
            success : function(rst) {
                $contentWrapper.html(rst);
            }
        })
    }


</script>

<!--网页底部-->
<jsp:include page="footer.jsp" />
</div>
</body>

</html>