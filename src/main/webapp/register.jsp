<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>注册信息</title>
    <link href="${pageContext.request.contextPath}/css/register.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <style>
        #qr-code-register {
            height: 232px;
        }

        .reg-cont .cont-box2 {
            height: 322px;
            padding-top: 0;
        }

        #qr-code-register .qr-code {
            height: 120px;
            width: 120px;
            background: url(../img/register_qr.png);
            margin: 0 auto;
        }

        #qr-code-register .title1 {
            text-align: center;
            margin: 0 auto;
            font-size: 16px;
            line-height: 56px;
            font-family: arial, 宋体;
            color: #010101;
        }

        #qr-code-register .title2 {
            text-align: center;
            margin: 0 auto;
            font-size: 14px;
            color: #4b4b4b;
            line-height: 56px;
            font-family: arial, 宋体;
        }

        .li_fr {
            float: right;
            background: none !important;
            border: none !important;
        }

        .li_fr a {
            color: #60af00
        }
    </style>
</head>
<!--logo s-->
<div class="logo-wrap clearfix">
    <div class="gj-logo"><a target="_self" href="/"><img width="155" height="62" alt="公司名称logo" src=""></a></div>
    <div class="logo-title"><span class="logo-tit user-reg">免费注册</span></div>
</div>
<!--logo e-->
<!--wrapper s-->
<div id="wrapper">
    <div class="clearfix reg-cont V5">
        <p class="desc">注册只需10秒，发布、管理信息更轻松</p>
        <div class="login-tab" data-widget="app/ms_v2/user/register.js#switchTab">
            <ul>
                <li data-role="switch" data-action="phone" class="active"><a href="javascript:void(0);">快速注册</a></li>
                <li class="li_fr">已有账号?<span><a href="#">立即登录</a></span></li>
                <!--登录界面地址-->

            </ul>
        </div>

        <div class="tab-con2 js-tab js-phone">
            <div class="error-box V5" id="reg_phone_error" style="display:none">
                <span class="validatorMsg validatorError" id="reg_phone_error_content"></span>
            </div>
            <form id="maintainForm" method="post" action="/user/addUser">
                <div class="tab-cont" style="display:block;">
                    <div class="field clearfix">
                        <label class="field-tit" for="username">用户名：</label>
                        <input value="" name="username" id="username" type="text" placeholder="请填写用户名"
                            class="tab-input-text t_reg_username"/>
                        <input value="2" type="hidden" name="identity"/>
                        <input value="3" type="hidden" name="freeMessageNum" id="freeMessageNum"/>
                        &nbsp;<span class="msg-box" id="tip_username"></span>
                    </div>
                    <div class="clearLine"></div>
                    <div class="field clearfix">
                        <label class="field-tit">头像：</label>
                        <input type="file" class="tab-input-text t_reg_phone" onchange="uploadImage(this);" class="text-input">
                        <input type="hidden" name="headPortrait" id="headPortrait" value=""/>
                    </div>
                    <div class="field clearfix">
                        <label class="field-tit" for="phone">手机号：</label>
                        <input type="text" class="tab-input-text t_reg_phone" placeholder="请填写您的手机号" name="mobile" id="mobile"
                            value="">
                        &nbsp;<span id="tip_phone" class="msg-box"></span>
                    </div>
                    <div class="field checkcode clearfix" id="checkcode"
                        data-widget="app/ms_v2/user/register.js#refleshPhoneRegImg">
                        <label class="field-tit" for="password">验证码：</label>
                        <input value="" name="checkphonecode" type="text" maxlength="4" class="input-text"
                            id="checkcode_phone_input">
                        <label class="fl">
                            <img id="img_phone_checkcode" data-role="reflesh" align="absmiddle"
                                src="js/ajax.php">
                        </label>
                        <a class="field-tips t_fts" data-role="reflesh" href="javascript:void(0);">看不清？换一个</a>
                        <span id="tip_phone_checkcode" style="width:136px"></span>
                        <p class="getcode clearfix">
                            <input type="button" gjalog="/user/register/send_phone_auth_code@atype=click"
                                class="time-buttom" value="获取手机确认码" name="sendCodeBtn"
                                data-widget="app/ms_v2/user/register.js#sendPhoneCode" autocomplete="off">
                            <span class="msg-box js-msg-box"><span class="validatorMsg"
                                    id="tip_is_get_code"></span></span>
                        </p>
                    </div>
                    <div class="field clearfix">
                        <label class="field-tit" for="phone_code">确认码：</label>
                        <input type="text" class="tab-input-text t_phone_code" name="phone_code" maxlength="6"
                            value=""><span id="tip_phone_code"></span>
                        <input type="hidden" value="/" name="next">
                        <input type="hidden" value="0" name="second">
                    </div>
                    <div class="field clearfix">
                        <label class="field-tit" for="password">密码：</label>
                        <input value=""  name="password" id="password" onKeyUp=pwStrength(this.value) onBlur=pwStrength(this.value) type="password" class="tab-input-text t_phone_password"
                            maxlength="16" data-widget="app/ms_v2/user/register.js#levelValid" />
                        <span class="msg-box" id="tip_phone_password"></span>
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
                    <div class="field clearfix">
                        <label class="field-tit" for="confirm-password">确认密码：</label>
                        <input value="" name="phone_password2" type="password" maxlength="16"
                            class="tab-input-text t_phone_password2" />
                        <span class="msg-box" id="tip_phone_password2"></span>
                    </div>
                    <div class="gj-agreement clearfix">
                        <div class="gj-agreement-cont"><input value="14" checked name="phone_affirm" type="checkbox"
                                class="chk-vm t_cvm" />
                            <label for="stay-login">我已阅读并同意<a target="_blank"
                                    href="#">&lt;&lt;服务条款&gt;&gt;</a>&nbsp;和&nbsp;<a target="_blank"
                                    href="#">&lt;&lt;隐私政策&gt;&gt;</a></label>
                            <span class="msg-box" id="tip_phone_affirm"></span>
                        </div>
                    </div>
                    <div class="submit-box" data-widget="app/ms_v2/user/register.js#phoneRegisterIndex">
                        <input class="btn-org js-submit-btn t_submit" type="submit" value="立即注册" data-role="reg_submit">
                        <span class="msg-submit " style="display: none;">正在提交···</span>
                    </div>
                </div>
            </form>
        </div>

    </div>
