<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
    #identity_style{
        margin-top: 345px;
    }
    #container{
        width: 800px;
        height: 320px;
    }
</style>

<form id="maintainForm" method="post" action="/intellectualTask/addIntellectualTask">
    <div class="container_24 cf">
        <div class="grid_3 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">名称：</label>
        </div>
        <div class="grid_7">
            <input type="text" name="productName" id="productName" value=""/>
        </div>
        <div class="clearLine"></div>
        <div class="grid_3 label-right">
            <label class="form-lb1">专利号：</label>
        </div>
        <div class="grid_7">
            <input type="text" name="patentNumber" id="patentNumber" value=""/>
        </div>
        <div class="clearLine"></div>
        <div class="grid_3 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">文字详情：</label>
        </div>
        <div class="grid_1">
            <script id="container" name="productDetails" type="text/plain">

            </script>
        </div>
        <div class="clearLine"></div>
        <div id="identity_style">
            <div class="grid_3 label-right">
                <em class="form-red">*</em>
                <label class="form-lb1">商品分类：</label>
            </div>
            <div class="grid_7">
                <select name="productCategory">
                    <option value="1">发明</option>
                    <option value="2">实用新型</option>
                    <option value="3">外观</option>
                    <option value="4">商标</option>
                    <option value="5">版权</option>
                </select>
            </div>
        </div>
        <div class="clearLine"></div>
        <div id="message_style">
            <div class="grid_3 label-right">
                <em class="form-red">*</em>
                <label class="form-lb1">行业分类：</label>
            </div>
            <div class="grid_7">
                <select name="industryCategory">
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
        </div>
        <div class="clearLine"></div>
        <div class="grid_3 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">真实姓名：</label>
        </div>
        <div class="grid_7">
            <input type="text" name="realName" id="realName" value=""/>
        </div>
        <div class="clearLine"></div>
        <div class="grid_3 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">手机号：</label>
        </div>
        <div class="grid_7">
            <input type="text" name="mobile" id="mobile" value=""/>
        </div>
        <div class="clearLine"></div>
        <div class="grid_3 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">置顶状态：</label>
        </div>
        <div class="grid_7">
            <select name="roofPlaceState" id="roofPlaceState">
                <option value="1">待审核</option>
                <option value="2">置顶</option>
            </select>
        </div>
        <div id="topDurationStr">
        </div>
        <div class="clearLine"></div>
        <div class="grid_3 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">发布状态：</label>
        </div>
        <div class="grid_7">
            <select name="state">
                <option value="1">待审核</option>
                <option value="2">发布</option>
                <option value="0">驳回</option>
            </select>
        </div>
        <div class="clearLine"></div>
        <div class="grid_3 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">图片上传：</label>
        </div>
        <div class="grid_1">
            <input type="file" multiple="multiple" name="myFile" onchange="uploadImage(this);" class="text-input">
            <input type="hidden" name="productPictureUrl" id="productPictureUrl" value="/img/tab1-1.png"/>
        </div>
        <div class="clearLine"></div>
        <div class="grid_3 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">视频上传：</label>
        </div>
        <div class="grid_1">
            <input type="file" onchange="uploadVideo(this);" class="text-input">
            <input type="hidden" name="productVideoUrl" id="productVideoUrl" value="">
        </div>
    </div>
</form>

<!-- 配置文件 -->
<script type="text/javascript" src="/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="/ueditor/ueditor.all.js"></script>

