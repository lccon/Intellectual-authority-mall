<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<!--title  -->
<title>${data["loginTab"].configName}</title>

<!--href  -->
<link rel="shortcut icon" href=${data["loginTabImage"].configName} type="image/x-icon"/>
<link rel="stylesheet" href="/resource/css/login/reset.css">
<link rel="stylesheet" href="/resource/css/login/login.css">
</head>
<body id="t-beauty-v1">

	<!--background  -->
	<div class="login-wrapper" id="loginBg" style='background-image:url(${data["loginBackground"].configName})'>
	
	    <!--登陆框背景  -->
		<div class="login-enter" id="loginEnterBg" style='background-image:url(${data["loginBoxImage"].configName})'>
			<div class="login-box">
				<form action="/cms/doLogin" method="post" id="loginform-inner"
					novalidate="novalidate">
					<input type="hidden" id="siteId" name="siteId" value="${siteId}"/>
					<div class="login-title">
					
						<!--登录页标题图标，loginTitle  -->
                        <i class="login-icon" id="loginTitleIcon" style='background:${data["loginTitleIcon"].configName}'></i>
                        <span class="login-name" id="loginTitle" style="font-size:${data["loginTitle"].wordSize}px">${data["loginTitle"].configName }</span>
                    </div>
					<p class="user-input">
						<input id="username" type="text" placeholder="邮箱地址" name="userName">
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
                    
                    <!--backgroundImage，loginFooter  -->
                    <div class="loginFooter">
                    	<i class="icon" id="loginFooterIcon" style='background-image:url(${data["loginFooterIcon"].configName})'></i>
                    	<span id="loginFooter">${data["loginFooter"].configName }</span>
                    </div>
				</form>
			</div>
		</div>
    </div>

</body>
<script src="/resource/js/base/jquery.base.js"></script>
<script src="/resource/js/base/jQuery.md5.js"></script>
<script src="/resource/js/base/validate.js"></script>
<script src="/resource/js/libs/formValidate.js"></script>
<script>
    /* $.ajax({
        url:'/cms/pageconfig/getPageConfigManageMapBySiteId',
        data:{"configType":1,"siteMark":$("#siteMark").val()},
        success:function(data){
        	debugger;
            //登录页页签logo
            var ico = document.querySelector("link[rel*='icon']");
            ico.href = '/resource/images/login-footer-logo.png'

            //登录页页签名称
            //document.title = '社会治理云平台'
            document.title = data["loginTab"].configName;
            
            //登录页标题更改
            $('#loginTitle').html(data["loginTitle"].configName)

            //登录页标题图标更改
            $('#loginTitleIcon').css({'background':'##78b7ff'})

            //登录页页脚
            $('#loginFooter').html(data["loginFooter"].configName)
            
            //登录页页脚icon
            $('#loginFooterIcon').css({'backgroundImage':'url(./resource/images/login-footer-logo.png)'})

            //登陆页背景更改
            $('#loginBg').css({'background':'url(./resource/images/login-bg.png)'})

            //登陆框背景
            $('#loginEnterBg').css({'backgroundImage':'url(./resource/images/login-enter-bg.png)'})

        }
    }); */

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
								if (!data.success) {
									$("#loginInfo").text(data.errDesc);
									$("#password").val("");
									$("#loginButton").attr('disabled', false);
									return;
								} 
								if(data.success){
									document.location.href = "/cms/index";
									return;
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