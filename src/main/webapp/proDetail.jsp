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

<jsp:include page="advertising.jsp"/>
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
                                <p class="info1">
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
                                            价格面议
                                        </span>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                        <div class="preview" style="float: left;">
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
                        <div class="pro-service" style="width: 450px;float: left;">
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
                                    <span>发明人&nbsp;&nbsp;: </span><span>${intellectualTask.realName}</span>
                                </dd>
                                <dd>
                                    <span>联系方式: </span>
                                    <span id="mobile"></span>
                                    <br>
                                </dd>
                                <dd>
                                    <span style="margin-left:120px;">
                                        <input type="hidden" id="accountYue"/>
                                        <a href="javascript:;" class="addcart" id="info">
                                        付费查看完整联系方式
                                        </a>
                                    </span>
                                </dd>
                                <dd>

                                        <cite style="font-size: xx-small">温馨提示：如果想要查看完整的付费方式需要支付50虚拟币</cite>
                                        <cite  style="font-size: xx-small" id="accountYue1">你当前的虚拟币余额为：</cite>
                                        <cite  style="font-size: xx-small">如果余额不足请先
                                        <a id="test1" href="javascript:void(0)" style="color:#f46;">充值</a>。
                                        </cite>
                                </dd>
                            </dl>
                        </div>
                        <c:if test="${authorizeType==2}">
                        <span style="float: right;">
                            <img src="${pageContext.request.contextPath}/img/yinzhang.png" style="width:130px;height:130px;">
                        </span>
                        </c:if>
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
                    <img id="img1" class="img-responsive" src="" alt="" style="width:1000px;">
                    <img id="img2" class="img-responsive" src="" alt="" style="width:1000px;">
                    <img id="img3" class="img-responsive" src="" alt="" style="width:1000px;">
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
        $('#info').on('click',function () {
            if(document.getElementById("accountYue").value <50){
                layer.msg('您的余额不足请先进行充值', {
                    time: 5000, //5s后自动关闭
                });
            }else {
                $.ajax({
                    type:"POST",
                    url: "/roofPlace/roofplaceconsume?consume=50",
                    success: function(result) {
                        console.log("111");
                        //eg2
                        layer.open({
                            content: '${intellectualTask.mobile}'
                            ,btn: ['确定']
                            ,yes: function(index, layero){
                                document.getElementById("mobile").innerText="${intellectualTask.mobile}";
                            }
                            ,cancel: function(){
                                //右上角关闭回调
                                //return false //开启该代码可禁止点击该按钮关闭
                            }
                        });
                    },
                })

            }
        })
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
            $.ajax({
                type:"POST",
                url: "/businessBrowse/addBusinessBrowse?moduleType=1&moduleTypeId=${intellectualTask.id}&publisherId=${intellectualTask.userId}",
                async : false,
                data:{type:1},
                success: function(result) {
                    console.log(result);
                },
            })
            $.ajax({
                type:"POST",
                url: "/roofPlace/getUseraccountYue",
                success: function(result) {
                    document.getElementById("accountYue").value=result;
                    document.getElementById("accountYue1").innerText+=result;
                },
            })
                var phNum="${intellectualTask.mobile}";
                var phnumAfter = phNum.substring(0,3) + "****" + phNum.substring(7);
                document.getElementById("mobile").innerText=phnumAfter;
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
    <script>
        $('#test1').on('click', function () {
            layer.open({
                type: 2,
                title: false,
                closeBtn: 0, //不显示关闭按钮
                shade: [0],
                area: ['340px', '215px'],
                offset: 'rb', //右下角弹出
                time: 2000, //2秒后自动关闭
                anim: 2,
                content: ['/vouchercenter.jsp', 'no'], //iframe的url，no代表不显示滚动条
                end: function () { //此处用于演示
                    layer.open({
                        type: 2,
                        title: '充值中心',
                        shadeClose: true,
                        shade: false,
                        maxmin: true, //开启最大化最小化按钮
                        area: ['893px', '600px'],
                        content: '/vouchercenter.jsp'
                    });
                }
            });

        });
    </script>
    <!--网页底部-->
    <jsp:include page="footer.jsp"/>



</body>

</html>