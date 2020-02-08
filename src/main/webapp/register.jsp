<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>注册信息</title>
    <link href="#" type="image/x-icon" rel="shortcut icon" />
    <script
        type="text/javascript">window.__GJ_PACK_CONFIG__ = { "documentDomain": "ganji.com", "debug": false, "useCombine": true, "addVersion": true, "cookieDomain": "ganji.com", "defaultServer": "https:\/\/passport.ganji.com", "defaultVersion": 1577960520, "servers": ["sta.ganji.com", "sta.ganjistatic1.com", "stacdn201.ganjistatic1.com"], "fileVersions": [], "fileCombines": { "3": [4, 5, 6], "10": [14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25], "28": [14, 29, 30, 31, 32, 33, 34, 35, 37, 38, 39], "42": [43, 44, 45, 46, 48, 49, 50], "52": [54, 56, 58, 60, 62, 64], "65": [70, 72, 73, 74, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 94, 95, 96, 97, 98], "99": [102, 103, 104, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115], "118": [119, 120], "121": [120, 119], "125": [127, 129, 131, 132, 133], "134": [127, 129, 131, 132, 135], "136": [127, 129, 131, 132, 137] }, "fileCodes": { "ganji": 138, "app_global": 140, "autocomplete": 142, "jquery": 144, "jquery_ui": 145, "util": 3, "json": 147, "log_tracker": [149, 151, 152, 154, 156], "select": 158, "upload": 160, "tool\/webim_v1\/js\/webim.js": 10, "tool\/webim\/js\/webim.js": 28, "tool\/webim_v3\/js\/webim.js": 42, "iframe": [154, 161], "panel": [163, 5, 165, 166], "flash": [168, 169], "talk_to_parent": [170, 154], "validator": [172, 173], "validator2": [172, 174, 175], "map": [5, 178], "uploader": [5, 181], "editor": [183, 184], "passport": [185], "uniontgm": [187, 188], "uniontgm_v6": [189, 188], "uniontgm_v5_b": [190, 188], "uniontgm_v6_b": [191, 188], "app\/ms\/common\/adm\/adm.cmb.js": 65 }, "words": ["js\/", "0|util\/", "1|ganji\/", "2|util.cmb.js", "jquery", "iframe", "panel", "tool\/", "7|webim\/", "8|js\/", "9|webim.cmb.js", "0|app\/", "11|common\/", "12|user\/", "13|user.js", "9|md5-min.js", "9|webim.util.js", "9|webim.core.js", "9|webim.html.js", "9|webim.interfaces.js", "9|webim.start.js", "9|webim.config.js", "9|webim.widget.js", "9|module\/", "23|webim.module.base.js", "23|moduleMgr.js", "7|webim_v2\/", "26|js\/", "27|webim.cmb.js", "27|md5-min.js", "27|webim.util.js", "27|webim.core.js", "27|webim.html.js", "27|webim.scrollbar.js", "27|webim.start.js", "27|webim.config.js", "27|module\/", "36|webim.module.base.js", "36|webim.module.main.js", "36|moduleMgr.js", "7|webim_v3\/", "40|js\/", "41|webim.cmb.js", "41|webim.util.js", "41|webim.core.js", "41|webim.start.js", "41|webim.config.js", "41|module\/", "47|webim.module.base.js", "47|webim.module.main.js", "47|moduleMgr.js", "1|yui\/", "51|charts.cmb.js", "51|yahoo-dom-event\/", "53|yahoo-dom-event.js", "51|json\/", "55|json.js", "51|element\/", "57|element.js", "51|datasource\/", "59|datasource.js", "51|swf\/", "61|swf.js", "51|charts\/", "63|charts.js", "gov.cmb.js", "app\/", "66|ms\/", "67|common\/", "68|adm\/", "69|adm.js", "69|adm_base\/", "71|template.js", "71|enum.js", "71|common.js", "71|core\/", "75|Banner.js", "75|DouFuKuai.js", "75|GanJiTuiGuang.js", "75|HuoJiTop.js", "75|JingPinTuiJian.js", "75|KABottom.js", "75|KABottomJS.js", "75|KABottomLink.js", "75|KAIconLink.js", "75|KAImgLink.js", "75|KALink.js", "75|KARightJS.js", "75|KARightLink.js", "75|KASkyscraper.js", "75|PinPaiGuangGao.js", "75|ZanZhuShangGuangGao.js", "75|KACouplet.js", "69|adm_widget\/", "93|KARightBrand_img.js", "93|KARightBrand_img_desc_job.js", "93|KARightBrand_img_desc_other.js", "93|KARightBrand_img_desc_toggle.js", "93|KATopBrand_img_ershouche.js", "gov2.cmb.js", "66|ms_v2\/", "100|adm2\/", "101|adm2_core.js", "101|adm2_config.js", "101|adm2_template.js", "101|default_widget\/", "105|KA_Bottom.js", "105|KA_Bottom_Link.js", "105|KA_Couplet.js", "105|KA_Img_Link.js", "105|KA_Link.js", "105|KA_Right_Link.js", "105|KA_Skyscraper.js", "105|KAFlag.js", "105|KARightImg.js", "105|KATop.js", "66|common\/", "116|uniontgm2\/", "117|uniontgm.cmb.js", "117|uniontgm_tpl.js", "117|uniontgm.js", "117|newzzgg.cmb.js", "css\/", "122|v5\/", "123|register\/", "124|register_index.cmb.css", "122|global\/", "126|global.css", "123|global\/", "128|global.css", "123|login\/", "130|login_new.css", "130|login_pub.css", "124|register_index.css", "124|register_iframe.cmb.css", "124|register_iframe.css", "124|register_third.cmb.css", "124|register_third.css", "2|ganji.js", "12|global\/", "139|global.js", "1|autocomplete\/", "141|autocomplete.js", "1|jquery\/", "143|jquery-1.8.2.js", "143|jquery.ui.js", "1|json\/", "146|json.js", "1|log_tracker\/", "148|log_tracker_simple.js", "1|uuid\/", "150|uuid.js", "150|unvalid_uuids.js", "1|iframe\/", "153|rpc3.js", "1|event\/", "155|event_emitter.js", "1|select\/", "157|jquery.select.js", "1|upload\/", "159|upload.js", "153|iframe.js", "1|panel\/", "162|panel.css", "1|dragdrop\/", "164|dragdrop.js", "162|panel.js", "1|swfobject\/", "167|swfobject-2.2.js", "167|swfloader.js", "153|talk_to_parent.js", "1|validator\/", "171|validator.css", "171|validator.js", "155|event.js", "171|validator-2.js", "7|map\/", "176|js\/", "177|create_map.js", "7|uploader\/", "179|js\/", "180|create_uploader.js", "7|editor\/", "182|editor.css", "182|editor.js", "13|passport.js", "116|uniontgm\/", "186|uniontgm_tpl_v5.js", "186|uniontgm_v7.js", "186|uniontgm_tpl_v6.js", "186|uniontgm_tpl_v5_B.js", "186|uniontgm_tpl_v6_B.js"], "serverTime": 1578018988, "reqid": "30a26d05-3394-44bc-a3b1-74fc0e1f9e38", "lottery": false };</script>
    <script>(function () { var dt = new Date; var CK = getCookie("STA_CK"); checkSta(function (err) { if (err) { if (!CK) { setCookie("STA_SL", 1); sendlog("sta=-1"); setCookie("STA_CK", 1) } else { sendlog("sta=-" + CK + "&ds=" + getCookie("STA_DS")); if (CK === "2") { if (window.STA_DS_) { setCookie("STA_DS", window.STA_DS_) } else { setCookie("STA_DS", parseInt(getCookie("STA_DS")) + 1 || 2); sendlog("sta=0") } setCookie("STA_CK", 3) } } } else { if (!CK) { return } else { sendlog("sta=" + CK + "&ds=" + getCookie("STA_DS")); removeCookie("STA_CK") } } }); function sendlog(log) { if (!getCookie("STA_SL")) { return } removeCookie("STA_SL"); var img1 = new Image; var img2 = new Image; img1.src = "http://analytics.ganji.com/c.gif?" + log; img2.src = "http://tralog.ganji.com/c.gif?" + log } function checkSta(cb) { setTimeout(function () { typeof GJ === "undefined" ? cb(1) : cb(0) }, 2e4) } function getCookie(name) { var cookie = document.cookie || ""; var match; if (!cookie) { return } match = cookie.match(new RegExp("(^| )" + name + "=([^;]*)(;|$)")); if (match) { return match[2] } } function setCookie(name, value) { dt.setTime(864e5 + +new Date); document.cookie = name + "=" + value + "; expires=" + dt.toGMTString() + "; path=/; domain=ganji.com;" } function removeCookie(name) { dt.setTime(+new Date - 1e3); document.cookie = name + "=; expires=" + dt.toGMTString() + "; path=/; domain=ganji.com;" } })();</script>
    <link href="${pageContext.request.contextPath}/css/register.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/js/register.js" type="text/javascript"></script>

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
            <form action="/register.php?method=phone_reg" method="post" id="phone_register_form">
                <div class="tab-cont" style="display:block;">

                    <div class="field clearfix">
                        <label class="field-tit" for="username">用户名：</label>
                        <input value="" name="reg_username" type="text" placeholder="请填写用户名"
                            class="tab-input-text t_reg_username"/>
                        &nbsp;<span class="msg-box" id="tip_username"></span>
                    </div>
                    <div class="field clearfix">
                        <label class="field-tit" for="phone">手机号：</label>
                        <input type="text" class="tab-input-text t_reg_phone" placeholder="请填写您的手机号" name="reg_phone"
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
                        <input value="" name="phone_password" type="password" class="tab-input-text t_phone_password"
                            maxlength="16" data-widget="app/ms_v2/user/register.js#levelValid" />
                        <span class="msg-box" id="tip_phone_password"></span>
                        <div class="pw-strength" id="level">
                            <div class="pw-bar"></div>
                            <div class="pw-bar-on"></div>
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
</body>

</html>