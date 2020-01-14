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
            <label class="form-lb1">商品名称：</label>
        </div>
        <div class="grid_7">
            <input type="text" name="productName" id="productName" value=""/>
        </div>
        <div class="clearLine"></div>
        <div class="grid_3 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">专利号：</label>
        </div>
        <div class="grid_7">
            <input type="text" name="patentNumber" id="patentNumber" value=""/>
        </div>
        <div class="clearLine"></div>
        <div class="grid_3 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">商品简介：</label>
        </div>
        <div class="grid_7">
            <textarea name="productBrief" style="width:541px;height:108px"></textarea>
        </div>
        <div class="clearLine"></div>
        <div class="grid_3 label-right" style="margin-top: 80px;">
            <em class="form-red">*</em>
            <label class="form-lb1">商品详情：</label>
        </div>
        <div class="grid_1" style="margin-top: 80px;">
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
            <label class="form-lb1">图片上传：</label>
        </div>
        <div class="grid_1">
            <input type="file" multiple="multiple" onchange="uploadImage(this);" class="text-input">
            <input type="hidden" name="productPictureUrl" id="productPictureUrl" value=""/>
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
                "productBrief":{
                    required:true,
                    minlength:1,
                    maxlength:1000
                },
                "productDetails":{
                    required:true,
                    minlength:1,
                    maxlength:5000
                },
                "patentNumber":{
                    required:true,
                    minlength:1,
                    maxlength:200
                }
            },
            messages:{
                "productName":{
                    required:"请输入商品名称",
                    minlength:$.format("商品名称至少需要输入{0}个字符"),
                    minlength:$.format("商品名称最多需要输入{0}个字符"),
                },
                "productBrief":{
                    required:"请输入商品简介",
                    minlength:$.format("商品简介至少需要输入{0}个字符"),
                    minlength:$.format("商品简介最多需要输入{0}个字符"),
                },
                "productDetails":{
                    required:"请输入商品详情",
                    minlength:$.format("商品详情至少需要输入{0}个字符"),
                    minlength:$.format("商品详情最多需要输入{0}个字符"),
                },
                "patentNumber":{
                    required:"请输入专利号",
                    minlength:$.format("专利号至少需要输入{0}个字符"),
                    minlength:$.format("专利号最多需要输入{0}个字符"),
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
                        $("#intellectualTaskList").trigger("reloadGrid");
                        $.messageBox({message:"新增成功!"});
                        $("#intellectualTaskDialog").dialog("close");
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
            debugger
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

</script>