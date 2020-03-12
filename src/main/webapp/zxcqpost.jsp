<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="UTF-8">
    <title>科天行</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/spro.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/prodetail.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/post-message.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/usercenter.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/vocher.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/conta.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/amazeui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/ui-choose.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.all.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/prodetail.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.pagination.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/post-message.js"></script>
    <jsp:include page="/admin/baseInclude.jsp"/>
</head>

<body style="background-color: #e5e5e5e5;">
<style>
    @media (min-width: 1200px){
        .container {
            width: 1140px;
            margin-left: auto;
        }
    }
</style>
<div class="suofang">
<jsp:include page="head1.jsp"/>
    <jsp:include page="advertising.jsp"/>
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-7 col-md-6 col-lg-12">
                <div class="top-title" style="width:1040px;">
                    <ol class="breadcrumb" id="top-title11">
                        <li> <label class="num"  style="background-color: #666;">1</label>
                            选择身份类别（知识产权商城<a href="/post-message" style="color:#f46">重选</a>）
                        </li>
                        <span class="glyphicon glyphicon-menu-right"></span>
                        <li> <label class="num">2</label>
                            填写信息
                        </li>
                        <span class="glyphicon glyphicon-menu-right"></span>
                        <li> <label class="num"  style="background-color: #666;">3</label>
                            完成发布
                        </li>
                    </ol>
                </div>
                <div class="main1">
                       <div class="cap1">
                           <span>基本信息</span>
                       </div>
                        <form id="maintainForm" method="post" action="/intellectualTask/useraddIntellectualTask" onsubmit="return checkform1();">
                           <div class="p-cap">
                               <label class="p-lab" style="margin-left: 192px;">
                                   <em class="form-req">*</em>
                                   名称：
                               </label>
                               <input type="text" name="productName" id="productName" value="" maxlength="20" class="input" onblur="productNameonblus()" onfocus="productNamonfocu()"/>
                               &nbsp;<span id="tip_productName" class="msg-box"></span>
                           </div>
                            <div class="p-wzxq">
                                <label class="p-lab"style="margin-left: 160px;">
                                    <em class="form-req">*</em>
                                    文字详情：

                                </label>
                            </div>
                            <div>
                                <script id="container" name="productDetails" id="productDetails" type="text/plain">

                                </script>
                            </div>
                           <div class="fenlei" style="margin-top:80px;">

                               <label style="margin-left: 160px;" class="p-lab">
                                   <em class="form-req">*</em>
                                   选择分类：
                               </label>
                               <select class="input" name="productCategory">
                                   <option value="1">发明</option>
                                   <option value="2">实用新型</option>
                                   <option value="3">外观</option>
                                   <option value="4">商标</option>
                                   <option value="5">版权</option>
                               </select>
                           </div>
                           <div class="fenlei">
                            <label style="margin-left: 128px;" class="p-lab">
                                <em class="form-req">*</em>
                                选择行业分类：
                            </label>
                            <select class="input" name="industryCategory">
                                <option value="1">生活需要</option>
                                <option value="2">交通运输</option>
                                <option value="3">化学化工</option>
                                <option value="4">轻工纺织</option>
                                <option value="5">建筑建材</option>
                                <option value="6">机械照明</option>
                                <option value="7">新能源</option>
                                <option value="8">电力电气</option>
                                <option value="9">武器爆破</option>
                                <option value="10">农林牧业</option>
                                <option value="11">视频饮料</option>
                                <option value="12">家具用品</option>
                                <option value="13">教育休闲</option>
                                <option value="14">医药医疗</option>
                                <option value="15">电子信息源</option>
                                <option value="16">仪器仪表</option>
                                <option value="17">包装印刷</option>
                                <option value="18">新型材料</option>
                                <option value="19">海洋开发</option>
                                <option value="20">航空航天</option>
                                <option value="21">采矿冶金</option>
                                <option value="22">橡胶塑料</option>
                                <option value="23">安全防护</option>
                                <option value="24">节能环保</option>
                                <option value="25">其他</option>
                            </select>
                        </div>
                        <div class="p-zl">
                            <label class="p-lab" style="margin-left: 192px;">
                                专利号：
                            </label>
                            <input type="text" name="patentNumber" id="patentNumber" maxlength="25" class="input"/>
                        </div>
                        <div class="p-pic">
                            <label class="p-lab" style="margin-left: 144px;">上传详情图片：</label>
                                   <div class="chuans"> 
                                       <img src="${pageContext.request.contextPath}/img/file.png" alt="" data-imgsrc="img/file.png">
                                        <input class="uploadImg file1" type="file" onchange="uploadImage(this);" name="file1" >
                                        <span class="delx glyphicon glyphicon-remove"></span>
                                   </div>
                                   <div class="chuans"> 
                                    <img src="${pageContext.request.contextPath}/img/file.png" alt="" data-imgsrc="img/file.png">
                                     <input class="uploadImg file1" type="file"onchange="uploadImage(this);" name="file1" >
                                     <span class="delx glyphicon glyphicon-remove"></span>
                                </div>
                                <div class="chuans"> 
                                    <img src="${pageContext.request.contextPath}/img/file.png" alt="" data-imgsrc="img/file.png">
                                     <input class="uploadImg file1" type="file" onchange="uploadImage(this);" name="file1" >
                                     <span class="delx glyphicon glyphicon-remove"></span>
                                </div>
                            <span class="msg-box" id="tip_picture"></span>
                            <input type="hidden" name="productPictureUrl" id="productPictureUrl" value=""/>
                            <span class="cite">
                                <cite >
                                    请上传三张商品详情图片（建议图片格式：jpg/jpeg/png,建议尺寸：1245X645px）
                                    <br>
                                </cite>
                            </span>
                        </div>
                        <div class="p-vid">
                            <label class="p-lab" style="margin-left: 176px;">短视频：</label>
                            <input type="file" class="video" style="margin-left: 250px;"  onchange="uploadVideo(this);">
                            <input type="hidden" name="productVideoUrl" id="productVideoUrl" value="">
                            <span class="msg-box" id="tip_video"></span>
                            <span class="cite">
                                <cite>
                                    视频格式必须为：mp4。视频时长须在30秒以内，否则会影响上传时长。
                                    <br>
                                </cite>
                            </span>
                        </div>
                        <div class="p-zd">
                            <label class="p-lab" style="margin-left: 144px;">
                                <em class="form-req">*</em>
                                是否置顶：
                            </label>
                            <input type="hidden" id="checkroof" value="2"/>
                            <input type="radio" style="margin-left: 20px;" name="roofPlaceState" value="1" class="checkbox-radio" id="zd"><span>置顶</span>
                            <input type="radio"  style="margin-left: 20px;" name="roofPlaceState" value="2" class="checkbox-radio" id="bzd"><span id="bzdname">不置顶</span>
                            <span class="success" id="zdsuccess">购买置顶天数成功</span>
                            &nbsp;<span id="tip_zd" class="msg-box"><span id="tip_zd1"></span></span>
                            <div id="zdmode">
                                <jsp:include page="roofplace.jsp"/>
                            </div>
                        </div>
                        <div class="p-cap">
                            <label class="p-lab" style="margin-left: 128px;">
                                <em class="form-req">*</em>
                                发布人姓名：
                            </label>
                            <input type="text" name="realName" id="realName" maxlength="25" class="input-60 input" onblur="nameonblus()" onfocus="nameonfocu()"/>
                            <span class="msg-box" id="tip_realName"></span>
                        </div>
                        <div class="p-cap">
                            <label class="p-lab"style="margin-left: 160px;">
                                <em class="form-req">*</em>
                                手机号：
                            </label>
                            <input type="text" class="input-60 input" name="mobile" id="tel_num" value="" onblur="LXDHonblus()" onfocus="LXDHonfocu()"/>
                            <span  type="button" class="code-btn">获取验证码</span>
                            &nbsp;<span id="tip_phone" class="msg-box"><span id="tip_phone1"></span></span>
                        </div>
                        <div class="p-cap">
                            <label class="p-lab" style="margin-left: 128px;">
                                <em class="form-req">*</em>
                                短信验证码：
                            </label>
                            <input style="margin-top:20px; width:100px;" type="tel" name="" id="code_num" class="input-60 input" lay-verify="required|phone" value="" onblur="YZMonblus()" onfocus="YZMonfou()"/>
                            &nbsp;<span style="margin-top:17px; width:200px;" id="tip_code_num" class="msg-box"><span id="tip_code_num1"></span></span>
                        </div>
                            <input type="hidden" value="1" name="state"/>
                            <input type="hidden" value="0" name="hasCollectedState"/>
                        <button class="btn btn-default" id="button2" style="margin-left: 250px;margin-top: 50px; margin-bottom: 20px;" type="submit">提交</button>
                            &nbsp;<span id="tip_form" class="msg-box"><span id="tip_form1"></span></span>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>

