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
                <li>任务分类：</li>
                <li><a href="#">申请</a></li>
                <li><a href="#">购买</a></li>
            </ul>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-7 col-md-6 col-lg-6">
            <ul class="list-inline">
                <li>知识产权类型：</li>
                <li><a href="#">发明</a></li>
                <li><a href="#">实用新型</a></li>
                <li><a href="#">外观</a></li>
                <li><a href="#">商标</a></li>
                <li><a href="#">版权</a></li>
            </ul>

        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-7 col-md-6 col-lg-12">
            <ul class="list-inline">
                <li>行业分类：</li>
                <li><a href="#">生活需要</a></li>
                <li><a href="#">交通运输</a></li>
                <li><a href="#">化学化工</a></li>
                <li><a href="#">轻工纺织</a></li>
                <li><a href="#">建筑建材</a></li>
                <li><a href="#">机械照明</a></li>
                <li><a href="#">新能源</a></li>
                <li><a href="#">电力电气</a></li>
                <li><a href="#">武器爆破</a></li>
                <li><a href="#" >农林牧业</a></li>
                <li><a href="#">食品饮料</a></li>
                <li><a href="#" style="margin-left: 82px;">家居用品</a></li>
                <li><a href="#">教育休闲</a></li>
                <li><a href="#">医药医疗</a></li>
                <li><a href="#">电子信息源</a></li>
                <li><a href="#">仪器仪表</a></li>
                <li><a href="#">包装印刷</a></li>
                <li><a href="#">新型材料</a></li>
                <li><a href="#" >海洋开发</a></li>
                <li><a href="#">航空航天</a></li>
                <li><a href="#">采矿冶金</a></li>
                <li><a href="#">橡胶塑料</a></li>
                <li><a href="#" style="margin-left: 82px;">安全防护</a></li>
                <li><a href="#">节能环保</a></li>
                <li><a href="#">其他</a></li>
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
                            <div class="media-left" >
                                <c:if test="${u.taskCategory==1}">
                                    <a href="/taskRelease/getTaskReleaseById?id=${u.id}"><img style="max-width:450px;max-height: 190px;" src="${pageContext.request.contextPath}/img/tab1-1.png" class="media-object" alt=""></a>
                                </c:if>
                                <c:if test="${u.taskCategory==2}">
                                    <a href="/taskRelease/getTaskReleaseById?id=${u.id}"><img style="max-width:450px;max-height: 190px;" src="${pageContext.request.contextPath}/img/tab1-2.jpg" class="media-object" alt=""></a>
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


<div>
    <span>第${requestScope.pagemsg.currPage }/ ${requestScope.pagemsg.totalPage}页</span>
    <span>总记录数：${requestScope.pagemsg.totalCount }  每页显示:${requestScope.pagemsg.pageSize}</span>
    <span>
       <c:if test="${requestScope.pagemsg.currPage != 1}">
           <a href="${pageContext.request.contextPath }/taskRelease/findpageTaskReleaseForList?currentPage=1">[首页]</a>
           <a href="${pageContext.request.contextPath }/taskRelease/findpageTaskReleaseForList?currentPage=${requestScope.pagemsg.currPage-1}">[上一页]</a>
       </c:if>

       <c:if test="${requestScope.pagemsg.currPage != requestScope.pagemsg.totalPage}">
           <a href="${pageContext.request.contextPath }/taskRelease/findpageTaskReleaseForList?currentPage=${requestScope.pagemsg.currPage+1}">[下一页]</a>
           <a href="${pageContext.request.contextPath }/taskRelease/findpageTaskReleaseForList?currentPage=${requestScope.pagemsg.totalPage}">[尾页]</a>
       </c:if>
   </span>

</div>
<div class="container">
    <div class="row pad-15">
        <div class="col-md-12">
            <nav class="pagination-outer" aria-label="Page navigation">
                <ul class="pagination">
                    <li class="page-item">
                        <a href="${pageContext.request.contextPath }/taskRelease/findpageTaskReleaseForList?currentPage=${requestScope.pagemsg.currPage-1}" class="page-link" aria-label="Previous">
                            <span aria-hidden="true">«</span>
                        </a>
                    </li>
                    <li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath }/taskRelease/findpageTaskReleaseForList?currentPage=1">1</a></li>
                    <c:forEach var="i" begin="2" end="${requestScope.pagemsg.totalCount }" step="1">
                        <li class="page-item">
                            <a class="page-link" href="#" onclick="aaa(${i})">${i}</a>
                        </li>
                    </c:forEach>
                    <li class="page-item">
                        <a href="${pageContext.request.contextPath }/taskRelease/findpageTaskReleaseForList?currentPage=${requestScope.pagemsg.currPage+1}" class="page-link" aria-label="Next">
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