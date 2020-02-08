<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <jsp:include page="jsinclude.jsp"/>
</head>

<body style="background-color: #e5e5e5e5;">

    <nav class="navbar navbar-default navbar-fixed-top">
        <div id="login">
            <ul>
                <li>
                    <a href=#>个人中心</a>
                </li>
            </ul>
            <ul>
                <li>
                    <a href="#"><span class="glyphicon glyphicon-user"></span>用户名1234567</a>/
                    <a href="#"><span class="glyphicon glyphicon-user"></span>登录</a>/
                    <a href="#">注册</a>
                </li>

            </ul>
        </div>
        <div class="container">
            <div class="navbar-header">
                <a href="index.jsp" class="navbar-brand logo"><img src="#" alt="公司logo"></a>
            </div> 
        </div>
    </nav>

    <div class="container" style="margin-top: 80px;">
        <div class="row">
            <div class="col-xs-12 col-sm-7 col-md-6 col-lg-12">
                <div class="top-title">
                    <ol class="breadcrumb" style="margin-left:300px; background-color: #e5e5e5e5;">
                        <li> <label class="num">1</label>
                            选择身份类别
                        </li>
                        <span class="glyphicon glyphicon-menu-right"></span>
                        <li> <label class="num" style="background-color: #666;">2</label>
                            选择身份类别
                        </li>
                        <span class="glyphicon glyphicon-menu-right"></span>
                        <li> <label class="num"  style="background-color: #666;">3</label>
                            选择身份类别
                        </li>
                    </ol>
                    <div class="choose-lb">
                        <span>请选择你的个体身份类别</span>
                    </div>
                    <div class="main">
                        <ul>
                            <li><a href="zxcqpost.html" >知识产权信息（供方）</a></li>
                            <li><a href="dbgspost.jsp">代办公司信息（中介方）</a></li>
                            <li><a href="xqfbpost.html" >需求任务发布（需方）</a></li>
                        </ul>
                    </div>
                </div>
            
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
                        pathn = "myinfo.html";
                        i = 0;
                        break;　　　　　　　
                    case "#renzheng":
                        pathn = "renzheng.html";
                        i = 1;
                        break;
                    case "#trade":
                        pathn = "user_trade.html";
                        i = 2;
                        break;
                    case "#info":
                        pathn = "user_info.html";
                        i = 3;
                        break;　　　　　　
                    default:
                        pathn = "user_center.html";
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
</body>

</html>