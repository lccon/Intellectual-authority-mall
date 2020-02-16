<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%--<%@ page import="com.mall.component.ThreadVariable" %>--%>

<head>
    <%@ page import="com.mall.component.ThreadVariable" %>
    <%
            out.print(ThreadVariable.getSession().getUserName());
    %>
   <%-- <%
    String path = request.getContextPath();
    request.setAttribute("path",path);
    request.setAttribute("currentSession","");
    request.setAttribute("userRealName", ThreadVariable.getSession().getUserName());
    %>--%>

<%--<body>
<input type="text" value="<%=ThreadVariable.getSession().getUserName()%>">
</body>

<script type="text/javascript">
    var PATH='${path}';
    var listUrl;
    var userRealName='${userRealName}';
</script>--%>
	<jsp:include page="jsinclude.jsp"/>
</head>

<body>
    <input type="text" value="${userRealName}">
    <jsp:include page="head.jsp"/>
	<div id="myCarousel" class="carousel slide">
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="item active" style="background:#223240">
				<img src="img/bananer1.jpg" alt="第一张">
			</div>
			<div class="item" style="background:#F5E4DC;">
				<img src="img/bananer2.jpg" alt="第二张">
			</div>
			<div class="item" style="background:#DE2A2D;">
				<img src="img/bananer3.jpg" alt="第三张">
			</div>
			<!-- 		<div style="background:#eee;">
			<img src="img/slide.png" alt="第三张">
		</div> -->
		</div>
		<a href="#myCarousel" data-slide="prev" class="carousel-control left">
			<span class="glyphicon glyphicon-chevron-left"></span>
		</a>
		<a href="#myCarousel" data-slide="next" class="carousel-control right">
			<span class="glyphicon glyphicon-chevron-right"></span>
		</a>
	</div>


	<div class="span">
		<div class="container">
			<div class="input-group">
				<input type="text" class="form-control" id="input1" placeholder="默认搜索项">
				<div class="input-group-btn">
					<button class="btn btn-default" id="button1" >搜索</button>
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





	<table>
		<div class="row">
			<div class="col-xs-12 col-sm-7 col-md-6 col-lg-6">
			<tr class="top-cap">
				<th>&nbsp&nbsp&nbsp&nbsp&nbsp买卖</th>
				<th>&nbsp&nbsp&nbsp&nbsp&nbsp代办</th>
				<th>&nbsp&nbsp&nbsp&nbsp&nbsp买方最新</th>
				<th>&nbsp&nbsp&nbsp&nbsp&nbsp卖方最新</th>
			</tr>
		</div>
		</div>
		<tr>
			<th>
				<div class="pro-box">
				<ul>
				<li class="media" id="product">
					<div class="row">
						<div class="col-xs-12 col-sm-7 col-md-6 col-lg-6">
							<a href="#" class="thumbnail">
								<img src="img/tab1-1.png" alt="" id="cap"></img>
							</a>
						</div>
					<div class="media-body" id="cap">
						<a class="media-heading"  href="#">中国移动中国移动中国移动中国移动中国移动</a>
						<p id="desc">中中中中中中中中中中中中中</p>
						<p id="price">1800元</p>
					</div>
				</div>
				</li>
			</ul>
		</div>
			</th>


			<th>
				<div class="pro-box">
				<ul>
				<li class="media" id="product">
					<div class="row">
						<div class="col-xs-12 col-sm-7 col-md-6 col-lg-6">
							<a href="#" class="thumbnail">
								<img src="img/tab1-1.png" alt="" id="cap"></img>
							</a>
						</div>
					<div class="media-body" id="cap">
						<a class="media-heading"  href="#">中国移动中国移动中国移动中国移动中国移动</a>
						<p id="desc">中中中中中中中中中中中中中</p>
						<p id="price">1800元</p>
					</div>
				</div>
				</li>
			</ul>
		</div>
			</th>



			<th>
				<div class="pro-box">
				<ul>
				<li class="media" id="product">
					<div class="row">
						<div class="col-xs-12 col-sm-7 col-md-6 col-lg-6">
							<a href="#" class="thumbnail">
								<img src="img/tab1-1.png" alt="" id="cap"></img>
							</a>
						</div>
					<div class="media-body" id="cap">
						<a class="media-heading"  href="#">中国移动中国移动中国移动中国移动中国移动</a>
						<p id="desc">中中中中中中中中中中中中中</p>
						<p id="price">1800元</p>
					</div>
				</div>
				</li>
			</ul>
		</div>
			</th>



			<th>
				<div class="pro-box">
				<ul>
				<li class="media" id="product">
					<div class="row">
						<div class="col-xs-12 col-sm-7 col-md-6 col-lg-6">
							<a href="#" class="thumbnail">
								<img src="img/tab1-1.png" alt="" id="cap"></img>
							</a>
						</div>
					<div class="media-body" id="cap">
						<a class="media-heading"  href="#">中国移动中国移动中国移动中国移动中国移动</a>
						<p id="desc">中中中中中中中中中中中中中</p>
						<p id="price">1800元</p>
					</div>
				</div>
				</li>
			</ul>
		</div>
			</th>
		</tr>





<!--复制的数据后期可删除-->


