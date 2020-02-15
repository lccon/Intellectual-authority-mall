<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <jsp:include page="jsinclude.jsp"/>
</head>

<body onload="aaa();">
    <div id="cover" style="background: #000; position: absolute; left: 0px; top: 0px; width: 100%; filter: alpha(opacity=30); opacity: 0.3; display: none; z-index: 2 ">
   
    </div>
    <!--网页头部-->
    <jsp:include page="head.jsp"/>


    <!--商品详情-->
    <div class="container" style="margin-top: 80px;background-color: #fff;">
        <div class="row">
            <div class="col-xs-11 col-sm-11 col-md-11 col-lg-11">
                <div class="detail">
                    <div class="detail-box">
                        <div class="pro-detail-head">
                            <div class="pro-hd">
                                <h1>
                                    ${intellectualTask.productName}
                                </h1>
                                <p class="info">
                                        ${intellectualTask.productBrief}
                                </p>
                            </div>
                            <div class="pro-sell">
                                <dl>
                                    <dd>
                                        <span>
                                            ￥
                                        </span>
                                        <span>
                                            1800元
                                        </span>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                        <div class="preview">
                            <div class="preview-box">
                                <a href="#">
                                    <img id="bigimg" class="media-object" alt="" src="" />
                                </a>
                            </div>
                            <ul class="preview-items">
                                <li class="current">
                                    <a href="javascript:;">
                                        <img id="img11" alt="" src="" />
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:;">
                                        <img id="img22" alt="" src="" />
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:;">
                                        <img id="img33" alt="" src="" />
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="pro-service" >
                            <dl class="clearfix" style="margin-top:40px;">
                                <dd>
                                    <span>商品分类: </span>
                                    <span>
                                        <c:if test="${intellectualTask.productCategory == 1}">发明</c:if>
                                        <c:if test="${intellectualTask.productCategory == 2}">实用新型</c:if>
                                        <c:if test="${intellectualTask.productCategory == 3}">外观</c:if>
                                        <c:if test="${intellectualTask.productCategory == 4}">商标</c:if>
                                        <c:if test="${intellectualTask.productCategory == 5}">版权</c:if>
                                    </span>
                                </dd>
                                <dd>
                                    <span>行业分类: </span>
                                    <span>
                                        <c:if test="${intellectualTask.industryCategory==1}">生活需要</c:if>
                                        <c:if test="${intellectualTask.industryCategory==2}">交通运输</c:if>
                                        <c:if test="${intellectualTask.industryCategory==3}">化学化工</c:if>
                                        <c:if test="${intellectualTask.industryCategory==4}">轻工纺织</c:if>
                                        <c:if test="${intellectualTask.industryCategory==5}">建筑建材</c:if>
                                        <c:if test="${intellectualTask.industryCategory==6}">机械照明</c:if>
                                        <c:if test="${intellectualTask.industryCategory==7}">新能源</c:if>
                                        <c:if test="${intellectualTask.industryCategory==8}">电力电气</c:if>
                                        <c:if test="${intellectualTask.industryCategory==9}">武器爆破</c:if>
                                        <c:if test="${intellectualTask.industryCategory==10}">农林牧业</c:if>
                                        <c:if test="${intellectualTask.industryCategory==11}">视频饮料</c:if>
                                        <c:if test="${intellectualTask.industryCategory==12}">家具用品</c:if>
                                        <c:if test="${intellectualTask.industryCategory==13}">教育休闲</c:if>
                                        <c:if test="${intellectualTask.industryCategory==14}">医药医疗</c:if>
                                        <c:if test="${intellectualTask.industryCategory==15}">电子信息源</c:if>
                                        <c:if test="${intellectualTask.industryCategory==16}">仪器仪表</c:if>
                                        <c:if test="${intellectualTask.industryCategory==17}">包装印刷</c:if>
                                        <c:if test="${intellectualTask.industryCategory==18}">新型材料</c:if>
                                        <c:if test="${intellectualTask.industryCategory==19}">海洋开发</c:if>
                                        <c:if test="${intellectualTask.industryCategory==20}">航空航天</c:if>
                                        <c:if test="${intellectualTask.industryCategory==21}">采矿冶金</c:if>
                                        <c:if test="${intellectualTask.industryCategory==22}">橡胶塑料</c:if>
                                        <c:if test="${intellectualTask.industryCategory==23}">安全防护</c:if>
                                        <c:if test="${intellectualTask.industryCategory==24}">节能环保</c:if>
                                        <c:if test="${intellectualTask.industryCategory==25}">其他</c:if>
                                    </span>
                                </dd>
                                <dd>
                                    <span>专利号&nbsp;&nbsp;: </span><span style="letter-spacing: 0;">${intellectualTask.patentNumber}</span>
                                </dd>
                                <dd>
                                    <span>发明人&nbsp;&nbsp;: </span><span>${intellectualTask.productBrief}</span>
                                </dd>
                                <dd>
                                    <span>联系方式: </span>
                                    <a href="javascript:;" class="addcart" id="info">
                                        查看联系方式
                                    </a>
                                </dd>
                            </dl>

                        </div>
                        <div class="pro-buy">
                            
                            <div id="box">
                                <div class="close">
                                    <a href="#" id="close"><span class="glyphicon glyphicon-remove"></span></a>
                                </div>
                                <div>
                                    <div class="cap">
                                        付费查看完整信息
                                    </div>
                                    <div class="modal-body">
                                        <div class="p1">
                                            <div class="icon">
                                                <p><span class="glyphicon glyphicon-earphone"></span>&nbsp&nbsp手机号：</p>
                                            </div>
                                            <div class="desc">
                                                <p>1312032****</p>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="butt">
                                        <a href="#" class="wzinfo">查看完整信息</a>
                                    </div>

                                </div>

                            </div>
                        </div>
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
                        商品详情         
                    </span>
                </div>
                  <!-- 商品详情图 -->
                  <div class="text">
                      <p>
                          ${intellectualTask.productDetails}
                      </p>

                  </div>
                  <div class="infopicture">
                    <img id="img1" class="img-responsive" src="" alt="">
                    <img id="img2" class="img-responsive" src="" alt="">
                    <img id="img3" class="img-responsive" src="" alt="">
                </div>
                <div class="embed-responsive embed-responsive-16by9">
                    <video width="320" height="240" controls>
                    <source src="${pageContext.request.contextPath}${intellectualTask.productVideoUrl}" type="video/mp4">
                    </video>
                    </div>

            </div>
        </div>
    </div>
    
