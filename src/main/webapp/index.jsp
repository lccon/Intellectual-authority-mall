<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<head>
	<jsp:include page="jsinclude.jsp"/>
</head>

<body>
<style>
	@media (min-width: 1700px) {
		.container {
			width: 1560px;
		}
	}

</style>
    <jsp:include page="head.jsp"/>
	<div class="container" style="margin-top:14px;">
	<div id="myCarousel" class="carousel slide">
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3" ></li>
			<li data-target="#myCarousel" data-slide-to="4"></li>
			<li data-target="#myCarousel" data-slide-to="5"></li>
		</ol>
		<div class="carousel-inner">
			<c:forEach items="${carouseAuthllist}" var="u" begin="0" end="0" step="1">
				<div class="item active" style="background:#223240">
					<a href="http://${u.addressUrl}" target="_blank">
						<img id="zauthimg${u.id}" src="" alt="第一张">
						<script>
                            var authurl1="${u.sitePictureUrl}".split(",");
                            var authimg1=document.getElementById("zauthimg${u.id}");
                            authimg1.src="${pageContext.request.contextPath}"+authurl1[0];
						</script>
					</a>
				</div>
			</c:forEach>
			<c:forEach items="${carouseAuthllist}" var="u" begin="1" end="5" step="1">
				<div class="item" style="background:#223240">
					<a href="http://${u.addressUrl}" target="_blank">
						<img id="authimg${u.id}" src="" alt="">
						<script>
                            var authurl2="${u.sitePictureUrl}".split(",");
                            var authimg2=document.getElementById("authimg${u.id}");
                            authimg2.src="${pageContext.request.contextPath}"+authurl2[0];
						</script>
					</a>
				</div>
			</c:forEach>
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
	</div>

	<div class="span">
		<div class="container">
			<div class="input-group">
				<input type="text" class="form-control" id="input1" placeholder="默认搜索项">
				<div class="input-group-btn">
					<a class="btn btn-default" id="button1" href="javascript:void(0);" onclick="findpage()">搜索</a>
					<script>
						function findpage() {
							var a1=document.getElementById("button1");
							var input1=document.getElementById("input1").value;
							a1.href="/api/getSearchBusinessData?page=1&rows=40&productName="+input1+"&productBrief="+input1;
                        }
					</script>
					<a href="/post-message" class="btn btn-default" id="button2">免费发布信息</a>
				</div>
			</div>
			<script>
                $("#newline").on("click","a",function () {
                    window.location.href="${pageContext.request.contextPath }/api/getSearchBusinessData?page=1&rows=40&productName="+$(this).text()+"&productBrief="+$(this).text();
                })
			</script>
		</div>
	</div>

	<!--中心显示区域-->
	<div class="container" style="margin-top:30px;height:520px;">
		<div class="row">
		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
			<div class="model">
				<div class="tit" style="background-color:RGB(15,68,136);">
					<h2>
						<a href="/intellectualTask/findpageIntellectualTaskForList"><strong>知识产权商城</strong></a>
					</h2>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6 col-lg-12" style="margin-top:10px;">
					<a href="/intellectualTask/findpageIntellectualTaskForList?productCategory=1" class="thumbnail" >
						<img src="img/zhanli.jpg" style="height: 60px;width: 100%;" alt="发明">
					</a>
					<a href="/intellectualTask/findpageIntellectualTaskForList?productCategory=2" class="thumbnail" >
						<img src="img/shiyong.jpg" style="height: 60px;width: 100%;" alt="实用新型">
					</a>
					<a href="/intellectualTask/findpageIntellectualTaskForList?productCategory=3" class="thumbnail" >
						<img src="img/waiguan.jpg" style="height: 60px;width: 100%;" alt="外观">
					</a>
					<a href="/intellectualTask/findpageIntellectualTaskForList?productCategory=4" class="thumbnail" >
						<img src="img/shangbiao.jpg" style="height: 60px;width: 100%;" alt="商标">
					</a>
					<a href="/intellectualTask/findpageIntellectualTaskForList?productCategory=5" class="thumbnail" >
						<img src="img/banquan.jpg" style="height: 60px;width: 100%;" alt="版权">
					</a>
				</div>
			</div>
		</div>
		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
			<div class="model">
				<div class="tit" style="background-color:RGB(248,172,27);">
					<h2>
						<a href="/authorizeCompany/findpageauthorizeCompanyForList"><strong>代办机构</strong></a>
					</h2>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6 col-lg-12" style="margin-top:10px;">
					<a href="/authorizeCompany/findpageauthorizeCompanyForList?businessCategory=1" class="thumbnail" >
						<img src="img/shenqingfuwu.jpg" style="height: 75px;width: 100%;" alt="申请服务">
					</a>
					<a href="/authorizeCompany/findpageauthorizeCompanyForList?businessCategory=2" class="thumbnail" >
						<img src="img/zhengshu.jpg" style="height: 75px;width: 100%;" alt="证书交易">
					</a>
					<a href="/authorizeCompany/findpageauthorizeCompanyForList?businessCategory=3" class="thumbnail" >
						<img src="img/jishu.jpg" style="height: 75px;width: 100%;" alt="技术成果转移">
					</a>
					<a href="/authorizeCompany/findpageauthorizeCompanyForList?businessCategory=4" class="thumbnail" >
						<img src="img/falu.jpg" style="height: 75px;width: 100%;" alt="法律咨询">
					</a>

				</div>
			</div>
		</div>
		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
			<div class="model">
				<div class="tit" style="background-color:RGB(234,18,31);margin-bottom: 10px;">
					<h2>
						<a href="/intellectualTask/findpageIntellectualTaskForList"><strong>最新发布</strong></a>
					</h2>
				</div>
				<div class="shu" style="margin-top:40px;"><a href="/intellectualTask/findpageIntellectualTaskForList?periodType=1">今日最新</a></div>
				<div class="layui-carousel" id="test1" style="float: right;">
					<div carousel-item>
						<div>
							<c:forEach items="${daytaskReleases1}" var="u" begin="0" end="2" step="1">
							<span><a class="bt" href="/intellectualTask/getIntellectualTaskById?id=${u.id}">${u.productName }</a></span><br>
							</c:forEach>
						</div>
						<div>
							<c:forEach items="${daytaskReleases1}" var="u" begin="3" end="5" step="1">
								<span><a class="bt" href="/intellectualTask/getIntellectualTaskById?id=${u.id}">${u.productName }</a></span><br>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- 条目中可以是任意内容，如：<img src=""> -->
				<div class="shu" style="margin-top:80px;"><a href="/intellectualTask/findpageIntellectualTaskForList?periodType=2">本周最新</a></div>
				<div class="layui-carousel" id="test2" style="float: right;margin-top: 20px;">
					<div carousel-item>
						<div>
							<c:forEach items="${weektaskReleases1}" var="u" begin="0" end="2" step="1">
								<span><a class="bt" href="/intellectualTask/getIntellectualTaskById?id=${u.id}">${u.productName }</a></span><br>
							</c:forEach>
						</div>
						<div>
							<c:forEach items="${weektaskReleases1}" var="u" begin="3" end="5" step="1">
								<span><a class="bt" href="/intellectualTask/getIntellectualTaskById?id=${u.id}">${u.productName }</a></span><br>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- 条目中可以是任意内容，如：<img src=""> -->
				<div class="shu" style="margin-top:85px;"><a href="/intellectualTask/findpageIntellectualTaskForList?periodType=3">本月最新</a></div>
				<div class="layui-carousel" id="test3" style="float: right;margin-top: 20px;">
					<div carousel-item>
						<div>
							<c:forEach items="${monthtaskReleases1}" var="u" begin="0" end="2" step="1">
								<span><a class="bt" href="/intellectualTask/getIntellectualTaskById?id=${u.id}">${u.productName }</a></span><br>
							</c:forEach>
						</div>
						<div>
							<c:forEach items="${monthtaskReleases1}" var="u" begin="3" end="5" step="1">
								<span><a class="bt" href="/intellectualTask/getIntellectualTaskById?id=${u.id}">${u.productName }</a></span><br>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- 条目中可以是任意内容，如：<img src=""> -->

				<script>
                    layui.use('carousel', function () {
                        var carousel = layui.carousel;
                        //建造实例
                        carousel.render({
                            elem: '#test1'
                            , width: '70%'
                            , height: '130px'
                            , arrow: 'none' //始终显示箭头
                            , anim: 'updown' //切换动画方式
                        });
                    });

                    layui.use('carousel', function () {
                        var carousel = layui.carousel;
                        //建造实例
                        carousel.render({
                            elem: '#test2'
                            , width: '70%'
                            , height: '130px'
                            , arrow: 'none' //始终显示箭头
                            , anim: 'updown' //切换动画方式
                        });
                    });


                    layui.use('carousel', function () {
                        var carousel = layui.carousel;
                        //建造实例
                        carousel.render({
                            elem: '#test3'
                            , width: '70%'
                            , height: '130px'
                            , arrow: 'none' //始终显示箭头
                            , anim: 'updown' //切换动画方式
                        });
                    });
				</script>
			</div>
		</div>
		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
			<div class="model">
				<div class="tit" style="background-color:RGB(234,18,31);margin-bottom:10px;">
					<h2>
						<a href="/taskRelease/findpageTaskReleaseForList"><strong>最新需求</strong></a>
					</h2>
				</div>
				<div class="shu" style="margin-top:40px;"><a href="/taskRelease/findpageTaskReleaseForList?periodType=1">今日最新</a></div>
				<div class="layui-carousel" id="test4" style="float: right;">
					<div carousel-item>
						<div>
							<c:forEach items="${daytaskReleases2}" var="u" begin="0" end="2" step="1">
								<span><a class="bt" href="/taskRelease/getTaskReleaseById?id=${u.id}">${u.purpose }</a></span><br>
							</c:forEach>
						</div>
						<div>
							<c:forEach items="${daytaskReleases2}" var="u" begin="3" end="5" step="1">
								<span><a class="bt" href="/taskRelease/getTaskReleaseById?id=${u.id}">${u.purpose }</a></span><br>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- 条目中可以是任意内容，如：<img src=""> -->
				<div class="shu" style="margin-top:80px;"><a href="/taskRelease/findpageTaskReleaseForList?periodType=2">本周最新</a></div>
				<div class="layui-carousel" id="test5" style="float: right;margin-top: 20px;">
					<div carousel-item>
						<div>
							<c:forEach items="${weektaskReleases2}" var="u" begin="0" end="2" step="1">
								<span><a class="bt" href="/taskRelease/getTaskReleaseById?id=${u.id}">${u.purpose }</a></span><br>
							</c:forEach>
						</div>
						<div>
							<c:forEach items="${weektaskReleases2}" var="u" begin="3" end="5" step="1">
								<span><a class="bt" href="/taskRelease/getTaskReleaseById?id=${u.id}">${u.purpose }</a></span><br>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- 条目中可以是任意内容，如：<img src=""> -->
				<div class="shu" style="margin-top:85px;"><a href="/taskRelease/findpageTaskReleaseForList?periodType=3">本月最新</a></div>
				<div class="layui-carousel" id="test6" style="float: right;margin-top: 20px;">
					<div carousel-item>
						<div>
							<c:forEach items="${monthtaskReleases2}" var="u" begin="0" end="2" step="1">
								<span><a class="bt" href="/taskRelease/getTaskReleaseById?id=${u.id}">${u.purpose }</a></span><br>
							</c:forEach>
						</div>
						<div>
							<c:forEach items="${monthtaskReleases2}" var="u" begin="3" end="5" step="1">
								<span><a class="bt" href="/taskRelease/getTaskReleaseById?id=${u.id}">${u.purpose }</a></span><br>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- 条目中可以是任意内容，如：<img src=""> -->

				<script>
                    layui.use('carousel', function () {
                        var carousel = layui.carousel;
                        //建造实例
                        carousel.render({
                            elem: '#test4'
                            , width: '70%'
                            , height: '130px'
                            , arrow: 'none' //始终显示箭头
                            , anim: 'updown' //切换动画方式
                        });
                    });

                    layui.use('carousel', function () {
                        var carousel = layui.carousel;
                        //建造实例
                        carousel.render({
                            elem: '#test5'
                            , width: '70%'
                            , height: '130px'
                            , arrow: 'none' //始终显示箭头
                            , anim: 'updown' //切换动画方式
                        });
                    });


                    layui.use('carousel', function () {
                        var carousel = layui.carousel;
                        //建造实例
                        carousel.render({
                            elem: '#test6'
                            , width: '70%'
                            , height: '130px'
                            , arrow: 'none' //始终显示箭头
                            , anim: 'updown' //切换动画方式
                        });
                    });
				</script>
			</div>
		</div>
		</div>
	</div>



	<div class="container" style="margin-top: 20px;height:170px;">
		<div class="row">
			<c:forEach items="${centerAuthllist}" var="u" begin="0" end="19" step="1">
			<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
				<a href="http://${u.addressUrl}" target="_blank" class="thumbnail">
					<img src="" id="centerimg${u.id}"/>
					<script>
                        var centerimg1="${u.sitePictureUrl}".split(",");
                        var centerimg2=document.getElementById("centerimg${u.id}");
                        centerimg2.src="${pageContext.request.contextPath}"+centerimg1[0];
					</script>
				</a>
			</div>
			</c:forEach>
		</div>
	</div>
	<div class="container" style="margin-top:30px;">
		<div class="row">
			<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
				<div class="model2">
					<div class="tit">
						<h2>
							<a href="/policyAdvice/findpagepolicyAdviceForList"><strong>新闻资讯</strong></a>
						</h2>
					</div>
					<c:forEach items="${PolicyAdvice}" var="u" begin="0" end="8" step="1">
						<span><img src="img/xinwen.png" class="tubiao"><a class="bt1" href="/policyAdvice/getPolicyAdviceById?id=${u.id}">${u.adviceTitle}</a></span><br>
					</c:forEach>
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
				<div class="model1">
					<div class="tit" style="background-color: #5367af;">
						<h2>
							<a href="/about.jsp"><strong>关于我们</strong></a>
						</h2>
					</div>
					<div class="gsjs">
						<h3 style="text-align: center;margin-top:20px;margin-bottom: 20px;height:45px;">了解科天行</h3>
						<p>科天行知产致力于打造集知识产权服务、资本对接、人才对接、技术转移和成果转化等在内的全链条一站式科技服务平台，拥有知识产权服务领域所需的战略远见、市场前沿的丰富经验。在搭建信息交互平台的基础上，挖掘知识产权领域所被低估的巨大价值，为隐藏着的具有巨大潜能的项目赋予更多的灵魂和生命力。</p>
						<p >业务范畴：</p>
						<p>科天行知产致力于打造知识产权信息服务全产业链，公司下设知识产权管理中心、信息运营中心、市场运营中心、营销中心、客服中心五大中心体系。科天行知产作为覆盖全领域的知识产权信息服务平台，所整合信息行业涉及生活需要、交通运输、化学化工、轻工纺织、新能源、节能环保、航空航天、教育休闲、医药医疗、农林牧业、采矿冶金、安全防护等多个领域，形成了从资源整合、信息推广、项目开发、资本对接、营销策划、直至知识产权成果最大化的全产业链完整服务体系。</p>
						<p>在用户服务层面，科天行不仅仅是一个信息交互的平台，更是一站式的知识产权成果转化平台，同时也为企业方客户建立了不断在更新的全方位技术智库。</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container" style="margin-top:30px;">
		<div class="com-title">
			<h2>
				<span></span>
				<strong>友情链接</strong>
				<span></span>
			</h2>
		</div>
		<div class="row">
			<c:forEach items="${yqAuthlist}" var="u" begin="0" end="5" step="1">
				<div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
					<a href="http://${u.addressUrl}" target="_blank" class="thumbnail" style="margin-bottom: 0;">
						<img src="" id="yqimg${u.id}">
						<script>
                            var yqimg1="${u.sitePictureUrl}".split(",");
                            var yqimg2=document.getElementById("yqimg${u.id}");
                            yqimg2.src="${pageContext.request.contextPath}"+yqimg1[0];
						</script>
					</a>
				</div>
			</c:forEach>
		</div>
		<div class="row">
			<c:forEach items="${yqAuthlist}" var="u" begin="6" end="11" step="1">
				<div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
					<a href="http://${u.addressUrl}" target="_blank" class="thumbnail">
						<img src="" id="yqimg${u.id}">
						<script>
                            var yqimg1="${u.sitePictureUrl}".split(",");
                            var yqimg2=document.getElementById("yqimg${u.id}");
                            yqimg2.src="${pageContext.request.contextPath}"+yqimg1[0];
						</script>
					</a>
				</div>
			</c:forEach>
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
		<a href="javascript:void(0);" id="close1" ><span class="glyphicon glyphicon-remove"></span></a>
	</div>

	<div class="w3ls-form">
		<h1>意见反馈</h1>
		<form  id="maintainForm" class="layui-form" method="post" action="/leaveMessage/addLeaveMessage">
			<ul class="fields">
		<li>	
			<label class="w3ls-opt">您的姓名<span class="w3ls-star"> * </span></label>
			<div class="w3ls-name">	
				<input type="text" name="realName"  placeholder="请输入您的姓名" required=" "/>
			</div>
		</li>
		<li>
			<label class="w3ls-opt">您的联系方式<span class="w3ls-star"> * </span></label>	
				<span class="w3ls-text w3ls-name">
					<input type="text" name="mobile" placeholder="请输入您的联系方式" required=""/>
				</span>
		</li>
		<li>
			<div class="mail">
				<label class="w3ls-opt">您的邮箱地址<span class="w3ls-star"> * </span></label>
				<span class="w3ls-text w3ls-name">
					<input type="email" name="mailAddress" placeholder="请输入您的邮箱地址" required=""/>
				</span>
			</div>
		</li>
		<div class="input">
			<label class="w3ls-opt1">您的问题或建议<span> ?</span></label>
			<span class="w3ls-input"><textarea name="message" id="message" placeholder="请输入您的问题或建议"></textarea></span>
			<input type="hidden" id="messageState" name="messageState" value="0"/>
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