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

<form id="maintainForm" method="post" action="/intellectualTask/updateIntellectualTask">
    <input type="hidden" name="id" value="${intellectualTask.id}"/>
    <div class="container_24 cf">
        <div class="grid_3 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">商品名称：</label>
        </div>
        <div class="grid_7">
            <input type="text" name="productName" id="productName" value="${intellectualTask.productName}"/>
        </div>
        <div class="clearLine"></div>
        <div class="grid_3 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">专利号：</label>
        </div>
        <div class="grid_7">
            <input type="text" name="patentNumber" id="patentNumber" value="${intellectualTask.patentNumber}"/>
        </div>
        <div class="clearLine"></div>
        <div class="grid_3 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">商品简介：</label>
        </div>
        <div class="grid_7">
            <textarea name="productBrief" id="productBrief" style="width:541px;height:108px">${intellectualTask.productBrief}</textarea>
        </div>
        <div class="clearLine"></div>
        <div class="grid_3 label-right" style="margin-top: 80px;">
            <em class="form-red">*</em>
            <label class="form-lb1">商品详情：</label>
        </div>
        <div class="grid_1" style="margin-top: 80px;">
            <script id="container" name="productDetails" type="text/plain">
                ${intellectualTask.productDetails}
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
                    <option value="1" <c:if test="${intellectualTask.productCategory == 1}">selected</c:if>>发明</option>
                    <option value="2" <c:if test="${intellectualTask.productCategory == 2}">selected</c:if>>实用新型</option>
                    <option value="3" <c:if test="${intellectualTask.productCategory == 3}">selected</c:if>>外观</option>
                    <option value="4" <c:if test="${intellectualTask.productCategory == 4}">selected</c:if>>商标</option>
                    <option value="5" <c:if test="${intellectualTask.productCategory == 5}">selected</c:if>>版权</option>
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
                    <option value="1" <c:if test="${intellectualTask.industryCategory == 1}">selected</c:if>>生活需要</option>
                    <option value="2" <c:if test="${intellectualTask.industryCategory == 2}">selected</c:if>>交通运输</option>
                    <option value="3" <c:if test="${intellectualTask.industryCategory == 3}">selected</c:if>>化学化工</option>
                    <option value="4" <c:if test="${intellectualTask.industryCategory == 4}">selected</c:if>>轻工纺织</option>
                    <option value="5" <c:if test="${intellectualTask.industryCategory == 5}">selected</c:if>>建筑建材</option>
                    <option value="6" <c:if test="${intellectualTask.industryCategory == 6}">selected</c:if>>机械照明</option>
                    <option value="7" <c:if test="${intellectualTask.industryCategory == 7}">selected</c:if>>新能源</option>
                    <option value="8" <c:if test="${intellectualTask.industryCategory == 8}">selected</c:if>>电力电气</option>
                    <option value="9" <c:if test="${intellectualTask.industryCategory == 9}">selected</c:if>>武器爆破</option>
                    <option value="10" <c:if test="${intellectualTask.industryCategory == 10}">selected</c:if>>农林牧业</option>
                    <option value="11" <c:if test="${intellectualTask.industryCategory == 11}">selected</c:if>>视频饮料</option>
                    <option value="12" <c:if test="${intellectualTask.industryCategory == 12}">selected</c:if>>家具用品</option>
                    <option value="13" <c:if test="${intellectualTask.industryCategory == 13}">selected</c:if>>教育休闲</option>
                    <option value="14" <c:if test="${intellectualTask.industryCategory == 14}">selected</c:if>>医药医疗</option>
                    <option value="15" <c:if test="${intellectualTask.industryCategory == 15}">selected</c:if>>电子信息源</option>
                    <option value="16" <c:if test="${intellectualTask.industryCategory == 16}">selected</c:if>>仪器仪表</option>
                    <option value="17" <c:if test="${intellectualTask.industryCategory == 17}">selected</c:if>>包装印刷</option>
                    <option value="18" <c:if test="${intellectualTask.industryCategory == 18}">selected</c:if>>新型材料</option>
                    <option value="19" <c:if test="${intellectualTask.industryCategory == 19}">selected</c:if>>海洋开发</option>
                    <option value="20" <c:if test="${intellectualTask.industryCategory == 20}">selected</c:if>>航空航天</option>
                    <option value="21" <c:if test="${intellectualTask.industryCategory == 21}">selected</c:if>>采矿冶金</option>
                    <option value="22" <c:if test="${intellectualTask.industryCategory == 22}">selected</c:if>>橡胶塑料</option>
                    <option value="23" <c:if test="${intellectualTask.industryCategory == 23}">selected</c:if>>安全防护</option>
                    <option value="24" <c:if test="${intellectualTask.industryCategory == 24}">selected</c:if>>节能环保</option>
                    <option value="25" <c:if test="${intellectualTask.industryCategory == 25}">selected</c:if>>其他</option>
                </select>
            </div>
        </div>
        <div class="clearLine"></div>
        <div class="grid_3 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">真实姓名：</label>
        </div>
        <div class="grid_7">
            <input type="text" name="realName" id="realName" value="${intellectualTask.realName}"/>
        </div>
        <div class="clearLine"></div>
        <div class="grid_3 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">手机号：</label>
        </div>
        <div class="grid_7">
            <input type="text" name="mobile" id="mobile" value="${intellectualTask.mobile}"/>
        </div>
        <div class="clearLine"></div>
        <div class="grid_3 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">置顶状态：</label>
        </div>
        <div class="grid_7">
            <select name="roofPlaceState" id="roofPlaceState">
                <option value="1" <c:if test="${intellectualTask.roofPlaceState == 1}">selected</c:if>>待审核</option>
                <option value="2" <c:if test="${intellectualTask.roofPlaceState == 2}">selected</c:if>>置顶</option>
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
                <option value="1" <c:if test="${intellectualTask.state == 1}">selected</c:if>>待审核</option>
                <option value="2" <c:if test="${intellectualTask.state == 2}">selected</c:if>>发布</option>
                <option value="0" <c:if test="${intellectualTask.state == 0}">selected</c:if>>驳回</option>
            </select>
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


        var ue = UE.getEditor('container');
        ue.ready(function() {
            //设置编辑器的内容
            var html = ue.getContent();
            ue.setContent(html);
        });

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
                    isDigitAndStr:true,
                    minlength:1,
                    maxlength:200
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
                    isDigitAndStr:"只能输入字母或数字",
                    minlength:$.format("专利号至少需要输入{0}个字符"),
                    minlength:$.format("专利号最多需要输入{0}个字符"),
                },
                "topDuration" : {
                    required:"请输入置顶天数",
                    positiveInteger:"只能输入数字",
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
            },
            submitHandler: function(form) {
                $(form).ajaxSubmit({
                    success: function(data){
                        if(data != null && !data.id){
                            $.messageBox({
                                message:"修改失败",
                                level: "error"
                            });
                            return;
                        }
                        $("#intellectualTaskList").trigger("reloadGrid");
                        $.messageBox({message:"修改成功!"});
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

    var roofPlaceState = $('#roofPlaceState option:selected').val();
    if(roofPlaceState == 2){
        $("#topDurationStr").append('<div class="clearLine"></div>\n' +
            '            <div class="grid_3 label-right">\n' +
            '                <em class="form-red">*</em>\n' +
            '                <label class="form-lb1">置顶天数：</label>\n' +
            '            </div>\n' +
            '            <div class="grid_7">\n' +
            '                <input type="text" name="topDuration" id="topDuration" value="${intellectualTask.topDuration}"/>\n' +
            '            </div>');
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
                '                <input type="text" name="topDuration" id="topDuration" value="${intellectualTask.topDuration}"/>\n' +
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
        var patrn=/^[A-Za-z0-9]+$/;
        if (!patrn.exec(value.replace(/[ ]/g,""))) return false
        return true
    });
</script>