<!--加入新闻模块-->
		<tr>
			<th>
				<div class="pro-box">
				<ul>
				<li class="media" id="product">
					<div class="row">
						<div class="col-xs-12 col-sm-7 col-md-6 col-lg-6">
							<a href="#" class="thumbnail">
								<img src="img/tab1-1.png" alt="" id="cap"></img>
							</a>
						</div>
					<div class="media-body" id="cap">
						<a class="media-heading"  href="#">中国移动中国移动中国移动中国移动中国移动</a>
						<p id="desc">中中中中中中中中中中中中中</p>
						<p id="price">1800元</p>
					</div>
				</div>
				</li>
			</ul>
		</div>
			</th>


			<th>
				<div class="pro-box">
				<ul>
				<li class="media" id="product">
					<div class="row">
						<div class="col-xs-12 col-sm-7 col-md-6 col-lg-6">
							<a href="#" class="thumbnail">
								<img src="img/tab1-1.png" alt="" id="cap"></img>
							</a>
						</div>
					<div class="media-body" id="cap">
						<a class="media-heading"  href="#">中国移动中国移动中国移动中国移动中国移动</a>
						<p id="desc">中中中中中中中中中中中中中</p>
						<p id="price">1800元</p>
					</div>
				</div>
				</li>
			</ul>
		</div>
			</th>



			
			<th class="top-cap-new">
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp新闻模块
			</th>
			<th>

			</th>
		</tr>

<!--复制的数据后期可删除-->




		




		
	</table>





<div class="tab3">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-sm-6">
				<img src="img/tab3.png" class="auto img-responsive center-block" alt="">
			</div>
			<div class="text col-md-6 col-sm-6">
				<h3>公司介绍</h3>
				<p>公司公司公司公司</p>
			</div>
		</div>
	</div>
</div>

<!--返回顶部和反馈意见按钮-->
<div id='sidebar-buttons'>
	<a id='iede' href='javascript:;' title='意见反馈' ><span class="glyphicon glyphicon-edit"></span></a>
	<a id='back-to-top' href='#' title='返回顶部'><span class="glyphicon glyphicon-menu-up"></span></a>
</div>
<!--意见反馈-->
<div class="w3ls-main" id="ll">
	<div class="close1" style="float: right">
		<a href="#" id="close1" ><span class="glyphicon glyphicon-remove"></span></a>
	</div>
	<div class="w3ls-form">
		<h1>意见反馈</h1>
	<form action="#" method="post">

	<ul class="fields">
		<li>	
			<label class="w3ls-opt">您的姓名<span class="w3ls-star"> * </span></label>
			<div class="w3ls-name">	
				<input type="text" name="username"  placeholder="请输入您的姓名" required=" "/>
			</div>
		</li>
		<li>
			<label class="w3ls-opt">您的联系方式<span class="w3ls-star"> * </span></label>	
				<span class="w3ls-text w3ls-name">
					<input type="text" name="phone number" placeholder="请输入您的联系方式" required=""/>
				</span>
		</li>
		<li>
			<div class="mail">
				<label class="w3ls-opt">您的邮箱地址<span class="w3ls-star"> * </span></label>
				<span class="w3ls-text w3ls-name">
					<input type="email" name="email" placeholder="请输入您的邮箱地址" required=""/>
				</span>
			</div>
		</li>
		<div class="input">
			<label class="w3ls-opt1">您的问题或建议<span> ?</span></label>
			<span class="w3ls-input"><textarea placeholder="请输入您的问题或建议"></textarea></span>
		</div>
	</ul>
	<div class="clear"></div>
		<div class="w3ls-btn">
			<input type="submit" value="提交">
		</div>
	</form>
	</div>
	</div>

<!--页面底部-->
	<jsp:include page="footer.jsp"/>
	<script type="text/javascript">
		//轮播自动播放
		$('#myCarousel').carousel({
			//自动4秒播放
			interval: 4000,
		});

		// //设置垂直居中
		// $('.carousel-control').css('line-height', $('.carousel-inner img').height() + 'px');
		// $(window).resize(function () {
		// 	var $height = $('.carousel-inner img').eq(0).height() || 
		// 				  $('.carousel-inner img').eq(1).height() || 
		// 				  $('.carousel-inner img').eq(2).height();
		// 	$('.carousel-control').css('line-height', $height + 'px');
		// });

		//设置文字垂直居中，谷歌浏览器加载图片的顺序问题，导致高度无法获取
		$(window).load(function () {
			$('.text').eq(0).css('margin-top', ($('.auto').eq(0).height() - $('.text').eq(0).height()) / 2 + 'px');
		});


		$(window).resize(function () {
			$('.text').eq(0).css('margin-top', ($('.auto').eq(0).height() - $('.text').eq(0).height()) / 2 + 'px');
		});

		$(window).load(function () {
			$('.text').eq(1).css('margin-top', ($('.auto').eq(1).height() - $('.text').eq(1).height()) / 2 + 'px');
		});

		$(window).resize(function () {
			$('.text').eq(1).css('margin-top', ($('.auto').eq(1).height() - $('.text').eq(1).height()) / 2 + 'px');
		});

	</script>
	<script>
		console.log("123");
        var idea = document.getElementById("iede");
        var box = document.getElementById("ll");
		var close1=document.getElementById("close1");
        idea.onclick = function () {
            box.style.display = "block";
        }
		close1.onclick=function(){
			box.style.display="none";
		}
    </script>
</body>

</html>