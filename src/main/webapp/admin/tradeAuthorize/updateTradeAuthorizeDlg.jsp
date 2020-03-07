<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form id="maintainForm" method="post" action="/tradeAuthorize/updateTradeAuthorize">
    <input type="hidden" name="id" value="${tradeAuthorize.id}"/>
    <input type="hidden" name="userId" value="${tradeAuthorize.userId}">
    <div class="container_24 cf">
        <div class="grid_6 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">公司名称：</label>
        </div>
        <div class="grid_11">
            <input type="text" name="companyName" id="companyName" value="${tradeAuthorize.companyName}"/>
        </div>
        <div class="clearLine"></div>
        <div class="grid_6 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">营业执照：</label>
        </div>
        <div class="grid_1">
            <input type="file" multiple="multiple" onchange="uploadImage(this);" class="text-input">
            <input type="hidden" name="licensePicture" id="licensePicture" value="${tradeAuthorize.licensePicture}"/>
        </div>
        <div class="clearLine"></div>
        <div class="grid_6 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">营业执照编码：</label>
        </div>
        <div class="grid_11">
            <input type="text" name="businessLicense" id="businessLicense" value="${tradeAuthorize.businessLicense}"/>
        </div>
        <div class="clearLine"></div>
        <div class="grid_6 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">联系人：</label>
        </div>
        <div class="grid_11">
            <input type="text" name="companyPerson" id="companyPerson" value="${tradeAuthorize.companyPerson}"/>
        </div>
        <div class="clearLine"></div>
        <div class="grid_6 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">认证状态/类型：</label>
        </div>
        <div class="grid_11">
            <select name="authorizeResult">
                <option value="0" <c:if test="${intellectualTask.authorizeResult == 0}">selected</c:if>>待认证</option>
                <option value="1" <c:if test="${intellectualTask.authorizeResult == 1}">selected</c:if>>驳回</option>
                <option value="2" <c:if test="${intellectualTask.authorizeResult == 2}">selected</c:if>>代办公司</option>
                <option value="3" <c:if test="${intellectualTask.authorizeResult == 3}">selected</c:if>>普通公司</option>
            </select>
        </div>
    </div>
</form>

<script type="text/javascript">
    $(document).ready(function(){

        $("#maintainForm").formValidate({
            rules:{
                "companyName":{
                    required:true,
                    minlength:1,
                    maxlength:50
                },
                "businessLicense":{
                    required:true,
                    minlength:1,
                    maxlength:50
                },
                "companyPerson":{
                    required:true,
                    minlength:1,
                    maxlength:32
                }
            },
            messages:{
                "companyName":{
                    required:"请输入公司名称",
                    minlength:$.format("公司名称至少需要输入{0}个字符"),
                    minlength:$.format("公司名称最多需要输入{0}个字符"),
                },
                "businessLicense":{
                    required:"请输入营业执照编码",
                    minlength:$.format("营业执照编码至少需要输入{0}个字符"),
                    minlength:$.format("营业执照编码最多需要输入{0}个字符"),
                },
                "companyPerson":{
                    required:"请输入联系人",
                    minlength:$.format("联系人至少需要输入{0}个字符"),
                    minlength:$.format("联系人最多需要输入{0}个字符"),
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
                        $("#tradeAuthorizeList").trigger("reloadGrid");
                        $.messageBox({message:"修改成功!"});
                        $("#tradeAuthorizeDialog").dialog("close");
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
                    $("#licensePicture").val(result.resultStr);
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