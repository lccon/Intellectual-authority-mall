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

<form id="maintainForm" method="post" action="/policyAdvice/updatePolicyAdvice">
    <input type="hidden" name="id" value="${policyAdvice.id}">
    <div class="container_24 cf">
        <div id="message_style">
            <div class="grid_3 label-right">
                <em class="form-red">*</em>
                <label class="form-lb1">资讯分类：</label>
            </div>
            <div class="grid_7">
                <select name="adviceCategory">
                    <option value="1" <c:if test="${policyAdvice.adviceCategory == 1}">selected</c:if>>政策法规</option>
                    <option value="2" <c:if test="${policyAdvice.adviceCategory == 2}">selected</c:if>>平台动态</option>
                    <option value="3" <c:if test="${policyAdvice.adviceCategory == 3}">selected</c:if>>新闻实事</option>
                    <option value="4" <c:if test="${policyAdvice.adviceCategory == 4}">selected</c:if>>行业知识</option>
                </select>
            </div>
        </div>
        <div class="clearLine"></div>
        <div class="grid_3 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">标题：</label>
        </div>
        <div class="grid_7">
            <input type="text" name="adviceTitle" id="adviceTitle" value="${policyAdvice.adviceTitle}"/>
        </div>
        <div class="clearLine"></div>
        <div class="grid_3 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">副标题：</label>
        </div>
        <div class="grid_7">
            <textarea name="adviceSubtitle" style="width:541px;height:108px">${policyAdvice.adviceSubtitle}</textarea>
        </div>
        <div class="clearLine"></div>
        <div class="grid_3 label-right" style="margin-top: 80px;">
            <em class="form-red">*</em>
            <label class="form-lb1">资讯内容：</label>
        </div>
        <div class="grid_1" style="margin-top: 80px;">
            <script id="container" name="adviceContent" type="text/plain">
                ${policyAdvice.adviceContent}
            </script>
        </div>
        <div class="clearLine"></div>
        <div id="identity_style">
            <div class="grid_3 label-right">
                <em class="form-red">*</em>
                <label class="form-lb1">资讯图片：</label>
            </div>
            <div class="grid_1">
                <input type="file" onchange="uploadImage(this);" class="text-input">
                <input type="hidden" name="advicePictureUrl" id="advicePictureUrl" value=""/>
            </div>
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
            ue.ready(function() {
                var html = ue.getContent();
                ue.setContent(html);
            });
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
                }
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
                        $("#policyAdviceList").trigger("reloadGrid");
                        $.messageBox({message:"修改成功!"});
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

</script>