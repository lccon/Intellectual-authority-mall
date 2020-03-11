<!DOCTYPE html>
<html lang="zh-cn">
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>

</head>

<body >
<div id="center11">
<div style="width:80px;">
    <ul>
        <li id="title">我的认证</li>
    </ul>
</div>
<c:if test="${user.authorizeType==3}">
    <div class="info">
        <ul style="margin-left: 30px;">
            <strong style="margin-left: 150px;">
                <i style="margin:0;" id="icon" class="glyphicon glyphicon-info-sign"></i>
                    您已经进行过企业认证，不可以再进行其他认证了
            </strong>
        </ul>
    </div>
</c:if>
<c:if test="${user.authorizeType==4}">
    <div class="info">
        <ul style="margin-left: 30px;">
            <strong style="margin-left: 150px;">
                <i style="margin:0;" id="icon" class="glyphicon glyphicon-info-sign"></i>
                您已经进行过个人认证，不可以再进行其他认证了
            </strong>
        </ul>
    </div>
</c:if>
<c:if test="${user.authorizeType==2}">
    <div class="info">
        <ul style="margin-left: 30px;">
            <strong style="margin-left: 150px;">
                <i style="margin:0;" id="icon" class="glyphicon glyphicon-info-sign"></i>
                您已经进行过代办公司认证了，不可以再进行其他认证了
            </strong>
        </ul>
    </div>
</c:if>
<c:if test="${user.authorizeType==0}">
   <div style="background-color: #fff;">
       <div style="margin-left: 50px;">
    <div class="titleline1">
        <div class="title"  style="width:500px;">
            请进入个人认证或企业认证
            <hr>
        </div>
    </div>
    <div class="container1" style="margin-top: 20px;">
            <label><input name="f1" id="geren" type="radio" value="" checked/>个人认证 </label> 
            <label style="margin-left: 20px;"><input name="f1" id="qiye" type="radio" value="" />企业认证 </label>         
    </div>
 <form  class="layui-form" method="post" action="/tradeAuthorize/addTradeAuthorize">
    <div class="container1" id="grmodel">
        <input name="authorizeStyle" value="2" type="hidden"/>
        <div class="into" style="margin-top: 20px;">
            <p>
                请输入真实姓名和身份证号，并上传证明图片，我们不会泄露您的个人信息。
            </p>
        </div>
        <div class="lab">
            <label>
                <span>真实姓名</span>
                <input style="margin-left: 20px; margin-top: 20px;" type="text" name="name">
            </label>
            
        </div>
        <div class="lab">
            <label>
                <span>身份证号</span>
                <input style="margin-left: 20px; margin-top: 20px;" type="text" name="idCard">
            </label>
        </div>
            <button type="submit" id="button2" style="margin-left: 50px; margin-bottom: 100px;">提交绑定</button>
</div>
 </form>
           <form class="layui-form" method="post" action="/tradeAuthorize/addTradeAuthorize">
<div class="container" id="qymodel" style="display: none;">
    <div class="into" style="margin-top: 20px;">
        <p>
            请您如实添写以下营业执照信息
        </p>
    </div>
    <div class="lab">
        <label>
            <span>工商注册号</span>
            <input name="authorizeStyle" value="1" type="hidden"/>
            <input style="margin-left: 20px; margin-top: 20px;" type="text" name="businessLicense">
        </label>
        
    </div>
    <div class="lab">
        <label>
            <span>公司名称&nbsp;&nbsp;&nbsp;&nbsp;</span>
            <input style="margin-left: 20px; margin-top: 20px;" type="text" name="companyName">
        </label>
    </div>
    <div class="lab">
        <label>
            <span>企业联系人&nbsp;&nbsp;&nbsp;&nbsp;</span>
            <input style="margin-left: 20px; margin-top: 20px;" type="text" name="companyPerson">
        </label>
    </div>

    <div style="margin-top: 20px;">
        <label>
            <span>上传营业执照：</span>
        </label>
        <div class="btn-group" role="group" aria-label="...">
            <div class="chuans" style="margin-left: 0px;">
                <img src="${pageContext.request.contextPath}/img/file.png" alt="" data-imgsrc="img/file.png">
                <input class="uploadImg file1" type="file" onchange="uploadImage(this);" name="file1" >
                <span class="delx glyphicon glyphicon-remove"></span>
            </div>
            <div class="chuans"  style="margin-left: 0px;">
                <img src="${pageContext.request.contextPath}/img/file.png" alt="" data-imgsrc="img/file.png">
                <input class="uploadImg file1" type="file"onchange="uploadImage(this);" name="file1" >
                <span class="delx glyphicon glyphicon-remove"></span>
            </div>
            <input type="hidden" name="productPictureUrl" id="productPictureUrl" value=""/>
        </div> 
    </div>

    <div class="tip">
        <br>
        <br>
        <br>
        以下证件可以通过营业执照的验证：
        <br>
        1.营业执照条件（正副本皆可）；
        <br>
        2.营业执照正本复印件加盖公司彩章；
        <br>
        3.营业执照副本复印件加盖公司彩章；
        <br>
        详见下方样图，图片需清晰无水印
    </div>
    <div class="licence" style="width: 256px; float: left;">
        <img src="img/yingyezhizhangzheng.png"/>
        <p style="margin-left: 40px;">营业执照正本原件图样</p>
        
    </div>
    <div class="licence" style="width: 256px; float: left;margin-top: 30px;">
        <img src="img/yingyezhizhangfu.png"/>
        <p style="margin-left: 15px;">加盖公司彩章的执照复印件图样</p>
    </div>
    <div style="margin-top: 400px; margin-bottom: 100px;">
        <button type="submit" id="button2">提交绑定</button>
    </div>
