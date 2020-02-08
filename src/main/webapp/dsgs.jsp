<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <jsp:include page="jsinclude.jsp"/>
</head>

<body>
    <!--网页头部-->
    <jsp:include page="head.jsp"/>

    <!--商品行业分类-->
    <div class="container" id="kind">
        <div class="row">
            <div class="col-xs-12 col-sm-7 col-md-6 col-lg-6">
                <ul class="list-inline">
                    <li>主办业务分类：</li>
                    <li><a href="#">申请专利</a></li>
                    <li><a href="#">证书买卖</a></li>
                    <li><a href="#">技术成果转让</a></li>
                    <li><a href="#">法律咨询</a></li>
                </ul>

            </div>
        </div>
    </div>
    <!--搜索框-->
    <div class="span">
		<div class="container">
			<div class="input-group">
				<input type="text" class="form-control" id="input1" placeholder="默认搜索项">
				<div class="input-group-btn">
					<button class="btn btn-default" id="button1">搜索</button>
					<button class="btn btn-default" id="button2">免费发布信息</button>
				</div>
			</div>

			<div class="container" id="newline">
				<a href="#">关键词</a>
				<a href="#">关键词</a>
				<a href="#">关键词</a>
				<a href="#">关键词</a>
				<a href="#">关键词</a>
			</div>
		</div>
	</div>







    <!--需求列表-->
    <div style="margin-top: 50px;">
        <div class="container">
            <div class="product">
                <div class="row">
                    <div class="col-xs-12 col-sm-7 col-md-6 col-lg-12">
                        <div class="media" style="width: 1150px;">
                            <div class="media-left">
                                <a href="#"><img src="img/tab1-1.png" class="media-object" alt=""></a>
                            </div>
                            <div class="media-body" id="caps">
                                <a href="#">中国移动中国移动中国移动中国移动中国移动</a>
                                <p id="desc">其他：无法保证上课效率、没有时间表，任务无法完成！我们：保证按时间表的上课、效率高、当天的任务当天完成！</p>
                                <p id="price">1800元</p>
                                <p id="desc">浏览量：100</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="warp">
                    <a class="label label-primary bstreedit">收藏<span class="glyphicon glyphicon-heart-empty"></span></a>
                    <a class="label label-primary bstreedit">置顶<span class="glyphicon glyphicon-chevron-up"></span></a>
                </div>
            </div>


        </div>
        
    </div>


    
    <!--网页底部-->
   <jsp:include page="footer.jsp"/>
</body>

</html>