</div>

<!--商品详情结束-->
    <script>
        var info = document.getElementById("info");
        var box = document.getElementById("box");
        var close = document.getElementById("close");
        var cover=document.getElementById("cover");
        info.onclick = function () {
            box.style.display = "block";
            cover.style.height=document.body.clientHeight;
            cover.style.display="block";
        }
        close.onclick = function () {
            box.style.display = "none";
            cover.style.display="none";
        }

    </script>
    <script type="text/javascript">
        function aaa()//用window的onload事件，窗体加载完毕的时候
        {
            var bigimg=document.getElementById("bigimg");
            var url1="${intellectualTask.productPictureUrl}".split(",");
            var img1=document.getElementById("img1");
            var img2=document.getElementById("img2");
            var img3=document.getElementById("img3");
            var img11=document.getElementById("img11");
            var img22=document.getElementById("img22");
            var img33=document.getElementById("img33");
            bigimg.src="${pageContext.request.contextPath}"+url1[0];
            img1.src="${pageContext.request.contextPath}"+url1[0];
            img2.src="${pageContext.request.contextPath}"+url1[1];
            img3.src="${pageContext.request.contextPath}"+url1[2];
            img11.src="${pageContext.request.contextPath}"+url1[0];
            img22.src="${pageContext.request.contextPath}"+url1[1];
            img33.src="${pageContext.request.contextPath}"+url1[2];
        }
        $(function() {
            /* 小图控制大图*/

            $(".detail-box .preview-items li").on('click', function() {
                var url1="${intellectualTask.productPictureUrl}".split(",");
                var index = $(this).index();
                bigimg.src="${pageContext.request.contextPath}"+url1[index];
                console.log(url1[0]);
            })
        });
    </script>
    <!--网页底部-->
    <jsp:include page="footer.jsp"/>



</body>

</html>