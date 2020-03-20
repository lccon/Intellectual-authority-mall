<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <jsp:include page="jsinclude.jsp"/>
</head>

<body onload="url1();">
<div id="cover" style="background: #000; position: absolute; left: 0px; top: 0px; width: 100%; filter: alpha(opacity=30); opacity: 0.3; display: none; z-index: 2 ">

</div>
<!--网页头部-->
<jsp:include page="head.jsp"/>

<jsp:include page="advertising.jsp"/>

<!--商品详情-->
<div class="container" style="margin-top: 94px;background-color: #fff;">
    <div class="row">
        <div class="col-xs-11 col-sm-11 col-md-11 col-lg-11">
            <div class="detail">
                <div class="detail-box">
                    <div class="preview">
                        <div class="preview-box">
                            <a href="#">
                                <img id="bigimg" class="media-object" alt="" src="" />
                            </a>
                        </div>
                    </div>
                    <div class="pro-service" >
                        <dl class="clearfix" style="margin-top:40px;">
                            <dd>
                                <span>公司名称: </span>
                                <span>${authorizeCompany.companyName}</span>
                            </dd>
                            <dd>
                                <span>业务分类: </span>
                                <span>
                                        <c:if test="${authorizeCompany.businessCategory==1}">申请专利</c:if>
                                        <c:if test="${authorizeCompany.businessCategory==2}">证书买卖</c:if>
                                        <c:if test="${authorizeCompany.businessCategory==3}">技术成果转让</c:if>
                                        <c:if test="${authorizeCompany.businessCategory==4}">法律咨询</c:if>
                                    </span>
                            </dd>
                            <dd>
                                <span>友情链接: </span>
                                <span>
                                   ${authorizeCompany.friendshipLink}
                                </span>
                            </dd>
                        </dl>
                    </div>
                    <script>
                        $.ajax({
                            type:"POST",
                            url: "/getauthorizeType?userid=${authorizeCompany.userId}",
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
                        公司详情
                    </span>
                </div>
                <!-- 商品详情图 -->
                <div class="text">
                    <p>
                        ${authorizeCompany.companyDescribe}
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
    function url1() {
        var url1="${authorizeCompany.companyPictureUrl}".split(",");
        var img1=document.getElementById("bigimg");
        img1.src="${pageContext.request.contextPath}"+url1[0];
        $.ajax({
            type:"POST",
            url: "/businessBrowse/addBusinessBrowse?moduleType=2&moduleTypeId=${authorizeCompany.id}&publisherId=${authorizeCompany.userId}",
            async : false,
            data:{type:1},
            success: function(result) {
            },
        })
    }
</script>


</body>

</html>