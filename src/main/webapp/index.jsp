<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<head>
	<jsp:include page="jsinclude.jsp"/>
</head>

<body>
    <jsp:include page="head.jsp"/>
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
			<c:forEach items="${AuthorizeSite}" var="u" begin="0" end="0" step="1">
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
			<c:forEach items="${AuthorizeSite}" var="u" begin="1" end="5" step="1">
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
							a1.href="/find?str1="+input1;
                        }
					</script>
					<a href="/post-message" class="btn btn-default" id="button2">免费发布信息</a>
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
				<c:forEach items="${IntellectualTask}" var="u" begin="0" end="4" step="1">

				<div class="pro-box">

				<ul>
				<li class="media" id="product">
					<div class="row">
						<div class="col-xs-12 col-sm-7 col-md-6 col-lg-6">

							<a href="/intellectualTask/getIntellectualTaskById?id=${u.id}" class="thumbnail">
								<img src="" alt="" id="cap${u.id}" style="width: 153px;height: 153px;"></img>
							</a>
							<script>
                                var url1="${u.productPictureUrl}".split(",");
                                var img1=document.getElementById("cap${u.id}");
                                img1.src="${pageContext.request.contextPath}"+url1[0];
							</script>
						</div>
					<div class="media-body" id="cap">
						<a class="media-heading"  href="/intellectualTask/getIntellectualTaskById?id=${u.id}">${u.productName}</a>
						<p id="desc">${u.productBrief}</p>
						<p id="price">1800元</p>
					</div>
				</div>
				</li>
			</ul>
		</div>
				</c:forEach>

			</th>


			<th>
				<c:forEach items="${AuthorizeCompany}" var="i" begin="0" end="4" step="1">
				<div class="pro-box">
				<ul>
				<li class="media" id="product">
					<div class="row">
						<div class="col-xs-12 col-sm-7 col-md-6 col-lg-6">

							<a href="/authorizeCompany/getAuthorizeCompanyById?id=${i.id}" class="thumbnail">
								<img src="" alt="" id="zzz${i.id}" style="width: 153px;height: 153px;"></img>
								<script>
                                        var url2="${i.companyPictureUrl}".split(",");
                                        var img2=document.getElementById("zzz${i.id}");
                                        img2.src="${pageContext.request.contextPath}"+url2[0];
								</script>
							</a>
						</div>
					<div class="media-body" id="cap">
						<a class="media-heading"  href="/authorizeCompany/getAuthorizeCompanyById?id=${i.id}">${i.companyName}</a>
						<p id="desc">${i.companyDescribe}</p>
					</div>
				</div>
				</li>
			</ul>
		</div>
				</c:forEach>
			</th>



			<th>
				<c:forEach items="${TaskRelease}" var="o" begin="0" end="4" step="1">
					<div class="pro-box">
				<ul>
				<li class="media" id="product">
					<div class="row">
						<div class="col-xs-12 col-sm-7 col-md-6 col-lg-6">

							<a href="/taskRelease/getTaskReleaseById?id=${o.id}" class="thumbnail">
								<img src="img/tab1-1.png" alt="" id="cap" style="width: 153px;height: 153px;"></img>
							</a>
						</div>
					<div class="media-body" id="cap">
						<a class="media-heading"  href="/taskRelease/getTaskReleaseById?id=${o.id}">${o.purpose}</a>
						<p id="desc">${o.detailedDesc}</p>
					</div>
				</div>
				</li>
			</ul>
		</div>
				</c:forEach>

			</th>



			<th>
				<c:forEach items="${TaskRelease1}" var="o" begin="0" end="4" step="1">
					<div class="pro-box">
						<ul>
							<li class="media" id="product">
								<div class="row">
									<div class="col-xs-12 col-sm-7 col-md-6 col-lg-6">
										<a href="/taskRelease/getTaskReleaseById?id=${o.id}" class="thumbnail">
											<img src="img/tab1-2.jpg" alt="" id="cap" style="width: 153px;height: 153px;"></img>
										</a>
									</div>
									<div class="media-body" id="cap">
										<a class="media-heading"  href="/taskRelease/getTaskReleaseById?id=${o.id}">${o.purpose}</a>
										<p id="desc">${o.detailedDesc}</p>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</c:forEach>

			</th>
		</tr>