</div>
<!--wrapper e-->
<!--footer s-->
<!-- footer s -->
<jsp:include page="footer.jsp"/>
<!-- footer e -->
<!--footer e-->
<script type="text/javascript">
    window.PAGE_CONFIG = { "GOOGLE_ANA_CODE": "UA-479320-1", "logTracker": { "gjchNew": "\/user\/login\/register\/-\/op", "server": "https:\/\/analytics.ganji.com" }, "reqid": "30a26d05-3394-44bc-a3b1-74fc0e1f9e38", "__hash__": "Xyy9epSCmvHJszMcLxLVErYMZvfa9r6aVeZDb1SZToljYr7S37+ti1YqaDwoObew" } || {};
    GJ.use(['app/ms_v2/common/base_page.js'], function (Page) {
        Page.first();
        Page.last();
    });
</script>
<script type="text/javascript">
    $(document).ready(function(){

        $("#maintainForm").formValidate({
            rules:{
                "username":{
                    required:true,
                    minlength:1,
                    maxlength:32
                },
                "password":{
                    required:true,
                    minlength:1,
                    maxlength:32,
                    notChinese:true
                },
                "mobile":{
                    required:true,
                    minlength:1,
                    maxlength:11,
                    isMobile:true
                },
                "idCard":{
                    required:true,
                    minlength:1,
                    maxlength:18,
                    isIdCard:true
                },
                "accountYue":{
                    required:true,
                    minlength:1,
                    maxlength:5,
                    isNumber:true
                },
                "virtualCoin":{
                    required:true,
                    minlength:1,
                    maxlength:5,
                    isNumber:true
                },
                "freeMessageNum":{
                    required:true,
                    minlength:1,
                    maxlength:5,
                    isNumber:true
                },
            },
            messages:{
                "username":{
                    required:"请输入用户名",
                    minlength:$.format("用户名至少需要输入{0}个字符"),
                    minlength:$.format("用户名最多需要输入{0}个字符"),
                },
                "password":{
                    required:"请输入密码",
                    notChinese:"请输入非中文密码",
                    minlength:$.format("密码至少需要输入{0}个字符"),
                    minlength:$.format("密码最多需要输入{0}个字符"),
                },
                "mobile":{
                    required:"请输入手机号",
                    isMobile:"手机号格式不正确",
                    minlength:$.format("手机号至少需要输入{0}个字符"),
                    minlength:$.format("手机号最多需要输入{0}个字符"),
                },
                "idCard":{
                    required:"请输入身份证号",
                    isIdCard:"身份证号格式不正确",
                    minlength:$.format("身份证号至少需要输入{0}个字符"),
                    minlength:$.format("身份证号最多需要输入{0}个字符"),
                },
                "accountYue":{
                    required:"请输入账户余额",
                    isNumber:"只能输入数字",
                    minlength:$.format("账户余额至少需要输入{0}位数字"),
                    minlength:$.format("账户余额最多需要输入{0}位数字"),
                },
                "virtualCoin":{
                    required:"请输入虚拟币数量",
                    isNumber:"只能输入数字",
                    minlength:$.format("虚拟币数量至少需要输入{0}位数字"),
                    minlength:$.format("虚拟币数量最多需要输入{0}位数字"),
                },
                "freeMessageNum":{
                    required:"请输入可免费发布信息数量",
                    isNumber:"只能输入数字",
                    minlength:$.format("可免费发布信息数量至少需要输入{0}位数字"),
                    minlength:$.format("可免费发布信息数量最多需要输入{0}位数字"),
                }
            },
            submitHandler: function(form) {
                $(form).ajaxSubmit({
                    success: function(data){
                        if(data != null && !data.id){
                            $.messageBox({
                                message:"新增失败",
                                level: "error"
                            });
                            return;
                        }
                        $("#userList").trigger("reloadGrid");
                        $.messageBox({message:"新增成功!"});
                        $("#userDialog").dialog("close");
                    },
                    error: function(data){
                        alert("提交数据发生错误！");
                    }
                });
            }
        });

    });

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
                    $.messageBox({message:"上传成功"});
                } else {
                    $.messageBox({message:result.resultStr});
                    $(obj).val('');
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                alert("上传失败，请检查网络后重试");
            }
        })
    }

    jQuery.validator.addMethod("isNumber", function(value, element){
        if(value==null||value==undefined||value=="" ){return true};
        var patrn=/^[0-9]+$/;
        if (!patrn.exec(value.replace(/[ ]/g,""))) return false
        return true
    });

    jQuery.validator.addMethod("isMobile", function(value, element) {
        var length = value.length;
        var mobile = /^1[3|4|5|7|8]\d{9}$/;
        return this.optional(element) || (length == 11 && mobile.test(value));
    });

    jQuery.validator.addMethod("isIdCard", function(value, element){
        var length = value.length;
        var idCard = /^[1-9]\d{5}(18|19|20|(3\d))\d{2}((0[1-9])|(1[0-2]))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
        return this.optional(element) || (length == 18 && idCard.test(value));
    });

    jQuery.validator.addMethod("notChinese", function(value, element) {
        if(value==null||value==undefined||value=="" ){return true};
        var patrn=/[^\u4e00-\u9fa5]+$/;
        if (!patrn.exec(value)) return false;
        return true
    });

</script>
<script language=javascript>
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
</script>
</body>

</html>