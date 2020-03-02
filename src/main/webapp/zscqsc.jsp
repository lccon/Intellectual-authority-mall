<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<head>
    <jsp:include page="jsinclude.jsp"/>
    <jsp:include page="admin/baseInclude.jsp"/>
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
                    <li data-url="/intellectualTask/findpageIntellectualTaskForList?productCategory=1"><a href="javascript:void(0)">发明</a></li>
                    <li data-url="/intellectualTask/findpageIntellectualTaskForList?productCategory=2"><a href="javascript:void(0)">实用新型</a></li>
                    <li data-url="/intellectualTask/findpageIntellectualTaskForList?productCategory=3"><a href="javascript:void(0)">外观</a></li>
                    <li data-url="/intellectualTask/findpageIntellectualTaskForList?productCategory=4"><a href="javascript:void(0)">商标</a></li>
                    <li data-url="/intellectualTask/findpageIntellectualTaskForList?productCategory=5"><a href="javascript:void(0)">版权</a></li>
                </ul>

            </div>
        </div>
        <div class="row">
            <div class="col-xs-12 col-sm-7 col-md-6 col-lg-12">
                <ul class="list-inline">
                    <li>行业分类：</li>
                    <li data-url="/intellectualTask/findpageIntellectualTaskForList?industryCategory=1"><a href="javascript:void(0)">生活需要</a></li>
                    <li data-url="/intellectualTask/findpageIntellectualTaskForList?industryCategory=2"><a href="javascript:void(0)">交通运输</a></li  data-url="/intellectualTask/findpageIntellectualTaskForList?industryCategory=1">
                    <li data-url="/intellectualTask/findpageIntellectualTaskForList?industryCategory=3"><a href="javascript:void(0)">化学化工</a></li>
                    <li data-url="/intellectualTask/findpageIntellectualTaskForList?industryCategory=4"><a href="javascript:void(0)">轻工纺织</a></li>
                    <li data-url="/intellectualTask/findpageIntellectualTaskForList?industryCategory=5"><a href="javascript:void(0)">建筑建材</a></li>
                    <li data-url="/intellectualTask/findpageIntellectualTaskForList?industryCategory=6"><a href="javascript:void(0)">机械照明</a></li>
                    <li data-url="/intellectualTask/findpageIntellectualTaskForList?industryCategory=7"><a href="javascript:void(0)">新能源</a></li>
                    <li data-url="/intellectualTask/findpageIntellectualTaskForList?industryCategory=8"><a href="javascript:void(0)">电力电气</a></li>
                    <li data-url="/intellectualTask/findpageIntellectualTaskForList?industryCategory=9"><a href="javascript:void(0)">武器爆破</a></li>
                    <li data-url="/intellectualTask/findpageIntellectualTaskForList?industryCategory=10"><a href="javascript:void(0)" >农林牧业</a></li>
                    <li data-url="/intellectualTask/findpageIntellectualTaskForList?industryCategory=11"><a href="javascript:void(0)">食品饮料</a></li>
                    <li data-url="/intellectualTask/findpageIntellectualTaskForList?industryCategory=12"><a href="javascript:void(0)" style="margin-left: 82px;">家居用品</a></li>
                    <li data-url="/intellectualTask/findpageIntellectualTaskForList?industryCategory=13"><a href="javascript:void(0)">教育休闲</a></li>
                    <li data-url="/intellectualTask/findpageIntellectualTaskForList?industryCategory=14"><a href="javascript:void(0)">医药医疗</a></li>
                    <li data-url="/intellectualTask/findpageIntellectualTaskForList?industryCategory=15"><a href="javascript:void(0)">电子信息源</a></li>
                    <li data-url="/intellectualTask/findpageIntellectualTaskForList?industryCategory=16"><a href="javascript:void(0)">仪器仪表</a></li>
                    <li data-url="/intellectualTask/findpageIntellectualTaskForList?industryCategory=17"><a href="javascript:void(0)">包装印刷</a></li>
                    <li data-url="/intellectualTask/findpageIntellectualTaskForList?industryCategory=18"><a href="javascript:void(0)">新型材料</a></li>
                    <li data-url="/intellectualTask/findpageIntellectualTaskForList?industryCategory=19"><a href="javascript:void(0)" >海洋开发</a></li>
                    <li data-url="/intellectualTask/findpageIntellectualTaskForList?industryCategory=20"><a href="javascript:void(0)">航空航天</a></li>
                    <li data-url="/intellectualTask/findpageIntellectualTaskForList?industryCategory=21"><a href="javascript:void(0)">采矿冶金</a></li>
                    <li data-url="/intellectualTask/findpageIntellectualTaskForList?industryCategory=22"><a href="javascript:void(0)">橡胶塑料</a></li>
                    <li data-url="/intellectualTask/findpageIntellectualTaskForList?industryCategory=23"><a href="javascript:void(0)" style="margin-left: 82px;">安全防护</a></li>
                    <li data-url="/intellectualTask/findpageIntellectualTaskForList?industryCategory=24"><a href="javascript:void(0)">节能环保</a></li>
                    <li data-url="/intellectualTask/findpageIntellectualTaskForList?industryCategory=25"><a href="javascript:void(0)">其他</a></li>
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
                    <a class="btn btn-default" id="button1" href="javascript:void(0)">搜索</a>

                    <a class="btn btn-default" id="button2" href="/intellectualTask/IntellectualTaskPost" onclick="return checkFreeMessageNum();">免费发布信息</a>
                    <script>
                        var FreeMessageNum="${FreeMessageNum}";
                        function checkFreeMessageNum(){
                            if(FreeMessageNum>0){
                                return true;
                            }
                            else{
                                layer.msg('您可以发布的信息数量已经为：0，请先前往个人中心我的资料页面购买信息发布数量再来发布信息吧', {
                                    time: 5000, //5s后自动关闭
                                });
                                return false;
                            }
                        }
                    </script>
                </div>
            </div>

            <div class="container" id="newline">
                <a href="javascript:void(0)">关键词</a>
                <a href="javascript:void(0)">关键词</a>
                <a href="javascript:void(0)">关键词</a>
                <a href="javascript:void(0)">关键词</a>
                <a href="javascript:void(0)">关键词</a>
            </div>
        </div>
    </div>







    <!--需求列表-->
    <c:if test="${requestScope.pagemsg.lists.size() == 0}">
        <div style="margin-top: 50px;">
            <div class="container" >
                <div class="info">
                    <ul style="margin-left: 30px;">
                        <strong style="margin-left: 150px;">
                            <i style="margin:0;" id="icon" class="glyphicon glyphicon-info-sign"></i>
                            您搜索信息暂未找到
                        </strong>
                        <li style="margin-left: 174px;">你可以继续去<a style="color: #f46;" href="/intellectualTask/findpageIntellectualTaskForList">知识产权商城页面</a>随便逛逛，浏览其他信息</li>
                    </ul>
                </div>
            </div>
        </div>
    </c:if>
    <c:if test="${requestScope.pagemsg.lists.size()>0}">
    <div style="margin-top: 50px;">
        <div class="container">
            <c:forEach items="${requestScope.pagemsg.lists}" var="u">
            <div class="product">
                <div class="row">
                    <div class="col-xs-12 col-sm-7 col-md-6 col-lg-12">
                        <div class="media" style="width: 1150px; height: 200px;">
                            <div class="media-left" style="width: 250px;">
                                <a href="/intellectualTask/getIntellectualTaskById?id=${u.id}">
                                    <img  id="img${u.id}" style="width:250px;height: 170px;" src="" class="media-object" alt="">
                                    <script type="text/javascript">
                                        var url11="${u.productPictureUrl}".split(",");
                                        var img1=document.getElementById("img${u.id}");
                                        img1.src="${pageContext.request.contextPath}"+url11[0];
                                    </script>
                                </a>
                            </div>
                            <div class="media-body" id="caps">
                                <a href="/intellectualTask/getIntellectualTaskById?id=${u.id}">${u.productName }</a>
                                <p class="desc">${u.productBrief }</p>
                                <p id="price">价格面议</p>
                                <p class="desc">浏览量：${u.browseVolume}</p>
                            </div>
                        </div>
                        <c:if test="${u.roofPlaceState==2}">
                            <div class="new-item-badge">置顶信息</div>
                        </c:if>
                    </div>
                </div>
                <div class="warp">
                    <c:if test="${u.hasCollectedState==0}">
                    <a id="abc" href="javascript:void(0);" onclick="addcollect(${u.id});" class="label label-primary bstreedit">收藏<span id="addcollect" class="glyphicon glyphicon-heart-empty"></span></a>
                    </c:if>
                    <c:if test="${u.hasCollectedState==1}">
                        <a id="abc" href="javascript:void(0);" onclick="deletecollect(${UserId},1,${u.id})" class="label label-primary bstreedit">已收藏<span id="addcollect" class="glyphicon glyphicon-heart-empty"></span></a>
                    </c:if>
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
                        <div id="demo2-1"></div>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
    </c:if>
    <script>
        var d_url=document.location.href.substr(71);
        $("#newline").on("click","a",function () {
            window.location.href="${pageContext.request.contextPath }/intellectualTask/findpageIntellectualTaskForList?productName="+$(this).text()+"&productBrief="+$(this).text();
        })
        $("#button1").on("click",function () {
            var a1=document.getElementById("button1");
            var input1=document.getElementById("input1").value;
            window.location.href="${pageContext.request.contextPath }/intellectualTask/findpageIntellectualTaskForList?productName="+input1+"&productBrief="+input1;
            console.log("111");
        })
        $(".list-inline").on("click","li",function(){
            window.location.href="${pageContext.request.contextPath }"+$(this).data('url');
            console.log($(this).data('url'));
        });

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
            var that=$(this);
            var $contentWrapper = $('#center11');
            var $ul1=$('pagination');
            $.ajax({
                url : "${pageContext.request.contextPath }/intellectualTask/findpageIntellectualTaskForList?currentPage="+path+"&"+d_url,
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
</div>

</body>

</html>