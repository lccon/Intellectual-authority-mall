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
                <li>知识产权类型：</li>
                <li data-url="/taskRelease/findpageTaskReleaseForList?intellectualProperty=1"><a href="javascript:void(0)">发明</a></li>
                <li data-url="/taskRelease/findpageTaskReleaseForList?intellectualProperty=2"><a href="javascript:void(0)">实用新型</a></li>
                <li data-url="/taskRelease/findpageTaskReleaseForList?intellectualProperty=3"><a href="javascript:void(0)">外观</a></li>
                <li data-url="/taskRelease/findpageTaskReleaseForList?intellectualProperty=4"><a href="javascript:void(0)">商标</a></li>
                <li data-url="/taskRelease/findpageTaskReleaseForList?intellectualProperty=5"><a href="javascript:void(0)">版权</a></li>
            </ul>

        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-7 col-md-6 col-lg-6">
            <ul class="list-inline">
                <li>任务分类：</li>
                <li data-url="/taskRelease/findpageTaskReleaseForList?taskCategory=1"><a href="javascript:void(0)">申请</a></li>
                <li data-url="/taskRelease/findpageTaskReleaseForList?taskCategory=2"><a href="javascript:void(0)">购买</a></li>
            </ul>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-7 col-md-6 col-lg-12">
            <ul class="list-inline">
                <li>行业分类：</li>
                <li data-url="/taskRelease/findpageTaskReleaseForList?industryBelongs=1"><a href="javascript:void(0)">生活需要</a></li>
                <li data-url="/taskRelease/findpageTaskReleaseForList?industryBelongs=2"><a href="javascript:void(0)">交通运输</a></li>
                <li data-url="/taskRelease/findpageTaskReleaseForList?industryBelongs=3"><a href="javascript:void(0)">化学化工</a></li>
                <li data-url="/taskRelease/findpageTaskReleaseForList?industryBelongs=4"><a href="javascript:void(0)">轻工纺织</a></li>
                <li data-url="/taskRelease/findpageTaskReleaseForList?industryBelongs=5"><a href="javascript:void(0)">建筑建材</a></li>
                <li data-url="/taskRelease/findpageTaskReleaseForList?industryBelongs=6"><a href="javascript:void(0)">机械照明</a></li>
                <li data-url="/taskRelease/findpageTaskReleaseForList?industryBelongs=7"><a href="javascript:void(0)">新能源</a></li>
                <li data-url="/taskRelease/findpageTaskReleaseForList?industryBelongs=8"><a href="javascript:void(0)">电力电气</a></li>
                <li data-url="/taskRelease/findpageTaskReleaseForList?industryBelongs=9"><a href="javascript:void(0)">武器爆破</a></li>
                <li data-url="/taskRelease/findpageTaskReleaseForList?industryBelongs=10"><a href="javascript:void(0)" >农林牧业</a></li>
                <li data-url="/taskRelease/findpageTaskReleaseForList?industryBelongs=11"><a href="javascript:void(0)">食品饮料</a></li>
                <li data-url="/taskRelease/findpageTaskReleaseForList?industryBelongs=12"><a href="javascript:void(0)" style="margin-left: 82px;">家居用品</a></li>
                <li data-url="/taskRelease/findpageTaskReleaseForList?industryBelongs=13"><a href="javascript:void(0)">教育休闲</a></li>
                <li data-url="/taskRelease/findpageTaskReleaseForList?industryBelongs=14"><a href="javascript:void(0)">医药医疗</a></li>
                <li data-url="/taskRelease/findpageTaskReleaseForList?industryBelongs=15"><a href="javascript:void(0)">电子信息源</a></li>
                <li data-url="/taskRelease/findpageTaskReleaseForList?industryBelongs=16"><a href="javascript:void(0)">仪器仪表</a></li>
                <li data-url="/taskRelease/findpageTaskReleaseForList?industryBelongs=17"><a href="javascript:void(0)">包装印刷</a></li>
                <li data-url="/taskRelease/findpageTaskReleaseForList?industryBelongs=18"><a href="javascript:void(0)">新型材料</a></li>
                <li data-url="/taskRelease/findpageTaskReleaseForList?industryBelongs=19"><a href="javascript:void(0)" >海洋开发</a></li>
                <li data-url="/taskRelease/findpageTaskReleaseForList?industryBelongs=20"><a href="javascript:void(0)">航空航天</a></li>
                <li data-url="/taskRelease/findpageTaskReleaseForList?industryBelongs=21"><a href="javascript:void(0)">采矿冶金</a></li>
                <li data-url="/taskRelease/findpageTaskReleaseForList?industryBelongs=22"><a href="javascript:void(0)">橡胶塑料</a></li>
                <li data-url="/taskRelease/findpageTaskReleaseForList?industryBelongs=23"><a href="javascript:void(0)" style="margin-left: 82px;">安全防护</a></li>
                <li data-url="/taskRelease/findpageTaskReleaseForList?industryBelongs=24"><a href="javascript:void(0)">节能环保</a></li>
                <li data-url="/taskRelease/findpageTaskReleaseForList?industryBelongs=25"><a href="javascript:void(0)">其他</a></li>
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

                <a class="btn btn-default" id="button2" href="/taskRelease/TaskReleasePost" onclick="return checkFreeMessageNum();">免费发布信息</a>
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
                        <li style="margin-left: 174px;">你可以继续去<a style="color: #f46;" href="/taskRelease/findpageTaskReleaseForList">任务发布页面</a>随便逛逛，浏览其他信息</li>
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
                        <div class="media" style="width: 1150px;height: 200px">
                            <div class="media-left" style="width: 250px;">
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
                        <a id="abc" href="javascript:void(0);" onclick="deletecollect(${UserId},3,${u.id});" class="label label-primary bstreedit">已收藏<span id="addcollect" class="glyphicon glyphicon-heart-empty"></span></a>
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
    var d_url=document.location.href.substr(61);
    console.log(d_url);
    $("#newline").on("click","a",function () {
        window.location.href="${pageContext.request.contextPath }/taskRelease/findpageTaskReleaseForList?purpose="+$(this).text()+"&detailedDesc="+$(this).text();
    })
    $("#button1").on("click",function () {
        var a1=document.getElementById("button1");
        var input1=document.getElementById("input1").value;
        window.location.href="${pageContext.request.contextPath }/taskRelease/findpageTaskReleaseForList?purpose="+input1+"&detailedDesc="+input1;
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
            url : "${pageContext.request.contextPath }/taskRelease/findpageTaskReleaseForList?currentPage="+path+"&"+d_url,
            success : function(rst) {
                $contentWrapper.html(rst);
            }
        })
    }



    //新增收藏
    function addcollect(id) {
        var a=document.getElementById("addcollect");
        var abc=document.getElementById("abc");
        $.ajax({
            type:"POST",
            url: "/businessCollected/addBusinessCollected?moduleType=3&moduleTypeId="+id,
            cache:false,
            contentType: false,
            processData: false,
            success: function(result) {
                if(result){
                    console.log(result);
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