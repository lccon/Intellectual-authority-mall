<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>

</head>

<body>
<script>
        var url11="${user.headPortrait}".split(",");
        var img1=document.getElementById("img1");
        img1.src="${pageContext.request.contextPath}"+url11[0];

        if(window.screen.width<1300){
            document.getElementById("voucher").style.display="block";
            document.getElementById("voucher1").style.display="none";
        }
        else {
           document.getElementById("voucher").style.display="none";
           document.getElementById("voucher1").style.display="block";
        }
</script>
<div>
    <ul>
        <li id="title">我的资料</li>
    </ul>
</div>
<div id="center11" style="background-color:#fff;">
<div style="margin-left:50px;">
    <form method="post" action="/user/updatemyinfo" class="form-horizontal">
        <input type="hidden" name="id" value="${user.id}"/>
        <input type="hidden" name="password" value="${user.password}"/>
            <div class="form-group" style="height: 60px;">
                <label for="inputEmail3" class="col-sm-2 control-label">用户名：</label>
                <div class="col-sm-3">
                    <input type="email" class="form-control" name="username" id="username"  value="${user.username}">
                </div>
            </div>
            <div class="form-group" style="height: 60px;">
                <label for="inputPassword3" class="col-sm-2 control-label">手机号：</label>
                <div class="col-sm-2">
                    <p class="help-block" style="float: left;">${user.mobile}</p>
                </div>
            </div>
            <div class="form-group" style="height: 60px;">
                <label for="inputPassword3" class="col-sm-2 control-label">帐户余额：</label>
                <div class="col-sm-6">
                    <p class="help-block" style="float: left;">${user.accountYue}</p>
                    <p class="help-block">
                        <a href="javascript:void(0);" id="voucher" style="margin-left: 60px;color: #FF5722;display: none;" role="button" >充值</a>
                        <a href="/vouchercenter.jsp" target="_blank" id="voucher1" style="margin-left: 60px;color: #FF5722;" role="button" >充值</a>
                    </p>
                </div>
            </div>
            <p class="help-block" style="margin-left: 70px;">温馨提示：科豆比例为1：10，若想使用虚拟币请先充值。</p>
            <div class="form-group" style="height: 60px;">
                <label for="inputPassword3" class="col-sm-2 control-label">可发布信息数量：</label>
                <div class="col-sm-7">
                    <p class="help-block" style="float: left;">${user.freeMessageNum}</p>
                    <p class="help-block">
                        <a href="javascript:void(0);" id="consume" style="margin-left: 20px; margin-top:10px;color: #FF5722;" role="button" >购买发布信息数量</a>
                    </p>
                </div>
            </div>
            <p class="help-block" style="margin-left: 70px;">温馨提示：免费发布信息数量初始值为5条，若为0请先购买发布信息数量，否则不可发布信息。</p>
            <div class="form-group" style="height: 120px;">
                <label for="inputPassword3" class="col-sm-2 control-label">上传头像：</label>
                <div class="col-sm-7">
                    <input type="file" id="exampleInputFile" onchange="uploadImage(this);">
                    <img style="width:80px;height: 80px;" id="img1" alt="" class="img-circle">
                    <input type="hidden" name="headPortrait" id="headPortrait" value=""/>
                </div>
            </div>
        <p class="help-block" style="margin-left: 70px;">温馨提示：上传头像的最佳尺寸为：84*90像素。</p>
        <div class="form-group" style="height: 120px;">
                <label for="inputPassword3" class="col-sm-2 control-label">认证类型：</label>
                <div class="col-sm-7">
                    <c:if test="${user.authorizeType==0}">
                        <p class="help-block">尚未认证，请前往我的认证进行认证</p>
                    </c:if>
                    <c:if test="${user.authorizeType==1}">
                        <p class="help-block">企业认证失败，请前往我的认证页面重新上传</p>
                    </c:if>
                    <c:if test="${user.authorizeType==5}">
                        <p class="help-block">正在认证请等待管理员审核</p>
                    </c:if>
                    <c:if test="${user.authorizeType==2}">
                        <img style="width:60px;height: 60px;" src="${pageContext.request.contextPath}/img/yinzhang.png"  class="img-circle">
                    </c:if>
                    <c:if test="${user.authorizeType==3}">
                        <img style="width:60px;height: 60px;" src="${pageContext.request.contextPath}/img/qiye.png"  class="img-circle">
                    </c:if>
                    <c:if test="${user.authorizeType==4}">
                        <img style="width:60px;height: 60px;" src="${pageContext.request.contextPath}/img/geren.png" class="img-circle">
                    </c:if>
                    <p class="help-block">个人认证后可免费发布20条信息</p>
                    <p class="help-block">企业认证后可免费发布30条信息</p>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default" id="button2" style="margin-bottom: 50px;">确认保存</button>
                </div>
            </div>
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
                    console.log("上传成功")
                } else {
                    console.log("上传失败")
                    $(obj).val('');
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                alert("上传失败，请检查网络后重试");
            }
        })
    }
    $("#voucher").on("click",function () {
        layer.open({
            type: 2,
            title: '充值中心',
            shadeClose: true,
            shade: 0.8,
            area: ['893px', '600px'],
            content: '/vouchercenter.jsp'//iframe的url
        });
    })
    $("#consume").on("click",function () {
        layer.open({
            type: 2,
            title: '购买发布信息数量',
            shadeClose: true,
            shade: 0.8,
            area: ['893px', '600px'],
            content: '/consumemessage.jsp'//iframe的url
        });
    })
</script>
</body>

</html>