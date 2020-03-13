<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <title>密码找回</title>
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
<style>
    .code-btn {
        color: #000000;
        margin-left: 10px;
        height: 28px;
        font-size: 14px;
        border: 1px solid #000000;
        border-radius: 5px;
        padding: 5px;
        box-sizing: border-box;
        cursor: pointer;
    }
    .success{
        background: url(../img/validatorvalid.png) no-repeat 10px 4px;
        font-size: 14px;
        display: inline-block;
        height: 30px;
        line-height: 30px;
        padding-left: 36px;
        vertical-align: middle;
    }
    .error1{
        background: url(../img/validatorerror.png) no-repeat 10px 4px;
        color: #f60;
        font-size: 14px;
        display: inline-block;
        height: 30px;
        line-height: 30px;
        padding-left: 36px;
        vertical-align: middle;
    }
</style>
<div class="page-container">
    <h1>忘记密码?</h1>
    <form action="/user/updatePassword" method="post" id="loginform-inner"
          novalidate="novalidate" onsubmit="return checkform();">
        <div style="width:500px;text-align: left;">
            <input type="text" name="mobile" id="mobile" class="username" placeholder="请输入手机号" onfocus="LXDHonfocu()" onblur="LXDHonblus()"><span type="button" style="margin-left: -83px;" class="code-btn">获取验证码</span>
            &nbsp;<span id="tip_mobile" class="msg-box"></span>
        </div>
        <div style="width:500px;text-align: left;">
        <input type="text" name="code" id="code_num" class="code" placeholder="请输入验证码" style="width:100px;" onblur="YZMonblus()" onfocus="YZMonfou()">
        &nbsp;<span id="tip_code_num" class="msg-box"></span>
            <br>
        </div>
        <div style="width:500px;text-align: left;">
        <input type="password" name="password" id="password" class="password" placeholder="请输入密码" onblur="pwdonblus()" onfocus="pwdfocu()">
        &nbsp;<span id="tip_password" class="msg-box"></span>
        </div>
        <div style="width:500px;text-align: left;">
        <input type="password" name="password1" id="password1" class="password1" placeholder="请重新输入密码" onblur="QRMMonblus()" onfocus="QRMMonfocu()">
        &nbsp;<span id="tip_password1" class="msg-box"></span>
        </div>
        <div style="width:500px;text-align: left;">
        <button type="submit">重置密码</button>
        <div id="loginInfo"></div>
        </div>
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
    var code1;
    var result1;
    var code_time = 90;
    function time_inter() {
        $('.code-btn').addClass('code-btn-gray');
        var timeflag = setInterval(function () {
            $('.code-btn-gray').html("" + code_time + "s后获取").css({
                "cursor": "no-",
                "color": "#999"
            });
            code_time--;
            if (code_time == 0) {
                clearInterval(timeflag);
                $('.code-btn-gray').html("获取验证码").css({
                    "cursor": "pointer",
                    "color": "#a07941"
                });
                $('.code-btn').removeClass('code-btn-gray');
            }
        }, 1000)

    }
    //获取验证码点击事件
    $('.code-btn').on('click', function () {
        if ($(this).hasClass('code-btn-gray')) {
            return false;
        }
        var tel_num = $('#tel_num').val();
        if (tel_num && tel_num.length == 11) {
            time_inter();//按钮倒计时
            $.ajax({
                type:"POST",
                url: "/api/Aliyunmobile?mobile="+tel_num,
                datatype:"JSON",
                success: function(result) {
                    if(result){
                        var d = $.parseJSON(result);
                        code1=d.code;
                        result1=d.Code;
                    }
                    else {

                    }

                },
            })
        } else {
            phoneerr=document.getElementById("tip_mobile");
            phoneerr.className="error1";
            phoneerr.innerText="请输入手机号";
        }
    })

    //    联系电话
    function LXDHonblus(){
        var phone=document.getElementById("mobile");
        var phoneerr=document.getElementById('tip_mobile');
        var re =/^(0|86|17951)?(13[0-9]|15[012356789]|17[0-9]|18[0-9]|14[57])[0-9]{8}$/;
        if(phone.value==""){
            phoneerr.className="error1";
            phoneerr.innerText="请输入手机号";
        }
        else if(!re.test(phone.value)){
            console.log(phone);
            phoneerr.className="error1";
            phoneerr.innerText="电话格式输入错误";
        }
        else {
            phoneerr.className="success";
            phoneerr.innerText ="";
        }
    }
    function LXDHonfocu(){
        var phoneerr=document.getElementById('tip_mobile');
        phoneerr.className="msg-box";
        phoneerr.innerText ="";
    }
    //验证码
    function YZMonblus() {
        var code_num=document.getElementById("code_num");
        var code_numerr=document.getElementById("tip_code_num");
        if(code_num.value==code1 && result1=="OK"){
            code_numerr.className="success";
        }
        else{
            code_numerr.className="error1";
            code_numerr.innerText="验证码不正确";
        }
    }
    function YZMonfou() {
        var code_numerr=document.getElementById("tip_code_num");
        code_numerr.className="msg-box";
        code_numerr.innerText="";
    }

    //密码
    //显示颜色
    function pwdonblus(){
        var password=document.getElementById("password");
        var passworderr=document.getElementById("tip_password");
        var re = /^(?=.*\d)(?=.*[a-zA-Z])[\da-zA-Z]{6,}$/;
        // var reg=/[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/;

        if(password.value==""){
            passworderr.className="error1";
            passworderr.innerText="请输入密码";
        }
        else if(password.value.length < 6){
            passworderr.className="error1";
            passworderr.innerText="格式错误,,密码长度至少为6位";
        }

        else if(!re.test(password.value)){
            passworderr.className="error1";
            passworderr.innerText="格式错误,必须包含英文字母大小写和数字";
        }
        else {
            passworderr.className="success";
            passworderr.innerText ="";
        }
    }
    function pwdfocu(){
        var passworderr=document.getElementById("tip_password");
        passworderr.className="msg-box";
        passworderr.innerText ="";
    }

    //    确认密码
    function QRMMonblus(){
        var password=document.getElementById("password");
        var confirmPassword=document.getElementById("password1");
        var password2err=document.getElementById('tip_password1');
        if(confirmPassword.value==""){
            password2err.className="error1";
            password2err.innerText="请输入确认密码";
        }
        else if(password.value != confirmPassword.value){
            password2err.className="error1";
            password2err.innerText="两次密码输入不一致";
        }
        else {
            password2err.className="success";
            password2err.innerText ="";
        }
    }
    function QRMMonfocu(){
        var password2err=document.getElementById('tip_password1');
        password2err.className="msg-box";
        password2err.innerText ="";
    }

    //表单较验
    function checkform() {
        var mobileerr=document.getElementById("tip_mobile").className;
        var code_numerr=document.getElementById("tip_code_num").className;
        var pwderr=document.getElementById("tip_password").className;
        var pwd1err=document.getElementById("tip_password1").className;
        var formerr=document.getElementById("loginInfo");
        if(mobileerr!="success" ||code_numerr!="success" || pwderr!="success" || pwd1err!="success"){
            formerr.className="error1";
            formerr.innerText="请先按错误提示修改表单中的信息再进行提交";
            return false;
        }
        else {
            formerr.className="success";
            formerr.innerText="正在提交...";
            return true;
        }
    }
</script>
</html>