<!--复制的数据后期可删除-->


<!--加入新闻模块-->
		<tr>
			<th>
				<c:forEach items="${IntellectualTask}" var="u" begin="5" end="5" step="1">

					<div class="pro-box">

						<ul>
							<li class="media" id="product">
								<div class="row">
									<div class="col-xs-12 col-sm-7 col-md-6 col-lg-6">

										<a href="/intellectualTask/getIntellectualTaskById?id=${u.id}" class="thumbnail">
											<img src="" alt="" id="cap${u.id}" style="width: 153px;height: 153px;"></img>
										</a>
										<script>
                                            var url1="${u.productPictureUrl}".split(",");
                                            var img1=document.getElementById("cap${u.id}");
                                            img1.src="${pageContext.request.contextPath}"+url1[0];
										</script>
									</div>
									<div class="media-body" id="cap">
										<a class="media-heading"  href="/intellectualTask/getIntellectualTaskById?id=${u.id}">${u.productName}</a>
										<p id="desc">${u.productBrief}</p>
										<p id="price">1800</p>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</c:forEach>

			</th>


			<th>
				<c:forEach items="${AuthorizeCompany}" var="i" begin="0" end="0" step="1">
					<div class="pro-box">
						<ul>
							<li class="media" id="product">
								<div class="row">
									<div class="col-xs-12 col-sm-7 col-md-6 col-lg-6">

										<a href="/authorizeCompany/getAuthorizeCompanyById?id=${i.id}" class="thumbnail">
											<img src="" alt="" id="bza${i.id}" style="width: 153px;height: 153px;"></img>
											<script>
                                                var url2="${i.companyPictureUrl}".split(",");
                                                var img2=document.getElementById("bza${i.id}");
                                                img2.src="${pageContext.request.contextPath}"+url2[0];
											</script>
										</a>
									</div>
									<div class="media-body" id="cap">
										<a class="media-heading"  href="/authorizeCompany/getAuthorizeCompanyById?id=${i.id}">${i.companyName}</a>
										<p id="desc">${i.companyDescribe}</p>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</c:forEach>
			</th>



			
			<th class="top-cap-new">
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp新闻模块
			</th>
			<th>

			</th>
		</tr>

