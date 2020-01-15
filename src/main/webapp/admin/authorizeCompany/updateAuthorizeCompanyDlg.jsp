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

<form id="maintainForm" method="post" action="/authorizeCompany/updateAuthorizeCompany">
    <input type="hidden" name="id" value="${authorizeCompany.id}">
    <div class="container_24 cf">
        <div class="grid_3 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">公司名称：</label>
        </div>
        <div class="grid_7">
            <input type="text" name="companyName" id="companyName" value="${authorizeCompany.companyName}"/>
        </div>
        <div class="clearLine"></div>
        <div class="grid_3 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">业务分类：</label>
        </div>
        <div class="grid_7">
            <select name="businessCategory">
                <option value="1" <c:if test="${authorizeCompany.businessCategory == 1}">selected</c:if>>申请专利</option>
                <option value="2" <c:if test="${authorizeCompany.businessCategory == 2}">selected</c:if>>证书买卖</option>
                <option value="3" <c:if test="${authorizeCompany.businessCategory == 3}">selected</c:if>>技术成果转让</option>
                <option value="4" <c:if test="${authorizeCompany.businessCategory == 4}">selected</c:if>>法律咨询</option>
            </select>
        </div>
        <div class="clearLine"></div>
        <div class="grid_3 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">公司介绍：</label>
        </div>
        <div class="grid_1">
            <script id="container" name="companyDescribe" type="text/plain">
                ${authorizeCompany.companyDescribe}
            </script>
        </div>
        <div class="clearLine"></div>
        <div class="grid_3 label-right" style="margin-top: 349px;">
            <em class="form-red">*</em>
            <label class="form-lb1">公司图片：</label>
        </div>
        <div class="grid_1" style="margin-top: 349px;">
            <input type="file" onchange="uploadImage(this);" class="text-input">
            <input type="hidden" name="companyPictureUrl" id="companyPictureUrl" value=""/>
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
            ue.setContent($("#companyDescribe").val());
        });

        $("#maintainForm").formValidate({
            rules:{
                "companyName":{
                    required:true,
                    minlength:1,
                    maxlength:50
                },
                "companyDescribe":{
                    required:true,
                    minlength:1,
                    maxlength:1000
                }
            },
            messages:{
                "companyName":{
                    required:"请输入公司名称",
                    minlength:$.format("公司名称至少需要输入{0}个字符"),
                    minlength:$.format("公司名称最多需要输入{0}个字符"),
                },
                "companyDescribe":{
                    required:"请输入公司介绍",
                    minlength:$.format("公司介绍至少需要输入{0}个字符"),
                    minlength:$.format("公司介绍最多需要输入{0}个字符"),
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
                        $("#authorizeCompanyList").trigger("reloadGrid");
                        $.messageBox({message:"修改成功!"});
                        $("#authorizeCompanyDialog").dialog("close");
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
                    $("#companyPictureUrl").val(result.resultStr);
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