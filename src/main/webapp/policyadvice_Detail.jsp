<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <jsp:include page="jsinclude.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/zerogrid.css">
</head>

<body onload="aaa();">
<div id="cover" style="background: #000; position: absolute; left: 0px; top: 0px; width: 100%; filter: alpha(opacity=30); opacity: 0.3; display: none; z-index: 2 ">

</div>
<!--网页头部-->
<jsp:include page="head.jsp"/>


<!--商品详情-->
<div class="wrap-body">
    <!--////////////////////////////////////Container-->
    <section>
        <div class="wrap-container clearfix">
            <div class="sub-header">
                <div class="zerogrid">
                    <h1>Blog</h1>
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
                                            <h1 class="entry-title">${policyAdvice.adviceTitle}</h1>
                                        </div>
                                        <div class="img-left">
                                            <img id="img1" src="" alt="pic"/>
                                                <h1>${policyAdvice.adviceSubtitle}</h1>
                                                <p>${policyAdvice.adviceContent}</p>
                                            <div  style="clear:both;"></div>
                                        </div>
                                    </article>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<!--网页底部-->
<jsp:include page="footer.jsp"/>
<script>
    function aaa() {
        var img1=document.getElementById("img1");
        var url1="${policyAdvice.advicePictureUrl}".split(",");
        img1.src="${pageContext.request.contextPath}"+url1[0];
    }
</script>


</body>

</html>