<!--复制的数据后期可删除-->
		<tr>
			<th>
				<c:forEach items="${IntellectualTask}" var="u" begin="6" end="10" step="1">

					<div class="pro-box">

						<ul>
							<li class="media" id="product">
								<div class="row">
									<div class="col-xs-12 col-sm-7 col-md-6 col-lg-6">

										<a href="/intellectualTask/getIntellectualTaskById?id=${u.id}" class="thumbnail">
											<img src="" alt="" id="cap${u.id}" style="width: 153px;height: 153px;"></img>
										</a>
										<script>
                                            var url1="${u.productPictureUrl}".split(",");
                                            var img1=document.getElementById("cap${u.id}");
                                            img1.src="${pageContext.request.contextPath}"+url1[0];
										</script>
									</div>
									<div class="media-body" id="cap">
										<a class="media-heading"  href="/intellectualTask/getIntellectualTaskById?id=${u.id}">${u.productName}</a>
										<p id="desc">${u.productBrief}</p>
										<p id="price">1800元</p>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</c:forEach>

			</th>


			<th>
				<c:forEach items="${AuthorizeCompany}" var="i" begin="1" end="5" step="1">
					<div class="pro-box">
						<ul>
							<li class="media" id="product">
								<div class="row">
									<div class="col-xs-12 col-sm-7 col-md-6 col-lg-6">

										<a href="/authorizeCompany/getAuthorizeCompanyById?id=${i.id}" class="thumbnail">
											<img src="" alt="" id="boc${i.id}" style="width: 153px;height: 153px;"></img>
											<script>
                                                var url2="${i.companyPictureUrl}".split(",");
                                                var img2=document.getElementById("boc${i.id}");
                                                img2.src="${pageContext.request.contextPath}"+url2[0];
											</script>
										</a>
									</div>
									<div class="media-body" id="cap">
										<a class="media-heading"  href="/authorizeCompany/getAuthorizeCompanyById?id=${i.id}">${i.companyName}</a>
										<p id="desc">${i.companyDescribe}</p>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</c:forEach>
			</th>



			<th>
				<c:forEach items="${PolicyAdvice}" var="p" begin="0" end="5" step="1">
					<div class="pro-box">
						<ul>
							<li class="media" id="product">
								<div class="row">
									<div class="col-xs-12 col-sm-7 col-md-6 col-lg-6">

										<a href="/policyAdvice/getPolicyAdviceById?id=${p.id}" class="thumbnail">
											<img src="" alt="" id="zpolicy${p.id}" style="width: 153px;height: 153px;"></img>
											<script>
                                                var url3="${p.advicePictureUrl}".split(",");
                                                var img3=document.getElementById("zpolicy${p.id}");
                                                img3.src="${pageContext.request.contextPath}"+url3[0];
											</script>
										</a>
									</div>
									<div class="media-body" id="cap">
										<a class="media-heading"  href="/policyAdvice/getPolicyAdviceById?id=${p.id}">${p.adviceTitle}</a>
										<p id="desc">${p.adviceSubtitle}</p>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</c:forEach>
			</th>



			<th>
				<c:forEach items="${PolicyAdvice}" var="p" begin="0" end="5" step="1">
					<div class="pro-box">
						<ul>
							<li class="media" id="product">
								<div class="row">
									<div class="col-xs-12 col-sm-7 col-md-6 col-lg-6">

										<a href="/policyAdvice/getPolicyAdviceById?id=${p.id}" class="thumbnail">
											<img src="" alt="" id="policy${p.id}" style="width: 153px;height: 153px;"></img>
											<script>
                                                var url3="${p.advicePictureUrl}".split(",");
                                                var img3=document.getElementById("policy${p.id}");
                                                img3.src="${pageContext.request.contextPath}"+url3[0];
											</script>
										</a>
									</div>
									<div class="media-body" id="cap">
										<a class="media-heading"  href="/policyAdvice/getPolicyAdviceById?id=${p.id}">${p.adviceTitle}</a>
										<p id="desc">${p.adviceSubtitle}</p>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</c:forEach>
			</th>
		</tr>



		




		
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
		<a href="javascript:void(0);" id="close1" ><span class="glyphicon glyphicon-remove"></span></a>
	</div>
	<div class="w3ls-form">
		<h1>意见反馈</h1>
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
			<span class="w3ls-input"><textarea name="message" id="message" placeholder="请输入您的问题或建议"></textarea></span>
		</div>
	</ul>
	<div class="clear"></div>
		<div class="w3ls-btn">
			<input type="submit" value="提交" onclick="addLevemessage()">
		</div>
	</div>
	</div>

<!--页面底部-->
	<jsp:include page="footer.jsp"/>
    <script type="text/javascript">
        function addLevemessage(){
            var message=document.getElementById("message").value;
            var box = document.getElementById("ll");
            $.ajax({
                type:"POST",
                url: "/addLeaveMessage?message="+message,
                async : false,
                data:{type:1},
                timeout:1000,
                success: function(data) {
                    if(data != null && !data.id){
                        console.log("新增失败");
                        box.style.display="none";
                    }
                    else{
                        console.log("新增成功");
                        box.style.display="none";
                    }

                },
            })
        }
    </script>
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