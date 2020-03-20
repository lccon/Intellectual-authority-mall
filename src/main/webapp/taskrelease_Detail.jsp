<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <jsp:include page="jsinclude.jsp"/>
</head>

<body>
<div id="cover" style="background: #000; position: absolute; left: 0px; top: 0px; width: 100%; filter: alpha(opacity=30); opacity: 0.3; display: none; z-index: 2 ">

</div>
<!--网页头部-->
<jsp:include page="head.jsp"/>

<jsp:include page="advertising.jsp"/>
<!--商品详情-->
<div class="container" style="margin-top: 114px;background-color: #fff;">
    <div class="row">
        <div class="col-xs-11 col-sm-11 col-md-11 col-lg-11">
            <div class="detail">
                <div class="detail-box">
                    <div class="preview">
                        <div class="preview-box">
                            <a href="#">
                                <c:if test="${taskRelease.taskCategory==1}">
                                    <img id="bigimg" class="media-object" alt="" src="${pageContext.request.contextPath}/img/tab1-1.png" />
                                </c:if>
                                <c:if test="${taskRelease.taskCategory==2}">
                                    <img id="bigimg" class="media-object" alt="" src="${pageContext.request.contextPath}/img/tab1-2.jpg" />
                                </c:if>
                            </a>
                        </div>
                    </div>
                    <div class="pro-service" >
                        <dl class="clearfix" style="margin-top:40px;">
                            <dd>
                                <span>任务类型: </span>
                                <span>
                                    <c:if test="${taskRelease.taskCategory==1}">申请</c:if>
                                    <c:if test="${taskRelease.taskCategory==2}">购买</c:if>
                                </span>
                            </dd>
                            <dd>
                                <span>知识产权类型: </span>
                                <span>
                                        <c:if test="${taskRelease.intellectualProperty == 1}">发明</c:if>
                                        <c:if test="${taskRelease.intellectualProperty == 2}">实用新型</c:if>
                                        <c:if test="${taskRelease.intellectualProperty == 3}">外观</c:if>
                                        <c:if test="${taskRelease.intellectualProperty == 4}">商标</c:if>
                                        <c:if test="${taskRelease.intellectualProperty == 5}">版权</c:if>
                                    </span>
                            </dd>
                            <dd>
                                <span>行业所属: </span>
                                <span>
                                        <c:if test="${taskRelease.industryBelongs==1}">生活需要</c:if>
                                        <c:if test="${taskRelease.industryBelongs==2}">交通运输</c:if>
                                        <c:if test="${taskRelease.industryBelongs==3}">化学化工</c:if>
                                        <c:if test="${taskRelease.industryBelongs==4}">轻工纺织</c:if>
                                        <c:if test="${taskRelease.industryBelongs==5}">建筑建材</c:if>
                                        <c:if test="${taskRelease.industryBelongs==6}">机械照明</c:if>
                                        <c:if test="${taskRelease.industryBelongs==7}">新能源</c:if>
                                        <c:if test="${taskRelease.industryBelongs==8}">电力电气</c:if>
                                        <c:if test="${taskRelease.industryBelongs==9}">武器爆破</c:if>
                                        <c:if test="${taskRelease.industryBelongs==10}">农林牧业</c:if>
                                        <c:if test="${taskRelease.industryBelongs==11}">视频饮料</c:if>
                                        <c:if test="${taskRelease.industryBelongs==12}">家具用品</c:if>
                                        <c:if test="${taskRelease.industryBelongs==13}">教育休闲</c:if>
                                        <c:if test="${taskRelease.industryBelongs==14}">医药医疗</c:if>
                                        <c:if test="${taskRelease.industryBelongs==15}">电子信息源</c:if>
                                        <c:if test="${taskRelease.industryBelongs==16}">仪器仪表</c:if>
                                        <c:if test="${taskRelease.industryBelongs==17}">包装印刷</c:if>
                                        <c:if test="${taskRelease.industryBelongs==18}">新型材料</c:if>
                                        <c:if test="${taskRelease.industryBelongs==19}">海洋开发</c:if>
                                        <c:if test="${taskRelease.industryBelongs==20}">航空航天</c:if>
                                        <c:if test="${taskRelease.industryBelongs==21}">采矿冶金</c:if>
                                        <c:if test="${taskRelease.industryBelongs==22}">橡胶塑料</c:if>
                                        <c:if test="${taskRelease.industryBelongs==23}">安全防护</c:if>
                                        <c:if test="${taskRelease.industryBelongs==24}">节能环保</c:if>
                                        <c:if test="${taskRelease.industryBelongs==25}">其他</c:if>
                                    </span>
                            </dd>
                        </dl>
                    </div>
                    <script>
                        $.ajax({
                            type:"POST",
                            url: "/getauthorizeType?userid=${taskRelease.userId}",
                            success: function(result) {
                                if(result==2){
                                    document.getElementById("yz").style.display="block";
                                }
                            },
                        })
                    </script>
                    <span class="yz" id="yz">
                            <img src="${pageContext.request.contextPath}/img/yinzhang.png" style="width:130px;height:130px;">
                    </span>
                </div>
            </div>
        </div>
    </div>
</div>
<!--商品详情-->


<div class="product-desc">
    <div class="container" style="background-color: #fff; margin-top: 30px;">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-11">
                <div class="product-hd">
                    <span class="current items-1">
                        用途
                    </span>
                </div>
                <!-- 商品详情图 -->
                <div class="text">
                    <p>
                        ${taskRelease.purpose}
                    </p>

                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-11">
                <div class="product-hd">
                    <span class="current items-1">
                        详细说明
                    </span>
                </div>
                <!-- 商品详情图 -->
                <div class="text">
                    <p>
                        ${taskRelease.detailedDesc}
                    </p>

                </div>
            </div>
        </div>
    </div>

</div>
<!--商品详情结束-->
<!--网页底部-->
<jsp:include page="footer.jsp"/>
<script>
    window.onload=function () {
        $.ajax({
            type:"POST",
            url: "/businessBrowse/addBusinessBrowse?moduleType=3&moduleTypeId=${taskRelease.id}&publisherId=${taskRelease.userId}",
            async : false,
            data:{type:1},
            success: function(result) {
            },
        })
    }
</script>


</body>

</html>