</div>

    <jsp:include page="footer.jsp"/>
    <script type="text/javascript" src="/ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="/ueditor/ueditor.all.js"></script>
    <script type="text/javascript">
        var ue = UE.getEditor('container');
    </script>
    <script type="text/javascript">

        $('#zd').on('click',function () {
            document.getElementById("zdmode").style.display="block";
            document.getElementById("checkroof").value="2";
        })
        $('#bzd').on('click',function () {
            document.getElementById("zdmode").style.display="none";
            document.getElementById("zdsuccess").style.display="none";
            document.getElementById("checkroof").value="1";
            document.getElementById("tip_zd").className="msg-box";
            document.getElementById("tip_zd").innerText="";
        })
    </script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/amazeui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ui-choose.js"></script>
<script>

    //发布表单验证
    var code1;
    var result1;
    function productNameonblus() {
        var productName=document.getElementById("productName").value;
        var productNameerr=document.getElementById("tip_productName");
        if(productName==""){
            productNameerr.className="error1";
            productNameerr.innerText="名称不能为空！";
        }
        else {
            productNameerr.className="success1";
            console.log(111);
        }
    }
    function productNamonfocu() {
        document.getElementById("tip_productName").className="msg-box";
        document.getElementById("tip_productName").innerText="";
    }
    function uploadImage(obj) {
        var f = $(obj).val();
        if(f == null || f == undefined || f == '') {
            return false;
        }
        if (!/\.(?:png|jpg|PNG|JPG)$/.test(f)) {
            console.log("类型必须是图片(.png|jpg|PNG|JPG)");
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
                    var pictureUrl = $("#productPictureUrl").val();
                    if (pictureUrl != null) {
                        pictureUrl = pictureUrl +result.resultStr;
                        $("#productPictureUrl").val(pictureUrl);
                    } else {
                        $("#productPictureUrl").val(result.resultStr);
                    }
                } else {
                    $(obj).val('');
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                alert("上传失败，请检查网络后重试");
            }
        })
    }

    function uploadVideo(obj) {
        var f = $(obj).val();
        if(f == null || f == undefined || f == '') {
            return false;
        }
        if (!/\.(?:mp4)$/.test(f)) {;
            $(obj).val('');
            return false;
        }
        var data = new FormData();
        $.each($(obj)[0].files, function(i, file) {
            data.append('video', file);
        })
        $.ajax({
            type:"POST",
            url: "/upload/uploadVideo",
            data: data,
            cache:false,
            contentType: false,
            processData: false,
            dataType: "json",
            success: function(result) {
                if (result.flag == true) {
                    $("#productVideoUrl").val(result.resultStr);
                    console.log("上传成功");
                } else {
                    console.log({message:result.resultStr});
                    $(obj).val('');
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                alert("上传失败，请检查网络后重试");
            }
        })
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
    //真实姓名
    function nameonblus() {
        var name=document.getElementById("realName").value;
        var nameerr=document.getElementById("tip_realName");
        if(name==""){
            nameerr.className="error1";
            nameerr.innerText="真实姓名不能为空";
        }
        else{
            nameerr.className="success1";
        }
    }
    function nameonfocu() {
        document.getElementById("tip_realName").className="msg-box";
        document.getElementById("tip_realName").innerText="";
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
            phoneerr.className="success1";
            phoneerr.innerText ="";
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
            code_numerr.className="success1";
            code_numerr.innerText="验证码正确"
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
    function checkform1() {
        var checkroof=document.getElementById("checkroof").value;
        var checkrooferr=document.getElementById("tip_zd");
        var productNameerr=document.getElementById("tip_productName");
        var phoneerr=document.getElementById("tip_phone");
        var code_numerr=document.getElementById("tip_code_num");
        var nameerr=document.getElementById("tip_realName");
        var formerr=document.getElementById("tip_form");
        if(checkroof=="2"){
            checkrooferr.className="error1";
            checkrooferr.innerText="请先支付置顶金额或选择不置顶。";
            formerr.className="error2";
            formerr.innerText="请先按错误提示修改表单中的信息再进行提交";
            return false;
        }
        else{
            checkrooferr.className="msg-box";
            checkrooferr.innerText="";
            if(productNameerr.className!="success1" || phoneerr.className!="success1" || code_numerr.className!="success1" || nameerr.className!="success1"){
                formerr.className="error2";
                formerr.innerText="请先按错误提示修改表单中的信息再进行提交";
                return false;
            }
            else{
                formerr.className="success1";
                formerr.innerText="正在提交...";
                return true;
            }
        }
    }
</script>

</body>

</html>