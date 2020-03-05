<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="UTF-8">
    <title>项目实战</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/spro.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/prodetail.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/post-message.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/usercenter.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/vocher.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/amazeui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/ui-choose.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.all.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/prodetail.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.pagination.js"></script>
    <script src="${pageContext.request.contextPath}/js/post-message.js"></script>
    <jsp:include page="/admin/baseInclude.jsp" />
</head>

<body style="background-color: #e5e5e5e5;">
<div class="suofang">
<jsp:include page="head1.jsp"/>
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-7 col-md-6 col-lg-12">
                <div class="top-title" style="width:1040px;">
                    <ol class="breadcrumb" id="top-title11">
                        <li> <label class="num"  style="background-color: #666;">1</label>
                            选择身份类别（代办公司<a href="/post-message" style="color:#f46">重选</a>）
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
                        <form id="maintainForm" method="post" action="/authorizeCompany/useraddAuthorizeCompany">                           <div class="p-cap">
                               <label class="p-lab" style="margin-left: 160px;">
                                   <em class="form-req">*</em>
                                   公司名称：
                               </label>
                               <input type="text"  name="companyName" id="companyName" maxlength="20" class="input-60 input"/>
                           </div>
                           <div class="fenlei">
                               <label style="margin-left: 128px;" class="p-lab">
                                   <em class="form-req">*</em>
                                   主办业务分类：
                               </label>
                               <select name="businessCategory">
                                   <option value=></option>
                                   <option value="1">申请专利</option>
                                   <option value="2">证书买卖</option>
                                   <option value="3">技术成果转让</option>
                                   <option value="4">法律咨询</option>
                               </select>
                           </div>
                           <div class="p-wzxq">
                               <label class="p-lab"style="margin-left: 128px;">
                                   <em class="form-req">*</em>
                                   公司详情描述：

                               </label>
                           </div>
                           <div>
                               <script id="container" name="companyDescribe" type="text/plain">

                               </script>
                           </div>
                        <div class="p-zl" style="margin-top:80px;">
                            <label class="p-lab" style="margin-left: 160px;">
                                <em class="form-req">*</em>
                                友情链接：
                            </label>
                            <input type="text" name="title" maxlength="25" class="input-60 input"/>
                        </div>
                           <div class="p-pic">
                               <label class="p-lab" style="margin-left: 160px;">
                                   <em class="form-req">*</em>公司图片：
                               </label>
                               <div class="chuans">
                                   <img src="${pageContext.request.contextPath}/img/file.png" alt="" data-imgsrc="img/file.png">
                                   <input class="uploadImg file1" type="file" onchange="uploadImage(this);" name="file1" >
                                   <span class="delx glyphicon glyphicon-remove"></span>
                               </div>
                               <input type="hidden" name="companyPictureUrl" id="companyPictureUrl" value=""/>
                           </div>
                            <div class="p-zd">
                                <label class="p-lab" style="margin-left: 160px;">是否置顶：</label>
                                <input type="hidden" id="acountyue" />
                                <input type="radio" style="margin-left: 20px;" name="roofPlaceState" value="0" class="checkbox-radio" id="zd"><span>置顶</span>
                                <input type="radio"  style="margin-left: 20px;" name="roofPlaceState" value="2" class="checkbox-radio" id="bzd"><span id="bzdname">不置顶</span>
                                <span class="success" id="zdsuccess">购买置顶天数成功</span>
                                <div id="zdmode">
                                    <jsp:include page="roofplace.jsp"/>
                                </div>
                            </div>
                            <div class="p-cap">
                                <label class="p-lab" style="margin-left: 144px;">发布人姓名：</label>
                                <input type="text" name="realName" maxlength="25" class="input-60 input"/>
                            </div>
                            <div class="p-cap">
                                <label class="p-lab"style="margin-left: 176px;">手机号：</label>
                                <input type="text" class="input-60 input" name="mobile" id="tel_num" value="" onblur="LXDHonblus()" onfocus="LXDHonfocu()"/>
                                <span  type="button" class="code-btn">获取验证码</span>
                                &nbsp;<span id="tip_phone" class="msg-box"><span id="tip_phone1"></span></span>
                            </div>
                            <div class="p-cap">
                                <label class="p-lab" style="margin-left: 144px;">短信验证码：</label>
                                <input style="margin-top:20px; width:100px;" type="tel" name="" id="code_num" class="input-60 input" lay-verify="required|phone" value="" onblur="YZMonblus()" onfocus="YZMonfou()"/>
                                &nbsp;<span style="margin-top:17px; width:200px;" id="tip_code_num" class="msg-box"><span id="tip_code_num1"></span></span>
                            </div>
                            <button class="btn btn-default" id="button2" style="margin-left: 250px;margin-top: 50px; margin-bottom: 20px;">提交</button>
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
    })
    $('#bzd').on('click',function () {
        document.getElementById("zdmode").style.display="none";
        document.getElementById("zdsuccess").style.display="none";
    })
    window.onload=function () {
        $.ajax({
            type:"POST",
            url: "/roofPlace/getUseraccountYue",
            success: function(result) {
                document.getElementById("acountyue").value=result*10+"虚拟币";
                document.getElementById("AccountYue").innerText=result*10+"虚拟币";
            },
        })
    }
