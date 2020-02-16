<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <title>项目实战</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/usercenter.css">
</head>

<body style="background-color: #e5e5e5e5;">

    <nav class="navbar navbar-default navbar-fixed-top">
        <div id="login">
            <c:if test="${param.username != null}">
                <ul>
                    <li>
                        <a href="/usercenter.jsp">个人中心</a>
                    </li>
                </ul>
            </c:if>
            <ul>
                <li>
                    <c:if test="${param.username != null}">
                        <a href="/usercenter.jsp"><span class="glyphicon glyphicon-user"></span>${param.username}</a>
                        <a class="quit" href="/admin/userlogout">退出</a>
                    </c:if>
                    <c:if test="${param.username == null}">
                        <a href="/login.jsp"><span class="glyphicon glyphicon-user"></span>登录</a>/
                        <a href="/register.jsp">注册</a>
                    </c:if>
                </li>

            </ul>
        </div>
    </nav>

    <!--用户中心头部信息-->
    <div class="container" id="nav-head">
        <div class="row">
            <div class="col-xs-12 col-sm-7 col-md-6 col-lg-12">
                <div class="media">
                    <div class="media-left" id="picture">
                        <a href="#">
                            <img class="img-circle image-responsive" src="img/user.png" />
                        </a>
                    </div>
                    <div class="media-body" id="head-text">
                        <p>
                            用户名11323241&nbsp;欢迎发布信息
                        </p>
                        <p style="margin-top: 15px;">
                            <span class="glyphicon glyphicon-phone">12345678901</span>
                            <a href="#">修改</a>
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
                    <li class="active" data-id="center"><a href="#" >我的资料</a></li>
                    <li data-id="renzheng"><a href="#">我的认证</a></li>
                    <li><a href="#">帐户明细</a></li>
                    <li class="nav-header"  id="cap2">我的资金</li>
                    <li data-id="vocher"><a  href="#">帐户余额</a></li>
                    <li><a href="#">充值记录</a></li>
                    <li class="nav-header"  id="cap2">我的动态</li>
                    <li data-id="user_post"><a  href="#">我发布的</a></li>
                    <li data-id="user_collect" ><a href="#">我的收藏</a></li>
                    <li><a href="#">我看过谁</a></li>
                    <li><a href="#">谁看过我</a></li>
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
            $("#userMenu").on("click", "li", function() {
                var sId = $(this).data("id"); //获取data-id的值
                window.location.hash = sId; //设置锚点
                loadInner(sId);
            });
 
            function loadInner(sId) {
                var sId = window.location.hash;
                var pathn, i;
                switch(sId) {
                    case "#center":
                        pathn = "myinfo.jsp";
                        i = 0;
                        break;　　　　　　　
                    case "#renzheng":
                        pathn = "renzheng.jsp";
                        i = 1;
                        break;
                    case "#vocher":
                        pathn = "vocher.jsp";
                        i = 2;
                        break;
                    case "#user_post":
                        pathn = "user_post.jsp";
                        i = 3;
                        break;
                    case "#user_collect":
                        pathn = "user_collect.jsp";
                        i = 4;
                        break;
                    default:
                        pathn = "myinfo.jsp";
                        i = 0;
                        break;
                }
                $("#content").load(pathn); //加载相对应的内容
                $(".userMenu li").eq(i).addClass("current").siblings().removeClass("current"); //当前列表高亮
            }
            var sId = window.location.hash;
            loadInner(sId);
        });
    </script>
<jsp:include page="footer.jsp"/>
</body>

</html>