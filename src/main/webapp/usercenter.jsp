<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/amazeui.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/amazeui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/ui-choose.js"></script>
    <link href="${pageContext.request.contextPath}/css/whoseeme.css" rel='stylesheet' type='text/css' />

</head>

<body style="background-color: #e5e5e5e5;">
<div class="suofang">
<jsp:include page="head1.jsp"/>

    <!--用户中心头部信息-->
    <div class="container" id="nav-head">
        <div class="row">
            <div class="col-xs-12 col-sm-7 col-md-6 col-lg-12">
                <div class="media">
                    <div class="media-left" id="picture">
                            <img id="img2" class="img-circle image-responsive" src="" />
                        <script>
                            var url11="${HeadPortrait}".split(",");
                            var img2=document.getElementById("img2");
                            img2.src="${pageContext.request.contextPath}"+url11[0];
                        </script>
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
                    <li data-url="/renzheng"><a class="item-inner" href="javascript:void(0);">我的认证</a></li>
                    <li class="nav-header"  id="cap2">我的资金</li>
                    <li data-url="/vocher"><a  class="item-inner" href="javascript:void(0);">帐户余额</a></li>
                    <li data-url="/payrank"><a href="javascript:void(0);">充值记录</a></li>
                    <li class="nav-header"  id="cap2">我的动态</li>
                    <li data-url="/intellectualTask/findIntellectualTaskReleaseForPage"><a   class="item-inner" href="javascript:void(0);">我发布的</a></li>
                    <li data-url="/businessCollected/findBusinessCollectedForPage?moduleType=1" ><a  class="item-inner" href="javascript:void(0);">我的收藏</a></li>
                    <li data-url="/businessBrowse/getMeSeeWho"><a href="javascript:void(0);">我看过谁</a></li>
                    <li data-url="/businessBrowse/getWhoSeeMe"><a href="javascript:void(0);">谁看过我</a></li>
                </ul>
            </div>
        </div>
    </div>
    <!--中央显示区域-->
    <div class="container" id="center">
        <div class="row">
            <div class="col-xs-6 col-sm-7 col-md-6 col-lg-10">
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
</div>
</body>

</html>