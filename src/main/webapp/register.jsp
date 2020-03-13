<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>注册信息</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon" />
    <link href="${pageContext.request.contextPath}/css/register.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="layui/layui.all.js"></script>
    <script src="/js/jquery.min.js"></script>
    <style>
        .layui-form-label{
            width:100px;
        }
        .layui-input{
            width:250px;
            float: left;
        }
        .code-btn {
            color: #a07941;
            margin-left: 10px;
            height: 28px;
            font-size: 14px;
            border: 1px solid #a07941;
            border-radius: 5px;
            padding: 5px;
            box-sizing: border-box;
            cursor: pointer;
        }
    </style>
</head>
<!--logo s-->
<div class="logo-wrap clearfix">
    <div class="kt-logo"><a target="_self" href="/"><img alt="公司名称logo" src="${pageContext.request.contextPath}/img/login1.ico" ></a></div>
</div>
<!--logo e-->
<!--wrapper s-->
<div id="wrapper">
    <div class="clearfix reg-cont">
        <p class="desc">注册只需10秒，发布、管理信息更轻松</p>
        <div class="login-tab" data-widget="app/ms_v2/user/register.js#switchTab">
            <ul>
                <li data-role="switch" data-action="phone" class="active"><a href="javascript:void(0);">快速注册</a></li>
                <li class="li_fr">已有账号?<span><a href="/login" style="color: #60af00;">立即登录</a></span></li>
                <!--登录界面地址-->
            </ul>
        </div>
        <div class="tab-con2">
            <form id="maintainForm" class="layui-form" method="post" action="/user/addcommonuser" onsubmit="return checkform();">
                    <div class="layui-form-item">
                        <label class="layui-form-label">用户名：</label>
                        <div class="layui-input-block">
                            <input  type="text" name="username" id="username" placeholder="请填写用户名" lay-verify="title" autocomplete="off" class="layui-input" onblur="YHMonblus()" onfocus="YHMonfocu">
                            <input value="2" type="hidden" name="identity"/>
                            <input value="5" type="hidden" name="freeMessageNum" id="freeMessageNum"/>
                            <input value="0" type="hidden" name="authorizeType" id="authorizeType" />
                            <input type="hidden" name="accountYue" id="accountYue" value="0"/>
                            &nbsp;<span class="msg-box" id="tip_username"><span id="tip_username1" class="msg-box1"></span></span>
                        </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">手机号：</label>
                            <div class="layui-input-block" >
                                <input type="text" class="layui-input" placeholder="请填写您的手机号" name="mobile" id="tel_num" value="" onblur="LXDHonblus()" onfocus="LXDHonfocu()">
                                <span  type="button" class="code-btn">获取验证码</span>
                                &nbsp;<span id="tip_phone" class="msg-box"><span id="tip_phone1"></span></span>
                            </div>
                            <div class="layui-input-block" style="width:300px;">
                            <input style="margin-top:20px; width:100px;" type="tel" name="" id="code_num" class="layui-input" lay-verify="required|phone" value="" onblur="YZMonblus()" onfocus="YZMonfou()">
                            &nbsp;<span style="margin-top:17px; width:200px;" id="tip_code_num" class="msg-box"><span id="tip_code_num1"></span></span>
                            </div>
                    </div>
                    <div class="layui-upload">
                        <label class="layui-form-label">上传头像：</label>
                        <div class="layui-input-block">
                        <div class="layui-upload-list">
                            <input type="file" id="test1" onchange="uploadImage(this)"/>
                            <img class="layui-upload-img" id="demo1" style="background-color: #eeeeee;width:100px;height:100px;">
                            <script>
                                layui.use('upload', function(){
                                    var $ = layui.jquery
                                        ,upload = layui.upload;

                                    //普通图片上传
                                    var uploadInst = upload.render({
                                        elem: '#test1'
                                        ,url: '/upload/uploadImg'
                                        ,before: function(obj){
                                            //预读本地文件示例，不支持ie8
                                            obj.preview(function(index, file, result){
                                                $('#demo1').attr('src', result); //图片链接（base64）
                                            });
                                        },
                                    });
                                    })
                            </script>
                            <span id="demoText"></span>
                            <input type="hidden" name="headPortrait" id="headPortrait" value=""/>
                        </div>
                        </div>
                    </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">密码：</label>
                    <div class="layui-input-block">
                        <input value=""  name="password" id="password" onKeyUp="pwStrength(this.value)" onBlur="pwStrength(this.value)" onfocus="MMonfocu()" type="password" class="layui-input"maxlength="16"/>
                        <span class="msg-box" id="tip_phone_password"><span id="tip_phone_password1"></span></span>
                    </div>
                    <div class="pw-strength" id="level">
                        <div class="progress" style="width: 200px;">
                            <div id="jian" class="progress-bar progress-bar-danger" >
                            </div>
                            <div id="yi" class="progress-bar progress-bar-warning progress-bar-striped" >
                            </div>
                            <div id="nan" class="progress-bar progress-bar-success">
                            </div>
                        </div>
                        <div class="pw-txt clearfix">
                            <span>危险</span>
                            <span>一般</span>
                            <span>安全</span>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">确认密码：</label>
                    <div class="layui-input-block">
                    <input value="" name="phone_password2" id="password2" type="password" maxlength="16" class="layui-input" onblur="QRMMonblus()" onfocus="QRMMonfocu()"/>
                        <span class="msg-box" id="tip_phone_password2"><span id="tip_phone_password21"></span></span>
                    </div>
                </div>
                <div class="layui-form-item">
                        <div class="agreement-cont">
                            <input id="check" type="checkbox" class="chk-vm" onclick="XY()" style="display: block;margin: 8px 5px 0 0;" checked/>
                            <label style="float: left;">
                            我已阅读并同意
                                <a target="_blank" href="/about.jsp#5">&lt;&lt;科天行服务协议&gt;&gt;</a>
                                &nbsp;和&nbsp;
                                <a target="_blank" href="/about.jsp#4">&lt;&lt;科天行隐私协议&gt;&gt;</a></label>
                            <span class="msg-box" id="tip_phone_affirm"><span id="tip_phone_affirm1"></span></span>
                        </div>
                </div>
                    <div class="submit-box">
                        <input type="submit" value="立即注册" data-role="reg_submit" class="btn-org">
                        <span class="msg-box" id="tip_form"><span id="tip_form1"></span></span>
                    </div>
            </form>
        </div>

    </div>
