<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-ui-timepicker-zh-CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-ui-timepicker-addon.js"></script>

<form id="maintainForm" method="post" action="/authorizeSite/addAuthorizeSite">
    <div class="container_24 cf">
        <div class="grid_5 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">轮播图图片：</label>
        </div>
        <div class="grid_1">
            <input type="file" onchange="uploadImage(this);" class="text-input">
            <input type="hidden" name="sitePictureUrl" id="sitePictureUrl" value=""/>
        </div>
        <div class="clearLine"></div>
        <div class="grid_5 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">链接地址：</label>
        </div>
        <div class="grid_14">
            <input type="text" name="addressUrl" id="addressUrl" value=""/>
        </div>
        <div class="clearLine"></div>
        <div class="grid_5 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">结束时间：</label>
        </div>
        <div class="grid_14">
            <input type="text" name="endTime" id="datepicker" value=""/>
        </div>
    </div>
</form>

<script type="text/javascript">
    $(document).ready(function(){
        $("#datepicker").prop("readonly", true).datetimepicker({
            timeFormat:"HH:mm:ss",
        });

        $("#maintainForm").formValidate({
            rules:{
                "addressUrl":{
                    required:true,
                    minlength:1,
                    maxlength:200
                },
                "endTime": {
                    required:true,
                }
            },
            messages:{
                "addressUrl":{
                    required:"请输入链接地址",
                    minlength:$.format("连接地址至少需要输入{0}个字符"),
                    minlength:$.format("连接地址最多需要输入{0}个字符"),
                },
                "endTime":{
                    required:"请输入结束时间",
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
                        $("#authorizeSiteList").trigger("reloadGrid");
                        $.messageBox({message:"新增成功!"});
                        $("#authorizeSiteDialog").dialog("close");
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
                    $("#sitePictureUrl").val(result.resultStr);
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