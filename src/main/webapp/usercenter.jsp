<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <title>项目实战</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/usercenter.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="layui/layui.all.js"></script>
</head>

<body style="background-color: #e5e5e5e5;">
<jsp:include page="head1.jsp"/>
    <div style="margin-top:120px;margin-left: 75px; height: 40px;" >
        <ol class="breadcrumb">
            <li><a href="/">返回首页</a></li>
            <li class="active">个人中心</li>
        </ol>
    </div>

    <!--用户中心头部信息-->
    <div class="container" id="nav-head">
        <div class="row">
            <div class="col-xs-12 col-sm-7 col-md-6 col-lg-12">
                <div class="media">
                    <div class="media-left" id="picture">
                        <a href="#">
                            <img id="img2" class="img-circle image-responsive" src="" />
                        </a>
                    </div>
                    <div class="media-body" id="head-text">
                        <p>
                            尊敬的${userRealName}&nbsp;欢迎发布信息
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--侧边栏-->
    <div class="container" id="leftnav">

        <div class="row">
            <div class="span6">
                <ul class="nav nav-list" id="userMenu">
                    <li class="nav-header" id="cap2">帐户管理</li>
                    <li class="active" data-url="/user/getUserById?id=${UserId}"><a class="item-inner" href="javascript:void(0);" >我的资料</a></li>
                    <li data-url="/userCenter/renzheng"><a class="item-inner" href="javascript:void(0);">我的认证</a></li>
                    <li><a href="javascript:void(0);">帐户明细</a></li>
                    <li class="nav-header"  id="cap2">我的资金</li>
                    <li data-url="/userCenter/vocher?id=${UserId}"><a  class="item-inner" href="javascript:void(0);">帐户余额</a></li>
                    <li><a href="javascript:void(0);">充值记录</a></li>
                    <li class="nav-header"  id="cap2">我的动态</li>
                    <li data-url="/intellectualTask/findIntellectualTaskReleaseForPage"><a   class="item-inner" href="javascript:void(0);">我发布的</a></li>
                    <li data-url="/businessCollected/findBusinessCollectedForPage?moduleType=1" ><a  class="item-inner" href="javascript:void(0);">我的收藏</a></li>
                    <li><a href="javascript:void(0);">我看过谁</a></li>
                    <li><a href="javascript:void(0);">谁看过我</a></li>
                </ul>
            </div>
        </div>
    </div>
    <!--中央显示区域-->
    <div class="container" id="center">
        <div class="row">
            <div class="col-xs-12 col-sm-7 col-md-6 col-lg-12">
                <div id="content"></div>
            </div>

        </div>
    </div>



    <script src="http://code.jquery.com/jquery-1.8.0.min.js"></script>
    <script>
        $(function() {

            window.onload = function() {
                $('#userMenu li').each(function(){
                    if($(this).data('url') == '/user/getUserById?id=${UserId}'){
                        $(this).addClass('checked');
                        window.location.hash = '/user/getUserById?id=${UserId}';
                        loadContent('/user/getUserById?id=${UserId}');
                    }
                })
            }

            // 内容区域
            var $contentWrapper = $('#center')

            var loadContent = function(path) {
                path = path || location.hash

                $.ajax({
                    url : path,
                    success : function(rst) {
                        $contentWrapper.html(rst)
                    }
                })
            }



            $('#userMenu').on('click','li', function() {
                var $elmLink = $(this);
                var link = $elmLink.data('url');
                console.log($elmLink,link)
                if(!link || link == ''){
                    return;
                }
                window.location.hash = link;
                loadContent(link);
            })




        })
    </script>

<jsp:include page="footer.jsp"/>
</body>

</html>