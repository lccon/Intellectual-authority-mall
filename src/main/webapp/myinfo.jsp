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
                    <input type="text" class="form-control" name="mobile" id="mobile" value="${user.mobile}">
                </div>
            </div>
            <div class="form-group" style="height: 60px;">
                <label for="inputPassword3" class="col-sm-2 control-label">帐户余额：</label>
                <div class="col-sm-6">
                    <p class="help-block" style="float: left;">${user.accountYue}</p>
                    <p class="help-block">
                        <a href="javascript:void(0);" id="voucher" style="margin-left: 20px;margin-top:10px; color: #FF5722;" role="button" >充值</a>
                    </p>
                </div>
            </div>
            <p class="help-block" style="margin-left: 70px;">温馨提示：虚拟币比例为1：10，若想使用虚拟币请先充值。</p>
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
            <div class="form-group" style="height: 120px;">
                <label for="inputPassword3" class="col-sm-2 control-label">认证类型：</label>
                <div class="col-sm-7">
                    <c:if test="${user.authorizeType==0}">
                        <p class="help-block">尚未认证，请前往我的认证进行认证</p>
                    </c:if>
                    <c:if test="${user.authorizeType==1}">
                        <img style="width:60px;height: 60px;" src="${pageContext.request.contextPath}/img/qiye.png"  class="img-circle">
                    </c:if>
                    <c:if test="${user.authorizeType==2}">
                        <img style="width:60px;height: 60px;" src="${pageContext.request.contextPath}/img/geren.png" class="img-circle">
                    </c:if>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default" id="button2">确认保存</button>
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
            title: false,
            closeBtn: 0, //不显示关闭按钮
            shade: [0],
            area: ['340px', '215px'],
            offset: 'rb', //右下角弹出
            time: 2000, //2秒后自动关闭
            anim: 2,
            content: ['/vouchercenter.jsp', 'no'], //iframe的url，no代表不显示滚动条
            end: function () { //此处用于演示
                layer.open({
                    type: 2,
                    title: '充值中心',
                    shadeClose: true,
                    shade: false,
                    maxmin: true, //开启最大化最小化按钮
                    area: ['893px', '600px'],
                    content: '/vouchercenter.jsp'
                });
            }
        });
    })
    $("#consume").on("click",function () {
        layer.open({
            type: 2,
            title: false,
            closeBtn: 0, //不显示关闭按钮
            shade: [0],
            area: ['340px', '215px'],
            offset: 'rb', //右下角弹出
            time: 2000, //2秒后自动关闭
            anim: 2,
            content: ['/consumemessage.jsp', 'no'], //iframe的url，no代表不显示滚动条
            end: function () { //此处用于演示
                layer.open({
                    type: 2,
                    title: '购买发布信息数量',
                    shadeClose: true,
                    shade: false,
                    maxmin: true, //开启最大化最小化按钮
                    area: ['893px', '600px'],
                    content: '/consumemessage.jsp'
                });
            }
        });

    })
</script>
</body>

</html>