</script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/amazeui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ui-choose.js"></script>
<script type="text/javascript">
    //页面层-自定义
    function zzz() {
        console.log("zzz");
        var price=document.getElementById("price");
        var accountyue=parseFloat(price.innerText);
        var accountyue1=parseFloat(document.getElementById("AccountYue").innerText);
        console.log(accountyue<accountyue1);
        if(accountyue>accountyue1){
            console.log(accountyue,accountyue1);
            layer.msg('您的余额不足请先进行充值', {
                time: 5000, //20s后自动关闭
            });
        }
        else{
            $.ajax({
                type:"POST",
                url: "/roofPlace/roofplaceconsume?consume="+accountyue,
                success: function(result) {
                    document.getElementById("zdsuccess").style.display="inline-block";
                    document.getElementById("zdmode").style.display="none";
                    document.getElementById("bzd").style.display="none";
                    document.getElementById("bzdname").style.display="none";
                    console.log(result);
                },
            })

        }
    }





    window.onload=function () {
        $.ajax({
            type:"POST",
            url: "/roofPlace/getUseraccountYue",
            success: function(result) {
                document.getElementById("AccountYue").innerText=result*10+"虚拟币";
            },
        })
    }
    // 将所有.ui-choose实例化
    $('.ui-choose').ui_choose();
    // uc_01 ul 单选
    var uc_01 = $('#uc_01').data('ui-choose'); // 取回已实例化的对象
    uc_01.click = function(index, item) {
        console.log('click', index, item.text())
    }
    uc_01.change = function(index, item) {
        console.log('change', index, item.text())
    }
    $(function() {
        $('#uc_01 li:eq(3)').click(function() {
            $('.tr_rechoth').show();
            $('.tr_rechoth').find("input").attr('required', 'true')
            $('.rechnum').text('100.00');
            document.getElementById("topDuration").value="10";
        })
        $('#uc_01 li:eq(0)').click(function() {
            $('.tr_rechoth').hide();
            $('.rechnum').text('100.00');
            $('.othbox').val('');
            document.getElementById("topDuration").value="10";
        })
        $('#uc_01 li:eq(1)').click(function() {
            $('.tr_rechoth').hide();
            $('.rechnum').text('200.00');
            $('.othbox').val('');
            document.getElementById("topDuration").value="20";
        })
        $('#uc_01 li:eq(2)').click(function() {
            $('.tr_rechoth').hide();
            $('.rechnum').text('500.00');
            $('.othbox').val('');
            document.getElementById("topDuration").value="50";
        })
        $(document).ready(function() {
            $('.othbox').on('input propertychange', function() {
                var num = $(this).val();
                $('.rechnum').html(num + "0.00");
                document.getElementById("topDuration").value=num;
            });
        });
    })

    $(function() {
        $('#doc-vld-msg').validator({
            onValid: function(validity) {
                $(validity.field).closest('.am-form-group').find('.am-alert').hide();
            },
            onInValid: function(validity) {
                var $field = $(validity.field);
                var $group = $field.closest('.am-form-group');
                var $alert = $group.find('.am-alert');
                // 使用自定义的提示信息 或 插件内置的提示信息
                var msg = $field.data('validationMessage') || this.getValidationMessage(validity);

                if(!$alert.length) {
                    $alert = $('<div class="am-alert am-alert-danger"></div>').hide().
                    appendTo($group);
                }
                $alert.html(msg).show();
            }
        });
    });
</script>
<script>
    $('#test1').on('click', function () {
        layer.open({
            type: 2,
            title: false,
            closeBtn: 0, //不显示关闭按钮
            shade: [0],
            area: ['340px', '215px'],
            offset: 'rb', //右下角弹出
            time: 2000, //2秒后自动关闭
            anim: 2,
            content: ['/vouchercenter.jsp', 'no'], //iframe的url，no代表不显示滚动条
            end: function () { //此处用于演示
                layer.open({
                    type: 2,
                    title: '充值中心',
                    shadeClose: true,
                    shade: false,
                    maxmin: true, //开启最大化最小化按钮
                    area: ['893px', '600px'],
                    content: '/vouchercenter.jsp'
                });
            }
        });

    });
</script>
</body>

</html>