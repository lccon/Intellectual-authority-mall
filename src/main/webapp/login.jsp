<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<!--title  -->
<title>登录</title>

<!--href  -->
<link rel="shortcut icon" href=${data["loginTabImage"].configName} type="image/x-icon"/>
<link rel="stylesheet" href="/resource/css/login/reset.css">
<link rel="stylesheet" href="/resource/css/login/login.css">
	<jsp:include page="jsinclude.jsp"/>
</head>
<body id="t-beauty-v1">

	<div class="login-wrapper" id="loginBg">
	
	    <!--登陆框背景  -->
		<div class="login-enter" id="loginEnterBg">
			<div class="login-box">
				<form action="/api/login" method="post" id="loginform-inner"
					novalidate="novalidate">
					<div class="login-title">
					
						<!--登录页标题图标，loginTitle  -->
                        <i class="login-icon" id="loginTitleIcon"></i>
                        <span class="login-name" id="loginTitle" style="font-size:${data["loginTitle"].wordSize}px">
							公司LOGO
						</span>
                    </div>
					<p class="user-input">
						<input id="username" type="text" placeholder="邮箱地址" name="username">
					</p>
					<p class="password-input">
						<input id="password" type="password" placeholder="密码" name="password">
					</p>
					<div id="loginInfo"></div>
					<div class="btn-bar">
						<label class="iv-checkbox"> <input type="checkbox" name=""
							id=""><span class="iv-checkbox-inner"></span>记住密码
						</label>
						<input type="submit" id="loginButton" class="login-btn" value="登录" />
                    </div>
                    <div style="margin-top: 40px;">
						<a href="index.jsp">返回首页</a>
						<a href="register.jsp" style="float: right">没有帐号？去注册</a>
					</div>
				</form>
			</div>
		</div>
    </div>

</body>
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