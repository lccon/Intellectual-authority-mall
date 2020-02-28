<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <jsp:include page="jsinclude.jsp"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/amazeui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/ui-choose.js"></script>
</head>
<body>
<style>
    .state {
        text-align: right;
        color: #ff6709;
        font-size: 14px;
    }
    .zd{
        float: right;
        padding: .5em 2em;
        color: #f46;
        border: 1px solid #f46;
        border-radius: 2px;
        text-decoration: none;
        -webkit-transition: all 217ms ease;
        transition: all 217ms ease;
    }
</style>
<div id="center11">
<div style="width:80px;margin-left: 10px;">
    <ul>
        <li id="title">我的发布</li>
    </ul>
    <ul id="title2">
        <li data-url="/intellectualTask/findIntellectualTaskReleaseForPage" ><a  class="item-inner" href="javascript:void(0);">知识产权商城</a></li>
        <li data-url="/authorizeCompany/findAuthorizeCompanyReleaseForPage" ><a  class="item-inner" href="javascript:void(0);">代办公司</a></li>
        <li data-url="/taskRelease/findTaskReleasePublishForPage" ><a  class="item-inner" href="javascript:void(0);">任务发布</a></li>
    </ul>
</div>
<c:if test="${gridPageintellectualTask.rows.size() == 0}">
<div class="info">
    <ul style="margin-left: 30px;">
        <strong style="margin-left: 150px;">
            <i style="margin:0;" id="icon" class="glyphicon glyphicon-info-sign"></i>
            您还没有发布信息
        </strong>
        <li style="margin-left: 174px;">1.您可以<a style="color: #f46;" href="/post-message">点击这里免费发布</a></li>
        <li style="margin-left: 174px;">2.去<a style="color: #f46;" href="/">首页</a>随便逛逛，看看大家都在发些什么信息</li>
    </ul>

</div>
</c:if>
    <c:if test="${gridPageauthorizeCompany.rows.size() == 0}">
        <div class="info">
            <ul style="margin-left: 30px;">
                <strong style="margin-left: 150px;">
                    <i style="margin:0;" id="icon" class="glyphicon glyphicon-info-sign"></i>
                    您还没有发布信息
                </strong>
                <li style="margin-left: 174px;">1.您可以<a style="color: #f46;" href="/post-message">点击这里免费发布</a></li>
                <li style="margin-left: 174px;">2.去<a style="color: #f46;" href="/">首页</a>随便逛逛，看看大家都在发些什么信息</li>
            </ul>

        </div>
    </c:if>
    <c:if test="${gridPagetaskRelease.rows.size() == 0}">
        <div class="info">
            <ul style="margin-left: 30px;">
                <strong style="margin-left: 150px;">
                    <i style="margin:0;" id="icon" class="glyphicon glyphicon-info-sign"></i>
                    您还没有发布信息
                </strong>
                <li style="margin-left: 174px;">1.您可以<a style="color: #f46;" href="/post-message">点击这里免费发布</a></li>
                <li style="margin-left: 174px;">2.去<a style="color: #f46;" href="/">首页</a>随便逛逛，看看大家都在发些什么信息</li>
            </ul>

        </div>
    </c:if>
<c:if test="${gridPageintellectualTask.rows.size()>0}">
    <div style="margin-top: 50px;">
        <div class="container">
            <c:forEach items="${gridPageintellectualTask.rows}" var="u">
                <div id="product1" class="product" style="height: 200px;width: 960px;margin-top:20px;">
                    <div class="row">
                        <div class="col-xs-10 col-sm-5 col-md-4 col-lg-10">
                                    <div class="media-body" id="caps">
                                        <a style="width:300px;" href="/intellectualTask/getIntellectualTaskById?id=${u.id}">${u.productName }</a>
                                        <p class="desc">${u.productBrief }</p>
                                        <c:if test="${u.state==0}">
                                            <p class="state">待审核</p>
                                        </c:if>
                                        <c:if test="${u.state==1}">
                                            <p class="state">已发布</p>
                                        </c:if>
                                        <p class="desc">浏览量：100</p>
                                    </div>
                        </div>
                        <div style="margin: 95px 20px 20px 20px;">
                            <a class="zd" href="javascript:void(0);" onclick="qwe()">置顶</a>
                        </div>
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
    <script>
        layui.use(['laypage', 'layer'], function(){
            var laypage = layui.laypage
                ,layer = layui.layer;
            laypage.render({
                elem: 'demo2-1',
                count: ${gridPageintellectualTask.records},
                limit:  15,
                theme: '#FF5722',
                curr:${gridPageintellectualTask.page},
                jump: function(obj, first){
                    //首次不执行
                    if(!first){
                        window.location.hash ="/intellectualTask/findIntellectualTaskReleaseForPage?page="+obj.curr;
                        loadContent("/intellectualTask/findIntellectualTaskReleaseForPage?page="+obj.curr);
                        //do something
                    }
                }
            });
        });
    </script>
