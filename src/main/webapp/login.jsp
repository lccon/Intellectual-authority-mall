<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <title>登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon" />

    <!-- CSS -->
    <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/supersized.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login1.css">
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

</head>

<body>

<div class="page-container">
    <h1>登录</h1>
    <form action="/api/login" method="post" id="loginform-inner"
          novalidate="novalidate">
        <input type="text" name="username" class="username" placeholder="用户名">
        <input type="password" name="password" class="password" placeholder="密码">
        <div style="margin-top: 40px;">
            <a href="/" style="float: left;">返回首页</a>
            <a href="/register" style="float: right">没有帐号？去注册</a>
        </div>
        <button type="submit">登录</button>
        <div id="loginInfo"></div>
    </form>
</div>

</body>
<script src="/js/jquery.min.js"></script>
<script src="/js/supersized.3.2.7.min.js"></script>
<script src="/js/supersized-init.js"></script>
<script src="/js/scripts.js"></script>
<script src="/resource/js/jquery.base.js"></script>
<script src="/resource/js/jQuery.md5.js"></script>
<script src="/resource/js/validate.js"></script>
<script src="/resource/js/formValidate.js"></script>
<script>

    $.fn.extend({
			dialogtip : function(option) {
				var defaultOption = {
					className : 'tip-error',
					showOn : 'none',
					alignTo : 'target',
					hideTimeout : 0,
					showTimeout : 0,
					alignX : 'center',
					alignY : 'bottom',
					offsetX : 0,
					offsetY : 5
				}
				$.extend(defaultOption, option);
				$(this).poshytip(defaultOption);
			}
		})
		$(function() {
			$("#username").focus();
			$("#username,#password").bind("keydown", function(evt) {
				var evt = window.event ? window.event : evt;
				if (evt.keyCode == 13) {
					$('#loginform-inner').submit();
				}
			});
			$("#remember").toggle(function() {
				$(this).attr('checked', "checked");
				$(this).siblings('.checkbox-wrapper').find('.check_right').show();
			}, function() {
				$(this).attr('checked', false);
				$(this).siblings('.checkbox-wrapper').find('.check_right').hide();
			});
			$("#loginform-inner").formValidate({
				rules : {
					userName : {
						required : true
					},
					password : {
						required : true
					}
				},
				messages : {
					userName : {
						required : "用户名不能为空！"
					},
					password : {
						required : "密码不能为空！"
					}
				},
				submitHandler : function(form) {					
					$("#loginInfo").text("系统登录中...");
					$("#loginButton").attr('disabled', true);
					$("#password").val($("#password").val());
					$(form).ajaxSubmit({
						success : function(data) {
							if (data != null && data) {
                                if (data.errorCode) {
                                    $("#loginInfo").text(data.message);
                                    $("#password").val("");
                                    $("#loginButton").attr('disabled', false);
                                } else {
                                    document.location.href = "/";
                                }
							}
						},
						error : function(xmlHttpRequest, textStatus, errorThrown) {
						}
					});
					return false;
				}
			});
		});

</script>
</html>