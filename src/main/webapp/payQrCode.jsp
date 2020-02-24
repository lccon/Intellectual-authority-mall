<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>微信支付</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/weixinpay.css" />
</head>
<body>
<div class="shortcut">
	<div class="w">
		<a class="s-logo" href="#" target="_blank" psa="PCashier_jd">
			<img width="170" height="28" alt="LOGO收银台" src="">
		</a>
		<span class="clr"></span>
	</div>
</div>

<div class="main">
		<div class="w">
			<!-- order 订单信息 -->
			<div class="order clearfix order-init order-init-oldUser-noQrcode">
				<!-- 订单信息 -->
				<div class="o-left"><h3 class="o-title">订单提交成功，请尽快付款！订单号：110332733554</h3>

					<p class="o-tips">

					</p>
				</div>
				<!-- 订单信息 end --><!-- 订单金额 -->
				<div class="o-right">
					<div class="o-price"><em>应付金额</em><strong>78.50</strong><em>元</em></div>
				</div>
				<!-- 订单金额 end -->
				<div class="o-list j_orderList" id="listPayOrderInfo"><!-- 单笔订单 -->

				</div>
			</div>
			<!-- payment 支付方式选择 -->
			<div class="payment">
				<!-- 微信支付 -->
				<div class="pay-weixin">
					<div class="p-w-hd"><img src="img/WePayLogo.png" style="max-width: 200px;max-height: 200px;"></div>
					<div class="p-w-bd" style="position:relative">
						<div class="p-w-box">
							<div class="pw-box-hd">
								<div id="code" class="code1"></div>
							</div>
							<div class="pw-box-ft">
							</div>
						</div>
						<div class="p-w-sidebar"></div>
					</div>
				</div>
				<!-- 微信支付 end -->
			</div>
		</div>
	</div>


	<input type="text" id="qrCodeUrl" value="${qrCodeUrl }"/>
	

	
	<script src="<%=request.getContextPath() %>/js/jquery.min.js?v=1.0.1" type="text/javascript"></script>
	<script src="<%=request.getContextPath() %>/js/jquery-qrcode/jquery.qrcode.min.js?v=1.0.1" type="text/javascript"></script>
	
	<script type="text/javascript">
	
		$('#code').qrcode($("#qrCodeUrl").val());
		
		// 如果url中含有中文，使用本方法
		function toUtf8(str) {    
		    var out, i, len, c;    
		    out = "";    
		    len = str.length;    
		    for(i = 0; i < len; i++) {    
		        c = str.charCodeAt(i);    
		        if ((c >= 0x0001) && (c <= 0x007F)) {    
		            out += str.charAt(i);    
		        } else if (c > 0x07FF) {    
		            out += String.fromCharCode(0xE0 | ((c >> 12) & 0x0F));    
		            out += String.fromCharCode(0x80 | ((c >>  6) & 0x3F));    
		            out += String.fromCharCode(0x80 | ((c >>  0) & 0x3F));    
		        } else {    
		            out += String.fromCharCode(0xC0 | ((c >>  6) & 0x1F));    
		            out += String.fromCharCode(0x80 | ((c >>  0) & 0x3F));    
		        }    
		    }    
		    return out;    
		} 
// 		$('#code').qrcode(toUtf8("我还会回来的！"));
		
		// 查询是否支付成功 
		function checkPayResult() {
			$.get("/wxPayIsSuccess", function(data) {
// 				debugger;
				console.log(data);
				if (data) {
					window.location.href = "/paySuccess";
				}
			});
		}
		
		$(function() {
			// 每个3秒调用后台方法，查看订单是否已经支付成功
			window.setInterval("checkPayResult()", 3000);
		});
	</script>
</body>
</html>