</c:if>
<c:if test="${gridPageauthorizeCompany.rows.size()>0}">
    <div style="margin-top: 50px;">
        <div class="container">
            <c:forEach items="${gridPageauthorizeCompany.rows}" var="u">
                <div id="product1" class="product" style="height: 200px;width: 960px;margin-top:20px;">
                    <div class="row">
                        <div class="col-xs-10 col-sm-5 col-md-4 col-lg-10">
                            <div class="media-body" id="caps">
                                <a href="/authorizeCompany/getAuthorizeCompanyById?id=${u.id}">${u.companyName }</a>
                                <p id="desc">${u.companyDescribe }</p>
                                <c:if test="${u.state==0}">
                                    <p class="state">待审核</p>
                                </c:if>
                                <c:if test="${u.state==1}">
                                    <p class="state">已发布</p>
                                </c:if>
                                <p class="desc">浏览量：100</p>
                            </div>
                        </div>
                        <div style="margin: 95px 20px 20px 20px;">
                            <a class="zd" href="javascript:void(0);" onclick="qwe()">置顶</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
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
    <script>
        layui.use(['laypage', 'layer'], function(){
            var laypage = layui.laypage
                ,layer = layui.layer;
            laypage.render({
                elem: 'demo2-1',
                count: ${gridPageauthorizeCompany.records},
                limit:  15,
                theme: '#FF5722',
                curr:${gridPageauthorizeCompany.page},
                jump: function(obj, first){
                    //首次不执行
                    if(!first){
                        window.location.hash ="/authorizeCompany/findAuthorizeCompanyReleaseForPage?page="+obj.curr;
                        loadContent("/authorizeCompany/findAuthorizeCompanyReleaseForPage?page="+obj.curr);
                        //do something
                    }
                }
            });
        });
    </script>
</c:if>
<c:if test="${gridPagetaskRelease.rows.size()>0}">
    <div style="margin-top: 50px;">
        <div class="container">
            <c:forEach items="${gridPagetaskRelease.rows}" var="u">
                <div id="product1" class="product" style="height: 200px;width: 960px;margin-top:20px;">
                    <div class="row">
                        <div class="col-xs-10 col-sm-5 col-md-4 col-lg-10">
                            <div class="media-body" id="caps">
                                <a href="/taskRelease/getTaskReleaseById?id=${u.id}">${u.purpose }</a>
                                <p id="desc">${u.detailedDesc }</p>
                                <c:if test="${u.state==0}">
                                    <p class="state">待审核</p>
                                </c:if>
                                <c:if test="${u.state==1}">
                                    <p class="state">已发布</p>
                                </c:if>
                                <p class="desc">浏览量：100</p>
                            </div>
                        </div>
                        <div style="margin: 95px 20px 20px 20px;">
                            <a class="zd"  href="javascript:void(0);" onclick="qwe()">置顶</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
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
    <script>
        layui.use(['laypage', 'layer'], function(){
            var laypage = layui.laypage
                ,layer = layui.layer;
            laypage.render({
                elem: 'demo2-1',
                count: ${gridPagetaskRelease.records},
                limit:  15,
                theme: '#FF5722',
                curr:${gridPagetaskRelease.page},
                jump: function(obj, first){
                    //首次不执行
                    if(!first){
                        window.location.hash ="/taskRelease/findTaskReleasePublishForPage?page="+obj.curr;
                        loadContent("/taskRelease/findTaskReleasePublishForPage?page="+obj.curr);
                        //do something
                    }
                }
            });
        });
    </script>
</c:if>
</div>
<script>
    var $contentWrapper = $('#center11')

    var loadContent = function(path) {
        path = path || location.hash

        $.ajax({
            url : path,
            success : function(rst) {
                $contentWrapper.html(rst);
            }
        })
    }



    $('#title2').on('click','li', function() {
        var $elmLink = $(this);
        var link = $elmLink.data('url');
        console.log($elmLink,link)
        if(!link || link == ''){
            return;
        }
        window.location.hash = link;
        loadContent(link);
    })

</script>
<script>
    function qwe() {
        layer.open({
            type: 2,
            title: false,
            closeBtn: 0, //不显示关闭按钮
            shade: [0],
            area: ['340px', '215px'],
            offset: 'rb', //右下角弹出
            time: 2000, //2秒后自动关闭
            anim: 2,
            content: ['/roofplace.jsp', 'no'], //iframe的url，no代表不显示滚动条
            end: function () { //此处用于演示
                layer.open({
                    type: 2,
                    title: '置顶',
                    shadeClose: true,
                    shade: false,
                    maxmin: true, //开启最大化最小化按钮
                    area: ['893px', '600px'],
                    content: '/roofplace.jsp'
                });
            }
        });

    };
</script>
</body>

</html>