</div>
           </form>
       </div>
   </div>
</c:if>
<c:if test="${user.authorizeType==1}">
    <div style="background-color: #fff;">
        <div style="margin-left: 50px;">
            <div class="titleline1">
                <div class="title" style="width:500px;">
                    你的企业认证信息被驳回，请重新上传企业认证信息
                    <hr>
                </div>
            </div>
            <form class="layui-form" method="post" action="/tradeAuthorize/addTradeAuthorize">
                <div class="container" id="qymodel1" style="display: block;">
                    <div class="into" style="margin-top: 20px;">
                        <p>
                            请您如实添写以下营业执照信息
                        </p>
                    </div>
                    <div class="lab">
                        <label>
                            <span>工商注册号</span>
                            <input name="authorizeStyle" value="1" type="hidden"/>
                            <input style="margin-left: 20px; margin-top: 20px;" type="text" name="businessLicense">
                        </label>

                    </div>
                    <div class="lab">
                        <label>
                            <span>公司名称&nbsp;&nbsp;&nbsp;&nbsp;</span>
                            <input style="margin-left: 20px; margin-top: 20px;" type="text" name="companyName">
                        </label>
                    </div>
                    <div class="lab">
                        <label>
                            <span>企业联系人&nbsp;&nbsp;&nbsp;&nbsp;</span>
                            <input style="margin-left: 20px; margin-top: 20px;" type="text" name="companyPerson">
                        </label>
                    </div>

                    <div class="zz" style="margin-top: 20px; height: 440px;width:700px;">
                        <label>
                            <span>上传营业执照：</span>
                        </label>
                        <div class="btn-group" role="group" aria-label="...">
                            <div class="chuans"  style="margin-left: 0px;">
                                <img src="${pageContext.request.contextPath}/img/file.png" alt="" data-imgsrc="img/file.png">
                                <input class="uploadImg file1" type="file" onchange="uploadImage(this);" name="file1" >
                                <span class="delx glyphicon glyphicon-remove"></span>
                            </div>
                            <div class="chuans"  style="margin-left: 0px;">
                                <img src="${pageContext.request.contextPath}/img/file.png" alt="" data-imgsrc="img/file.png">
                                <input class="uploadImg file1" type="file"onchange="uploadImage(this);" name="file1" >
                                <span class="delx glyphicon glyphicon-remove"></span>
                            </div>
                            <input type="hidden" name="productPictureUrl" id="productPictureUrl" value=""/>
                        </div>
                    </div>

                    <div class="tip">
                        <br>
                        <br>
                        <br>
                        以下证件可以通过营业执照的验证：
                        <br>
                        1.营业执照条件（正副本皆可）；
                        <br>
                        2.营业执照正本复印件加盖公司彩章；
                        <br>
                        3.营业执照副本复印件加盖公司彩章；
                        <br>
                        详见下方样图，图片需清晰无水印
                    </div>
                    <div class="licence" style="width: 256px; float: left;">
                        <img src="img/yingyezhizhangzheng.png"/>
                        <p style="margin-left: 40px;">营业执照正本原件图样</p>

                    </div>
                    <div class="licence" style="width: 256px; float: left;margin-top: 30px;">
                        <img src="img/yingyezhizhangfu.png"/>
                        <p style="margin-left: 15px;">加盖公司彩章的执照复印件图样</p>
                    </div>
                    <div style="margin-top: 400px; margin-bottom: 100px;">
                        <button type="submit" id="button2">提交绑定</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</c:if>
<script src="${pageContext.request.contextPath}/js/post-message.js"></script>

<script>
    var geren = document.getElementById("geren");
    var qiye=document.getElementById("qiye");
    geren.onclick = function () {
        grmodel.style.display = "block";
        qymodel.style.display="none";
    }
    qiye.onclick = function () {
        grmodel.style.display = "none";
        qymodel.style.display="block";
    }

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
                    document.getElementById("demoText").className="success";
                    document.getElementById("demoText").innerText="上传成功";
                    console.log("上传成功");
                } else {
                    $.messageBox({message:result.resultStr});
                    $(obj).val('');
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                document.getElementById("demoText").className="error2";
                document.getElementById("demoText").innerText="上传失败，请检查网络后重试";
            }
        })
    }
</script>
</div>
</body>

</html>