<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
    <meta charset="UTF-8">
    <title>项目实战</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/spro.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/prodetail.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/post-message.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/usercenter.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/vocher.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/amazeui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/ui-choose.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.all.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/prodetail.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.pagination.js"></script>
    <script src="${pageContext.request.contextPath}/js/post-message.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/zerogrid.css">
</head>

<body>
<div class="suofang">


<div id="cover" style="background: #000; position: absolute; left: 0px; top: 0px; width: 100%; filter: alpha(opacity=30); opacity: 0.3; display: none; z-index: 2 ">

</div>
<!--网页头部-->
<jsp:include page="head.jsp"/>

    <style>
        @media (min-width: 1200px){
            .sub-header{
                margin-left: 100px;
            }
        }
        @media (min-width: 1400px){
            .sub-header{
                margin-left: 300px;
            }
        }
        @media (min-width: 1900px){
            .sub-header{
                margin-left: 380px;
            }

        }
        .neirong{
            margin-left:30px;
        }
        .neirong p{
            font-size: 16px;
            text-indent: 2em;
            word-wrap:break-word;
        }
    </style>

<!--商品详情-->
<div class="wrap-body">
    <!--////////////////////////////////////Container-->
    <section>
        <div class="wrap-container clearfix">
            <div class="sub-header">
                <div class="zerogrid">
                </div>
            </div>
            <div class="zerogrid">
                <div class="row">
                    <div class="col-full">
                        <div class="wrap-col">
                            <div id="main-content">
                                <div class="wrap-content">
                                    <article>
                                        <div class="art-header">
                                            <h1 class="entry-title" style="font-size: 26px;">${policyAdvice.adviceTitle}</h1>
                                        </div>
                                        <div class="img-left">
                                            <span>发布时间：<fmt:formatDate value="${policyAdvice.createDate}" pattern="yyyy-MM-dd"/></span>
                                            <div  style="clear:both;"></div>
                                        </div>
                                    </article>
                                    <div class="neirong">
                                        <p>${policyAdvice.adviceContent}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
</div>
<!--网页底部-->
<jsp:include page="footer.jsp"/>
</body>

</html>