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
    <jsp:include page="/admin/baseInclude.jsp"/>
</head>

<body style="background-color: #e5e5e5e5;">
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
                        <form id="maintainForm" method="post" action="/intellectualTask/useraddIntellectualTask">
                           <div class="p-cap">
                               <label class="p-lab" style="margin-left: 160px;">
                                   <em class="form-req">*</em>
                                   商品名称：
                               </label>
                               <input type="text" name="productName" id="productName" value="" maxlength="20" class="input" onblur="productNameonblus()" onfocus="productNamonfocu()"/>
                               &nbsp;<span id="tip_productName" class="msg-box"></span>
                           </div>
                            <div class="p-wzxq">
                                <label class="p-lab"style="margin-left: 160px;">
                                    <em class="form-req">*</em>
                                    商品简介：
                                </label>
                            </div>
                            <div style="margin-left: 266px;">
                                <textarea class="input" name="productBrief" id="productBrief" maxlength="5000" size="5" style="overflow:hidden;resize:horizontal; width:390px;height: 115px;" onblur="productBriefonblus()" onfocus="productBriefonfocu()"></textarea>
                                <span calss="msg-box" id="tip_productBrief"></span>
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

                               <label style="margin-left: 128px;" class="p-lab">
                                   <em class="form-req">*</em>
                                   选择商品分类：
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
                            <label class="p-lab" style="margin-left: 128px;">上传详情图片：</label>
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
                            <input type="text" name="realName" id="realName" maxlength="25" class="input-60 input"/>
                            <span class="msg-box" id="tip_realName"></span>
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
                            <input type="hidden" value="1" name="state"/>
                            <input type="hidden" value="0" name="hasCollectedState"/>
                        <button class="btn btn-default" id="button2" style="margin-left: 250px;margin-top: 50px; margin-bottom: 20px;" type="submit">提交</button>
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
                    document.getElementById("acountyue").value=result+"虚拟币";
                    document.getElementById("AccountYue").innerText=result+"虚拟币";
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