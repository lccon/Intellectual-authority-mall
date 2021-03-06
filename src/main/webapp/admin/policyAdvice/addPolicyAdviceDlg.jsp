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

<form id="maintainForm" method="post" action="/policyAdvice/addPolicyAdvice">
    <div class="container_24 cf">
        <div id="message_style">
            <div class="grid_3 label-right">
                <em class="form-red">*</em>
                <label class="form-lb1">资讯分类：</label>
            </div>
            <div class="grid_7">
                <select name="adviceCategory">
                    <option value="1">政策法规</option>
                    <option value="2">平台动态</option>
                    <option value="3">新闻实事</option>
                    <option value="4">行业知识</option>
                </select>
            </div>
        </div>
        <div class="clearLine"></div>
        <div class="grid_3 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">标题：</label>
        </div>
        <div class="grid_7">
            <input type="text" name="adviceTitle" id="adviceTitle" value=""/>
        </div>
        <div class="clearLine"></div>
        <div class="grid_3 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">副标题：</label>
        </div>
        <div class="grid_7">
            <textarea name="adviceSubtitle" style="width:541px;height:108px"></textarea>
        </div>
        <div class="clearLine"></div>
        <div class="grid_3 label-right" style="margin-top: 80px;">
            <em class="form-red">*</em>
            <label class="form-lb1">资讯内容：</label>
        </div>
        <div class="grid_1" style="margin-top: 80px;">
            <script id="container" name="adviceContent" type="text/plain">

            </script>
        </div>
        <div class="clearLine"></div>
        <div class="grid_3 label-right" style="margin-top: 345px;">
            <em class="form-red">*</em>
            <label class="form-lb1">置顶状态：</label>
        </div>
        <div class="grid_7" style="margin-top: 345px;">
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
            <label class="form-lb1">资讯图片：</label>
        </div>
        <div class="grid_1">
            <input type="file" onchange="uploadImage(this);" class="text-input">
            <input type="hidden" name="advicePictureUrl" id="advicePictureUrl" value=""/>
        </div>
    </div>
</form>

<!-- 配置文件 -->
<script type="text/javascript" src="/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="/ueditor/ueditor.all.js"></script>

<script type="text/javascript">
    $(document).ready(function(){

        $(function(){
            var ue = UE.getEditor('container');
            /*ue.ready(function() {
                //设置编辑器的内容
                ue.setContent('hello张三');
                //获取html内容，返回: <p>hello</p>
                var html = ue.getContent();
                //获取纯文本内容，返回: hello
                var txt = ue.getContentTxt();
            });*/
        })

        $("#maintainForm").formValidate({
            rules:{
                "adviceTitle":{
                    required:true,
                    minlength:1,
                    maxlength:200
                },
                "adviceSubtitle":{
                    required:true,
                    minlength:1,
                    maxlength:600
                },
                "adviceContent":{
                    required:true,
                    minlength:1,
                    maxlength:5000
                },
                "topDuration" : {
                    required:true,
                    positiveInteger:true,
                    minlength:1,
                    maxlength:10
                }
            },
            messages:{
                "adviceTitle":{
                    required:"请输入标题",
                    minlength:$.format("标题至少需要输入{0}个字符"),
                    minlength:$.format("标题最多需要输入{0}个字符"),
                },
                "adviceSubtitle":{
                    required:"请输入副标题",
                    minlength:$.format("副标题至少需要输入{0}个字符"),
                    minlength:$.format("副标题最多需要输入{0}个字符"),
                },
                "adviceContent":{
                    required:"请输入资讯内容",
                    minlength:$.format("资讯内容至少需要输入{0}个字符"),
                    minlength:$.format("资讯内容最多需要输入{0}个字符"),
                },
                "topDuration" : {
                    required:"请输入置顶天数",
                    positiveInteger:"请输入正整数",
                    minlength:$.format("置顶天数至少需要输入{0}个字符"),
                    minlength:$.format("置顶天数最多需要输入{0}个字符"),
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
                        $("#policyAdviceList").trigger("reloadGrid");
                        $.messageBox({message:"新增成功!"});
                        $("#policyAdviceDialog").dialog("close");
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
                    $("#advicePictureUrl").val(result.resultStr);
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

</script>