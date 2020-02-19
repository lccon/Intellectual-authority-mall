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
    <div class="container" id="kind" style="margin-top:100px;">
        <div class="row">
            <div class="col-xs-12 col-sm-7 col-md-6 col-lg-6">
                <ul class="list-inline">
                    <li>商品分类：</li>
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
                    <a class="btn btn-default" id="button1" onclick="findpage()">搜索</a>
                    <script>
                        function findpage() {
                            var a1=document.getElementById("button1");
                            var input1=document.getElementById("input1").value;
                            a1.href="/intellectualTask/findByIntellectualTask?str1="+input1;
                        }
                    </script>
                    <a class="btn btn-default" id="button2">免费发布信息</a>
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
                                <a href="/intellectualTask/getIntellectualTaskById?id=${u.id}">
                                    <img  id="img${u.id}" style="max-width:450px;height: 170px;" src="" class="media-object" alt="">
                                    <script type="text/javascript">
                                        var url11="${u.productPictureUrl}".split(",");
                                        var img1=document.getElementById("img${u.id}");
                                        img1.src="${pageContext.request.contextPath}"+url11[0];
                                    </script>
                                </a>
                            </div>
                            <div class="media-body" id="caps">
                                <a href="/intellectualTask/getIntellectualTaskById?id=${u.id}">${u.productName }</a>
                                <p id="desc">${u.productBrief }</p>
                                <p id="price">1800元</p>
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

        </div>

    </div>
    <!--分页-->
    <div class="container">
        <div class="row pad-15">
            <div class="col-md-12">
                <nav class="pagination-outer" aria-label="Page navigation">
                    <ul class="pagination">
                        <c:if test="${requestScope.pagemsg.currPage!=1}">
                            <li class="page-item" onclick="bbb(${requestScope.pagemsg.currPage-1})">
                                <a href="javascript:void(0);" class="page-link" aria-label="Previous">
                                    <span aria-hidden="true">«</span>
                                </a>
                            </li>
                        </c:if>
                        <li id="page1" class="page-item" onclick="bbb(1)">
                            <a class="page-link" href="javascript:void(0);">1</a>
                        </li>
                        <c:forEach var="i" begin="2" end="${requestScope.pagemsg.totalPage}" step="1">
                            <li class="page-item" onclick="bbb(${i})">
                                <a class="page-link" href="javascript:void(0);">${i}</a>
                            </li>
                        </c:forEach>
                        <c:if test="${requestScope.pagemsg.currPage!=requestScope.pagemsg.totalPage}">
                        <li class="page-item" onclick="bbb(${requestScope.pagemsg.currPage+1})">
                            <a href="javascript:void(0);" class="page-link" aria-label="Next">
                                <span aria-hidden="true">»</span>
                            </a>
                        </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
    <script>
        function bbb(path) {
            var that=$(this);
            var $contentWrapper = $('#center11');
            var $ul1=$('pagination');
            $.ajax({
                url : "${pageContext.request.contextPath }/intellectualTask/findpageIntellectualTaskForList?currentPage="+path,
                success : function(rst) {
                    $contentWrapper.html(rst);
                    obj_li = document.getElementsByTagName("li");
                    switch (path){
                        case 1:
                            obj_li[path + 42].className = 'page-item active';
                            console.log("111");
                            break;
                        case ${requestScope.pagemsg.totalPage}:
                            obj_li[path + 43].className = 'page-item active';
                            console.log("222");
                            break;
                        default:
                            obj_li[path + 45].className = 'page-item active';
                            console.log("333");
                    }
                }
            })
        }
    </script>
    <!--网页底部-->
    <jsp:include page="footer.jsp" />
</div>

</body>

</html>