</div>
<!--wrapper e-->
<!--footer s-->
<!-- footer s -->
<!-- footer e -->
<!--footer e-->
<script type="text/javascript">
    var code1;
    var result1;

    function uploadImage(obj) {
        var f = $(obj).val();
        if(f == null || f == undefined || f == '') {
            return false;
        }
        if (!/\.(?:png|jpg|PNG|JPG)$/.test(f)) {
            $.messageBox({message:"类型必须是图片(.png|jpg|PNG|JPG)"});
            $(obj).val('');
            return false;
        }
        var data = new FormData();
        $.each($(obj)[0].files, function(i, file) {
            data.append('img', file);
        })
        $.ajax({
            type:"POST",
            url: "/upload/uploadImg",
            data: data,
            cache:false,
            contentType: false,
            processData: false,
            dataType: "json",
            success: function(result) {
                if (result.flag == true) {
                    $("#headPortrait").val(result.resultStr);
                    document.getElementById("demoText").className="success";
                    document.getElementById("demoText").innerText="上传成功";
                    console.log("上传成功");
                } else {
                    $.messageBox({message:result.resultStr});
                    $(obj).val('');
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                document.getElementById("demoText").className="error2";
                document.getElementById("demoText").innerText="上传失败，请检查网络后重试";
            }
        })
    }


    //判断输入密码的类型
    function CharMode(iN){
        if (iN>=48 && iN <=57) //数字
            return 1;
        if (iN>=65 && iN <=90) //大写
            return 2;
        if (iN>=97 && iN <=122) //小写
            return 4;
        else
            return 8;
    }
    //bitTotal函数
    //计算密码模式
    function bitTotal(num){
        modes=0;
        for (i=0;i<4;i++){
            if (num & 1) modes++;
            num>>>=1;
        }
        return modes;
    }
    //返回强度级别
    function checkStrong(sPW){
        if (sPW.length<=4)
            return 0; //密码太短
        Modes=0;
        for (i=0;i<sPW.length;i++){
//密码模式
            Modes|=CharMode(sPW.charCodeAt(i));
        }
        return bitTotal(Modes);
    }

    //显示颜色
    function pwStrength(pwd){
        var password=document.getElementById("password");
        var passworderr=document.getElementById("tip_phone_password");
        var re = /^(?=.*\d)(?=.*[a-zA-Z])[\da-zA-Z]{6,}$/;
        // var reg=/[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/;

        if(password.value==""){
            passworderr.className="error1";
            passworderr.innerText="请输入密码";
        }
        else if(password.value.length < 6){
            passworderr.className="error2";
            passworderr.innerText="格式错误,,密码长度至少为6位";
        }

        else if(!re.test(password.value)){
            passworderr.className="error2";
            passworderr.innerText="格式错误,必须包含英文字母大小写和数字";
        }
        else {
            passworderr.className="success";
            passworderr.innerText ="";
        }


        O_color="";
        L_color="33%";
        M_color="33%";
        H_color="33%";
        if (pwd==null||pwd==''){
            Lcolor=Mcolor=Hcolor=O_color;
        }
        else{
            S_level=checkStrong(pwd);
            switch(S_level) {
                case 0:
                    Lcolor=Mcolor=Hcolor=O_color;
                case 1:
                    Lcolor=L_color;
                    Mcolor=Hcolor=O_color;
                    break;
                case 2:
                    Lcolor=Mcolor=M_color;
                    Hcolor=O_color;
                    break;
                default:
                    Lcolor=Mcolor=Hcolor=H_color;
            }
        }
        document.getElementById("jian").style.width=Lcolor;
        document.getElementById("yi").style.width=Mcolor;
        document.getElementById("nan").style.width=Hcolor;
        return;
    }


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
            phoneerr=document.getElementById("tip_phone");
            phoneerr.className="error1";
            phoneerr.innerText="请输入手机号";
        }
    })

    //    用户名
    function YHMonblus(){
        var username=document.getElementById("username");
        var usernameerr=document.getElementById('tip_username');
        // var reN =/^\d{6,18}$/;
        var re = /^[a-zA-Z0-9_]*$/;
        if(username.value==""){
            usernameerr.className="error1";
            usernameerr.innerText="请输入用户名";
        }
        else if(username.value.length < 6 ||username.value.length > 18){
            console.log(username.value);
            usernameerr.className="error2";
            usernameerr.innerText="格式错误,长度应为6-18个字符";
        }
        else if(!re.test(username.value)){
            usernameerr.className="error2";
            usernameerr.innerText="格式错误,只能包含英文字母和下划线";
        }
        else {
            usernameerr.className="success";
            usernameerr.innerText ="";
        }
    }
    function YHMonfocu(){
        var usernameerr=document.getElementById('tip_username');
        usernameerr.className="msg-box";
        usernameerr.innerText ="";
    }
    //   密码
    function MMonfocu(){
        var passworderr=document.getElementById("tip_phone_password");
        passworderr.className="msg-box";
        passworderr.innerText ="";
    }

    //    确认密码
    function QRMMonblus(){
        var password=document.getElementById("password");
        var confirmPassword=document.getElementById("password2");
        var password2err=document.getElementById('tip_phone_password2');
        if(confirmPassword.value==""){
            password2err.className="error1";
            password2err.innerText="请输入确认密码";
        }
        else if(password.value != confirmPassword.value){
            password2err.className="error2";
            password2err.innerText="两次密码输入不一致";
        }
        else {
            password2err.className="success";
            password2err.innerText ="";
        }
    }
    function QRMMonfocu(){
        var password2err=document.getElementById('tip_phone_password2');
        password2err.className="msg-box";
        password2err.innerText ="";
    }

    //    联系电话
    function LXDHonblus(){
        var phone=document.getElementById("tel_num");
        var phoneerr=document.getElementById('tip_phone');
        var re =/^(0|86|17951)?(13[0-9]|15[012356789]|17[0-9]|18[0-9]|14[57])[0-9]{8}$/;

        if(phone.value==""){
            phoneerr.className="error1";
            phoneerr.innerText="请输入手机号";
        }
        else if(!re.test(phone.value)){
            console.log(phone);
            phoneerr.className="error2";
            phoneerr.innerText="电话格式输入错误";
        }
        else {

            $.ajax({
                type:"POST",
                url: "/user/getUserByMobile?mobile="+phone.value,
                success: function(result) {
                    if(result){
                        phoneerr.className="success";
                        phoneerr.innerText ="";
                    }else{
                        phoneerr.className="error2";
                        phoneerr.innerText="手机号已经注册，请前往登录页面";
                    }
                },
            })
        }
    }
    function LXDHonfocu(){
        var phoneerr=document.getElementById('tip_phone');
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
            code_numerr.className="error2";
            code_numerr.innerText="验证码不正确";
        }
    }
    function YZMonfou() {
        var code_numerr=document.getElementById("tip_code_num");
        code_numerr.className="msg-box";
        code_numerr.innerText="";
    }

    function XY() {
        var c=document.getElementById("check");
        var cerr=document.getElementById("tip_phone_affirm");
        if(!c.checked){
            cerr.className="error2";
            cerr.innerText="必须先接收网站的条款"
        }
        else{
            cerr.className="msg-box";
            cerr.innerText="";
        }
        console.log(c.checked);
    }
    function checkform() {
        var usernameerr=document.getElementById('tip_username');
        var pictureerr=document.getElementById("demoText");
        var passworderr=document.getElementById("tip_phone_password");
        var password2err=document.getElementById('tip_phone_password2');
        var phoneerr=document.getElementById('tip_phone');
        var code_numerr=document.getElementById("tip_code_num");
        var cerr=document.getElementById("tip_phone_affirm");
        var formerr=document.getElementById("tip_form");
        if(usernameerr.className!="success" || pictureerr.className!="success" || passworderr.className!="success" || password2err.className!="success" || phoneerr.className!="success"  || cerr.className =="error2" || code_numerr.className!="success")
        {
            formerr.className="error2";
            formerr.innerText="请先按错误提示修改表单中的信息再进行提交";
            return false;
        }else {
            formerr.className="success";
            formerr.innerText="正在提交...";
            return true;
        }

    }
</script>

</body>

</html>