<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form id="maintainForm" method="post" action="/user/updateUser">
    <input type="hidden" name="id" value="${user.id}"/>
    <input type="hidden" name="password" value="${user.password}"/>
    <div class="container_24 cf">
        <div class="grid_6 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">用户名：</label>
        </div>
        <div class="grid_10">
            <input type="text" name="username" id="username" value="${user.username}"/>
        </div>
        <div class="clearLine"></div>
        <div class="grid_6 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">手机号：</label>
        </div>
        <div class="grid_10">
            <input type="text" name="mobile" id="mobile" maxlength="11" value="${user.mobile}"/>
        </div>
        <div class="clearLine"></div>
        <div class="grid_6 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">身份证号：</label>
        </div>
        <div class="grid_10">
            <input type="text" name="idCard" id="idCard" maxlength="18" value="${user.idCard}"/>
        </div>
        <div class="clearLine"></div>
        <div class="grid_6 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">身份：</label>
        </div>
        <div class="grid_10">
            <select name="identity">
                <option value="1" <c:if test="${user.identity == 1}">selected</c:if>>普通用户</option>
                <option value="2" <c:if test="${user.identity == 2}">selected</c:if>>管理员</option>
            </select>
        </div>
        <div class="clearLine"></div>
        <div class="grid_6 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">认证类型：</label>
        </div>
        <div class="grid_10">
            <select name="authorizeType">
                <option value="1" <c:if test="${user.authorizeType == 1}">selected</c:if>>企业认证</option>
                <option value="2" <c:if test="${user.authorizeType == 2}">selected</c:if>>个人认证</option>
            </select>
        </div>
        <div class="clearLine"></div>
        <div class="grid_6 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">头像：</label>
        </div>
        <div class="grid_10">
            <input type="file" onchange="uploadImage(this);" class="text-input">
            <input type="hidden" name="headPortrait" id="headPortrait" value=""/>
        </div>
        <div class="clearLine"></div>
        <div class="grid_6 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">账户余额：</label>
        </div>
        <div class="grid_10">
            <input type="text" name="accountYue" id="accountYue" value="${user.freeMessageNum}"/>
        </div>
        <div class="clearLine"></div>
        <div class="grid_6 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">虚拟币数量：</label>
        </div>
        <div class="grid_10">
            <input type="text" name="virtualCoin" id="virtualCoin" value="${user.freeMessageNum}"/>
        </div>
        <div class="clearLine"></div>
        <div class="grid_6 label-right">
            <em class="form-red">*</em>
            <label class="form-lb1">可免费发布信息数量：</label>
        </div>
        <div class="grid_10">
            <input type="text" name="freeMessageNum" id="freeMessageNum" value="${user.freeMessageNum}"/>
        </div>
    </div>
</form>

<script type="text/javascript">
    $(document).ready(function(){

        $("#maintainForm").formValidate({
            rules:{
                "username":{
                    required:true,
                    minlength:1,
                    maxlength:32
                },
                "password":{
                    required:true,
                    minlength:1,
                    maxlength:32,
                    notChinese:true
                },
                "mobile":{
                    required:true,
                    minlength:1,
                    maxlength:11,
                    isMobile:true
                },
                "idCard":{
                    required:true,
                    minlength:1,
                    maxlength:18,
                    isIdCard:true
                },
                "accountYue":{
                    required:true,
                    minlength:1,
                    maxlength:5,
                    isNumber:true
                },
                "virtualCoin":{
                    required:true,
                    minlength:1,
                    maxlength:5,
                    isNumber:true
                },
                "freeMessageNum":{
                    required:true,
                    minlength:1,
                    maxlength:5,
                    isNumber:true
                },
            },
            messages:{
                "username":{
                    required:"请输入用户名",
                    minlength:$.format("用户名至少需要输入{0}个字符"),
                    minlength:$.format("用户名最多需要输入{0}个字符"),
                },
                "password":{
                    required:"请输入密码",
                    notChinese:"请输入非中文密码",
                    minlength:$.format("密码至少需要输入{0}个字符"),
                    minlength:$.format("密码最多需要输入{0}个字符"),
                },
                "mobile":{
                    required:"请输入手机号",
                    isMobile:"手机号格式不正确",
                    minlength:$.format("手机号至少需要输入{0}个字符"),
                    minlength:$.format("手机号最多需要输入{0}个字符"),
                },
                "idCard":{
                    required:"请输入身份证号",
                    isIdCard:"身份证号格式不正确",
                    minlength:$.format("身份证号至少需要输入{0}个字符"),
                    minlength:$.format("身份证号最多需要输入{0}个字符"),
                },
                "accountYue":{
                    required:"请输入账户余额",
                    isNumber:"只能输入数字",
                    minlength:$.format("账户余额至少需要输入{0}位数字"),
                    minlength:$.format("账户余额最多需要输入{0}位数字"),
                },
                "virtualCoin":{
                    required:"请输入虚拟币数量",
                    isNumber:"只能输入数字",
                    minlength:$.format("虚拟币数量至少需要输入{0}位数字"),
                    minlength:$.format("虚拟币数量最多需要输入{0}位数字"),
                },
                "freeMessageNum":{
                    required:"请输入可免费发布信息数量",
                    isNumber:"只能输入数字",
                    minlength:$.format("可免费发布信息数量至少需要输入{0}位数字"),
                    minlength:$.format("可免费发布信息数量最多需要输入{0}位数字"),
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
                        $("#userList").trigger("reloadGrid");
                        $.messageBox({message:"修改成功!"});
                        $("#userDialog").dialog("close");
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
                    $("#headPortrait").val(result.resultStr);
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

    jQuery.validator.addMethod("isNumber", function(value, element){
        if(value==null||value==undefined||value=="" ){return true};
        var patrn=/^[0-9]+$/;
        if (!patrn.exec(value.replace(/[ ]/g,""))) return false
        return true
    });

    jQuery.validator.addMethod("isMobile", function(value, element) {
        var length = value.length;
        var mobile = /^1[3|4|5|7|8]\d{9}$/;
        return this.optional(element) || (length == 11 && mobile.test(value));
    });

    jQuery.validator.addMethod("isIdCard", function(value, element){
        var length = value.length;
        var idCard = /^[1-9]\d{5}(18|19|20|(3\d))\d{2}((0[1-9])|(1[0-2]))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
        return this.optional(element) || (length == 18 && idCard.test(value));
    });

    jQuery.validator.addMethod("notChinese", function(value, element) {
        if(value==null||value==undefined||value=="" ){return true};
        var patrn=/[^\u4e00-\u9fa5]+$/;
        if (!patrn.exec(value)) return false;
        return true
    });

</script>