<script type="text/javascript">
    $(document).ready(function(){
        UE.getEditor('container');

        $("#maintainForm").formValidate({
            rules:{
                "productName":{
                    required:true,
                    minlength:1,
                    maxlength:200
                },
                "productDetails":{
                    required:true,
                    minlength:1,
                    maxlength:5000
                },
                "topDuration" : {
                    required:true,
                    positiveInteger:true,
                    minlength:1,
                    maxlength:10
                },
                "realName" : {
                    required:true,
                    minlength:1,
                    maxlength:10
                },
                "mobile" : {
                    required:true,
                    isMobile:true,
                    minlength:1,
                    maxlength:11
                },
                /*"myFile": {
                    required:true,
                }*/
            },
            messages:{
                "productName":{
                    required:"请输入商品名称",
                    minlength:$.format("商品名称至少需要输入{0}个字符"),
                    minlength:$.format("商品名称最多需要输入{0}个字符"),
                },
                "productDetails":{
                    required:"请输入商品详情",
                    minlength:$.format("商品详情至少需要输入{0}个字符"),
                    minlength:$.format("商品详情最多需要输入{0}个字符"),
                },
                "patentNumber":{
                    required:"请输入专利号",
                    isDigitAndStr:"只能输入字母或数字",
                    minlength:$.format("专利号至少需要输入{0}个字符"),
                    minlength:$.format("专利号最多需要输入{0}个字符"),
                },
                "topDuration" : {
                    required:"请输入置顶天数",
                    positiveInteger:"请输入正整数",
                    minlength:$.format("置顶天数至少需要输入{0}个字符"),
                    minlength:$.format("置顶天数最多需要输入{0}个字符"),
                },
                "realName" : {
                    required:"请输入真实姓名",
                    minlength:$.format("真实姓名至少需要输入{0}个字符"),
                    minlength:$.format("真实姓名最多需要输入{0}个字符"),
                },
                "mobile" : {
                    required:"请输入手机号",
                    isMobile:"输入的手机号格式不正确",
                    minlength:$.format("手机号至少需要输入{0}个字符"),
                    minlength:$.format("手机号最多需要输入{0}个字符"),
                },
                /*"myFile": {
                    required:"请上传图片",
                }*/
            },
            submitHandler: function(form) {
                $(form).ajaxSubmit({
                    success: function(data){
                        var reg = /<pre.+?>(.+)<\/pre>/g;
                        var result = data.match(reg);
                        data = RegExp.$1;
                        if(data != null && data){
                            $("#intellectualTaskList").trigger("reloadGrid");
                            $.messageBox({message:"新增成功!"});
                            $("#intellectualTaskDialog").dialog("close");
                        } else {
                            $.messageBox({
                                message:"新增失败",
                                level: "error"
                            });
                        }
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
                    $("#productPictureUrl").val(result.resultStr);
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

    function uploadVideo(obj) {
        var f = $(obj).val();
        if(f == null || f == undefined || f == '') {
            return false;
        }
        if (!/\.(?:mp4)$/.test(f)) {
            $.messageBox({message:"类型必须是视频(.mp4)"});
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

    $("#roofPlaceState").change(function(){
        var roofPlaceState = $('#roofPlaceState option:selected').val();
        // 如果选择的是自定义上传
        if(roofPlaceState == 2){
            $("#topDurationStr").append('<div class="clearLine"></div>\n' +
                '            <div class="grid_3 label-right">\n' +
                '                <em class="form-red">*</em>\n' +
                '                <label class="form-lb1">置顶天数：</label>\n' +
                '            </div>\n' +
                '            <div class="grid_7">\n' +
                '                <input type="text" name="topDuration" id="topDuration" value=""/>\n' +
                '            </div>');
        }else{
            $("#topDurationStr").empty();
        }
    })

    jQuery.validator.addMethod("positiveInteger", function(value, element) {
        var positiveInteger = /^[0-9]*[1-9][0-9]*$/;
        return this.optional(element) || (positiveInteger.test(value));
    });

    jQuery.validator.addMethod("isMobile", function(value, element) {
        var length = value.length;
        var mobile = /^1[3|4|5|7|8]\d{9}$/;
        return this.optional(element) || (length == 11 && mobile.test(value));
    });

    jQuery.validator.addMethod("isDigitAndStr", function(value, element){
        if(value==null||value==undefined||value=="" ){return true};
        var patrn= /^[0-9a-zA-Z.]{0,}$/;
        if (!patrn.exec(value.replace(/[ ]/g,""))) return false
        return true
    });
</script>