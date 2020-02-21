<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <title>项目实战</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/usercenter.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
</head>

<body>
<script>
        var url11="${user.headPortrait}".split(",");
        var img1=document.getElementById("img1");
        var img2=document.getElementById("img2");
        img1.src="${pageContext.request.contextPath}"+url11[0];
        img2.src="${pageContext.request.contextPath}"+url11[0];
</script>
<div style="width:80px;">
    <ul>
        <li id="title">我的资料</li>
    </ul>
</div>
<div id="center11" style="background-color:#fff;">
<div style="margin-left:50px;">
    <form id="maintainForm" method="post" action="/user/updatemyinfo">
        <input type="hidden" name="id" value="${user.id}"/>
        <input type="hidden" name="password" value="${user.password}"/>
    <div class="name">
        <label class="username" style="margin-top:20px;">
            <span style="color:#ec5524;">*</span>
            <span >用户名：</span>
        </label>
        <div class="inp">
            <input type="text" name="username" id="username" class="form-control" value="${user.username}">
        </div>
    </div>
    <br>
    <br>
    <div class="name" style="margin-top:20px;">
        <label class="username">
            <span style="color:#ec5524;">*</span>
            <span>手机号：</span>
        </label>
        <div class="inp">
            <input type="text" name="mobile" id="mobile" class="form-control" value="${user.mobile}">
        </div>
    </div>
    <br>
    <br>
    <div class="id_img">
        <label class="img_cap">
            <span style="font-size: 16px;">上传头像：</span>
        </label>
        <div class="media-left"id="picture">
            <img id="img1" src="" class="img-circle image-responsive"/>
        </div>
        <div class="btn-group" role="group" aria-label="..." id="btn" >
            <input type="file" onchange="uploadImage(this);" class="text-input">
            <input type="hidden" name="headPortrait" id="headPortrait" value=""/>
        </div> 
    </div>
    <div class="renzheng">
        <label>
            <span>认证类型：</span>
        </label>
        <c:if test="${user.authorizeType==1}">
        <div class="media-left"id="picture">
            <img class="img-circle image-responsive" style="margin-left: 20px;"  src="${pageContext.request.contextPath}/img/qiye.png"/>
        </div>
        </c:if>
        <c:if test="${user.authorizeType==2}">
        <div class="media-left"id="picture">
            <img class="img-circle image-responsive" style="margin-left: 20px;"  src="${pageContext.request.contextPath}/img/geren.png"/>
        </div>
        </c:if>
    </div>
        <button class="btn btn-default" id="button2" style="margin-left: 250px;margin-top: 50px; margin-bottom: 20px;">确认保存</button>
    </form>
</div>
</div>
<script>

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
</script>
</body>

</html>